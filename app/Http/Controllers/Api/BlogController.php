<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\BlogCategory;
use App\Models\BlogTag;
use App\Models\Page;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

use TCG\Voyager\Facades\Voyager;

class BlogController extends Controller{


    public function show()
    {
        $page = Page::where('id', '=', 8)->firstOrFail();
        return response(['page'=>Helper::page($page)],200);
    }

    public function getArticles()
    {
        $cats = [];
        $tags = [];
        if (request()->has('cats') or request()->has('tags')){
            $cats =  explode(',',request()->get('cats'));
            $tags = explode(',',request()->get('tags'));

            $articles =  Blog::whereHas('categories',function ($q) use($cats){
                $q->where('slug','LIKE',$cats);
            })->orWhereHas('tags',function ($q)use($tags){
                $q->where('tag_name','LIKE',$tags);
            })->with('translations')->orderBy('id','DESC')->paginate(10);
        }else{
            $articles = Blog::with('translations')->orderBy('id','DESC')->paginate(10);
        }


        return response($this->pagination($articles),200);
    }


    protected function pagination($articles): array
    {
        $data = [];
        $data['current_page']= $articles->currentPage();
        $data['previous_page_url'] = $articles->previousPageUrl();
        $data['next_page_url'] = $articles->nextPageUrl();
        $data['last_page'] = $articles->lastPage();
        $data['base_path']= $articles->getOptions()['path'];
        $data['data']=[];
        foreach ($articles->items() as $article) {
            array_push($data['data'],[
                'id'=>$article->id,
                'status'=>$article->status,
                'image'=>Voyager::image($article->image),
                'ar' => [
                    'title'=>$article->title,
                    'slug'=>$article->slug,
                    'content'=>$article->content,
                    'excerpt'=>$article->excerpt,
                    'seo_title'=>$article->seo_title,
                    'meta_description'=>$article->meta_description,
                    'meta_keywords'=>$article->meta_keywords,
                ],
                'en'=>Helper::toTranslation($article->translations),

            ]);
        }
        return $data;
    }

    public function getTags()
    {
        $tags = BlogTag::get(['id','tag_name']);
        return response($tags,200);
    }

    public function getCategories()
    {
        $data = [];
        $categories = BlogCategory::with('translations')->get();
        foreach ($categories as $category) {
            array_push($data, [
                'id' => $category->id,
                'slug' => $category->slug,
                'ar'=>[
                    'category_name' => $category->category_name,

                ],
                'en'=>Helper::toTranslation($category->translations),
            ]);
        }
        return response($data,200);
    }

	/* search function */

   public static function search($q)
    {
        $result = Blog::search($q)->paginate(10);
        $result->load('translations');

        return (new BlogController())->pagination($result);
    }
 public function getSingleArticle($article_id)
    {
        //try {
            $article = Blog::whereId($article_id)->whereStatus('PUBLISHED')->with('translations')->first();
	if(is_null($article)) return response(['status'=>'ERROR','message'=>'this article is private or not found try with another article'],401);
        //} catch (ModelNotFoundException $e) {
          //  return response(['status'=>'ERROR','message'=>'the article not found'],404);
        //}
        $data = [];

        $data['ar'] = [
            'title'=>$article->title,
            'content'=>$article->content,
            'excerpt'=>$article->excerpt,
	     'slug'=> $article->slug
        ];
        $data['en'] = Helper::toTranslation($article->translations);
        $data['image']= Voyager::image($article->image);
        $data['status']= $article->status;
	$data['id'] = $article->id;
        $data['seo']= [
            'seo_title'=>$article->seo_title,
            'meta_description'=>$article->meta_description,
            'meta_keywords'=>$article->meta_keywords,

        ];
        $data['categories']= $this->getCategoriesForSingleArticle($article);
        $data['tags']= $this->getTagsForSingleArticle($article);
	$data['related'] = $this->getRelatedArticles($article);
        return response($data,200);
    }

    public function getCategoriesForSingleArticle(Blog $article): array
    {
        $cats = $article->categories;
        $cats->load('translations');
        $data = [];
        foreach ($cats as $cat) {
            array_push($data, [
                'id'=>$cat->id,
                'slug'=>$cat->slug,
                'ar'=>['category_name'=>$cat->category_name],
                'en'=>Helper::toTranslation($cat->translations)
            ]);
        }
        return $data;
    }
    public function getTagsForSingleArticle(Blog $article): array
    {
        $tags = $article->tags;

        $data = [];
        foreach ($tags as $cat) {
            array_push($data, [
                'id'=>$cat->id,
                'tag_name'=>$cat->tag_name,

            ]);
        }
        return $data;
    }

	public function getRelatedArticles(Blog $article): array
    {
        $related = Blog::whereHas('categories', function ($q) use($article) {
            return $q->whereIn('blog_categories.id', $article->categories()->pluck('blog_categories.id')->all());
        })->where('id','<>',$article->id)->whereStatus('PUBLISHED')->limit(5)->get();
        $data = [];
        foreach ($related as $article) {
            array_push($data, [
                'id' => $article->id,
                'image'=> Voyager::image($article->image),
                'ar' => [
                    'title'=>$article->title,
                    'excerpt'=>$article->excerpt
                ],
                'en'=>Helper::toTranslation($article->translations,['title','excerpt']),

            ]);
        }
        return $data;
    }
}
