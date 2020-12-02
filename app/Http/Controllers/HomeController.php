<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Page;
use TCG\Voyager\Models\Post;

class HomeController extends Controller
{
    public function index(){
        //$home=  Page::where('slug','hello-world')->first();
        //$home->load('translations');
        $posts = Post::all();
        $posts->load('translations');
        return response($posts);
    }
}
