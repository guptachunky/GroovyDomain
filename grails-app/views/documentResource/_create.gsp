<%@ page import="bootcamp.Topic" %>
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="modal-header">--}%
%{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}%
%{--Sharing Document (Pop Up)--}%
%{--</div>--}%

%{--<div class="modal-body">--}%
%{--<form class="form-horizontal">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-sm-2" for="email">Link:*</label>--}%

%{--<div class="col-sm-10">--}%
%{--<input type="text" name="link" class="form-control">--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="form-group">--}%
%{--<label class="control-label col-sm-2" for="email">Description*:</label>--}%

%{--<div class="col-sm-10 ">--}%
%{--<textarea rows="4" cols="50">--}%
%{--Description--}%
%{--</textarea>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="form-group">--}%
%{--<label class="control-label col-sm-2" for="email">Topic*:</label>--}%

%{--<div class="col-sm-10 ">--}%
%{--<select class="col-sm-12">--}%
%{--<option value="volvo">Topic</option>--}%
%{--<option value="saab">Topic</option>--}%
%{--<option value="opel">Topic</option>--}%
%{--<option value="audi">Topic</option>--}%
%{--</select>--}%
%{--</div>--}%
%{--</div>--}%


%{--<div class="form-group">--}%
%{--<input type="submit" name="user" class="btn btn-success col-sm-offset-2 col-sm-2" value="share">--}%
%{--<input type="submit" name="user" class="btn btn-success col-sm-offset-3 col-sm-2"--}%
%{--value="cancel">--}%
%{--</div>--}%

%{--</form>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%


<div class="modal-dialog">

    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">create document resource</h4>
        </div>

        <div class="modal-body row">

            <g:uploadForm controller="DocumentResource" action="update" method="post">

                <div class="form-group row">
                    <label class="control-label col-sm-2" for="document">document</label>

                    <div class="col-sm-10 row">
                        <input type="file" id="document" name="document"/>

                    </div>

                </div>

                <br>


                <div class="form-group row">
                    <label class="control-label col-sm-2" for="description">description:</label>

                    <div class="col-sm-10">
                        <textarea class="form-control" id="description" rows="5"
                                  placeholder="enter the description of tha resource">

                        </textarea>
                    </div>
                </div>

                <div class="dropdown">
                    <label class="control-label col-sm-2" for="topicName">topic:</label>

                    <g:select name="topicName" from="${bootcamp.Subscription.findAllByUser(session.user)}"
                              value="name">Topics
                    </g:select>

                </div>

                <div class="form-group">
                    <br>

                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">share</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </g:uploadForm>

        </div>

    </div>

</div>

