<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
class SearchController extends Controller{

    /**
     * @param string $q
     * @return array
     */
    public function show(string $q): array
    {
//	 return BlogController::search($q);
     return BlogController::advancedSearch($q);
    }


}
