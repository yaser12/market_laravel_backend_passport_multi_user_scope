<option data-lvl="{{$lvl}}" data-id="{{$region->id}}"
        data-region_type_id="{{$region->region_type->id}}"
        data-description="{{$region->description}}"
        data-parent_region_id="{{$region->parent_region_id}}"
        data-region_name_ar="{{$region->region_name_ar}}"
        data-region_name_en="{{$region->region_name_en}}"
        data-lat="{{$region->latlong_region->region_lat}}"
        data-long="{{$region->latlong_region->region_long}}">
    {{$region->region_name_ar}}
</option>
