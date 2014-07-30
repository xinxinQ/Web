﻿<div id="commentWrap">
<div><a name="commentTop"></a></div>
<style>
.commentPublishTableWrap { width: 90%;background:#f6f6f6;margin:10px 10px 10px 5px; padding:10px; border-radius:5px; box-shadow:0px 1px 8px rgba(0,0,0,0.3); }
.commentPublishTable { width:98%; }

#commentListWrap {width:95%; border:0px solid blue;}

.commentItem {width:100%; margin: 8px 5px 8px 0px; border-bottom: 1px #ccc solid;padding-bottom:10px;}
.commentItem:last-child { border-bottom: none;  }
.commentSubItem {border-bottom: 0px; border-top:1px solid #ccc; padding-bottom:0px; padding-top:8px;}
.fL { float: left; }
.commentItem img { border-radius:4px;}

.cmUserFace {width:50px;padding-top:3px; padding-right:10px; vertical-align:top; text-align:right;}
.cmUserFace img { border-radius:3px;}
.cmItemMain {}

.replySubList td.cmItemMain {color:#666;}
</style>


    <div style="margin:15px 0px;">
        <span style="font-size:16px;font-weight:bold;">评论列表</span> (共 <span id="replies"></span> 条)
        <a href="#{deleteAllLink}" class="left10 ajaxDeleteCmd #{deleteAllHideClass}" removeId="commentListWrapInner" data-callback="clearReplyCount"><img src="~img/delete.gif" /> 删除所有评论</a>    
    </div>
    <div id="commentFormWrap">
        <div class="commentFormInner">
        <!-- BEGIN loginForm -->
        <div class="commentPublishTableWrap">
        <table class="commentPublishTable">
            <tr>
                <td class="cmUserFaceInfo cmUserFace avs"></td>
                <td>
                    <div><textarea name="commentBody" style="width: 100%;height:60px;"></textarea></div>
                    <div style="margin-top:5px;"><input class="btnComment btn btns" type="button" value="_{submitComment}" /></div>
                </td>
            </tr>
        </table>
        </div>
        <!-- END loginForm -->
        <!-- BEGIN guestForm -->
        <div class="commentPublishTableWrap">
        <table class="commentPublishTable">
            <tr>
                <td style="width: 60px; ">_{userName}<span class="red strong">*</span></td>
                <td>
                    <input style="width: 120px" name="UserName" class="UserName" type="text" />
                </td>
                <td style="text-align:right;">
                    _{emailOrWebsite}
                    <input name="UserEmail" size="20" style="width: 150px;" type="text" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">_{commentBody}<span class="red strong">*</span></td>
                <td colspan="2"><textarea name="commentBody" class="commentBody" style="width: 99%; height: 70px"></textarea></td>
            </tr>
            <tr style="display: none;" class="validationRow">
                <td>_{validationCode}<span class="red">*</span></td>
                <td colspan="2"> #{Captcha}</td></tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2"><div><input class="btnComment btn btns" type="button" value="_{submitComment}" /></div></td>
            </tr>
        </table>
        </div>
        <!-- END guestForm -->
        </div>
    </div>

    <div id="commentListWrap">
    <div id="commentListWrapInner">
        <!-- BEGIN list -->
        <table class="commentItem" id="commentItem#{c.Id}"><tr>
            <td class="cmUserFace avs">#{c.UserFace}</td>
            <td class="cmItemMain">
                <div><span class="strong">#{c.UserName}</span></div>
                <div style="color:#000;max-width:500px;">#{c.Content}</div>
                <div style="color:#666;margin-top:2px;">
                    (#{c.Created})  <span class="hide link left5">支持</span>
                    <span class="hide link left5">收藏</span>
                    <span class="link lnkReply left5" data-ParentId="#{c.Id}">回复</span>
                    <a href="#{c.DeleteLink}" class="ajaxDeleteCmd #{hideClass}" removeId="commentItem#{c.Id}" data-callback="substractReplyCount">删除</a>
                    <span class="replyCount left5" data-ReplyCount="#{c.Replies}" data-MoreId="replyListMore#{c.Id}" data-ParentId="#{c.Id}" data-StartId="#{c.StartId}"></span>
                </div>
                <div class="replyFormWrap"></div>
                <div class="replySubList" id="replyListLine#{c.Id}" style="width:95%;">

                    <!-- BEGIN replyList -->
                    <table class="commentItem commentSubItem" id="commentItem#{c.Id}" style="width:99%;"><tr>
                        <td class="cmUserFace avs">#{c.UserFace}</td>
                        <td class="cmItemMain">
                            <div><span class="strong">#{c.UserName}</span></div>
                            <div id="replySubContent#{c.Id}" style="width:100%;">#{c.Content}</div>
                            <div style="color:#666;margin-top:2px;">(#{c.Created})  <span class="hide link left5">支持</span>
                            <span class="hide link left5">收藏</span>
                            <span class="link lnkSubReply left5" data-ParentId="#{c.ParentId}" data-AtId="#{c.Id}" data-Author="#{c.AuthorText}">回复</span>
                            <a href="#{c.DeleteLink}" class="ajaxDeleteCmd #{hideClass}" removeId="commentItem#{c.Id}" data-callback="substractReplyCount">删除</a>
                            </div>
                        </td></tr>
                    </table>
                    <!-- END replyList -->
                    <div id="replyMoreWrap#{c.Id}"></div>
                    <div id="replyListMore#{c.Id}" class="link left15 moreLink"></div>

                </div>
                
            </td></tr>
        </table>
        <!-- END list -->
        </div>
    </div>
    <div>#{page}</div>
</div>
<script>

    function clearReplyCount() {
        $('#replies').text( 0 );
        $('#contentReplies', window.parent.document ).text( 0 );
    }

    function substractReplyCount() {
        var replies = parseInt( $('#replies').text() );
        if( replies>0 ) replies = replies-1; 
        $('#replies').text( replies );
        $('#contentReplies', window.parent.document ).text( replies );
    }

    _run(function () {

        $('.turnpage a').attr('target', '');
        $('.turnpage a').each( function() {
            var newUrl = $(this).attr('href')+'#commentTop';
            $(this).attr('href', newUrl);
        });

        var commentInfo = {

            createLink: '#{createLink}',
            moreLink: '#{moreLink}',

            userFace: '#{userFace}',
            userName: '#{userName}',

            replies: #{cmCount}, // 所有评论数量
            subCacheSize: #{subCacheSize}, // 子回复最多呈现的数量  
            
            thisRenumId: '#{thisRenumId}',           

            thisUrl: '#{thisUrl}',
            thisDataTitle: '#{thisDataTitle}',
            thisDataType: '#{thisDataType}',
            thisDataUserId: #{thisDataUserId},
            thisDataId: #{thisDataId},
            thisOwnerId: #{thisOwnerId},
            thisAppId: #{thisAppId},
            thisFeedId: #{thisFeedId}

        };

        require(['wojilu.core.comment'], function (x) {
            x.bindEvent(commentInfo);
        });

    });
</script>
