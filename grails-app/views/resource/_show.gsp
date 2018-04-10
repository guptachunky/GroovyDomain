
    <g:each in="${bootcamp.Resource.getTopPost()}" var="post">
        <div class="row">
            <div class=" col-lg-offset-1 col-lg-2">
                <img class="img-responsive" alt="dummy" src="index.jpeg"/>
            </div>

            <div class=" col-lg-9">
                <div class="row">
                    <div class="col-sm-7">
                        <span>${post.user.userName}</span> <small class="text-muted">@uday
                    5min</small>
                    </div>

                    <div class="cil-sm-offset-4 col-sm-1">
                        <a href="#" class="anchor">${post.topic.name}</a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-11" style="padding-right: 23px">
                        ${post.description}</div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <span>
                        <i class="fa fa-facebook-square" aria-hidden="true"></i> <i class="fa fa-tumblr"
                                                                                    aria-hidden="true"></i> <i
                            class="fa fa-google-plus" aria-hidden="true"></i>
                    </span>
                </div>

                <div class="col-sm-offset-2 col-sm-4">
                    <a href="#">View Post</a>
                </div>
                <g:if test="${session.user}">

                    <div class="col-sm-offset-2 col-sm-4">
                        <a href="#">Edit</a>
                    </div>

                    <div class="col-sm-offset-2 col-sm-4">
                        <a href="#">Delete</a>
                    </div>
                </g:if>

            </div>
        </div>
    </g:each>
