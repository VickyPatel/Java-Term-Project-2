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
    </head>
    <body>
        <h1>Add your Product</h1>

        <form class="form-horizontal">

            <div class="form-group">
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
             <button type="submit" class="btn btn-primary">Add Product</button>
             <div id="result"></div>
        </form>   

        <!--                Title: <input id="name" name="name"></input>
                        Description:  <input id="email" name="email"></input>
                        Price:  <input id="password" name="password"></input>
                        Email:  <input id="password2" name="password2"></input>
                        Phone:  <input id="name" name="name"></input>
                        Location:  <input id="name" name="name"></input>
        
                        <button id="add" type="submit">Add Product</button>
                        <div id="result"></div>-->


    </body>
</html>
