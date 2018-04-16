<%@ page import="bootcamp.Topic" %>
<div class="container col-sm-12">
    <div class="row">

        <div class="col-sm-8">

            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title">
                        Send Invitation (Pop-up)
                        <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
                    </h3>
                </div>

                <div class="panel">
                    <div class="panel-body">
                        <g:form controller="topic" action="invite" method="post">
                            <div class="form-group" >
                        <div class="form-group col-lg-10">
                        <label class="control-label col-sm-2">Email:</label>

                        <div class="col-sm-10">
                        <input class="form-control" type="email" name="to" placeholder="enter the email of the recepient">

                        </div>
                        </div>
                        <span class="caret"></span>

                            <g:select name="topic" optionKey="id" optionValue="name"
                                      from="${session.user.getSubscribedTopics()}"/>
                            <br>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <g:submitButton name="Share" value="Invite">Invite</g:submitButton>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
