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
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Control Panel</h1>
    <h4>Routes</h4>
</div>

<div id="container" class="container">
    <input style="float: left" class="form-control-sm" type="button" onclick="document.getElementById('myModalAdd').style.display = 'block'" value="Add">

    <div id="myModalAdd" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span style="text-align: right;margin-bottom: 5px;"
                  onclick="document.getElementById('myModalAdd').style.display = 'none'"
                  class="close">&times;</span>
            <input class="form-control" type="text" placeholder="insert a name ar" name="region_type_name_ar">
            <input class="form-control" type="text" placeholder="insert a name en" name="region_type_name_en">
            <input style="display: none;" value="1" type="text" name="is_verified_from_us">
            <input type="button" value="ADD" onclick="addregiontypeclick()">
        </div>
    </div>
    <input class="form-control-sm" type="button"
           onclick="document.getElementById('myModalDel').style.display = 'block'"
           value="Del">

    <div id="myModalDel" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span style="text-align: right;" onclick="document.getElementById('myModalDel').style.display = 'none'"
                  class="close">&times;</span>
            <input onclick="delregiontypeclick()" type="button"
                   value="yes">
            <input type="button"
                   onclick="document.getElementById('myModalDel').style.display = 'none'"
                   value="no">
            <input id="region_id" type="text" style="display: none;">
        </div>
    </div>
    <select id="select" style="float: left;width: 200px;" class='search-select' title="Choose Region Type"
            onchange="chooseregiontype(this)">
        <option value="0">-- Choose Region Type --</option>
        @foreach($region_types as $region_type)
            <option data-id="{{$region_type->id}}">{{$region_type->region_type_name_ar}}</option>
        @endforeach
    </select>
</div>
<div class="jumbotron text-center" style="margin-bottom:0">
    {{--<p>Footer</p>--}}
</div>
</body>
</html>
