<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Blog;

class BlogController extends Controller{


    public static function search($q)
    {
        $result = Blog::search($q)->get();
        $result->load('translations');
        return [];
    }

}
