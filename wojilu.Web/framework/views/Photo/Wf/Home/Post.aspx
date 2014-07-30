﻿<div class="row" style="width:1060px; margin:20px auto;">

    <div class="span9">
    
        <div style=" background:#fff; border:1px solid #ccc; border-radius:4px;">
        
            <div class="row" style="padding-top:20px;">
                <div class="span6">
                    <div style="margin:10px 30px;">
                        <div class="pull-left"><a href="#{x.CreatorLink}"><img src="#{x.CreatorPic}" class="avs radius3" /></a></div>
                        <div class="pull-left left10" style="width:300px;">
                            <div><a href="#{x.CreatorLink}">#{x.CreatorName}</a> 添加到 <a href="#{x.AlbumLink}">#{x.AlbumName}</a></div>
                            <div class="note">#{x.Created}</div>
                        </div>
                    </div>
                </div>

                <div class="span2 pull-right">
                    <div style="text-align:right; padding-right:40px; margin-top:10px;">
                    <a href="#{x.CreatorLink}" class="btn"><i class="icon-hand-right"></i> 访问TA</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div style="margin-left:20px; margin-top:20px; border-top:1px solid #ccc; "></div>
            </div>

            <div class="row">
                
                <div class="span9" style="padding-top:20px;">
                    <div class="span5" style="padding-top:3px;">
                        <span>收集:#{x.Pins}</span>
                        <span class="left10">喜欢:#{x.Likes}</span>
                        <span class="left10">评论:<span id="contentReplies">0</span></span>                        
                        <span class="left20"><img src="~img/zoomOut.gif" /></span> <a href="#{x.PicO}" target="_blank">:{viewOriginalPhoto}</a>
                        <span class="left10">#{lnkPrevNext}</span>
                        
                    </div>

                    <div class="span3 pull-right">
                        <div style=" text-align:right; padding-right:50px;">
                        <a href="#{x.RepinLink}" class="btn btn-success frmBox"><i class="icon-plus icon-white"></i> 收集</a>
                        <button class="btn btn-info left5 #{x.LikedCss}" data-like-href="#{x.LikeLink}" data-unlike-href="#{x.UnLikeLink}"> #{x.LikeName}</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row top20">
                <div class="span9" style=" text-align:center;">
                    <div><img src="#{x.PicM}" /></div>
                    <div style="margin:10px; font-size:14px;">
                        <div><strong>#{x.Title}</strong></div>
                        <div class="top5">#{x.Description}</div>                        
                    </div>
                </div>
            </div>
            
            <div class="row top10">
                <div style=" background:#f2f2f2; padding:5px 0px;margin-left:20px;">
                    <div style="text-align:right; margin-right:40px;">
                        <span class="right20">所属专辑：<a href="#{x.AlbumLink}">#{x.AlbumName}</a></span>
                        <span class="note"><i class="icon-hand-right"></i> 来源：#{x.SrcInfo}</span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span8 pull-right1" style="padding-left:25px;">

                    <div style="margin-left:5px;"></div>
                    <div class="top10">
                    	<div class="shareCmd"></div>
	                    <script>
	                        _run(function () {
	                            wojilu.tool.shareFull();
	                        });
	                    </script>            
                    </div>
    
                    
        
                </div>
            </div>


            <div class="row top20">
                <div class="span8" style="padding:20px 30px;">
		<div>
		    <div><a href="#{thisUrl}" id="comentLink" class="frmLink" loadTo="commentMain" nolayout=999></a></div>
		    <div id="commentMain"></div>
		</div>
		<script>
		    _run(function () {
		        wojilu.ctx.changeUrl = false;
		        wojilu.ui.frmLink();
		        $('#comentLink').click();
		    });
		</script>


                </div>
                
            </div>
        
        </div>      

    </div>

    <div class="span4">


        <div style=" background:#fff; border:1px solid #ccc; border-radius:4px; padding:10px 20px;">
            <div class="clearfix">
                <div class="pull-left"><i class="icon-th"></i> <span class="font14">#{x.AlbumName}</span>            
                </div>
                <div class="pull-right"><a href="#{x.AlbumLink}">_{more}</a></div>
            </div>

            <ul class="unstyled"><!-- BEGIN cposts -->
                <li style=" float:left; margin:10px 10px 5px 0px;width:76px;height:76px;">
                    <a href="#{x.Link}"><img src="#{x.PicS}" style="width:68px;border:1px solid #ccc; padding:3px;" /></a>
                </li><!-- END cposts -->
            </ul>

            <div class="clear"></div>
        </div>


        <div class="top20" style=" background:#fff; border:1px solid #ccc; border-radius:4px; padding:10px 20px;">        
            <div><i class="icon-plus"></i> <span class="font14">其他用户的收集</span></div>

            <ul class="unstyled"><!-- BEGIN xposts -->
                <li style=" float:left; margin:10px 10px 5px 0px;width:76px;height:76px;">
                    <a href="#{x.Link}"><img src="#{x.PicS}" style="width:68px;border:1px solid #ccc; padding:3px;" /></a>
                </li><!-- END xposts -->
            </ul>
            
            <div class="clear"></div>    
        </div>       

    </div>

</div>