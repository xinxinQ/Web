/*
 * Copyright (c) 2010, www.wojilu.com. All rights reserved.
 */

using System;
using System.Collections.Generic;
using System.Text;
using wojilu.Web.Mvc;
using wojilu.Common.Msg.Interface;
using wojilu.Common.Msg.Service;
using wojilu.Common.Msg.Domain;
using wojilu.Web.Mvc.Attr;
using wojilu.Members.Sites.Service;
using wojilu.Members.Sites.Domain;
using wojilu.Members.Users.Domain;

namespace wojilu.Web.Controller.Admin.Members {

    public class SiteMsgController : ControllerBase {

        public virtual ISiteMessageService msgService { get; set; }
        public virtual ISiteRoleService roleService { get; set; }

        public SiteMsgController() {
            msgService = new SiteMessageService();
            roleService = new SiteRoleService();
        }

        public virtual void Index() {

            set( "addLink", to( Add ) );
            DataPage<MessageSite> list = msgService.GetPage( 50 );
            bindList( "list", "msg", list.Results, editCmd );
            set( "page", list.PageBar );
        }

        protected void editCmd( IBlock tpl, long id ) {
            tpl.Set( "msg.EditLink", to( Edit, id ) );
            tpl.Set( "msg.DeleteLink", to( Delete, id ) );
        }

        public virtual void Add() {
            target( Create );

            List<SiteRole> roles = getRoles();
            dropList( "siteRole", roles, "Name=Id", 0 );
        }

        private List<SiteRole> getRoles() {
            List<SiteRole> roles = roleService.GetAllRoles();
            List<SiteRole> results = new List<SiteRole>();
            results.Add( new SiteRole( -1, lang( "allUser" ) ) );
            foreach (SiteRole r in roles) {
                if (r.Id != 0) results.Add( r );
            }
            return results;
        }

        [HttpPost, DbTransaction]
        public virtual void Create() {

            MessageSite msg = new MessageSite();
            msg.Title = ctx.Post( "Title" );
            msg.Body = ctx.PostHtml( "Body" );
            msg.ReceiverRoleId = ctx.PostLong( "siteRole" );
            msg.Creator = (User)ctx.viewer.obj;

            Result result = msgService.Insert( msg );
            if (result.IsValid)
                echoRedirectPart( lang( "opok" ), to( Index ) );
            else
                echoError( result );
        }

        public virtual void Edit( long id ) {
            target( Update, id );
            MessageSite msg = msgService.GetById( id );

            set( "Title", msg.Title );
            set( "Body", msg.Body );

            List<SiteRole> roles = getRoles();
            dropList( "siteRole", roles, "Name=Id", msg.ReceiverRoleId );
        }

        [HttpPost, DbTransaction]
        public virtual void Update( long id ) {
            MessageSite msg = msgService.GetById( id );

            msg.Title = ctx.Post( "Title" );
            msg.Body = ctx.PostHtml( "Body" );
            msg.ReceiverRoleId = ctx.PostLong( "siteRole" );

            Result result = msgService.Update( msg );
            if (result.IsValid)
                echoRedirectPart( lang( "opok" ) );
            else
                echoError( result );
        }

        [HttpDelete, DbTransaction]
        public virtual void Delete( long id ) {
            MessageSite msg = msgService.GetById( id );
            msgService.Delete( msg );
            redirect( Index );
        }

    }

}
