﻿<div class="row">
    <div class="span12 forum-search-row">
        <div class="span4">
		    <form method="get" action="#{searchAction}" class="form-search form-inline" style="margin:10px 30px;">
                <div class="input-append">
                    <img src="~static/skin/site/new/search.png" />
		            <input type="text" name="q" class="search-query input-small" style="width:160px;" /><input type="submit" class="btn btn-primary" value="搜" />
                </div>
		    </form>
        </div>
        <div class="span7 pull-right">
            <div class="pull-right" style="margin:15px 15px 15px 0px;">
                #{lnkNotice}
                <a href="#{lnkTopic}" target="_blank"><i class="icon-file"></i> :{newTopic}</a>
		        <a href="#{lnkPost}" target="_blank"><i class="icon-play-circle"></i> :{newPosts}</a>		        
		        <a href="#{lnkMyPost}" target="_blank"><i class="icon-edit"></i> :{myPosts}</a>
		        <a href="#{lnkMyTopic}" target="_blank"><i class="icon-pencil"></i> :{myTopics}</a>
	            <a href="#{lnkPicked}" target="_blank"><i class="icon-star"></i> :{picked}</a>
		        <a href="#{lnkViews}" target="_blank"><i class="icon-list-alt"></i> :{rank}</a>
            </div>
        </div>
    </div>
</div>
	
#{forumNotice}
<div class="forum-top-row" style="#{forum.IsHideTop_Style}">
#{forumNewPosts}
</div>

<div class="row" style="#{forum.IsHideStats_Style}">	
    <div class="span12 forum-stats-row">

        <div class="span2 forum-stats-title">
            <div style="float:left; line-height:18px;margin-top:8px;font-size:18px; font-weight:bold; font-family:Microsoft YaHei; color:#666;"><img src="~static/skin/site/new/home.png" /> 讨论区</div>
            <div style="float:left;margin-left:10px;"><img src="~static/skin/site/new/forum-arrow.jpg" /></div>
        </div>

	    <div class="span9 forum-stats-data pull-right">
		    <div class="pull-right" style="margin:10px 20px 0px 0px;">
                <i class="icon-signal"></i>
                <a href="#{lnkPost}" target="_blank">_{today}:<span class="forum-stats-num forum-stats-today">#{forum.TodayPost}</span></a> 
                :{topic}:<span class="forum-stats-num">#{forum.TodayTopic}</span>
                _{yesterday}:<span class="forum-stats-num">#{forum.YestodayPostCount}</span>
                :{maxDay}:<span class="forum-stats-num">#{forum.PeakPostCount}</span> 
                :{topic}:<span class="forum-stats-num">#{forum.TopicCount}</span>
                :{post}:<span class="forum-stats-num">#{forum.PostCount}</span>
                _{member}:<span class="forum-stats-num">#{forum.MemberCount}</span>
                <span class="left10"><i class="icon-user"></i> :{welcomeNewMember}</span> <a href="#{newUserLink}" class="forum-stats-lastUser" target="_blank">#{newUserName}</a>
            </div>			
	    </div>

    </div>
</div>

<!-- BEGIN forumCategory -->
<div class="fbCategoryWrap">#{childrenBoards}</div>
<div class="fbCategoryAdWrap">#{adForumBoards}</div>
<!-- END forumCategory -->

<div class="row top20" style="#{forum.IsHideOnline_Style}">
    <div class="span12">
        <div>
	        <div class="forum-bottom-title"><i class="icon-user"></i> :{whoIsOnline} </div>
            <div class="forum-bottom-body"> <span style="font-weight:normal;">共 <span id="onlineCount">0</span> 人在线(<a href="#{onlineLink}">详情</a>)。其中会员 <span id="onlineMember">0</span> 人，游客 <span id="onlineGuest">0</span> 人。历史最高在线 <span id="onlineMax">0</span> 人，发生时间是：<span id="onlineMaxTime"></span></span></div>
        </div>
    </div>
</div>

<div class="row" style="#{forum.IsHideLink_Style}">
    <div class="span12">
        <div>
	        <div class="forum-bottom-title"><i class="icon-th-list"></i> :{forumLink}</div>
	        <div class="forum-bottom-body">
                <ul style="margin-top:10px;" class="unstyled">
	            <!-- BEGIN picLinks -->
	            <li class="forum-link-item"><a href="#{x.Url}" title="#{x.Name}" target="_blank"><img src="#{x.Logo}" /></a></li>
	            <!-- END picLinks -->
                </ul>
                <div style="clear:both;"></div>
                <ul style="margin-top:15px;" class="unstyled">
	            <!-- BEGIN textLinks -->
	            <li class="forum-link-item"><a href="#{x.Url}" title="#{x.Name}" target="_blank">#{x.Name}</a></li>
	            <!-- END textLinks -->
                </ul>
                <div style="clear:both;"></div>
	        </div>
        </div>
    </div>
</div>


<script>
_run( function() {
    var bindOnlineInfo = function () {
        $('#onlineCount').text(ctx.online.count);
        $('#onlineMember').text(ctx.online.member);
        $('#onlineGuest').text(ctx.online.guest);
        $('#onlineMax').text(ctx.online.max);
        $('#onlineMaxTime').text(ctx.online.maxTime);
    };
    wojilu.site.load(bindOnlineInfo);
});
</script>
