<?php


namespace App\Http\Controllers;
use App\Models\ServiceSection;
use App\Models\ServiceSectionItem;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class AjaxController extends Controller
{
    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function getSections(Request $request): JsonResponse
    {
        $serviceId = $request->input('serviceID');
        $sections = self::getSectionItems($serviceId);
        return response()->json($sections);
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function addNewSection(Request $request)
    {
        $serviceId = $request->input('serviceID');
        $sectionTitle = $request->input('sectionTitle');
        ServiceSection::create(['title' => $sectionTitle, 'service_id' => $serviceId]);

        return self::getSectionItems($serviceId);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function updateSortingList(Request $request): JsonResponse
    {
        $params = json_decode($request->getContent());
        $status = true;

        foreach( $params as $val ){
            $sectionID = (int)$val[0];
            $sortingOrder = $val[1];
            $itemID = $val[2];
            $updateSection = ServiceSection::updateSorting($sectionID, $sortingOrder);
            $updateItem = ServiceSectionItem::updateSorting($itemID, $sortingOrder);
            if (!$updateSection || !$updateItem) {
                $status = false;
                break;
            }
        }

        if ($status) {
            return response()->json('OK');
        } else {
            return response()->json('Sorting is not working, please contact your administrator!');
        }
    }

    /**
     * @param $serviceID
     * @return mixed
     */
    private function getSectionItems($serviceID)
    {
        return ServiceSection::relatedSections($serviceID);
    }

}
