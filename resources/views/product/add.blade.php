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
    <link rel="stylesheet"
          href="css/bootstrap-select.min.css">
    <script src="js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src='searchselect/js/select2.js' type='text/javascript'></script>
    <link href='searchselect/css/select2.css' rel='stylesheet' type='text/css'>
    <script src="js/custom_categories.js"></script>

    <script src="js/custom.js"></script>
    <style type="text/css">
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <a href="controlpanel">  <h1>Control Panel</h1></a>
    <h4>Routes</h4>
</div>

<div class="container" style="margin-top:30px">
    <?php
    function create_upload_image_with_input ($input_name,$errors) {
        return <<<HTML
        <div class="form-group">
            <label for="">{$input_name}</label>
            <input type="text"  name="{$input_name}" id="{$input_name}"   class="form-control">
            <li style="list-style-type:none; color: red">{$errors->first($input_name)}</li>
            <iframe src="image-upload?target_input={$input_name}" width="270px" height="70px"></iframe>
        </div>
HTML;
    }



    ?>
    <?php $i=0;?>

    <form action="<?php echo e(route('add.product')); ?>" method="post">
        <?php echo csrf_field(); ?>



        <div class="form-group">
            <label for="">price</label>
            <input type="text" id="price" value="<?php echo e(Request::old('price')); ?>" name="price"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('price')); ?></li>
        </div>
            <div class="form-group">
                <label for="">showed_price</label>
                <input type="text" id="showed_price" value="<?php echo e(Request::old('showed_price')); ?>" name="showed_price"
                       class="form-control">
                <li style="list-style-type:none; color: red"><?php echo e($errors->first('showed_price')); ?></li>
            </div>






        <div class="form-group">
            <label for="">note_ar</label>
            <input type="text" value="<?php echo e(Request::old('note_ar')); ?>" name="note_ar"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('note_ar')); ?></li>
        </div>

        <div class="form-group">
            <label for="">note_en</label>
            <input type="text" value="<?php echo e(Request::old('note_en')); ?>" name="note_en"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('note_en')); ?></li>
        </div>


        <div class="form-group">
            <label for="">newprice</label>
            <input type="text" value="<?php echo e(Request::old('newprice')); ?>" name="newprice"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('newprice')); ?></li>
        </div>










        <div class="form-group">
            <label for="">name_ar</label>
            <input type="text" value="<?php echo e(Request::old('name_ar')); ?>" name="name_ar" id="name_ar"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('name_ar')); ?></li>
        </div>

        <div class="form-group">
            <label for="">name_en</label>
            <input type="text" value="<?php echo e(Request::old('name_en')); ?>" name="name_en" id="name_en"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('name_en')); ?></li>
        </div>

        <div class="form-group">
            <label for="">email</label>
            <input type="text" value="<?php echo e(Request::old('email')); ?>" name="email"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('email')); ?></li>
        </div>

        <div class="form-group">
            <label for="">phonenumber</label>
            <input type="text" value="<?php echo e(Request::old('phonenumber')); ?>" name="phonenumber"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('phonenumber')); ?></li>
        </div>


        <div class="form-group">

            <table id="photo_tables" class="detail" border="3">

                <tbody>

                </tbody>
            </table>
            <style>
                .button {
                    display: block;
                    width: 115px;
                    height: 25px;
                    background: #4E9CAF;

                    text-align: center;
                    border-radius: 5px;
                    color: white;
                    font-weight: bold;
                }

            </style>
            <a  class="button" name="add_photo_4_category" value="add photo 4 category" style="width: 100%;" onclick="add_trs()"> upload colored products  </a>

            <select style="float: left ; width: 100%"  class='search-select' id="category_4_image_select" style='width: 200px;' title="Choose Category"
                    onchange="choose_soncat(this)">
                <option value="0">-- Choose photo  Category --</option>
                <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData);
                foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop();

                ?>
                <option data-id="<?php echo e($category->id); ?>"
                        data-category_name_ar="<?php echo e($category->category_name_ar.$category->parent  ); ?>"
                        data-category_name_en="<?php echo e($category->category_name_en.$category->parent); ?>"
                        data-category_type_id="<?php echo e($category->category_type_id); ?>"
                        data-photo_path="<?php echo e($category->photo_path); ?>"
                        data-max_price_new="<?php echo e($category->max_price_new); ?>"
                        data-min_price_new="<?php echo e($category->min_price_new); ?>"
                        data-max_price_old="<?php echo e($category->max_price_old); ?>"
                        data-min_price_old_="<?php echo e($category->min_price_old); ?>">
                    <?php echo e($category->category_name_ar.' - '.$category->parent); ?></option>
                <?php     endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <script type="text/javascript">

                row_numbercategory_4_image=1;

                function getColor()
                {
                    return "hsl(" + 360 * Math.random() + ',' +
                        (25 + 70 * Math.random()) + '%,' +
                        (85 + 10 * Math.random()) + '%)'
                }


                function add_trs( )
                {
                    color=getColor() ;
                    var max_number_phot=5;
                    if (typeof  $('option:selected', '#category_4_image_select').attr('data-category_name_ar')  === "undefined")
                        return false;

                    appendedhtml=" <tr  class=\"parent\" id=\"row-"+row_numbercategory_4_image+"\" title=\"Click to expand/collapse\" onclick=\"   $(this).siblings('.child-' + this.id).toggle();  \" style=\"cursor: pointer; background-color : "+color+"  \">\n" +
                        "    <td>"+row_numbercategory_4_image+"</td>\n" +
                        "     <td colspan=\""+max_number_phot+"\">"+  $('option:selected', '#category_4_image_select').attr('data-category_name_ar')+"</td>\n" +
                        + "       <td style=\"cursor: pointer; \"    onclick=\"   $(this).closest('tr').remove(); \"   > delete  </td>\n"  +
                        "    </tr>\n"
                        + "      <tr class=\"child-row-"+row_numbercategory_4_image+"\" style=\"display: none;\">\n"
                        + "      <td  style=\"cursor: pointer; \"    onclick=\"     $(this).closest('tr').remove();   $('#row-"+row_numbercategory_4_image+"').closest('tr').remove();   \"       > delete all </td>\n" ;
                    for(   i=0;i<max_number_phot;i++)
                    {
                        appendedhtml=appendedhtml+

                            "     <td    style=\"  background-color : "+color+"  \" >" +
                            "    <input type=\"hidden\"      name=\"input_colored_prducts_img_path_"+i+"_"+ $('option:selected', '#category_4_image_select').attr('data-id')+"\" id=\"input_colored_prducts_img_path_"+i+"_"+ $('option:selected', '#category_4_image_select').attr('data-id')+"\"   class=\"form-control\">\n" +
                            "    <img         name=\img_"+i+"_"+ $('option:selected', '#category_4_image_select').attr('data-id')+"\" id=\"img_"+i+"_"+ $('option:selected', '#category_4_image_select').attr('data-id')+"\"   class=\"form-control\"  style=\" height: 300px; \"    >\n" +
                            "    <div  class=\"form-group\">\n" +


                            "    <iframe src=\"image-upload?target_img=img_"+i+"_"+ $('option:selected', '#category_4_image_select').attr('data-id')+"&target_input=input_colored_prducts_img_path_"+i+"_"+ $('option:selected', '#category_4_image_select').attr('data-id')+"\" width=\"270px\" height=\"70px\"></iframe>\n" +
                            "    </div>" +
                            "</td>\n" ;
                    }
                    appendedhtml=appendedhtml+ " </tr>";

                    $('#photo_tables').find('tbody').append(appendedhtml);
                    row_numbercategory_4_image++;
                }
                function clickListner(){
                    {
                        $('tr.parent')
                            .css("cursor", "pointer")
                            .attr("title", "Click to expand/collapse")
                            .click(function () {
                                console.log(this);
                                var events = $._data(this, "events");
                                var hasEvents = (events != null);
                                console.log('events='+events);
                                $(this).siblings('.child-' + this.id).toggle();
                            });

                        $('tr[@class^=child-]').hide().children('td');
                    }



                }
               // $(document).ready(clickListner());

            </script>
        </div>

        <div class="form-group">
            <label for="">whats_phone</label>
            <input type="text" value="<?php echo e(Request::old('whats_phone')); ?>" name="whats_phone"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('whats_phone')); ?></li>
        </div>





        <div class="form-group">
            <label for="">address</label>
            <input type="text" value="<?php echo e(Request::old('address')); ?>" name="address"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('address')); ?></li>
        </div>




        <div class="form-group">
            <label for="">description_text</label>
            <input type="text" value="<?php echo e(Request::old('description_text')); ?>" name="description_text"
                   class="form-control">
            <li style="list-style-type:none; color: red"><?php echo e($errors->first('description_text')); ?></li>
        </div>




            <div id="container" class="container">

                <h5>add product to stock</h5>

                <table id="product_in_stock_tables" class="detail" border="3">
                    <tbody>
                    <tr  class="parent"  title="Click to expand/collapse"     >
                        <td> <select style="float: left" class='search-select' id="product_in_stock_select" style='width: 200px;' title="Choose Category"   onchange="add_category_for_current_product_item()">
                                <option value="0">-- Choose Category --</option>
                                <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option data-id="<?php echo e($category->id); ?>"
                                        data-category_name_ar="<?php echo e($category->category_name_ar.$category->parent ); ?>"
                                        data-category_name_en="<?php echo e($category->category_name_en.$category->parent ); ?>"
                                        data-category_type_id="<?php echo e($category->category_type_id); ?>"
                                        data-photo_path="<?php echo e($category->photo_path); ?>"
                                        data-max_price_new="<?php echo e($category->max_price_new); ?>"
                                        data-min_price_new="<?php echo e($category->min_price_new); ?>"
                                        data-max_price_old="<?php echo e($category->max_price_old); ?>"
                                        data-min_price_old_="<?php echo e($category->min_price_old); ?>"><?php echo e($category->category_name_ar.$category->parent); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        <div id="product_categories">
                            <table id="one_product_categories_in_stock_tables" class="detail" border="3">
                                <tbody>

                                </tbody>
                            </table>
                        </div></td>
                        <td>
                            <select id="stocks_select" name="stocks_select">

                            </select>
                        <script>
                            $.ajax({
                                url: "stocks",
                                type: "GET",
                                dataType: "json",
                                success: function (data) {
                                    console.table(data.json);
                                  //  if(data.success)
                                    {

                                        $.each(data.json, function (index, value) {
                                            console.log(data.json[index]['name']);
                                            $('#stocks_select').append("<option value=\""+data.json[index]['id']+"\">"+data.json[index]['name']+"</option>");
                                        });
                                    }
                                }
                            });
                            </script>
                        </td>
                        <td>
                            number products
                            <input type="number" name="number_products"  id="number_products" value="0"/>
                        </td>
                        <td>

                            <input type="button" value="add" onclick="add_product_to_stock( )"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table id="all_product_in_stock_tables" class="detail" border="3">
                    <tbody id="main_tbody">
                    <tr  class="parent"  title="Click to expand/collapse"   style="text-align: center;background-color: #0C9A9A"  >
                        <td colspan="4">
                              product in stock
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
<script>

