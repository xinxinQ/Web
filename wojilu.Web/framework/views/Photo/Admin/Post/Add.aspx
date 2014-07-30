﻿<div style="padding:20px 30px;">

	<form id="uploadPhotoForm" method="post" action="#{ActionLink}">
	<table cellSpacing="1" cellPadding="4" >
		<tr>
			<td colspan="2"><strong>:{selectAlbum}</strong></td>
		</tr>
		<tr>
			<td>:{myalbum}</td>
			<td>#{PhotoAlbumId} <a href="#{PhotoAlbumAddUrl}" class="cmd" style="margin-left:10px;">+:{addAlbum}</a></td>
		</tr>
		<tr><td>:{sysCategory}</td><td>
		#{SystemCategoryId}
		</td></tr>
		<tr>
			<td colSpan="2" style="padding:15px;">
				<input name="Submit1" type="submit" value=":{nextStep}" class="btn">
				<span id="btnStartUpload" class="left20 strong link">或者 <img src="~img/s/upload.png" />批量上传</span>
			</td>
		</tr>
	</table>
	<div id="uploadPanel" style="display:none;margin-top:-20px;">
	    <div style="margin:0px 0px 0px 20px;"><input id="myFile" name="myFile" type="file" /></div>
        <div id="uploadResult" style="margin-left:22px; margin-top:10px;">一次最多选择10张图片</div>
	    <div id="uploadProgressBar"></div>	
	</div>
	
	</form>
</div>


<script type="text/javascript">
<!--

var arrIds = [];

_run( function() {
	$('#uploadPhotoForm').submit( function() {
		var catid = $('#SystemCategoryId').val();
		if( catid<=0 ) {
			alert( ':{exSysCategoryRequire}' );
			return false;
		}
	});
	
    
    $('#btnStartUpload').click( function() {
	    var catid = $('#SystemCategoryId').val();
	    if( catid<=0 ) {
		    alert( ':{exSysCategoryRequire}' );
		    return false;
	    }
		
        $(this).hide().prev().hide();
        $('#uploadPanel').show();
        
        var albumId = $('#PhotoAlbumId').val();
        var params = #{authJson};
        params[ 'SystemCategoryId' ] = catid;
        params[ 'PhotoAlbumId' ] = albumId;

        var cfg = wojilu.upload.getSettings();

        cfg.uploader = '#{uploadLink}'.toAjax(); // 接受上传的网址
        cfg.postData = params; // 客户端验证信息(cookie等)
        cfg.fileTypeExts = '*.jpg;*.gif;*.png;*.jpeg;*.bmp;'; // 允许上传的文件类型
        cfg.fileTypeDesc = 'Image Files'; // 选择框中罗列的类型
        cfg.queueID = 'uploadProgressBar'; // 显示进度条的容器

        // 可以自定义上传处理结果
        cfg.errors= '';
        cfg.validCount = 0;
        cfg.errorCount = 0;

        // 每个文件上传成功之后在这里处理。data是服务端返回的数据。
        cfg.onUploadSuccess = function (file, data, response) {

            var obj = eval( '('+data+')');

            if( wojilu.str.isJson( obj ) ) {
                if( obj.IsValid ) {
                    arrIds.push( obj.Info.Id );
                    cfg.validCount += 1;
                }
                else {
                    cfg.errors += obj.Msg + '<br/>';
                    cfg.errorCount += 1;
                }    
            }        
        };

        cfg.onQueueComplete = function (data) {


            var msg = cfg.validCount + ' 个文件上传成功. ';
            if( cfg.errors.length>0 ) msg += '<br/>' + cfg.errorCount + ' 个错误：<br/>'+cfg.errors;
            $('#uploadResult').html( msg );

            // 重置
            cfg.errors = '';
            cfg.validCount = 0;
            cfg.errorCount = 0;

            // 发送feed信息
            $.post( '#{feedLink}'.toAjax(), {ids:arrIds.join(','), albumId:$('#PhotoAlbumId').val()}, function(data) {
                if( data=='ok') {
                }
                else {
                    logger.info( data );
                }
            });

        };

        wojilu.upload.initFlash( '#myFile', cfg );        
        
    });
});
//-->
</script>
