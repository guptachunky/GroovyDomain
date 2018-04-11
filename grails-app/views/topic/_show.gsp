<div class="row">
    <div class="col-lg-4 subform">Subscription</div>

    <div class="col-lg-offset-4 col-lg-4"><a class="a-right">View All</a></div>
</div>
</div>

<div class="panel-body">
    <div class="row">
        <g:each in="${session.user?.subscribedTopic}" var="subscribedTopics">

            <div class="col-lg-offset-1 col-lg-2">
                <img class="img-responsive" alt="dummy" src="index.jpeg"/>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-sm-12">
                        <a href="#" class="anchor">${subscribedTopics?.topics?.name}</a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <small class="text-muted">@${subscribedTopics?.user?.userName}</small>
                    </div>

                    <div class="col-sm-4">
                        Subscriptions</div>

                    <div class="col-sm-4">Post</div>
                </div>

                <div class="row">
                    <div class="col-sm-4"><a>Unsubscribe</a></div>

                    <div class="col-sm-4"><a>50</a></div>

                    <div class="col-sm-4"><a>30</a></div>
                </div>

                <div class="row">
                    <g:if test="${session.user}">

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

                        </div></g:if>

                    <div class="col-sm-4">
                        <a class="fa fa-envelope-o" data-toggle="modal" href="#SendInvite"
                           aria-hidden="true"></a>
                        <a class="fa fa-file-o" data-toggle="modal" href="#CreateTopic"
                           ariahidden="true"></a>
                        <a class="fa fa-trash" aria-hidden="true"></a>
                    </div>

                </div>
            </div>
        </g:each>
        <hr>
    </div>
</div>
