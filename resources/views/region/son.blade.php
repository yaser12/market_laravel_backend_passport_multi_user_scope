<select id="select{{$lvl}}" style="float: left;width: 200px;" class='search-select' title="Choose Category"
        onchange="regionclick(this)">
    <option value="0">-- Choose Region --</option>
    @foreach($regions as $region)
        <option style="width: 200px" data-lvl="{{$lvl}}"
                data-id="{{$region->id}}"
                data-region_type_id="0"
                data-description="{{$region->description}}"
                data-parent_region_id="{{$region->parent_region_id}}"
                data-region_name_ar="{{$region->region_name_ar}}"
                data-region_name_en="{{$region->region_name_en}}"
                data-lat="{{$region->latlong_region->region_lat}}"
                data-long="{{$region->latlong_region->region_long}}">{{$region->region_name_ar}}</option>
    @endforeach
</select>


<input style="float: left" class="form-control-sm" type="button"
       onclick="document.getElementById('myModalAdd{{$lvl}}').style.display = 'block';model_affected='{{$lvl}}_a';initMap({{$lvl}}+'a');"
       value="Add Item">

<div id="myModalAdd{{$lvl}}" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
                    <span style="text-align: right;"
                          onclick="document.getElementById('myModalAdd{{$lvl}}').style.display = 'none'"
                          class="close">&times;</span>
        <input class="form-control" type="text" placeholder="insert a description" name="description">
        <input class="form-control" type="text" placeholder="insert a name ar" name="region_name_ar">
        <input class="form-control" type="text" placeholder="insert a name en" name="region_name_en">
        <select onchange="$('#nrg{{$lvl}}').attr('value',$(this).find(':selected').data('id'))"
                style="float: left" class="search-select"
                title="choose Next Region Type">
            <option value="0">-- Choose Region --</option>
            @foreach($region_types as $this_region_type)
                <option data-id="{{$this_region_type->id}}">{{$this_region_type->region_type_name_ar}}</option>
            @endforeach
        </select>
        <div style="display: inline">
            <input id="lat{{$lvl}}_a" style="float: left" type="text" name="lat">
            <input id="long{{$lvl}}_a" style="float: left" type="text" name="long">
        </div>
        <input id="nrg{{$lvl}}" style="display: none;" type="text" name="region_type_id">
        <input style="display: none;" type="text" value="1" name="is_verified_from_us">
        <input style="display: none;" type="text" value="{{$parent_id}}" name="parent_region_id">
        <div class="map" id="map{{$lvl}}a"></div>
        <input type="button" value="ADD" onclick="addregionclick({{$lvl}})">
    </div>
</div>

<div class=" funcButtons" style="display: none;float: left" id="myModal{{$lvl}}">
    <input class="form-control-sm" type="button"
           onclick="document.getElementById('myModalEdit{{$lvl}}').style.display = 'block';model_affected='{{$lvl}}_b';initEditMap({{$lvl}}+'b');"
           value="Edit">
    <input class="form-control-sm" type="button"
           onclick="document.getElementById('myModalDel{{$lvl}}').style.display = 'block'"
           value="Del">

    <div id="myModalDel{{$lvl}}" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span style="text-align: right;"
                  onclick="document.getElementById('myModalDel{{$lvl}}').style.display = 'none'"
                  class="close">&times;</span>
            <div>
                <input onclick="delregionclick({{$lvl}})" type="button" value="yes">
                <input type="button"
                       onclick="document.getElementById('myModalDel{{$lvl}}').style.display = 'none'"
                       value="no">
                <input type="text" name="del_region_id" style="display: none;">
            </div>
        </div>
    </div>

    <div id="myModalEdit{{$lvl}}" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span style="text-align: right;"
                  onclick="document.getElementById('myModalEdit{{$lvl}}').style.display = 'none'"
                  class="close">&times;</span>
            <input class="form-control" type="text" placeholder="insert a description" name="description">
            <input class="form-control" type="text" placeholder="insert a name ar" name="region_name_ar">
            <input class="form-control" type="text" placeholder="insert a name en" name="region_name_en">
            <div style="display: inline">
                <input name="temp_lat" id="lat{{$lvl}}_b" style="float: left" type="text" name="lat">
                <input name="temp_long" id="long{{$lvl}}_b" style="float: left" type="text" name="long">
            </div>
            <input id="nrgfe{{$lvl}}" style="display: none;" type="text"
                   name="region_type_id">
            <input id="s1" style="display: none;" type="text" name="lat">
            <input id="s2" style="display: none;" type="text" name="long">
            <input style="display: none;" type="text" name="parent_region_id">
            <input style="display: none;" type="text" name="is_verified_from_us">
            <input style="display: none;" type="text" name="id">
            <div class="map" id="map{{$lvl}}b"></div>
            <input type="button" value="Edit" onclick="editregionclick({{$lvl}})">
        </div>
    </div>
</div>

<div class="lvlContainer" id="lvl{{++$lvl}}"></div>
