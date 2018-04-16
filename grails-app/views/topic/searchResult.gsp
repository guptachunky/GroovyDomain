<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 12/4/18
  Time: 2:36 PM
--%>

<%@ page import="bootcamp.Subscription" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta name="layout" content="main">

    <div class="glyphicon glyphicon-user pull-right" style="margin-left: 30px; margin-top: 5px; ">

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



    <button type="img" class="fa fa-file pull-right " style="margin-left: 10px;" data-toggle="modal"
            data-target="#create">

    </button>
    <button type="img" class="glyphicon glyphicon-link pull-right" style="margin-left: 10px;"
            data-toggle="modal" data-target="#myModal3">

    </button>
    <button type="img" class="fa fa-comment pull-right" data-toggle="modal" style="margin-left: 10px;"
            data-target="#myModal4">

    </button>

    <button type="img" class="glyphicon glyphicon-envelope pull-right" data-toggle="modal"
            style=" margin-left: 10px;" data-target="#myModal5">
    </button>

</div>

</head>

<body>

<div class="container">
    <div class=" panel panel-default     ">
        <div class="panel-heading " style="background: #007efc">

            Searched Topics
        </div>

        <div class="panel-body  ">
            <g:if test="${topicNames.size()}">

                <g:each in="${topicNames}" var="topic">
                    <div class="row">

                        <div class="col-lg-offset-1 col-lg-2">
                            <g:if test="${session.user?.photo}">
                                <img class="img-responsive" alt="dummy" height="64" width="64"
                                     src="data:image/png;base64,${session.user?.photo.encodeBase64()} "/>
                            </g:if>
                            <g:else>
                                <img class="img-responsive" alt="dummy" src="dummy.jpeg"/>
                            </g:else>
                        </div>

                        <div class="col-lg-9">
                            <div class="row">
                                <div class=col-sm-12>
                                    <a href="#" class="anchor">${topic.name}</a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <small class="text-muted">@${topic.createdBy}</small>
                                </div>

                                <div class="col-sm-4">
                                    Subscriptions</div>

                                <div class="col-sm-4">Post</div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4"><a>Unsubscribe</a></div>

                                <div class="col-sm-4"><a>50</a></div>

                                <div class="col-sm-4"><a>${topic.count}</a></div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <select>
                                        <option selected="true">Serious</option>
                                        <option>VerySerious</option>
                                        <option>Casual</option>
                                    </select>
                                </div>

                                <div class="col-sm-4">
                                    <select>
                                        <option>Private</option>
                                        <option selected="true">Public</option>
                                    </select>

                                </div>

                                <div class="col-sm-4">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <i class="fa fa-file-o" aria-hidden="true"></i>
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </div>

                            </div>
                        </div>

                        <hr/>
                    </div>

                </g:each>
            </g:if>
            <g:else>
                <div class="panel-heading" style="background:#696969">

                    <div class="row">
                        <div class="col-lg-4 subform">
                            No Result Found
                        </div>

                    </div>
                </div>
            </g:else>
        </div></div>
</body>
</html>