var one_product_item_id_arr=new Array();
var one_product_item_name_arr=new Array();
var one_category_product_itemappendedhtml="";
var  all_categories_product_itemappended_arr=new Array();
    var row_numbercategory_4_product=1;
    function  add_category_for_current_product_item()
    {

        color=getColor() ;

        one_product_itemappendedtds=   "                    <td>"+row_numbercategory_4_product+"</td>\n" +
            "                    <td  \">"+  $('option:selected', '#product_in_stock_select').attr('data-category_name_ar') + '  '
            +  $('option:selected', '#product_in_stock_select').attr('data-category_name_en')

            + "                <input type=\"hidden\" name=\"cat_category_4_product_in_stock_"+row_numbercategory_4_product+"\"  value=\" "+$('option:selected', '#product_in_stock_select').attr('data-id')+"\">\n"
            + "      <td  style=\"cursor: pointer; \"    onclick=\"   $(this).closest('tr').remove();       \"       > delete   </td>\n";

        one_product_itemappendedtr=" <tr  class=\"parent\" id=\"row-category_4_product-"+row_numbercategory_4_product+"\" title=\"Click to expand/collapse\"  style=\"cursor: pointer; background-color : "+color+"  \">\n"
         +one_product_itemappendedtds
            +   "                </tr>"
        ;

        one_product_itemappendedtr=one_product_itemappendedtr+ " </tr>";

        $('#one_product_categories_in_stock_tables').find('tbody').append(one_product_itemappendedtr);
        all_categories_product_itemappended_arr[row_numbercategory_4_product]=one_product_itemappendedtr;
        row_numbercategory_4_product++;
    }
    var number_product_in_stock=0;
    function add_product_to_stock( )
    {
        if(all_categories_product_itemappended_arr.length==0)return;

        number_product_in_stock++;
        one_product_item="";
        one_product_item =  ("<tr >" +
             "      <td  style=\"cursor: pointer; \"    onclick=\"   $(this).closest('tr').remove();       \"       > delete   </td>"+
            "<td>" +
            "<table border=\"3\" >" +
            "<tr>" +
            "<td>" +
            "nubmer this product in stock" +
            "</td>" +
            "</tr>" +
            "<tr>" +
            "<td><input type='hidden' name='stock_number_"+number_product_in_stock+"' value='"+$("#number_products").val()+"'> " +
            "" +  $("#number_products").val() +
            "" +
            "</td>" +
            "</tr>" +
            "</table>" +
            "</td>" +
            "<td>" +
            "<table>" +
            "<tr>" +
            "<td>" +
            "stock" +
            "</td>" +
            "</tr>" +
            "<tr>" +
            "<td><input type='hidden' name='stock_id_"+number_product_in_stock+"' value='"+$("#stocks_select").children("option:selected").val()+"'> " +
            "" +  $("#stocks_select").children("option:selected").html() +
            "</td>" +
            "</tr>" +
            "</table>" +
            "</td>" +
            "<td>" +
            "<table border=\"3\"> <tbody>");
        for(i=0;i<all_categories_product_itemappended_arr.length;i++) {
            if(typeof  all_categories_product_itemappended_arr[i] !== 'undefined')


            one_product_item=one_product_item+(all_categories_product_itemappended_arr[i]);
        }
        one_product_item=one_product_item+(" </tbody></table></td></tr>");
        console.log(' one_product_item = '+one_product_item);


        $('#all_product_in_stock_tables').find('#main_tbody').append(one_product_item);

        all_categories_product_itemappended_arr=new Array();
       $('#one_product_categories_in_stock_tables tbody tr').remove();
    }
