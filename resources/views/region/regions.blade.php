<!DOCTYPE html>
<html lang="en" xmlns:display="http://www.w3.org/1999/xhtml">
<head>
    <title>ControlPanel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
{{--    <link rel="stylesheet"--}}
{{--          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">--}}
{{--    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>--}}
    <script src='searchselect/js/select2.js' type='text/javascript'></script>
    <link href='searchselect/css/select2.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/custom_regions.js"></script>
    <script src="js/custom.js"></script>
</head>
<style>
    .map {
        height: 15em;
        width: 100%;
    }

    #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto', 'sans-serif';
        line-height: 30px;
        padding-left: 10px;
    }
</style>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Control Panel</h1>
    <h4>Regions</h4>
</div>

<div id="container" class="container">
    <div id="lvlr">

        <select style="width: 200px;float: left" class='search-select' title="Choose Category"
                onchange="regionclick(this)">
            <option value="0">-- Choose Region --</option>
            @foreach($regions as $region)
                <option style="width: 200px" data-lvl="0"
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
               onclick="document.getElementById('myModalAdd0').style.display = 'block';model_affected='0_a';initMap('0'+'a');"
               value="Add Item">

        <div id="myModalAdd0" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span style="text-align: right;margin-bottom: 5px;"
                      onclick="document.getElementById('myModalAdd0').style.display = 'none'"
                      class="close">&times;</span>
                <input class="form-control" type="text" placeholder="insert a description" name="description">
                <input class="form-control" type="text" placeholder="insert a name ar" name="region_name_ar">
                <input class="form-control" type="text" placeholder="insert a name en" name="region_name_en">
                <select
                    onchange="$('#nrgr').attr('value',$(this).find(':selected').data('id'))"
                    style="float: left" class="search-select"
                    title="choose Region Type">
                    @foreach($region_types as $region_type)
                        <option data-id="{{$region_type->id}}">{{$region_type->region_type_name_ar}}</option>
                    @endforeach
                </select>
                <div style="display: inline">
                    <input id="lat0_a" style="float: left" type="text"
                           name="lat">
                    <input id="long0_a" style="float: left" type="text"
                           name="long">
                </div>
                <input id="nrgr" style="display: none;" type="text"
                       name="region_type_id">
                <input style="display: none;" value="0" type="text" name="parent_region_id">
                <input style="display: none;" value="1" type="text" name="is_verified_from_us">
                <div class="map" id="mapra"></div>
                <input type="button" value="ADD" onclick="addregionclick('0')">
            </div>
        </div>

        <div class="funcButtons" style="display: none;float: left" id="myModal0">
            <input class="form-control-sm" type="button"
                   onclick="document.getElementById('myModalEdit0').style.display = 'block';model_affected='0_b';initEditMap('0'+'b');"
                   value="Edit">
            <input class="form-control-sm" type="button"
                   onclick="document.getElementById('myModalDel0').style.display = 'block'"
                   value="Del">

            <div id="myModalDel0" class="modal">
                <!-- Modal content -->
                <div class="modal-content">
                    <span style="text-align: right;"
                          onclick="document.getElementById('myModalDel0').style.display = 'none'"
                          class="close">&times;</span>
                    <div>
                        <input onclick="delregionclick('0')" type="button"
                               value="yes">
                        <input type="button"
                               onclick="document.getElementById('myModalDel0').style.display = 'none'"
                               value="no">
                        <input type="text" name="del_region_id" style="display: none;">
                    </div>
                </div>
            </div>

            <div id="myModalEdit0" class="modal">
                <!-- Modal content -->
                <div class="modal-content">
                    <span style="text-align: right;"
                          onclick="document.getElementById('myModalEdit0').style.display = 'none'"
                          class="close">&times;</span>
                    <input class="form-control" type="text" placeholder="insert a description" name="description">
                    <input class="form-control" type="text" placeholder="insert a name ar" name="region_name_ar">
                    <input class="form-control" type="text" placeholder="insert a name en" name="region_name_en">
                    <div style="display: inline">
                        <input name="temp_lat" id="lat0_b" style="float: left"
                               type="text">
                        <input name="temp_long" id="long0_b" style="float: left"
                               type="text">
                    </div>
                    <input id="nrgfer" style="display: none;" type="text"
                           name="next_region_type_id">
                    <input style="display: none;" type="text" name="parent_region_id">
                    <input id="s1" style="display: none;" type="text" name="lat">
                    <input id="s2" style="display: none;" type="text" name="long">
                    <input style="display: none;" value="1" type="text" name="is_verified_from_us">
                    <input style="display: none;" type="text" name="region_type_id">
                    <input style="display: none;" type="text" name="id">
                    <div class="map" id="map0b"></div>
                    <input type="button" value="Edit"
                           onclick="editregionclick('0')">
                </div>
            </div>
        </div>
    </div>
    <div class="lvlContainer" id="lvl1"></div>

</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    {{--<p>Footer</p>--}}
</div>

</body>

<script>
    var model_affected = "";
    // In the following example, markers appear when the user clicks on the map.
    // The markers are stored in an array.
    // The user can then click an option to hide, show or delete the markers.
    var map;
    var markers = [];

    function initMap(affecteddiv) {
        if (getCookie('lastPoslat') == null || getCookie('lastPoslat') == "") {
            map = new google.maps.Map(document.getElementById('map' + affecteddiv), {
                zoom: 8,
                center: {lat: 0.0, lng: 0.0},
                mapTypeId: 'roadmap'
            });
        } else {
            map = new google.maps.Map(document.getElementById('map' + affecteddiv), {
                zoom: 8,
                center: {lat: parseFloat(getCookie('lastPoslat')), lng: parseFloat(getCookie('lastPoslong'))},
                mapTypeId: 'roadmap'
            });
        }
        // This event listener will call addMarker() when the map is clicked.
        map.addListener('click', function (event) {
            clearMarkers();
            $('#lat' + model_affected).val(event.latLng.lat);
            $('#long' + model_affected).val(event.latLng.lng);
            addMarker(event.latLng);
            setCookie('lastPoslat', $('#lat' + model_affected).val(), 30);
            setCookie('lastPoslong', $('#long' + model_affected).val(), 30);
        });
    }

    function initEditMap(affecteddiv) {
        $('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='lat']").val($('#lvl' + affecteddiv.slice(0, affecteddiv.length - 1)).find("select[class='search-select region']").find(':selected').attr('data-lat'));
        $('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='long']").val($('#lvl' + affecteddiv.slice(0, affecteddiv.length - 1)).find("select[class='search-select region']").find(':selected').attr('data-long'));
        $('#lat' + model_affected).val('' + $('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='lat']").val());
        $('#long' + model_affected).val('' + $('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='long']").val());
        region_latlong = {
            lat: parseFloat($('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='lat']").val()),
            lng: parseFloat($('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='long']").val())
        };
        map = new google.maps.Map(document.getElementById('map' + affecteddiv), {
            zoom: 8,
            center: {
                lat: parseFloat($('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='lat']").val()),
                lng: parseFloat($('#myModalEdit' + affecteddiv.slice(0, affecteddiv.length - 1)).find("input[name='long']").val())
            },
            mapTypeId: 'roadmap'
        });
        addMarker(region_latlong);

        // This event listener will call addMarker() when the map is clicked.
        map.addListener('click', function (event) {
            clearMarkers();
            $('#lat' + model_affected).val(event.latLng.lat);
            $('#long' + model_affected).val(event.latLng.lng);
            addMarker(event.latLng);
        });
    }

    // Adds a marker to the map and push to the array.
    function addMarker(location) {
        var marker = new google.maps.Marker({
            position: location,
            map: map
        });
        markers.push(marker);
    }

    // Sets the map on all markers in the array.
    function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }

    // Removes the markers from the map, but keeps them in the array.
    function clearMarkers() {
        setMapOnAll(null);
    }

    // Shows any markers currently in the array.
    function showMarkers() {
        setMapOnAll(map);
    }

    // Deletes all markers in the array by removing references to them.
    function deleteMarkers() {
        clearMarkers();
        markers = [];
    }

</script>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA58pzDLW37-xFBMMxCCSORR-PeI12T5Lw" async defer></script>
</html>
