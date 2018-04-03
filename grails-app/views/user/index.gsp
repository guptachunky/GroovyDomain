<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 2/4/18
  Time: 10:03 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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

    <div class="glyphicon glyphicon-user pull-right" style="margin-left: 30px; margin-top: 5px; "></div>



    <button type="img" class="fa fa-file pull-right " style="margin-left: 10px;" data-toggle="modal"
            data-target="#create">

    </button>
    <button type="img" class="glyphicon glyphicon-link pull-right" style="margin-left: 10px;"
            data-toggle="modal" data-target="#myModal3">

    </button>
    <button type="img" class="fa fa-comment pull-right" data-toggle="modal" style="margin-left: 10px;"
            data-target="#myModal2">

    </button>

    <button type="img" class="glyphicon glyphicon-envelope pull-right" data-toggle="modal"
            style="margin-left: 10px;" data-target="#myModal5">

    </button>

</head>

<body>

<div class="modal fade" id="create" role="dialog">
    %{--<g:layout template="/topic/create"></g:layout>--}%
    <g:render template="/topic/create"/>
</div>

<div class="container col-sm-12">
    <div class="row">

        <div class="col-sm-5">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-3 glyphicon glyphicon-user fa-5x">
                            </div>

                            <div class="col-sm-9">

                                <p>Uday Pratap Singh<br><small class="text-muted">@uday</small></p>

                                <div class="row">

                                    <h6 class="text-muted col-sm-6">Subscriptions
                                        <p class="text-primary">50</p>
                                    </h6>

                                    <h6 class="text-muted col-sm-6">Topics
                                        <p class="text-primary">30</p>
                                    </h6>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>


            <div class="panel panel-primary" style="margin-bottom: 0">

                <div class="panel-heading">
                    <h3 class="panel-title">
                        Subscriptions
                        <a href="#" class="pull-right">View All</a>
                    </h3>
                </div>

                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">

                                <div class="col-sm-3 glyphicon glyphicon-user fa-5x">
                                    <!--  <img src="avatar.png" class="img-thumbnail"> -->

                                </div>

                                <div class="col-sm-9">
                                    <a href="#" class="pull-left">Grails</a>
                                    <br>

                                    <div class="row">

                                        <div class="col-sm-6">
                                            <h6 class="text-muted">@uday</h6>
                                            <a href="#">Unsubscribe</a>
                                        </div>


                                        <div class="col-sm-3">
                                            <h6 class="text-muted pull-left">Subscriptions</h6>
                                            <h6 class="text-primary">50</h6>
                                        </div>

                                        <div class="col-sm-3">
                                            <h6 class="text-muted  pull-right" ">Post
                                            <br>
                                            <br>

                                            <p class="text-primary">30</p>
                                        </h6>

                                        </div>

                                        <span type="img" class="fa fa-file pull-right fa-2x"
                                              style="margin-left: 10px;  margin-right: 5px;" data-toggle="modal"
                                              data-target="#myModal4">
                                        </span>

                                        <span type="img" class="fa fa-envelope pull-right fa-2x"
                                              style="margin-left: 10px;" data-toggle="modal" data-target="#myModal5">
                                        </span>
                                        <span type="img" class="glyphicon glyphicon-trash pull-right fa-2x"
                                              style="margin-left: 10px;" data-toggle="modal" data-target="#myModal">
                                        </span>
                                        <select class="pull-right">
                                            <option>Serious</option>
                                            <option>Private</option>
                                        </select>

                                        <div>
                                            <select class="pull-right">
                                                <option>Private</option>
                                                <option>Public</option>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="row">
                                <div class="col-sm-3 glyphicon glyphicon-user fa-5x">
                                    <!--  <img src="avatar.png" class="img-thumbnail"> -->

                                </div>

                                <div class="col-sm-9">
                                    <a href="#" class="pull-left">Grails</a>
                                    <br>

                                    <div class="row">

                                        <div class="col-sm-6">
                                            <h6 class="text-muted">@uday</h6>
                                            <a href="#">Unsubscribe</a>
                                        </div>

                                        <div class="col-sm-3">
                                            <h6 class="text-muted pull-left">Subscriptions</h6>
                                            <h6 class="text-primary">50</h6>
                                        </div>

                                        <div class="col-sm-3">
                                            <h6 class="text-muted  pull-right" ">Post
                                            <br>
                                            <br>

                                            <p class="text-primary">30</p>
                                        </h6>

                                        </div>


                                        <span type="img" class="fa fa-envelope pull-right fa-2x"
                                              style="margin-left: 10px; margin-right: 5px;" data-toggle="modal"
                                              data-target="#myModal5">

                                        </span>
                                        <select class="pull-right">
                                            <option>Serious</option>
                                            <option>Private</option>
                                        </select>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>




            <div class="container">
                <div class="row">
                    <div class="col-lg-6" >
                        <div class="panel panel-default">
                            <div class="panel-heading">

                                <div class="row">
                                    <div class="col-lg-4 subform">Trending Topics</div>
                                    <div class="col-lg-offset-4 col-lg-4"> <a class="a-right">View All</a></div>
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
                                                    <a href="#" class="anchor">${trendingTopics.name} </a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <small class="text-muted">@${trendingTopics.createdBy.userName}</small>
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
</div>
            <div class="panel panel-primary">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="row">
                                <div class="col-sm-3 glyphicon glyphicon-user fa-5x">
                                    <!--  <img src="avatar.png" class="img-thumbnail"> -->

                                </div>

                                <div class="col-sm-9">
                                    <a href="#" class="pull-left">Grails</a>
                                    <br>

                                    <div class="row">

                                        <div class="col-sm-6">
                                            <h6 class="text-muted">@uday</h6>
                                            <a href="#">Unsubscribe</a>
                                        </div>

                                        <div class="col-sm-3">
                                            <h6 class="text-muted pull-left">Subscriptions</h6>
                                            <h6 class="text-primary">50</h6>
                                        </div>

                                        <div class="col-sm-3">
                                            <h6 class="text-muted  pull-right" ">Post
                                            <br>
                                            <br>

                                            <p class="text-primary">30</p>
                                        </h6>

                                        </div>


                                        <span type="img" class="fa fa-file pull-right fa-2x"
                                              style="margin-left: 10px;  margin-right: 5px;" data-toggle="modal"
                                              data-target="#myModal4">

                                        </span>

                                        <span type="img" class="fa fa-envelope pull-right fa-2x"
                                              style="margin-left: 10px;" data-toggle="modal" data-target="#myModal5">

                                        </span>

                                        <span type="img" class="glyphicon glyphicon-trash pull-right fa-2x"
                                              style="margin-left: 10px;" data-toggle="modal" data-target="#myModal">

                                        </span>



                                        <select class="pull-right">
                                            <option>Serious</option>
                                            <option>Private</option>
                                        </select>

                                        <div>
                                            <select class="pull-right">
                                                <option>Private</option>
                                                <option>Public</option>
                                            </select>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>


        <div class="col-sm-7">

            <div class="panel panel-default">

                <div class="panel panel-heading panel-default">
                    <h4>
                        <u>Recent Shares</u>
                    </h4>
                </div>

                <div class="panel panel-body col-sm-3">
                    <img src="vk.jpg" width="100" height="150" class="img-rounded img-responsive">
                </div>

                <div class="panel panel-body col-sm-9">
                    UDAY PRATAP SINGH
                    <div class="text-muted">
                        @uday 5min
                    </div>
                    <a href="self" class=" col-sm-8">Grails</a>
                    <br>
                    Learn how to add a search box inside a responsive navigation menu.
                    Learn how to add a search box inside a responsive navigation menu.
                </div>


                <div class="panel-body">
                    <div class="col-sm-12">

                    </div></div></div></div>

    </div>

</div>
</body>
</html>