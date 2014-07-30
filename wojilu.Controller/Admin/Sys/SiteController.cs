﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using wojilu.Web.Mvc;
using wojilu.Web.Mvc.Attr;

namespace wojilu.Web.Controller.Admin.Sys {

    public class SiteController : ControllerBase {

        public SiteController() {
            LayoutControllerType = typeof( SiteConfigController );
        }

        public virtual void BeginRestart() {

            set( "ActionLink", to( Restart ) );
            set( "ActionLinkFull", to( RestartFull ) );
        }

        [HttpPost]
        public virtual void RestartFull() {
            HttpRuntime.UnloadAppDomain();
            echoRedirect( lang( "restartDone" ), ctx.url.SiteAndAppPath );
        }

        [HttpPost]
        public virtual void Restart() {
            sys.Clear.ClearAll();
            echoRedirect( lang( "restartDone" ), ctx.url.SiteAndAppPath );
        }

    }

}
