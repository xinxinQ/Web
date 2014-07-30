﻿using System;
using System.Collections.Generic;
using System.Text;
using wojilu.Web.Mvc;
using wojilu.Members.Groups;

namespace wojilu.Web.Controller.Admin.Groups {

    public class SettingController : ControllerBase {

        public virtual void Index() {
            target( Save );
            bind( "x", GroupSetting.Instance );
        }

        public virtual void Save() {
            GroupSetting.Save( ctx.PostValue<GroupSetting>( "x" ) );
            echoRedirectPart( lang( "opok" ) );
        }

    }

}
