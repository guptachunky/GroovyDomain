<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <asset:javascript src="application.js?compile=false"/>
    <g:layoutHead/>
</head>

<body>
<div class="panel">
    <div class="panel panel-default">

        <div class="row well">
            <div>
                <div class="col-md-6 col-sm-6">
                    <a href="/grails-app/user/index" class="pull-left a1"
                       style=" text-decoration: none">Link Sharing</a>
                </div>

                <g:form class="search" url="[controller: 'topic', action: 'search']">

                    <span><i class="fa fa-search"></i></span>
                    <input id="search" placeholder="Search" name="key">
                    <span><i class=" fa fa-times"></i></span>
                </g:form>

            </div>
        </div>

        <g:if test="${flash.error}">
            <g:message message="${flash.error}"></g:message>

        </g:if>

        <g:if test="${flash.message}">
            <g:message message="${flash.message}"></g:message>

        </g:if>


        <g:layoutBody/>

    </div>
</div>
</body>
</html>
