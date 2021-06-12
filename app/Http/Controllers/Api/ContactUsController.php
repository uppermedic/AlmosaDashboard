<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace  App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Jobs\ContactUsJob;
use App\Mail\ContactUsMail;
use App\Models\ContactUs;
use App\Models\Page;

use Illuminate\Database\Eloquent\ModelNotFoundException;

use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use TCG\Voyager\Facades\Voyager;

class ContactUsController extends Controller
{
    public function show()
    {
        $page = Page::where(['id'=>12,"status"=>"ACTIVE"])->with('translations')->first();
        if (is_null($page) or $page =='') {
            return response(['status'=>'ERROR','message','not found'],404);
        }
        return response([
            'page'=>Helper::page($page),
            'content'=>$this->getContent(),
        ],200);
    }
    public function getContent():array
    {
        $pageContent = [];
        try {
            $contents = Page::find(12)->getPageContents()->with('translations')->orderBy('id', 'ASC')->get();
        } catch (ModelNotFoundException $ex) {
            return response([
                'status'=>'ERROR',
                'message'=>$ex
            ],404);
        }

        foreach ($contents as $k => $content) {
            $pageContent[] = [
                'image'=>Voyager::image($content->image),
                'ar'=>[
                    'title'=>$content->title,
                    'content'=>$content->content,

                ],
                'en'=>Helper::toTranslation($content->translations)
            ];
        }
        return  $pageContent;

    }
    public function ContactUs(\Illuminate\Http\Request $request)
    {
        $validate = Validator::make($request->all(),[
            'name' => 'required|string|max:200',
            'email' => 'required|string|email',
            'subject' => 'required|string|max:255',
            'message' => 'required',

        ]);
        if ($validate->fails()) {
            return response(['message'=>'Oops,some data missing!','errors'=>$validate->errors(),'success'=>false],201);
        }
        $data = $this->create($request->all());
        ContactUsJob::dispatch($data);

        return response(['message'=>'Thank you for your message.','errors'=>$validate->errors(),'success'=>true],200);
    }

    protected function create(array $data)
    {

        $user =  ContactUs::create([
            'name'=>$data['name'],
            'email'=>$data['email'],
            'subject'=>$data['subject'],
            'message'=>$data['message'],
        ]);

        return  $user;

    }
}
