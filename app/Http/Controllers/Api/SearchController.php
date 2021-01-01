<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
class SearchController extends Controller{

    public function show($q)
    {
	 return BlogController::search($q);
    }


}
