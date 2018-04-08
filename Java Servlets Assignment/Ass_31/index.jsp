<html>
    <head>
        <title>31 - Register Form</title>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <style>
            body{
                background-image: url('img/back.jpg');
                background-size: 100% 100%;
                margin: 0px;
            }
            input{
                margin: 5px;
                padding: 10px;
                border: 1px solid #847d7d;
                border-radius: 5px;
                width: 100%;
                font-family: 'Raleway', sans-serif;
            }
            input[type="submit"]{
                background: cadetblue;
                color: white;
                border: 0px;
                font-size: large;
            }
            .form{
                position: relative;
                text-align: center;
                margin-left: 20%;
                margin-right: 20%;
                padding: 3% 10% 3% 10%;
                box-shadow: 3px 3px 5px 5px #041d35;
                border-radius: 3px;
            }
            .form-header{
                text-align: center;
                font-family: 'Raleway', sans-serif;
                color: white;
            }
            .only{
                margin-top: 5%;
            }
            .mar5{
                margin: 5%;
                border: 1px solid #847d7d;
                background: darkslategrey;
                border-radius: 3px;
            }
            .shadow-border{
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                background-color: rgb(0,0,0,0.3);
                z-index: -2000;
                filter: blur(20px)
            }
            .nav{
                position: absolute;
                width: 100%;
                background: rgb(0,0,0,0.7);
                top: 0px;
            }
            .nav input[type="button"]{
                width: 10% !important;
                float: right;
            }

            .hide{
                display: none;
            }

            .error{
                color: #e5f9ff;
                font-family: monospace;
                font-size: large;
                letter-spacing: 1px;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="nav">
                <input type="button" value="Register" onclick="show('register', 'login');">
                <input type="button" value="Login" onclick="show('login', 'register');">
            </div>
        </header>
        <!-- Register -->
        <div id="register" class="form only">
            <div class="shadow-border"></div>
            <h1 class="form-header">Register Here</h1>
            <hr class="mar5"/>
            <form class="form-elements" action="register.jsp" method="POST" onsubmit="return validateReg();">
                <input type="text" name="name" placeholder="Name" required><br/>
                <span id="regname_error" class="error"></span>
                <input type="email" name="email" placeholder="Email" required><br/>
                <span id="regemail_error" class="error"></span>
                <input type="phone" name="phone" placeholder="Contact number" required><br/>
                <span id="regphone_error" class="error"></span>
                <input type="password" name="password" placeholder="Password" required><br/>
                <input type="password" name="cpassword" placeholder="Confirm Password" required><br/>
                <span id="regpass_error" class="error"></span>
                <input type="submit" value="Register"><br/>
            </form>
        </div>
        <!-- Login -->
        <div id="login" class="form only hide">
            <div class="shadow-border"></div>
            <h1 class="form-header">Login Here</h1>
            <hr class="mar5"/>
            <form class="form-elements" action="login.jsp" method="POST" onsubmit="return validateLog();">
                <input type="email" name="email" placeholder="Email" required><br/>
                <input type="password" name="password" placeholder="Password" required><br/>
                <span id="log_error" class="error"></span>
                <input type="submit" value="Login"><br/>
            </form>
        </div>

        <script>
            show = function(toShow, toHide){
                ts = document.getElementById(toShow);
                th = document.getElementById(toHide);
                ts.classList.remove('hide');
                th.classList.add('hide');
            }

            validateName = function(name){
                pattern = /^[a-zA-Z]{3,20}$/
                return pattern.test(name);
            }
            
            validateEmail = function(email){
                pattern = /^[0-9A-Za-z_-]*@[0-9A-Za-z_-]*\.[0-9A-Za-z_-]*$/
                return pattern.test(email)
            }
            
            validatePhone = function(number){
                pattern = /^[0-9]{10}$/
                return pattern.test(number)
            }
            
            validatePassword = function(password){
                pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d$@$!-_%*?&]{7,15}$/
                return pattern.test(password)
            }

            validateReg = function(){
                console.log("First");
                error = document.getElementById("reg_error");
                error_msg = "";
                valid = true
                form = document.forms[0]
                name = form.name.value
                email = form.email.value
                phone = form.phone.value
                password = form.password.value
                cPassword = form.cpassword.value
                document.getElementById("regname_error").innerHTML = ""
                document.getElementById("regemail_error").innerHTML = ""
                document.getElementById("regphone_error").innerHTML = ""
                document.getElementById("regpass_error").innerHTML = ""

                if(!validateName(name)){
                    error_msg = "*Seems like name is invalid!";
                    document.getElementById("regname_error").innerHTML = error_msg;
                    valid = false
                }
                if(!validateEmail(email)){
                    error_msg = "*Seems like email is invalid!";
                    document.getElementById("regemail_error").innerHTML = error_msg;
                    valid = false
                }
                if(!validatePhone(phone)){
                    error_msg = "*Seems like contact number is invalid!";
                    document.getElementById("regphone_error").innerHTML = error_msg;
                    valid = false
                }

                if (password !== cPassword){
                    error_msg = "*Seems like passwords don't match!";
                    document.getElementById("regpass_error").innerHTML = error_msg;
                    valid = false
                }else if(!validatePassword(password)){
                    error_msg = "*Seems like password is invalid!";
                    document.getElementById("regpass_error").innerHTML = error_msg;
                    valid = false
                }
                if(valid){
                    console.log("Valid");
                }
                return valid;
            }
        </script>
    </body>
</html>