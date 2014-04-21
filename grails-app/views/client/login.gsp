<%--
  Created by IntelliJ IDEA.
  User: casuser
  Date: 4/7/14
  Time: 3:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain - Login</title>
    <meta name="layout" content="client_main">
</head>

<body>

<g:if test="${params.justRegistered == "1"}">
    <div style="padding: 10px" class="panel-danger col-md-12 text-center bg-success">
        <span class="glyphicon glyphicon-ok"></span> <span class="h4 text-success"> You are now registered, please log in</span>
    </div>
    <br/><br/><br/><br/>
</g:if>

<div class="col-md-5 col-md-offset-1">
    <img src="${resource(dir: 'images', file: 'pinkyAndTheBrain.gif')}">
</div>

<div class="col-md-6">

    <div class="panel panel-default">
        <g:form class="form-horizontal" action="validateCredentials">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-lock"></span> Login</div>
        <div class="panel-body">
                <div class="form-group">
                    <label for="userName" class="col-sm-3 control-label">
                        User Name</label>
                    <div class="col-sm-9">
                        <g:textField name="userName" class="form-control" id="userName" placeholder="User Name" required="required" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-3 control-label">
                        Password</label>
                    <div class="col-sm-9">
                        <g:passwordField name="pw" class="form-control" id="inputPassword3" placeholder="Password" required="required" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"/>
                                %{--TODO: Remember not working--}%
                                Remember me
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group last">
                    <div class="col-sm-offset-3 col-sm-9">
                        <g:submitButton name="login" class="btn btn-success btn-sm" value="Sign in" />

                        %{--TODO: Reset not working--}%
                        <button type="reset" class="btn btn-default btn-sm">
                            Reset</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="panel-footer">
            Not Registred? <g:link name="register" action="signup" >Register here </g:link>
        </div>
    </g:form>
    </div>

</div>
</body>
</html>