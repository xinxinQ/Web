﻿using System;
using System.Collections.Generic;
using System.Text;
using wojilu.Web.Mvc;
using wojilu.Web.Mvc.Attr;
using wojilu.Apps.Download.Domain;
using wojilu.Common.AppBase.Interface;
using wojilu.Common.AppBase;


namespace wojilu.Web.Controller.Download.Admin {

    [App( typeof( DownloadApp ) )]
    public class PlatformController : ControllerBase {


        public virtual void List() {

            set( "addLink", to( Add ) );
            set( "sortAction", to( SaveSort ) );

            List<Platform> list = Platform.GetAll();
            bindList( "list", "data", list, bindLink );
        }

        private void bindLink( IBlock block, long id ) {
            block.Set( "data.LinkEdit", to( Edit, id ) );
            block.Set( "data.LinkDelete", to( Delete, id ) );
        }

        [HttpPost]
        public virtual void SaveSort() {

            long id = ctx.PostLong( "id" );
            String cmd = ctx.Post( "cmd" );

            Platform data = Platform.GetById( id );

            List<Platform> list = Platform.GetAll();

            if (cmd == "up") {

                new SortUtil<Platform>( data, list ).MoveUp();
                echoRedirect( "ok" );
            }
            else if (cmd == "down") {

                new SortUtil<Platform>( data, list ).MoveDown();
                echoRedirect( "ok" );
            }
            else {
                echoError( lang( "exUnknowCmd" ) );
            }

        }

        public virtual void Add() {
            target( Create );
        }

        [HttpPost]
        public virtual void Create() {
            string name = ctx.Post( "Name" );
            if (strUtil.IsNullOrEmpty( name )) {
                echoError( "请填写名称" );
                return;
            }

            Platform pf = new Platform();
            pf.Name = name;
            pf.insert();

            echoToParentPart( lang( "opok" ) );
        }

        public virtual void Edit( long id ) {
            target( Update, id );

            Platform pf = Platform.GetById( id );
            set( "Name", pf.Name );
        }

        [HttpPost]
        public virtual void Update( long id ) {

            string name = ctx.Post( "Name" );
            if (strUtil.IsNullOrEmpty( name )) {
                echoError( "请填写名称" );
                return;
            }

            Platform pf = Platform.GetById( id );
            pf.Name = name;
            pf.update();

            echoToParentPart( lang( "opok" ) );
        }

        [HttpDelete]
        public virtual void Delete( long id ) {

            Platform f = Platform.GetById( id );
            if (f != null) {
                f.delete();
                redirect( List );
            }

        }
    }

}

