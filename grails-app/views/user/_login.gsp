<g:form class="form-horizontal" controller="login"
        action="loginHandler">
    <div class="form-group">
        <label class="control-label col-sm-2" for="userName">Email:</label>

        <div class="col-sm-10">
            <g:textField type="text" class="form-control"
                         placeholder="Enter email" name="userName"/>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="password">Password:</label>

        <div class="col-sm-10">
            <g:passwordField type="password" class="form-control"
                             placeholder="Enter password" name="password"/>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-5">
            <a href="/grails-app/user/profile" data-toggle="modal" aria-hidden="true">forgot Password</a>
        </div>

        <div class="col-sm-5">
            <g:submitButton name="Login" value="login"
                            class="btn btn-default">LogIn</g:submitButton>
        </div>
    </div>
</g:form>


