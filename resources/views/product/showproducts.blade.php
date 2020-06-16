<!DOCTYPE html>
<html lang="en">
<head>
    <title>ControlPanel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="../css/bootstrap-select.min.css">
    <script src="../js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="../css/style.css">
    <script src='../searchselect/js/select2.js' type='text/javascript'></script>
    <link href='../searchselect/css/select2.css' rel='stylesheet' type='text/css'>
    <script src="../js/custom_categories.js"></script>

    <script src="../js/custom.js"></script>
    <style type="text/css">
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <a href="../controlpanel">  <h1>Control Panel</h1></a>
    <h4>Routes</h4>
</div>

<div class="container" style="margin-top:30px">




<table border="1">
        @foreach($stockProducts as $stockProduct)

    <tr>
        <td>
            <div class="form-group">
                <label for="">{{$stockProduct->product->id}}</label>

            </div>
        </td>
        <td>
            <div class="form-group">
                <label for="">{{$stockProduct->product->name_ar.' '.$stockProduct->product->name_en}}</label>

                @foreach($stockProduct->product->productPhotos as $productPhoto)
                    <img src="../{{$productPhoto->product_photo_path}}" width="200px" height="200px" >
                @endforeach



            </div>
        </td>
        <td>
            <div class="form-group">


                <table border="1">  <tr>
                    @foreach($stockProduct->stockProductCategories as $stockProductCategory)

                            <td>
                                <div class="form-group">
                                    {{$stockProductCategory->Category->category_name_ar .' '.$stockProductCategory->Category->category_name_en }}
                                </div>
                            </td>

                    @endforeach
                    </tr> </table>
            </div>
        </td>
        <td>
            <div class="form-group">
                <input type="button" name="delete" value="delete" onclick="window.location='/delete_stockProduct/{{$stockProduct->id}}'; " class="form-control">

            </div>
        </td>
    </tr>

        @endforeach
</table>




</div>


</body>
</html>
<?php /**PATH E:\web\app store\sotre\malls-onlineapi\resources\views/product/add.blade.php ENDPATH**/ ?>
