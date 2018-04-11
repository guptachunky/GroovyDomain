<%@ page import="bootcamp.Subscription; bootcamp.User" %>
<html>
<head>
    <title>

    </title>
</head>


<body>

%{--<img src="">--}%
%{--<img class="img-responsive" alt="dummy"  height="64" width="64" src="data:image/png;base64,${session.user?.photo.encodeBase64()} "/>--}%

<g:paginate next="Forward" prev="Back"
            maxsteps="0" controller="awai"
            action="index" total="${bootcamp.Subscription.count}"/>


<g:each in="${bootcamp.Subscription.getAll()}" var="user">
    <div>
        ${user.topic}
    </div>
    <br/>
</g:each>

</body>

</html>