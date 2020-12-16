<?php


/**
 * created by aziz (aziz.adel.fci@gmail.com)
 */

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
class LayoutController extends Controller{

    /**
     * show the header and footer api
     * return Response
     */
    public function show()
    {
        return response(
            [
                'header'=>Helper::header(),
                'footer'=>Helper::footer()
            ],
            200
        );
    }
}
