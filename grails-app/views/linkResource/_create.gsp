<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            Sharing Link (Pop Up)
        </div>

        <div class="modal-body">

<g:form class="form-horizontal" controller="linkResource"
        action="save">
    <div class="form-group">
        <label class="control-label col-sm-2" for="email">Link:*</label>

        <div class="col-sm-10">
            <input type="text" name="url" class="form-control">

        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="email">Description*:</label>

        <div class="col-sm-10 ">
            <textarea rows="4" cols="50" name="description">
                Description
            </textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="email">Topic*:</label>

        <div class="col-sm-10 ">
            <select class="form-control" name="topic" id="topicLink">
                <g:each in="${session.user?.getSubscribedTopics()}" var="subscribedTopics">

                    <option value="${subscribedTopics?.topic?.name}">${subscribedTopics?.topic?.name}</option>
                </g:each>
            </select>
        </div>
    </div>


    <div class="form-group">
        <input type="submit" name="user" class="btn btn-success col-sm-offset-2 col-sm-2" value="share">
        <input type="submit" name="user" class="btn btn-success col-sm-offset-3 col-sm-2" value="cancel">
    </div>
</g:form>
</div>
</div>
</div>
