﻿<div style="margin:20px;">#{publisher}</div>

<div style="">
<div style="font-size:18px; font-weight:bold; margin:10px 0px 20px 25px;">我的收藏</div>
<div  style="margin:20px;">#{flist}</div>
<div style="margin-left:25px;">#{page}</div>
</div>
<script>
    _run(function () {
        $('#returnUrl').val('#{homeLink}');
    });
</script>