<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 2/4/18
  Time: 10:03 AM
--%>

<%@ page import="bootcamp.Topic" contentType="text/html;charset=UTF-8" %>
<!Doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>
        Liink Sharing Bootstrap

    </title>
    <meta name="layout" content="main">

    <div class="pull-right" style="   margin-left: 30px; margin-top: 5px; ">

        <g:if test="${session.user}">

            <li class="dropdown  col-lg-3" style="padding: 0px">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user"
                                                                              style="font-size:24px"></i>
                    ${session.user.getFirstName()}
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="user" action="editProfile">Profile</g:link></li>
                    <g:if test="${session.user.admin}">
                        <li><g:link controller="user" action="showUserListToAdmin">Users</g:link></li>
                    </g:if>
                    <li><g:link controller="login" action="logout">Logout</g:link></li>
                </ul>
            </li>
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

</head>

<body>

<div class="modal fade" id="create" role="dialog">
    <g:render template="/topic/create"/>
</div>


<div id="myModal5" class="modal fade" role="dialog">

    <g:render template="/topic/email"/>
</div>

<div class="modal fade" id="myModal3" role="dialog">

    <g:render template="/linkResource/create"/>
</div>


<div class="modal fade" id="myModal4" role="dialog">

    <g:render template="/documentResource/create"/>

</div>


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


        <div class="col-lg-6" style=" left: 20px;">
            <div class="panel panel-default">
                <div class="panel-heading">Inbox</div>

                <div class="panel-body">

                    <div class="col-lg-offset-1 col-lg-2">
                        %{--<img class="img-responsive" alt="dummy" height="64" width="64"--}%
                             %{--src="data:image/png;base64,${session.user?.photo.encodeBase64()} "/>--}%
                        <img class="img-responsive" alt="dummy" height="64" width="64" src=" "/>

                    </div>

                    <div class="col-lg-9">
                        <span>Uday Pratap Singh</span> <small class="text-muted">@uday
                    5min</small> <a class="a-right" href="#" class="anchor">Grails</a>

                        <div class="row">
                            <div class="col-sm-12">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.
                                </p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-2">
                                <small><a href="#">Download</a>
                                </small>
                            </div>

                            <div class="col-sm-3">
                                <small>
                                    <a href="#">View full site</a>
                                </small>
                            </div>

                            <div class="col-sm-4">
                                <a href="#">
                                    <ls:readLink>hello</ls:readLink>
                                </a>
                            </div>

                            <div class="col-sm-3">
                                <small>
                                    <a href="#">View Post</a>
                                </small>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <div class="col-lg-offset-1 col-lg-2">
                        %{--<img class="img-responsive" alt="dummy" height="64" width="64"--}%
                             %{--src=" data:image/png;base64,${session.user?.photo.encodeBase64()}  "/>--}%

                        <img class="img-responsive" alt="dummy" height="64" width="64" src=""/>

                    </div>

                    <div class=" col-lg-9">
                        <span>Uday Pratap Singh</span> <small class="text-muted">@uday
                    5min</small> <a class="a-right" href="#" class="anchor">Grails</a>

                        <div class="row">
                            <div class="col-sm-12">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.
                                </p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-2">
                                <small>
                                    <a href="#">Download</a>
                                </small>
                            </div>

                            <div class="col-sm-3">
                                <small>
                                    <a href="#">View full site</a>
                                </small>
                            </div>

                            <div class="col-sm-4">
                                <small>
                                    <a href="#">Mark as read</a>
                                </small>
                            </div>

                            <div class="col-sm-3">
                                <small>
                                    <a href="#">View Post</a>
                                </small>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <div class="row">
                                <div class="col-lg-4 subform">Subscription</div>

                                <div class="col-lg-offset-4 col-lg-4"><a class="a-right">View All</a></div>
                            </div>
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <g:each in="${session.user?.getSubscribedTopics()}" var="subscribedTopics">

                                    <div class="col-lg-offset-1 col-lg-2">
                                        <img class="img-responsive" alt="dummy" src="index.jpeg"/>
                                    </div>

                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <a href="#" class="anchor">${subscribedTopics?.name}</a>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <small class="text-muted">@${subscribedTopics?.createdBy}</small>
                                            </div>

                                            <div class="col-sm-4">
                                                Subscriptions</div>

                                            <div class="col-sm-4">Post</div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4"><a>Unsubscribe</a></div>
                                            %{--${subscribedTopics?.createdBy.getSubscriptionsCount()}--}%
                                            <div class="col-sm-4"><a>
                                        ${subscribedTopics.subscriptions.size()}
                                        </a></div>

                                            <div class="col-sm-4"><a>${subscribedTopics.resources.size()}</a></div>
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
                                                <a class="fa fa-envelope-o" data-toggle="modal" href="#SendInvite"
                                                   aria-hidden="true"></a>
                                                <a class="fa fa-file-o" data-toggle="modal" href="#CreateTopic"
                                                   ariahidden="true"></a>
                                                <a class="fa fa-trash" aria-hidden="true"></a>
                                            </div>

                                        </div>
                                        <br><hr>

                                    </div>

                                </g:each>
                                <hr>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <div class="row">
                                <div class="col-lg-4 subform">Trending Topics</div>

                                <div class="col-lg-offset-4 col-lg-4"><a class="a-right">View All</a></div>
                            </div>
                        </div>

                        <div class="panel-body">
                            <g:each in="${bootcamp.Topic.getTrendingTopic()}" var="trendingTopics">

                                <div class="row">

                                    <div class="col-lg-offset-1 col-lg-2">
                                        <img class="img-responsive" alt="dummy" src="index.jpeg"/>
                                    </div>

                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class=col-sm-12>
                                                <a href="#" class="anchor">${trendingTopics.name}</a>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <small class="text-muted">@${trendingTopics.createdBy}</small>
                                            </div>

                                            <div class="col-sm-4">
                                                Subscriptions</div>

                                            <div class="col-sm-4">Post</div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4"><a>Unsubscribe</a></div>

                                            <div class="col-sm-4"><a>50</a></div>

                                            <div class="col-sm-4"><a>${trendingTopics.count}</a></div>
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
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

</body>
</html>
