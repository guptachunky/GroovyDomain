<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <g:layoutHead/>
</head>

<body>
<div class="panel">
    <div class="panel panel-default">

        <div class="row well">
            <div>
                <div class="col-md-6 col-sm-6">
                    <a class="pull-left a1" style="text-decoration: none">Link Sharing</a>
                </div>

                <div class="col-md-6 col-sm-6">
                    <div class="col-md-4 col-sm-3 searchbox">
                        <div class="input-group ">
                            <span class="input-group-addon glyphicon glyphicon-search"></span>
                            <input id="dashBoardHeaderSearchTag" type="search" class="form-control"
                                   placeholder="search"/>
                            <span class="input-group-addon glyphicon glyphicon-remove-sign"></span>


                        </div>
                    </div>
                </div>
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
