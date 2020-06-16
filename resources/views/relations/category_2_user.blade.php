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
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="../css/style.css">
    <script src='../searchselect/js/select2.js' type='text/javascript'></script>
    <link href='../searchselect/css/select2.css' rel='stylesheet' type='text/css'>
</head>
<style>
    .map {
        height: 15em;
        width: 100%;
    }
</style>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Control Panel</h1>
    <h4>Category Region Relations</h4>
</div>

<div id="container" class="container">

    <h5>Categories</h5>
    <select style="float: left" class='search-select' id="son_select" style='width: 200px;' title="Choose Category"
            onchange="$('#category_id').attr('value',$(this).find(':selected').data('id'))">
        <option value="0">-- Choose Category --</option>
        @foreach($categories as $category)
            <option data-id="{{$category->id}}">{{$category->category_name_en}}</option>
        @endforeach
    </select>
    <input type="text" id="category_id" style="display: none;">



    <br>
    <br>
    <br>
    <h5>Regions</h5>
    <select style="float: left" id="parent_select" class='search-select' style='width: 200px;' title="Choose Region"
            onchange="$('#region_id').attr('value',$(this).find(':selected').data('id'))">
        <option>-- Choose Region --</option>
        @foreach($users as $user)
            <option data-id="{{$user->id}}">{{$user->name}}</option>
        @endforeach
    </select>
    <input type="text" id="user_id" style="display: none;">

    <br>
    <br>
    <br>
    <input type="button" onclick="addRelation()" value="Add Rel">

</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    {{--<p>Footer</p>--}}
</div>
</body>
<!-- Script -->
<script>
    function addRelation() {
        $.ajax({
            url: '../rel/cat2user/add',
            data: {
                user_id: $('#user_id').attr('value'),
                category_id: $('#category_id').attr('value')
            },
            success: function (responseText) {
                alert('success');
            }
        });
    }

    $(document).ready(function () {
        // Initialize select2
        $(".search-select").select2();
    });
</script>
</html>