</script>
        <div id="container" class="container">

            <h5>Product Filters and pages </h5>
            <select style="float: left" class='search-select' id="category_4_product_select" style='width: 200px;' title="Choose Category"
                    onchange="add_trscategory( )">
                <option value="0">-- Choose Category --</option>
                <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option data-id="<?php echo e($category->id); ?>"
                        data-category_name_ar="<?php echo e($category->category_name_ar.$category->parent ); ?>"
                        data-category_name_en="<?php echo e($category->category_name_en.$category->parent ); ?>"
                        data-category_type_id="<?php echo e($category->category_type_id); ?>"
                        data-photo_path="<?php echo e($category->photo_path); ?>"
                        data-max_price_new="<?php echo e($category->max_price_new); ?>"
                        data-min_price_new="<?php echo e($category->min_price_new); ?>"
                        data-max_price_old="<?php echo e($category->max_price_old); ?>"
                        data-min_price_old_="<?php echo e($category->min_price_old); ?>"><?php echo e($category->category_name_ar.' - '.$category->parent); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <table id="product_category_tables" class="detail" border="3">
                <tbody>

                </tbody>
            </table>
        </div>
            <script>
            function getColor()
            {
                return "hsl(" + 360 * Math.random() + ',' +
                (25 + 70 * Math.random()) + '%,' +
                (85 + 10 * Math.random()) + '%)'
            }

