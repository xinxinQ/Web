﻿<div style="width:530px;">
<form method="post" action="#{ActionLink}">

<table style="width:500px; margin:20px auto;">
<tr>
    <td style="width:60px; vertical-align:top;  text-align:right; font-weight:bold;">标题<div style="font-weight:normal;"><span class="note">(支持html)</span>  </div></td><td>
        <div>
            <textarea name="Title" style="width:390px; height:30px;"></textarea></div>  
    </td>
</tr>
<tr>
    <td style=" height:40px;  text-align:right; font-weight:bold;">网址</td><td>
        <div><input name="Link" type="text" value="" style="width:310px;" />
        </div> 
    </td>
</tr>
<tr>
    <td style=" vertical-align:top;  text-align:right; font-weight:bold;">摘要<div style="font-weight:normal;"><span class="note">(支持html)</span></div></td><td>
    <div><textarea name="Summary" style="width:390px; height:80px;"></textarea>
    </div>    
    </td>
</tr>
<tr>
    <td style="  vertical-align:top;  text-align:right; font-weight:bold;">显示位置</td><td>
        <div>

        <div style="width:330px;height:20px; background:#eee; text-align:center;margin:2px 5px ;">
            <label style="cursor:pointer;"><input id="idx1" type="radio" name="Index" value="1" checked="checked" />1号位(头条)</label>            
        </div>

        <script>
            for (var i = 2; i < 12; i++) {

                document.write('<div style="float:left;width:160px;height:20px; background:#eee; text-align:left;margin:2px 5px ;"><label style="cursor:pointer;"><input id="idx'+i+'" type="radio" name="Index" value="' + i + '" /> <span>' + i + '号位</span></label></div>');

            }

            var ids = [#{indexIds}];
            for (var i = 0; i < ids.length; i++) {
                $('#idx'+ids[i]).attr('disabled', 'disabled')
                var span = $('#idx'+ids[i]).next();
                span.html( '<span style="color:#aaa;">'+span.text()+ '(已占用)</span>');
            }

        </script>

        </div> 
    </td>
</tr>
<tr>
    <td>&nbsp;</td><td>
        <input id="Submit1" type="submit" value="添加自定义内容" class="btn" />
        <input id="Button1" type="button" value="_{cancel}" class="btnCancel" />
    </td>
</tr>
</table>
</form>
</div>
