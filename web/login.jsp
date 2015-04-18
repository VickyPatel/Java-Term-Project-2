<%-- 
    Document   : login
    Created on : 10-Apr-2015, 10:05:07 AM
    Author     : c0633648
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <script src="jquery.validate.min.js"></script>
        <script>
                    $(document).ready(function() {

//                $("#name").focus();
//                $("#login_form").validate({
//                    rules: {
//                        email: {
//                            required: true,
//                            email: true
//                        },
//                        password: {
//                            required: true
//
//                        }
//                    },
            submitHandler: function() {
            $.ajax({
            url: "./web/advertise/login",
                    dataType: "text",
                    contentType: 'application/json; charset=UTF-8',
                    data: JSON.stringify({
                    "email": $("#email").val(),
                            "password": $("#password").val()}),
                    method: "post",
                    success: function(data) {
                    // $(location).attr('welcom.jsp');
                    if (data == 'success') {
                    alert('LogIN successful');
                            $('#result').html('Welcome');
                    }
                    else {
                    alert('LogIN failed');
                            $('#result').html('Please Enter Correct Email and Password');
                    }
                    }
            });
            }
            });
                    // Configure an On-Click Listener to Update the Form
//                $('#login').click(function() {
//                    
//                });

            });
        </script>
    </head>
    <body>
        <form id="login_form">

            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" placeholder="Enter email">
            </div>
            <br>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="Password">
            </div>
            <br>
            <button type="submit" class="btn btn-default" id="login">Submit</button>


            <!--            Email: <input id="email"></input>
                        Password:  <input id="password"></input>
                        <button id="login">LogIn</button>-->

            <div id="result"></div> 
        </form>
    </body>
</html>
