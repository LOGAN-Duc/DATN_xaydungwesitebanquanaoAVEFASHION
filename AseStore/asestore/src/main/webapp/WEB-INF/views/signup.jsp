<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Sign in Form with Facebook and Twitter Buttons</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.login-form {
    width: 400px;
    margin: 30px auto;
}
.login-form form {        
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .login-btn {
    border-radius: 2px;
}
.input-group-prepend .fa {
    font-size: 18px;
}
.login-btn {
    font-size: 15px;
    font-weight: bold;
  	min-height: 40px;
}
.social-btn .btn {
    border: none;
    margin: 10px 3px 0;
    opacity: 1;
}
.social-btn .btn:hover {
    opacity: 0.9;
}
.social-btn .btn-secondary, .social-btn .btn-secondary:active {
    background: #507cc0 !important;
}
.social-btn .btn-info, .social-btn .btn-info:active {
    background: #64ccf1 !important;
}
.social-btn .btn-danger, .social-btn .btn-danger:active {
    background: #df4930 !important;
}
.or-seperator {
    margin-top: 20px;
    text-align: center;
    border-top: 1px solid #ccc;
}
.or-seperator i {
    padding: 0 10px;
    background: #f7f7f7;
    position: relative;
    top: -11px;
    z-index: 1;
}   
</style>
</head>
<body>
<div class="login-form">
    <form  method="get">
    <h2 class="text-center">Sign Up</h2>   
    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user"></span>
                </span>                    
            </div>
            <input type="text" id="username" name="username" placeholder="User name" class="form-control" required /> 
        </div>
    </div>
    
    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <i class="fa fa-lock"></i>
                </span>                    
            </div>
            <input type="password" id="password" name="password" placeholder="Password" class="form-control" required /> 
        </div>
    </div>     

    <div class="form-group">
        
    </div> 

    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-envelope"></span>
                </span>                    
            </div>
            <input type="email" id="email" name="email" placeholder="Email" class="form-control" required /> 
        </div>
    </div>

    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user"></span>
                </span>                    
            </div>
            <input type="text" id="name" name="name" placeholder="Full Name" class="form-control" required /> 
        </div>
    </div>

    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-phone"></span>
                </span>                    
            </div>
            <input type="text" id="mobile" name="mobile" placeholder="Mobile" class="form-control" required /> 
        </div>
    </div>   

    <div class="form-group">
        <button type="submit" onclick="registerUser()" class="btn btn-primary login-btn btn-block">Sign Up</button>
    </div>
    
    <div class="or-seperator"><i>or</i></div>
    <p class="text-center">Register with your social media account</p>
    <div class="text-center social-btn">
        <a href="#" class="btn btn-secondary"><i class="fa fa-facebook"></i>&nbsp; Facebook</a>
        <a href="#" class="btn btn-info"><i class="fa fa-twitter"></i>&nbsp; Twitter</a>
        <a href="#" class="btn btn-danger"><i class="fa fa-google"></i>&nbsp; Google</a>
    </div >
    
</form>
<div class="text-center social-btn">
          <p class="text-center">You already have an account</p>
          <a href="${classpath }/login"><button  class="btn btn-primary login-btn btn-block">Log in</button></a>
    </div>
</div>
<script>
function registerUser() {
    // Tạo đối tượng chứa dữ liệu người dùng từ biểu mẫu
    let userData = {
     
        username : jQuery("#username").val(),
        password: jQuery("#password").val(),
        email: jQuery("#email").val(),
        name: jQuery("#name").val(),
        mobile: jQuery("#mobile").val(),
       
        
    };

   

    // Gửi yêu cầu AJAX
    jQuery.ajax({
        url: "/register",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(userData), // Chuyển đổi đối tượng thành chuỗi JSON
        dataType: "json", // Kiểu dữ liệu nhận về từ server

        success: function(jsonResult) {
            alert(jsonResult.code + ": " + jsonResult.message);
            if (jsonResult.code === 200) {
                // Chuyển hướng hoặc thực hiện hành động khác nếu đăng ký thành công
                window.location.href = "/login"; // Hoặc trang nào đó bạn muốn
            }
        },

        error: function(jqXhr, textStatus, errorMessage) {
            console.error("Error occurred:", errorMessage);
            alert("Có lỗi xảy ra khi đăng ký. Vui lòng thử lại.");
        }
    });
}
</script>
</body>
</html>