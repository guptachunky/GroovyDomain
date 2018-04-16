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

<div class="panel panel-default">
    <div class="panel-heading">
        UserList
    </div>

    <div class="panel-body">

        %{--<g:render template="userList" collection="${user1}"></g:render>--}%

        <div class="col-lg-12" style="margin-top: 20px">
            <div class="col-lg-7">
                <g:if test="${flash.error}">
                    <g:message message="${flash.error}"></g:message>

                </g:if>
                <g:if test="${flash.message}">
                    <g:message message="${flash.message}"></g:message>

                </g:if>

                <div class="panel-body">
                    <g:each in="${user1}" var="user">

                        <div class="col-lg-12">
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
                                        <p class="name-font">${user.userName}<sub
                                                class="text-muted">@${user.firstName}</sub></p>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <span class="">Subscription</span>
                                            </div>

                                            <div class="col-sm-4">
                                                <span>Topic</span>
                                            </div>


                                            <div class="col-sm-4">
                                                <span>Active</span>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <a href="#">${user.topics.size()}</a>

                                            </div>

                                            <div class="col-sm-4">
                                                <a href="#">${user.subscriptions.size()}</a>

                                            </div>


                                            <div class="col-sm-4">
                                                <a href="${createLink(controller: 'user', action: 'changeActiveness', id: user.id)}">${user.active}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-footer">
        <br/>
        <g:paginate total="${total}" prev="Previous" next="Next" controller="admin" action="userList" max="2"/><br/>
    </div>
</div>
</body>
</html>