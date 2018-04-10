<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 9/4/18
  Time: 6:52 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

</head>

<body>

<div class="container">
    <div class="col-lg-6">
        <div class="panel panel-primary col-lg-12">
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-3 fa fa-user fa-5x">
                        </div>

                        <div class="col-sm-9">

                            <p>${session.user.userName}<br>
                                <small class="text-muted">${session.user.userName}</small>
                            </p>

                            <div class="row">

                                <h6 class="text-muted col-sm-6">Subscriptions
                                    <p class="text-primary">
                                        <ls:userSubscriptionCount/>
                                    </p>
                                </h6>

                                <h6 class="text-muted col-sm-6">Topics
                                    <p class="text-primary">
                                        <ls:topicCount/>
                                    </p>
                                </h6>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <br><br><br><br>

        <div class="col-lg-12"><br></div>
        <br><br><br><br>


        <div class="panel panel-primary ">
            <div class="panel-heading"><h3 class="panel-title">
                Subscriptions
                <a href="#" class="pull-right">View All</a>
            </h3></div>
            <g:render template="topicCreated"></g:render>
            <hr>

            <g:render template="subscribedTopic"></g:render>

        </div>
        <br>

        <div class="col-lg-12"><br></div>
        <br>

  <g:render template="trendingTopic"></g:render>

        <hr>


        %{--</div>--}%

    </div>

    <br>

    <div class="col-lg-6">
        <div class="row">
            <div class="panel panel-primary ">
                <div class="panel-heading">Inbox</div>

                <div class="panel-body">
                    <div class="col-lg-12">
                        <div class="col-lg-3" style="margin-top: 25px">
                            <i class="fa fa-user fa-5x" aria-hidden="true"></i>

                        </div>

                        <div class="col-lg-9">
                            <p><h6>User's FullName  <span style="color: darkgray">${session.user.userName}</span><span
                                class="pull-right"
                                style="margin-right: 0px;color: #007efc;font-size: small">Topic Name</span></h6> </p>
                            <p><h5>An overview of the topic is written here for basic understanding...............................</h5></p>

                            <i class="fa fa-facebook-official fa-lg" aria-hidden="true"></i>
                            <i class="fa fa-google fa-lg" aria-hidden="true"></i>
                            <i class="fa fa-twitter fa-lg" aria-hidden="true"></i>
                            <span class="pull-right" style="margin-right: 0px;color: #007efc"><a href="#"
                                                                                                 style="color: #007efc;font-size: small">Download</a>
                                <a href="#" style="color: #007efc;font-size: small">Mark as Read</a>
                                <a href="#" style="color: #007efc;font-size: small">View Topic</a></span>

                        </div>
                    </div>

                </div>
                <hr>

                <div class="panel-body">
                    <div class="col-lg-12">
                        <div class="col-lg-3" style="margin-top: 25px">
                            <i class="fa fa-user fa-5x" aria-hidden="true"></i>

                        </div>

                        <div class="col-lg-9">
                            <p><h6>User's FullName  <span style="color: darkgray">${session.user.getName()}</span><span
                                class="pull-right"
                                style="margin-right: 0px;color: #007efc;font-size: small">Topic Name</span></h6> </p>
                            <p><h5>An overview of the topic is written here for basic understanding...............................</h5></p>

                            <i class="fa fa-facebook-official fa-lg" aria-hidden="true"></i>
                            <i class="fa fa-google fa-lg" aria-hidden="true"></i>
                            <i class="fa fa-twitter fa-lg" aria-hidden="true"></i>
                            <span class="pull-right" style="margin-right: 0px;color: #007efc"><a href="#"
                                                                                                 style="color: #007efc;font-size: small">Download</a>
                                <a href="#" style="color: #007efc;font-size: small">Mark as Read</a>
                                <a href="#" style="color: #007efc;font-size: small">View Topic</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>