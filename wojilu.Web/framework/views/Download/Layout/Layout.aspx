﻿<style>

.downloadSidebar { background:#f3f3f3;width:200px; float:left;}
.downloadSidebarMain {border:1px #ddd solid;}
.downloadSidebar ul { margin-bottom:0px;}
.downloadSidebar li { border-top: 1px solid #fcfcfc;border-bottom: 1px solid #e5e5e5;}
.downloadSidebar li:last-child  {border-bottom:0px;}
.downloadSidebar li a { color:#333; }
.cat-title {margin:10px 10px 10px 10px; font-size:14px; font-weight:bold; }
.cat-list {margin:0px 10px 15px 10px;}
.cat-list a {margin-right:10px; }
.downloadSidebarMain li .cat-list a {color:#666;}

.sidebarTitle {background:#f5f5f5; color:#222; font-size:16px; font-weight:bold; text-align:center; padding:10px;border-bottom: 1px solid #e5e5e5;}
.sidebarPanel {margin:10px 5px 15px 5px;}


.downloadMain {width:700px; float:left;  margin:5px 0px 0px 15px; }
.downloadLocation {width:100%; margin-bottom:10px;margin-left:5px;}
.downloadCategoryLocation {margin:10px 15px 10px 0px; background:#f2f2f2; padding:5px; line-height:150%; border-radius:4px;}
.downloadCategoryLocation a {margin-right:5px; color:#666;}


.fdTitle { font-size:18px; font-weight:bold; background:#f2f2f2; padding:5px; margin-bottom:10px; margin-right:15px;}
.fdLine {font-size:16px; font-weight:bold; background:#f2f2f2;padding:5px 5px 3px 5px; margin-right:15px;}

#postComment h4 {font-size:16px; font-weight:bold; background:#f2f2f2;padding:5px 5px 3px 5px;}

.fileTitle { font-size:14px; font-weight:bold;}
.fileInfo { color:#333;}
.fileRank {}
.fileSummary { color:#666; line-height:135%;word-break: break-all;word-wrap: break-word; }

.fileDownload { vertical-align:top; padding-top:1px;}
.fileDownload .note { text-align:center; margin-top:3px;}

.dowloadLeftLabel {background:#f2f2f2;width:75px; text-align:center;}


</style>

<div style="padding:20px 10px 10px 15px;">

<div id="adminTool" class="row appAdminTool" style=" display:none;">
    <div class="admin-menu-wrap clearfix alert">
        <div class="admin-pointer">            
            <span class="btn btn-primary">
                文件管理 <i class="icon-hand-right icon-white"></i>
            </span>
        </div>

        <ul class="admin-menu unstyled">	
            <li><a href="#{lnkFiles}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/list.gif" /> 所有文件</a></li>
            <li><a href="#{lnkAdd}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/add.gif" /> 添加文件</a></li>
            <li><a href="#{lnkCateAdmin}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/app/download/category.png" /> 分类管理</a></li>
            <li><a href="#{lnkSubCate}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/app/download/subcategory.png" /> 子类管理</a></li>
            <li><a href="#{lnkLicense}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/app/download/license.png" /> 授权方式</a></li>
            <li><a href="#{lnkPlatform}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/app/download/platform.png" /> 运行平台</a></li>
            <li><a href="#{lnkLang}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/app/download/lang.png" /> 语言类型</a></li>
            <li><a href="#{lnkComment}" class="frmLink" loadTo="downloadPage" nolayout=3><img src="~img/talk.gif" /> 评论</a></li>

        </ul>

    </div>
</div>


    <div id="downloadPage">#{layout_content}
    <div class="clear"></div>
    
    </div>    
</div>

<script>
_run(function () {

    $('.admin-menu li').click(function () {
        $('.admin-menu li').removeClass('admin-menu-current');
        $(this).addClass('admin-menu-current');
    });

    var showAdminTool = function() {
        if( typeof(ctx) == 'undefined' ) return;
        if( ctx.viewer.IsLogin==false  ) return;
        
        if( ctx.owner.IsSite) {
            
            if( ctx.viewer.IsAdministrator ) {
                $('#adminTool').show();
            }
            else if( ctx.viewer.IsInAdminGroup )  {
                $.post( '#{adminCheckUrl}'.toAjax(), function(data) {
                    if( 'ok'==data ) $('#adminTool').show();
                });
            }
            
            
        }
        else if( ctx.viewerOwnerSame ) {
            $('#adminTool').show();
        }

    };
    
    wojilu.site.load( showAdminTool );

    wojilu.ui.frmLink();
});
</script>