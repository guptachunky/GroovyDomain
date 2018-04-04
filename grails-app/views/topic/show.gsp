<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 3/4/18
  Time: 4:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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

    <div class="glyphicon glyphicon-user pull-right" style="margin-left: 30px; margin-top: 5px; "></div>



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
            style="margin-left: 10px;" data-target="#myModal5">

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
                                    <div class="col-sm-4"><a>50</a></div>

                                    <div class="col-sm-4"><a>30</a></div>
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
</body>
</html>