﻿<script>

_run(function () {

    wojilu.ui.makeTab({
        'Friends': 'tabFriends',
        'Blog/Index': 'tabFriends',
        'Add': 'tabAdd',
        'Draft': 'tabDraft',
        'Trash': 'tabTrash',
        'Category': 'tabCat',
        'Blogroll': 'tabBlogroll',
        'Setting': 'tabSetting',
        '--': 'tabMy'
    });

});

</script>

<div style="padding:10px 5px 10px 10px;">

<div style="margin:5px 0px 15px 10px; font-weight:bold; font-size:14px;"><img src="~img/app/s/wojilu.Apps.Blog.Domain.BlogApp.png" /> _{blog}</div>

	
<style>
.tabList li {width:85px;}
</style>

<ul class="tabList" style="margin-left:10px; width:95%;">
    <li id="tabFriends" class="firstTab"><a href="#{friendsBlogLink}" class="frmLink" loadTo="blogMain" nolayout=3>:{friendBlog}</a><span></span></li>
    <li id="tabMy"><a href="#{myBlogLink}" class="frmLink" loadTo="blogMain" nolayout=3>:{myblog}</a><span></span> </li>

    <li id="tabAdd" style="width:90px;"><a href="#{addBlogLink}" class="frmLink" loadTo="blogMain" nolayout=3><img src="~img/add.gif" /> :{writeBlog}</a><span></span></li>
    <li id="tabDraft" style="width:50px;"><a href="#{draftLink}" class="frmLink" loadTo="blogMain" nolayout=3>:{draft}</a><span></span></li>
    <li id="tabTrash" style="width:60px;"><a href="#{trashLink}" class="frmLink" loadTo="blogMain" nolayout=3>_{trash}</a><span></span></li>
    <li id="tabCat"><a href="#{categoryLink}" class="frmLink" loadTo="blogMain" nolayout=3>:{blogCategory}</a><span></span></li>
    <li id="tabBlogroll"><a href="#{blogrollLink}" class="frmLink" loadTo="blogMain" nolayout=3>:{blogroll}</a><span></span></li>
    <li id="tabSetting" style="width:50px;"><a href="#{settingLink}" class="frmLink" loadTo="blogMain" nolayout=3>_{setting}</a><span></span></li>
    <div style="clear:both;"></div>
</ul>
	
	
	<div style="width:100%;padding:0px;margin:0px; background:#fff;" class="tabMain">
		
		<table style="width: 100%">
			<tr>
				<td style="padding:10px;" id="blogMain">#{layout_content}</td>
			</tr>
		</table>	
		
	</div>

</div>
