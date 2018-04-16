<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 3/4/18
  Time: 4:59 PM
--%>

<%@ page import="bootcamp.Resource; bootcamp.Subscription" contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>
        Topic Show
    </title>

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

</head>

<body>
${session.user}
<div class="container">
    <div class="col-lg-6">
        <div class="col-lg-12">
            <div class=" panel panel-default     ">
                <div class="panel-heading " style="background: #007efc">
                    <p>

                    <h3 style="color:white">Topic:${topic.name}</h3></p>
                </div>

                <div class="panel-body  ">
                    <div class="col-lg-12">
                        <div class="col-lg-3" style="margin-top: 25px">
                            <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>

                        </div>

                        <div class="col-lg-9">
                            <div class="col-lg-12">
                                <h5><a href="#">${topic.name}</a> <span
                                        STYLE="color: #007efc ">(${topic.visibility})</span></h5>
                            </div>

                            <div class="col-lg-12">
                                <div class="col-lg-4">
                                    <p style="color: #007efc">@${topic.createdBy.userName}</p>

                                    <% bootcamp.Subscription subscription = Subscription.findByUserAndTopic(topic.createdBy, topic) %>
                                    <g:if test="${subscription}">

                                        <g:link controller="subscription" action="subscriptionDelete"
                                                id="${topic.id}">Unsubscribe</g:link>
                                    </g:if>

                                    <g:else>
                                        <g:link controller="subscription" action="subscriptionSave"
                                                id="${topic}">Subscribe</g:link>
                                    </g:else>

                                </div>

                                <div class="col-lg-4">
                                    <p style="color: #007efc">Subscriptions</p>
                                    <p1 style="color: #2e6da4">

                                        ${topic.subscriptions.size()}
                                    </p1>

                                </div>

                                <div class="col-lg-2">
                                    <p style="color: #007efc">Post</p>
                                    <p1 style="color: #2e6da4">
                                        <ls:resourceCount id="${topic}"></ls:resourceCount>
                                    </p1>
                                </div>


                                <div class="col-lg-2">
                                    <p style="color: #007efc">
                                        <a data-toggle="modal" href="#updateTopic" aria-hidden="true">update</a>
                                    </p>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>


        <div id="updateTopic" class="modal fade" role="dialog">
            <g:render template="/topic/update"/>

        </div>

        <div class="col-lg-12">
            <div class=" panel panel-default     ">
                <div class="panel-heading " style="background: #007efc">
                    <p>

                    <h3 style="color:white">Users :  ${topic.name}</h3></p>
                </div>

                <div class="panel-body  ">
                    <g:each in="${Subscription.findAllByTopic(topic)}" var="subscriptions">
                        <div class="col-lg-12">
                            <div class="col-lg-3" style="margin-top: 25px">
                                <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>

                            </div>

                            <div class="col-lg-9">
                                <div class="col-lg-12">
                                    <h5>${subscriptions.user.getFirstName()}</h5>

                                    <p STYLE="color: #007efc ">@${subscriptions.user.userName}</p>
                                </div>

                                <div class="col-lg-12">
                                    <div class="col-lg-6">
                                        <p style="color: #007efc">Subscriptions</p>
                                        ${topic.subscriptions.size()}

                                    </div>

                                    <div class="col-sm-4">
                                        <i class="fa fa-envelope-o" data-toggle="modal" href="#SendInvite"
                                           aria-hidden="true"></i>
                                        <i class="fa fa-file-o" data-toggle="modal" href="#CreateTopic"
                                           ariahidden="true"></i>
                                        <g:link controller="topic" action="delete" id="${topic.id}">
                                            <i class="fa fa-trash" aria-hidden="true">

                                            </i>
                                        </g:link>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-12">
                            <hr>
                        </div>
                    </g:each>
                </div>
            </div>

        </div>
    </div>

    <div class="col-lg-6">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class=" panel panel-default     ">
                    <div class="panel-heading col-lg-12" style="background: #007efc;">
                        <div class="col-lg-4">
                            <h3 style="color:white">Posts: ${topic.name}</h3>
                        </div>

                        <div class="col-lg-8">
                            <div class="topnav pull-rigth " style="background-color: #007efc">

                                <div class="search-container">

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="panel-body  ">
                        <g:each in="${bootcamp.Resource.findAllByTopic(topic)}" var="resourceList">
                            <div class="col-lg-12">
                                <div class="col-lg-3" style="margin-top: 25px">
                                    <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>

                                </div>

                                <div class="col-lg-9">
                                    <div class="col-sm-12">
                                        <br>

                                        <span>${resourceList.user.getFirstName()} &nbsp;&nbsp;&nbsp;&nbsp;<small
                                                class="text-muted">@${resourceList.user.userName}</small>

                                            <a href="#" class="pull-right">${topic.name}</a>
                                            <br><br>

                                            <div class="col-lg-12">
                                                <p>${resourceList.description}</p>
                                            </div>

                                        </span>

                                        <div>
                                            <i class="fa fa-facebook-square fa-lg" aria-hidden="true"></i>
                                            <i class="fa fa-google-plus fa-lg" aria-hidden="true"></i>
                                            <i class="fa fa-twitter-square fa-lg" aria-hidden="true"></i>
                                            <span class="pull-right" style="margin-right: 0px;color: #007efc">
                                                <a href="#" style="color: #007efc;font-size: 75%">Download</a>
                                            </span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </g:each>
                    </div>
                </div>

            </div>

        </div>
    </div>

</div>

</body>

</html>