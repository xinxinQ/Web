/*
 * Copyright (c) 2010, www.wojilu.com. All rights reserved.
 */

using System;
using System.Collections.Generic;

using wojilu.Web.Mvc;
using wojilu.Web.Mvc.Attr;

using wojilu.Apps.Content.Domain;
using wojilu.Apps.Content.Interface;
using wojilu.Apps.Content.Service;
using wojilu.Apps.Content.Enum;
using wojilu.Common.AppBase.Interface;
using wojilu.Web.Controller.Content.Utils;
using wojilu.Common.AppBase;

namespace wojilu.Web.Controller.Content.Section {


    [App( typeof( ContentApp ) )]
    public partial class ListImgController : ControllerBase, IPageSection {
        
        public virtual IContentPostService postService { get; set; }
        public virtual IContentImgService imgService { get; set; }
        public virtual IContentSectionService sectionService { get; set; }

        public ListImgController() {
            sectionService = new ContentSectionService();
            postService = new ContentPostService();
            imgService = new ContentImgService();
        }

        public virtual void SectionShow( long sectionId ) {

            ContentSection s = sectionService.GetById( sectionId, ctx.app.Id );
            if (s == null) {
                throw new Exception( lang( "exDataNotFound" ) + "=>page section:" + sectionId );
            }

            long appId = ctx.app.Id;
            int postcat = PostCategory.Post;
            int imgcat = PostCategory.Img;

            List<ContentPost> posts = postService.GetTopBySectionAndCategory( sectionId, postcat );
            List<ContentPost> imgs = imgService.GetByCategory( sectionId, imgcat, appId );

            bindSectionShow( posts, imgs );
        }

        public virtual void List( long sectionId ) {
            run( new ListController().List, sectionId );
        }

        public virtual void Show( long id ) {
            run( new ListController().Show, id );
        }


    }
}

