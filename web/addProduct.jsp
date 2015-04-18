<%-- 
    Document   : addProduct
    Created on : 15-Apr-2015, 12:36:02 AM
    Author     : c0633648
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product Page</title>
        <link rel="stylesheet" href="addproduct.css"></link>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <script src="jquery.validate.min.js"></script>
        <script>
           $(document).ready(function() {
            $("#title").focus();



            //Reference: http://runnable.com/UkmDoGPTV7wtAAja/how-to-use-jquery-validation-ajax-call-on-success
                //  submitHandler: function() {
            $('#add').click(function() {
            $.ajax({
            url: "./web/advertise/add",
                    dataType: "json",
                    method: "post",
                    contentType: 'application/json; charset=UTF-8',
                    data: JSON.stringify({
                            "title": $("#title").val(),
                            "description": $("#description").val(),
                            "price": $("#price").val(),
                            "email": $("#email").val(),
                            "phone": $("#phone").val(),
                    "location": $("#location").val()
                    }),
                    success: function(data) {

                            alert('Product Added successfully');
                    $('#result').html('Product Added');
            }
            });
            });   
            });
        </script>



    </head>
    <body>
        <h1>Add your Product</h1>

        <form class="form-horizontal" id="addproduct_form">

            <!--            <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">Title</label>
                            <div class="col-sm-10">
                                <input type="title" class="form-control" id="title" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">Description:</label>
                            <div class="col-sm-10">
                                <input type="description" class="form-control" id="description" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-2 control-label">Price</label>
                            <div class="col-sm-10">
                                <input type="price" class="form-control" id="price" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">Phone</label>
                            <div class="col-sm-10">
                                <input type="phone" class="form-control" id="phone" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="location" class="col-sm-2 control-label">Location</label>
                            <div class="col-sm-10">
                                <input type="location" class="form-control" id="location" >
                            </div>
                        </div>
            
                        <button type="submit" class="btn btn-primary" id="add">Add Product</button>-->


            Title: <input id="title" name="title"></input>
            Description:  <input id="description" name="description"></input>
            Price:  <input id="price" name="price"></input>
            Email:  <input id="email" name="email"></input>
            Phone:  <input id="phone" name="phone"></input>
            Location:  <input id="location" name="location"></input>

            <button id="add" type="submit">Add Product</button>


            <div id="result"></div>
        </form> 
    </body>
</html>
