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
                                <p class="name-font">${user.userName}<sub
                                        class="text-muted">@${user.firstName}</sub></p>

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
                                        <a href="#">${user.topics.size()}</a>

                                    </div>

                                    <div class="col-sm-6">
                                        <a href="#">${user.subscriptions.size()}</a>

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