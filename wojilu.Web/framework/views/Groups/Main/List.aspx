﻿<div class="group-list">
<h3 style="margin-bottom:10px; padding-left:5px;"><img src="~img/s/usersb.png" /> #{groupsByCategory}</h3>
	
<div class="thumbnails">
	<!-- BEGIN list -->
	<li class="span2" style="width:130px;">
        <div class="thumbnail">
	        <a href="#{g.Link}" ><img src="#{g.Logo}" /></a>
            <div class="caption">
	    	    <h5><a href="#{g.Link}">#{g.Name}</a><span class="note">(#{g.MemberCount})</span></h5>
	    	    <div class="note">#{g.Created}</div>
            </div>
        </div>
	</li>
	<!-- END list -->
</div>

<div>#{page}</div>

</div>