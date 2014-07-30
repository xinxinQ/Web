﻿<style>

.restCount {font-size:22px; font-weight:bold; color:#1d91c2;}
.restCountWarning {font-size:22px; font-weight:bold; color:#e56f04;}

#mcmdEmotion, #piccmdUpload, #mcmdVideo, #mcmdTag {margin-right:10px; cursor:pointer;padding:2px 0px 0px 19px;}

#mcmdEmotion { background:url("~img/emotion.gif") no-repeat 0px 0px; }
#piccmdUpload { background:url("~img/img.gif") no-repeat 0px 0px; }
#mcmdVideo { background:url("~img/video.gif") no-repeat 0px 0px; }
#mcmdTag {background:url("~img/talk.gif") no-repeat 5px 2px; }
.mBoxClose { cursor:pointer;}

.emotionItem { cursor:pointer;}
.emotionItem:hover {background:#fff;}

</style>
<div id="myform">
<table style="width:98%; margin:auto;" cellpadding="0" cellspacing="0">
    <tr>
        <td style="font-size:16px; font-weight:bold; padding-bottom:5px;">有什么新鲜事？</td>
        <td style="text-align:right;padding-bottom:5px;"><span id="wmsg">还可以输入 <span class="restCount">#{mbTotalCount}</span> 字</span></td>
    </tr>
</table>
<table style="width:98%; margin:auto;background:#eff9fe; border-radius:4px;" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2" style="padding:5px 0px 5px 5px;">
        <textarea id="txtContent" name="Content" style="width:97%; height:80px;border:1px #ccc inset; font-size:14px; line-height:130%; border-radius:3px;"></textarea></td>
    </tr>
    <tr>
        <td style="padding-left:5px; height:35px; vertical-align:top;">
			<div style="margin-top:5px; ">
			插入：
			<span id="mcmdEmotion2"></span>
                <input id="mcmdEmotion" type="button" value="表情" style="border:0px;" />
			<span id="piccmdUpload">图片</span>
			<span id="mcmdVideo">视频</span>
			<span id="mcmdTag">话题</span>
			
			</div>
			<div id="uploadPanel" class="hide"></div>
			<div id="uploadPicThumb"></div>        
        </td>
        <td style="text-align:right; vertical-align:top;padding:3px; padding-right:10px;">
            <input id="btnPublish" type="button" class="btn" value="_{publish}" />
            <span id="loading"></span>
            <input id="picUrl" type="hidden" />
            <input id="videoId" type="hidden" />
            <input id="srcType" type="hidden" />
            <input id="fromPage" type="hidden" />
            <input id="returnUrl" type="hidden" />
        </td>
    </tr>
</table>

</div>

<div id="emBox" class="ebox" style="width:300px;padding:20px 20px; ">
    <div class="mBoxClose" style="float:right;"><img src="~img/box/close.gif" /></div><div id="mbpubEmotion"></div>
    <script>
        _run(function () {
            require(["wojilu.app.microblog"], function (x) {
                $('#mbpubEmotion').html( x.getEmotionTable() );
            });
        });
    </script>
</div>

<div id="picUploadBox" class="ebox" style="width:400px;padding:20px 20px;">
    <div class="mBoxClose" style="float:right;"><img src="~img/box/close.gif" /></div>
    <table><tr><td>上传图片</td>
    <td><input id="file_upload" name="file_upload" type="file" /></td>
    <td><span id="status"></span></td>
    </tr></table>
    <div id="myqueue"></div>
</div>

<div id="iePicBox" class="ebox" style="width:390px;padding:20px 20px; ">
    <div class="mBoxClose" style="float:right;"><img src="~img/box/close.gif" /></div>
    <div><a href="#{uploadLink}" id="lnkPicUplader" class="frmUpdate" loadTo="picUploadFrame"></a></div>
    <div id="picUploadFrame" style="display:none"></div>
</div>

<div id="videoBox" class="ebox" style="width:380px; height:60px;padding:20px;">
    <div class="mBoxClose" style="float:right;"><img src="~img/box/close.gif" /></div>
    <div style="margin-bottom:5px;font-size:12px;">请输入优酷网、土豆网、酷6网等视频网站的视频播放页链接</div>
    <div><input  id="videoUrl" type="text" style="width:300px; border:1px #ccc inset; height:20px;margin-right:5px;" />
    <input id="btnVideo" class="btn btns" type="button" value="确定" /></div>
</div>

<script>

_run( function() {

    var cfg = wojilu.upload.getSettings();

    cfg.uploader = '#{savPicLink}'.toAjax(); // 接受上传的网址
    cfg.postData = #{authJson}; // 客户端验证信息(cookie等)
    cfg.fileTypeExts = '*.jpg;*.gif;*.png;'; // 允许上传的文件类型
    cfg.fileTypeDesc = 'Image Files'; // 选择框中文件类型描述
    cfg.queueID = 'myqueue'; // 显示进度条的容器
    cfg.queueSizeLimit = 1;
    cfg.multi = false;

    cfg.onUploadSuccess = function (file, data, response) {            
        var obj = eval( '('+data+')' );
        $('#uploadPicThumb').html( '<img src="'+obj.picThumbUrl+'" />' );
        $('#picUrl').val( obj.picUrl );
        $('#picUploadBox').slideUp();
    };

    wojilu.upload.initFlash( '#file_upload', cfg );

    require(['wojilu.app.microblog'], function( x ) {
        x.bindMbEvent( '#{getVideoUrl}' , #{mbTotalCount}, '#{ActionLink}');
    });
	
});

</script>