<?php

namespace App\FormFields;

use TCG\Voyager\FormFields\AbstractHandler;

class ServiceItemsField extends AbstractHandler
{
    protected $codename = "ServiceItems";

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('formfields.serviceItems', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent
        ]);
    }
}