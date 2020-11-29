<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Page;
class HomeController extends Controller
{
    public function index(){
        $home=  Page::where('slug','hello-world')->first();
        $home->load('translations');
        return response($home);
    }
}
