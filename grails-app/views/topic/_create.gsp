<!-- Create Toppic Modal -->
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            Create Topic (Pop Up)
        </div>

        <div class="modal-body">

            <form id="saveTopic">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name:</label>

                    <div class="col-sm-10">
                        <g:textField type="text" class="form-control"
                                     placeholder="Enter Topic Name" name="name"/>
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Visibility:</label>

                    <div class="col-sm-10 ">

                        <select name="visibility" id="visibility">
                            <option value="Public">Public</option>
                            <option value="Private">Private</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">

                    <input type="button" id="topicSaveButton" value="Save" class="btn btn-primary"/>
                    <input type="button" name="user" class="btn btn-success col-sm-offset-3 col-sm-2" value="cancel">
                </div>
            </form>

            %{--</g:form>--}%

        </div>
    </div>
</div>

<!-- </div> -->
<!-- End Creationg -->
