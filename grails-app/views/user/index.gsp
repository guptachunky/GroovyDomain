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
    <link rel="stylesheet" href="https:
    //maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>
        Liink Sharing Bootstrap

    </title>
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
                <div class="panel-heading" style="background:#696969">

                    <div class="row">
                        <div class="col-lg-4 subform">User Details</div>

                    </div>
                </div>

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
                <div class="panel-heading" style="background:#696969">Inbox</div>

                <div class="panel-body">
                    <g:each in="${resourceList}" var="resource">

                        <div class="col-lg-offset-1 col-lg-2">
                            <img class="img-responsive" alt="dummy" height="64" width="64" src=" "/>

                        </div>

                        <div class="col-lg-9">
                            <span>
                                ${resource.user}
                            </span>

                            <a class="a-right" href="#" class="anchor">Grails</a>

                            <div class="row">
                                <div class="col-sm-12">
                                    <p>
                                        ${resource.description}
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
                                    <g:link controller="resource" action="changeIsRead" id="${resource.id}">
                                        <ls:readLink read="${resource.id}"></ls:readLink>
                                    </g:link>
                                </div>

                                <div class="col-sm-3">
                                    <small>
                                        <a href="#">View Post</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </g:each>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background:#696969">

                            <div class="row">
                                <div class="col-lg-4 subform">Subscription</div>

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
                                                <g:link controller="topic" action="show"
                                                        id="${subscribedTopics.id}">${subscribedTopics?.name}</g:link>
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

                                            <div class="col-sm-4">
                                                %{--<a href="/grails-app/topic/save">Unsubscribe</a>--}%


                                                <g:link controller="subscription" action="changeSubscription"
                                                        id="${subscribedTopics.id}">
                                                    Unsubscribe
                                                %{--<ls:showSubscribe read="${post.id}"></ls:showSubscribe>--}%
                                                </g:link>

                                            </div>

                                            <div class="col-sm-4"><a>
                                                ${subscribedTopics.subscriptions.size()}
                                            </a></div>

                                            <div class="col-sm-4"><a>${subscribedTopics.resources.size()}</a></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">

                                                <select name="updatedSeriousness" id="updateSeriousness"
                                                        onchange="changeSeriousness(${subscribedTopics.id}, this.value)">

                                                    <option value="${constant.Seriousness.Serious}"
                                                            selected="true">Serious</option>
                                                    <option value="${constant.Seriousness.VerySerious}">VerySerious</option>
                                                    <option value="${constant.Seriousness.Casual}">Casual</option>
                                                </select>

                                            </div>

                                            <div class="col-sm-4">

                                                <select name="updatedVisibility" id="updateVisibility"
                                                        onchange="changeVisibility(${subscribedTopics.id}, this.value)">

                                                    <option class="placeholder" selected disabled
                                                            value="">${subscribedTopics.visibility}</option>

                                                    <option value="${constant.Visibility.Public}"
                                                            selected="true">Public</option>
                                                    <option value="${constant.Visibility.Private}"
                                                            selected="true">Private</option>
                                                </select>




                                                %{--<select>--}%
                                                %{--<option>Private</option>--}%
                                                %{--<option selected="true">Public</option>--}%
                                                %{--</select>--}%

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
                        <div class="panel-heading" style="background:#696969">

                            <div class="row">
                                <div class="col-lg-4 subform">Trending Topics</div>

                            </div>
                        </div>

                        <div class="panel-body">
                            <g:each in="${bootcamp.Topic.getTrendingTopic()}" var="trendingTopics">

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
<script>
    function changeSeriousness(subscriptionId, value) {
        console.log("inside change")
        console.log("id is : ", subscriptionId)
        console.log("value is : ", value)
        $.ajax({
            type: 'post',
            data: {'id': subscriptionId, 'seriousness': value},
            url: '/grails-app/subscription/changeSeriousness',
            dataType: 'json',
            success: function (res) {
                alert(res);
            },
            error: function (res) {
                $('#message').text('Error!');
                $('.dvLoading').hide();
            }
        });
    }
</script>

<script>
    function changeVisibility(topicId, value) {
        console.log("inside change")
        console.log("id is : ", topicId)
        console.log("value is : ", value)
        $.ajax({
            type: 'post',
            data: {'id': topicId, 'visibility': value},
            url: '/grails-app/topic/changeVisibility',
            dataType: 'json',
            success: function (res) {
                alert(res);
            },
            error: function (res) {
                $('#message').text('Error!');
                $('.dvLoading').hide();
            }
        });
    }
</script>
</body>
</html>
