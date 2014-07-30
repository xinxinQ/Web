﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="wojilu" %>
<%@ Import Namespace="wojilu.View" %>
<%@ Import Namespace="wojilu.Web.Controller.Admin" %>

<div class="formPanel" style="margin:10px 20px;">
	
	
		<form action="#{ActionLink}" method="post" class="ajaxPostForm">
		<table style="width: 100%">
			<tr>
				<td class="ltd">访问限制</td>
				<td><label><input name="NeedLogin" type="checkbox" #{needLoginChecked} /> 只有登录用户才可以访问网站内容</label></td>
			</tr>
			<tr>
				<td class="ltd">登录限制</td>
				<td> 

                <% if (config.Instance.Site.EnableEmail == false) { %>
                    <label><input name="AlertActivation" type="checkbox" disabled="disabled" #{needAlertActivation} /> 必须激活之后才可以登录</label>
                    <a href="<%=link.to( new SiteConfigController().Email ) %>" target="_blank" style="color:red;">请先开启邮件服务(点击此处)，才能使用本功能</a>
                <%}
                   else { %>
                   <label><input name="AlertActivation" type="checkbox" #{needAlertActivation} /> 必须激活之后才可以登录</label>
                <%} %>
                
                </td>
			</tr>

            <tr><td colspan="2">&nbsp;</td></tr>

			<tr>
				<td class="ltd">注册限制</td>
				<td>#{registerType}</td>
			</tr>
			<tr>
				<td class="ltd">注册审核</td>
				<td><label><input name="UserNeedApprove" type="checkbox" #{userNeedApproveChecked} /> 用户注册之后必须经过人工审核才能登录</label></td>
			</tr>
            <tr>
                <td class="ltd">注册之后</td>
                <td><input type="text" name="PublishTimeAfterReg" style="width:50px;" value="#{site.PublishTimeAfterReg}" /> 小时之内禁止发言
                <span class="note">(0表示不限制)</span>
                </td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>

			<tr>
				<td class="ltd">页顶用户栏</td>
				<td>#{topNavDisplay}</td>
			</tr>	
			

			<tr>
				<td style="width:120px">_{userNameLength}</td>
				<td>
				_{fromChar} <input name="UserNameLengthMin" type="text" style="width: 50px" value="#{site.UserNameLengthMin}"> 
				_{toChar} <input name="UserNameLengthMax" style="width: 50px" type="text" value="#{site.UserNameLengthMax}"> 
				</td>
			</tr>
			<tr>
				<td class="ltd">用户简介长度</td>
				<td>
				_{fromChar} <input name="UserDescriptionMin" type="text" style="width: 50px" value="#{site.UserDescriptionMin}"> 
				_{toChar} <input name="UserDescriptionMax" style="width: 50px" type="text" value="#{site.UserDescriptionMax}"> 
                </td>
			</tr>
			<tr>
				<td class="ltd">用户签名长度</td>
				<td>
				_{fromChar} <input name="UserSignatureMin" type="text" style="width: 50px" value="#{site.UserSignatureMin}"> 
				_{toChar} <input name="UserSignatureMax" style="width: 50px" type="text" value="#{site.UserSignatureMax}"> 
                </td>
			</tr>

            <tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td class="ltd" style=" vertical-align:top;">
                    <div>用户聚合首页</div>
                    <div class="note">(SEO Keywords)</div>
                </td>
				<td><input name="UserPageKeywords" type="text" style="width: 600px" value="#{site.UserPageKeywords}">&nbsp;</td>
			</tr>

			<tr>
				<td class="ltd" style=" vertical-align:top;">
                    <div>用户聚合首页</div>
                    <div class="note">(SEO Description)</div>
                </td>
				<td>
				<textarea name="UserPageDescription" style="width: 600px; height: 50px">#{site.UserPageDescription}</textarea>&nbsp;</td>
			</tr>
			
			<tr><td colspan="2">&nbsp;</td></tr>

			<tr>
				<td class="ltd">上传头像提醒</td>
				<td><label><input name="AlertUserPic" type="checkbox" #{needAlertUserPic} /> 提醒用户上传头像<span class="note">(上传头像的奖励分在“货币和积分”中设置)</span></label></td>
			</tr>

			<tr>
				<td class="ltd">激活邮件限制</td>
				<td><label>用户在 <input name="confirmEmailInterval" type="text" value="#{site.UserSendConfirmEmailInterval}" style="width:30px;" /> 分钟之内只能发一次激活邮件</td>
			</tr>
			<tr>
				<td class="ltd">邮件激活模板</td>
				<td>请 <a href="#{confirmEmailEditLink}" target="_blank">点击此处</a> 修改邮件激活模板</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>

			<tr>
				<td colspan="2" style="font-size:16px;font-weight:bold; padding-bottom:10px ">_{newUserRegTip}
				</td>
			</tr>
			<tr>
				<td>_{msgTitle}</td>
				<td>
				<input name="SystemMsgTitle" type="text" style="width: 600px" value="#{site.SystemMsgTitle}">&nbsp;</td>
			</tr>
			<tr>
				<td style="vertical-align:top">_{msgBody}</td>
				<td><div style="width:600px;">
<script type="text/plain" id="SystemMsgContent" name="SystemMsgContent">#{SystemMsgContent}</script>
<script>
    _run(function () {
        wojilu.editor.bind('SystemMsgContent').height(180).line(1).show();
    });
</script>

                </div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" style="font-size:16px;font-weight:bold; padding-bottom:10px ">_{regForbidden}<span class="font12 left5 red">(_{wordFilterTip})</span>
				</td>
			</tr>
			<tr>
				<td style="vertical-align:top">_{forbiddenUserName}</td>
				<td>
				<textarea name="ReservedUserName" style="width: 600px; height: 60px">#{site.ReservedUserNameStr}</textarea></td>
			</tr>
			<tr>
				<td style="vertical-align:top">_{forbiddenUserUrl}</td>
				<td>
				<textarea name="ReservedUserUrl" style="width: 600px; height: 60px">#{site.ReservedUserUrlStr}</textarea></td>
			</tr>
			<tr>
				<td style="vertical-align:top">保留关键词</td>
				<td>
				<textarea name="ReservedKeyString" style="width: 600px; height: 150px">#{site.ReservedKeyString}</textarea></td>
			</tr>
	
	
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input name="Submit1" type="submit" value="_{editSetting}" class="btn">&nbsp;</td>
			</tr>
		</table>
		</form>
	
	
	</div>	