var number_cat=1;
            var row_number=1;
            function add_trscategory( )
            {

            color=getColor() ;
            var max_number_phot=5;
            if (typeof  $('option:selected', '#category_4_product_select').attr('data-category_name_ar')  === "undefined")
            return false;

            appendedhtml=" <tr  class=\"parent\" id=\"row-"+row_number+"\" title=\"Click to expand/collapse\" onclick=\"   $(this).siblings('.child-' + this.id).toggle();  \" style=\"cursor: pointer; background-color : "+color+"  \">\n" +
            "                    <td>"+row_number+"</td>\n" +
            "                    <td colspan=\""+max_number_phot+"\">"+  $('option:selected', '#category_4_product_select').attr('data-category_name_ar') + '  '
                +  $('option:selected', '#category_4_product_select').attr('data-category_name_en')

                + "                <input type=\"hidden\" name=\"filter_categories_"+number_cat+"\"  value=\" "+$('option:selected', '#category_4_product_select').attr('data-id')+"\">\n"
                + "                    <td style=\"cursor: pointer; \"    onclick=\"   $(this).closest('tr').remove(); \"   > delete  </td>\n" +

                +   "                </tr>"  ;

            appendedhtml=appendedhtml+ " </tr>";

            $('#product_category_tables').find('tbody').append(appendedhtml);
                number_cat++;
            }
</script>








        <br/>



<input type="submit" value="save product" onclick="return check_befor_submint();">
</form>
        <div id="message" class="jumbotron text-center" style="margin-bottom:0">

        </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">

</div>

<script>
    function  check_befor_submint() {
      var  must_fill=true;
        if(document.getElementById('price').value=='') must_fill= false;
        if(document.getElementById('showed_price').value=='') must_fill= false;
        if(document.getElementById('name_ar').value=='') must_fill= false;
        if(document.getElementById('name_en').value=='') must_fill= false;
       if(must_fill==false) {
           document.getElementById('message').innerHTML = 'fill price showed_price name_ar name_en ';
           return false;
       }

    }
</script>
</body>
</html>
<?php /**PATH E:\web\app store\sotre\malls-onlineapi\resources\views/product/add.blade.php ENDPATH**/ ?>
