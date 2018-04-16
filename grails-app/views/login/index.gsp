<%--
  Created by IntelliJ IDEA.
  User: chunky
  Date: 29/3/18
  Time: 9:19 PM
--%>

<%@ page import="bootcamp.Resource" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    %{--<meta name="layout" content="main">--}%
    <meta name="layout" content="main">

</head>


<body>

<div class=" container">
    <div class="col-lg-6">

        <div class="col-lg-12" style="margin-top: 25px">

            <g:render template="/resource/recentShares"></g:render>

        </div>

        <div class="col-lg-12" style="margin-top: 25px">

            <g:render template="/resource/topPosts"></g:render>

        </div>

    </div>

    <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading" style="background:#696969">

                <p>

                <h3 style="color:white">Login</h3>
            </p>
            </div>

            <div class="panel-body">

                <g:render template="/user/login"></g:render>
            </div></div></div>

    <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading" style="background:#696969">

                <p>

                <h3 style="color:white">Register</h3>
            </p>
            </div>

            <div class="panel-body">

                <g:render template="/user/register"></g:render>
            </div></div></div>
</div>

</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

