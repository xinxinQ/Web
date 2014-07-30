﻿using System;
using System.Collections.Generic;
using System.Text;
using wojilu.Web.Mvc;
using wojilu.Members.Groups;
using wojilu.Apps.Blog;

namespace wojilu.Web.Controller.Admin.Apps.Blog {

    public class SettingController : ControllerBase {

        public virtual void Index() {
            target( Save );
            bind( "x", BlogAppSetting.Instance );
        }

        public virtual void Save() {
            BlogAppSetting.Save( ctx.PostValue<BlogAppSetting>( "x" ) );
            echoRedirectPart( lang( "opok" ) );
        }

    }

}
