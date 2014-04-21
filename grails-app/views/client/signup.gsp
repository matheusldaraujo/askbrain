<%--
  Created by IntelliJ IDEA.
  User: casuser
  Date: 4/7/14
  Time: 3:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain - Sign Up</title>
    <meta name="layout" content="client_main">
</head>

<body>
    <br>
    <g:hasErrors bean="${user}">
        <ul>
            <g:eachError var="err" bean="${user}">
                <li><g:message error="${err}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>



<g:form action="createUser">
    <h2>Please Sign Up <small>It's free for now.</small></h2>
    <strong>* Required fields</strong>
    <hr class="colorgraph">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="form-group">
                <g:textField type="text" name="firstName" id="firstName" class="form-control input-lg" placeholder="First Name" tabindex="1" />
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="form-group">
                <g:textField type="text" name="lastName" id="lastName" class="form-control input-lg" placeholder="Last Name" tabindex="2"/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <g:textField type="text" name="userName" id="userName" class="form-control input-lg" placeholder="User Name" tabindex="3"/>
    </div>
    <div class="form-group">
        <g:textField type="email" name="userEmail" id="userEmail" class="form-control input-lg" placeholder="Email Address" tabindex="4"/>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="form-group">
                <g:passwordField type="password" name="pw" id="pw" class="form-control input-lg" placeholder="Password" tabindex="5"/>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="form-group">
                <g:passwordField type="password" name="conPw" id="conPw" class="form-control input-lg" placeholder="Confirm Password" tabindex="6"/>
            </div>
        </div>
    </div>


    <hr class="colorgraph">
    <div class="row">
        <div class="col-xs-12 col-md-6"><g:submitButton type="submit" name="Submit" id="registerBtn" value="Register" class="btn btn-primary btn-block btn-lg" tabindex="7"/></div>
        <div class="col-xs-12 col-md-6"><g:link name="sign" action="login" class="btn btn-success btn-block btn-lg">Sign In</g:link></div>
    </div>
</g:form>

    <script>
        function checkPasswords()
        {
            if (document.getElementsByName("pw")[0].value == document.getElementsByName("conPw")[0].value){
                document.getElementsByName("passwordText")[0].innerHTML="Passwords Match!";
                document.getElementsByName("passwordText")[0].style.color="green";
            } else {
                document.getElementsByName("passwordText")[0].innerHTML="Passwords Do Not Match!";
                document.getElementsByName("passwordText")[0].style.color="red";
            }

        }
    </script>
</body>
</html>