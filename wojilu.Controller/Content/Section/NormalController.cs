/*
 * Copyright (c) 2010, www.wojilu.com. All rights reserved.
 */

using System;
using System.Collections.Generic;

using wojilu.Web.Mvc;
using wojilu.Web.Mvc.Attr;

using wojilu.Common.AppBase.Interface;
using wojilu.Apps.Content.Interface;
using wojilu.Apps.Content.Service;
using wojilu.Apps.Content.Enum;
using wojilu.Apps.Content.Domain;
using wojilu.Web.Controller.Content.Utils;
using wojilu.Common.AppBase;

namespace wojilu.Web.Controller.Content.Section {

    [App( typeof( ContentApp ) )]
    public partial class NormalController : ControllerBase, IPageSection {


        public virtual IContentPostService postService { get; set; }
        public virtual IContentImgService imgService { get; set; }
        public virtual IContentSectionService sectionService { get; set; }

        public NormalController() {
            postService = new ContentPostService();
            imgService = new ContentImgService();
            sectionService = new ContentSectionService();
        }

        public virtual void SectionShow( long sectionId ) {

            ContentSection s = sectionService.GetById( sectionId, ctx.app.Id );
            if (s == null) {
                throw new Exception( lang( "exDataNotFound" ) + "=>page section:" + sectionId );
            }

            long appId = ctx.app.Id;
            int postcat = PostCategory.Post;
            int imgcat = PostCategory.Img;

            List<ContentPost> posts = this.postService.GetTopBySectionAndCategory( sectionId, postcat );
            ContentPost img = this.imgService.GetTopImg( sectionId, imgcat, appId );

            bindSectionShow( posts, img );
        }

        public virtual void List( long sectionId ) {
            run( new ListController().List, sectionId );
        }

        public virtual void Show( long id ) {
            run( new ListController().Show, id );
        }

    }
}
