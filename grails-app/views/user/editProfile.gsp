<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 12/4/18
  Time: 1:50 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>${session.user.firstName} Profile</title>
    <meta name="layout" content="main">


    <div class="pull-right" style="   margin-left: 30px; margin-top: 5px; ">

        <g:if test="${session.user}">

            <span class="col-lg-3 dropdown">

                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">

                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user" style="font-size:24px"></i></a>
                    ${session.user.firstName}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <g:if test="${session.user.admin}">
                        <li><g:link controller="admin" action="userList">View All Users</g:link></li>
                    </g:if>
                    <li><g:link controller="user" action="editProfile">Edit Profile</g:link></li>
                    <li><a href="#">Users</a></li>
                    <li><a href="#">Topic</a></li>
                    <li><a href="#">Posts</a></li>
                    <li><g:link controller="login" action="logout">Logout</g:link></li>
                </ul>
            </span>
        </g:if>

    </div>




</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="col-lg-offset-1 col-lg-2">
                        <img class="img-responsive" alt="dummy" src="index.jpeg"/>
                    </div>

                    <div class="col-lg-9">
                        <p class="name-font">${session.user.userName}<sub
                                class="text-muted">@${session.user.firstName}</sub></p>

                        <div class="row">
                            <div class="col-sm-6">
                                <span class="">Subscription</span>
                            </div>

                            <div class="col-sm-6">
                                <span>Topic</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <a href="#">${session.user?.topics.size()}</a>

                            </div>

                            <div class="col-sm-6">
                                <a href="#">${session.user?.subscriptions.size()}</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="col-lg-12 " style="margin-top: 25px">

                <div class=" panel panel-default  ">
                    <div class="panel-heading">
                        <p>

                        <h3 style="color:white">Profile</h3></p>
                    </div>

                    <div class="panel-body ">
                        <g:uploadForm controller="user" action="updateUser" enctype="multipart/form-data">
                            <div class="form-group col-lg-10">
                                <label>First Name*</label>
                                <input class="form-control" type="text" name="updatedFirstname" required>
                            </div>

                            <div class="form-group col-lg-10">
                                <label>Last Name*</label>
                                <input class="form-control" type="text" name="updateLastname" required>
                            </div>

                            <div class="form-group col-lg-10">
                                <label>Username*</label>
                                <input class="form-control" type="text" name="updatedUsername" required>
                            </div>

                            <div class="col-lg-2"></div>

                            <div class="form-group col-lg-10">
                                <label>Photo</label>
                                <input class="form-control" type="file" name="updatedPhoto">

                            </div>

                            <div class="col-lg-12"></div>

                            <div class="form-group col-lg-10">
                                <input type="submit" class="form-control btn-primary">
                            </div>

                        </g:uploadForm>

                    </div>
                </div>
            </div>

            <div class="col-lg-12 " style="margin-top: 25px">

                <div class=" panel panel-default  ">
                    <div class="panel-heading " style="background:#696969">

                        <p>

                        <h3 style="color:white">Change Password</h3></p>
                    </div>

                    <div class="panel-body ">
                        <g:form controller="user" action="changePassword">

                            <div class="form-group col-lg-10">
                                <label>Old Password*</label>
                                <input class="form-control" type="text" name="oldPassword">
                            </div>


                            <div class="form-group col-lg-10">
                                <label>New Password*</label>
                                <input class="form-control" type="text" name="updatedPassword">
                            </div>

                            <div class="form-group col-lg-10">
                                <label>Confirm New Password*</label>
                                <input class="form-control" type="password" name="updatedConfirmPassword">
                            </div>


                            <div class="col-lg-2"></div>


                            <div class="col-lg-12"></div>

                            <div class="form-group col-lg-10">
                                <input type="submit" class="form-control btn-primary">
                            </div>

                        </g:form>

                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
</html>