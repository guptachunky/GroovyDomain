<%@ page import="bootcamp.Resource" %>
<div class=" panel panel-default     ">
    <div class="panel-heading  col-lg-12" style="background:#696969">
        <h3 style="color:white " class="col-lg-8">Top Posts</h3>



    </div>

    <div class="panel-body  ">
        <g:each in="${bootcamp.Resource.getTopPost()}" var="topPosts">
            <div class="col-lg-12">
                <div class="col-lg-3" style="margin-top: 25px">
                    <i class="fa fa-user fa-5x" aria-hidden="true"></i>

                </div>

                <div class="col-lg-9">

                    <p>${topPosts.user.getUserName()}<span
                            style="color: darkgray">@${topPosts.user.userName}</span><span
                            class="pull-right"
                            style="margin-right: 0px;color: #007efc;font-size: small">${topPosts.topic.name}</span>
                    </p>

                    <p>${topPosts.topic.name}</p>


                    <i class="fa fa-facebook-official fa-lg" aria-hidden="true"></i>
                    <i class="fa fa-google fa-lg" aria-hidden="true"></i>
                    <i class="fa fa-twitter fa-lg" aria-hidden="true"></i>
                    <span class="pull-right" style="margin-right: 0px;color: #007efc">
                        <g:link controller="topic" action="show"
                                id="${topPosts.topic.id}">view Topic</g:link>
                    </span>

                </div>
            </div>
        </g:each>
    </div>
</div>