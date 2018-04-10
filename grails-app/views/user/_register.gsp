<g:form class="form-horizontal" controller="user"
        action="register" enctype="multipart/form-data">

    <div class="form-group">
        <label class="control-label col-sm-4" for="firstName">First Name*</label>

        <div class="col-sm-8">
            <g:textField type="text" class="form-control"
                         placeholder="First Name" name="firstName"/>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4" for="lastName">Last Name*:</label>

        <div class="col-sm-8">
            <g:textField type="text" class="form-control"
                         placeholder="Last Name" name="lastName"/>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Email*:</label>

        <div class="col-sm-8">
            <input type="email" class="form-control" name="emailId" placeholder="Enter Email">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Username*:</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" name="userName" placeholder="Enter Username">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Password*:</label>

        <div class="col-sm-8">
            <input type="password" class="form-control" name="password" placeholder="Enter Password">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Confirm Password*:</label>

        <div class="col-sm-8">
            <input type="password" class="form-control" name="confirmPassword" placeholder="Enter Confirm Password">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Photo:</label>

        <div class="col-sm-8">
            <input type="file" name="photo"/>
            <br/><br/>
        </div>
    </div>

    <div class="form-group">

        <div class="col-sm-offset-7 col-sm-4">
            <button type="submit" class="btn btn-default">Register</button>
        </div>
    </div>
</g:form>
