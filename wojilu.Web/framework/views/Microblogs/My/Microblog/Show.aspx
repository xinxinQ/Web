﻿<style type="text/css">
.commentCmd {cursor:pointer; }
#commentForm table td { padding:5px;}
#commentList img { padding:2px; border:1px #ddd solid;}
</style>

#{blogList}

<div style="margin:10px 30px 10px 30px;">    
	
	<div style="font-size:16px; font-weight:bold; padding:3px 10px; background:#f2f2f2;">_{comment}</div>
	
	<div style="margin:15px 0px; border-bottom:1px #aaa dotted;">
    <div id="commentForm">
    <form method="post" action="#{ActionLink}" class="ajaxUpdateForm">
    <table style="width:100%;">
        <tr>
            <td style="vertical-align:top; text-align:center;width:60px;"><img src="#{viewer.PicSmall}" /></td>
            <td style="text-align:left; vertical-align:top;">
                <div style="border:0px #666 solid;"><textarea name="content" style="width:100%;height:50px;"></textarea><span class="valid hide" mode="border"></span></div>
                <div style="margin-top:5px;">
                    <label><input id="Checkbox1" name="isRepost" type="checkbox" />同时转发到我的微博</label>
                    <input type="submit" value="_{comment}" class="btn btns left10" id="btnComment" />
                    <input name="rootId" type="hidden" value="#{c.RootId}" />
                    <input name="parentId" type="hidden" value="#{c.ParentId}" />                
                </div>
            </td>
        </tr>
    </table>
    </form>
    </div>
    </div>

    <div style="margin:30px 5px 5px 0px; " id="commentList">
    <div id="blogComments#{blog.Id}"></div>
    <!-- BEGIN comments -->
    <div style="border-bottom:1px #ccc dotted; padding-top:10xp;">
    <table style=" margin:10px 0px 5px 0px;background2:#ebf3f7;width:100%; " border="0" class="commentItem">
        <tr>
            <td rowspan="2" style="width:60px; vertical-align:top;">
                <a href="#{user.Link}"><img src="#{user.Face}" style=""/></a>
            </td>
            <td style="vertical-align:top;">
            <div>
                <a href="#{user.Link}">#{user.Name}</a> 
                <span class="note">_{postedAt} #{comment.Created}</span>                
            </div>
            </td>
            <td style="text-align:right;">
                <a href="#{comment.ReplyUrl}" class="frmBox">_{reply}</a>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="vertical-align:top;">
                <div style="margin-top:5px; color:#666;" id="commentContent#{comment.Id}" class="commentContent">#{comment.Content}
                </div>            
            </td>
        </tr>
    </table>
    </div>
    <!-- END comments -->
    </div>



    <div style="margin:10px;">#{page}</div>

</div>
			
<script>

_run( function() {
    wojilu.ui.valid();
    wojilu.ui.ajaxUpdateForm();
});

</script>


