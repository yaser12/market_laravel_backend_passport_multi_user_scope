<!DOCTYPE html>
<html lang="en">
<head>
    <title>ControlPanel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>ControlPanel</h1>
    <p>you are Welcome</p>
</div>

<div class="container" style="margin-top:30px">

    <div class="form-group">
        <label for="">Routes Page</label>
        <input type="button" value="Routes" onclick="window.location='routes'" class="form-control">
        <label for="">Add  Product Page</label>
        <input type="button" value="Add Product" onclick="window.location='addcarproduct'" class="form-control">
        <label for="">show  Products Page</label>
        <input type="button" value="show Product" onclick="window.location='showproducts/1'" class="form-control">
        <label for="">Regions Page</label>
        <input type="button" value="Regions" onclick="window.location='regions'" class="form-control">
        <input type="button" value="Region Types" onclick="window.location='regiontypes'" class="form-control">
        <label for="">Categories Page</label>
        <input type="button" value="Categories" onclick="window.location='categories'" class="form-control">
        <label for="">Add Image To Server</label>
        <input type="button" value="Add Image" onclick="window.location='image-upload'" class="form-control">
        <label for="">Add Category 2 Region Relation</label>
        <input type="button" value="Relations View" onclick="window.location='cat2reg/view'" class="form-control">
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    {{--        <p>Footer</p>--}}
</div>
</body>
</html>
