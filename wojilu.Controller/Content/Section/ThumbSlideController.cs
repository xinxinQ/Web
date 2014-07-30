/*
 * Copyright (c) 2010, www.wojilu.com. All rights reserved.
 */

using System;
using System.Collections.Generic;

using wojilu.Web.Mvc;
using wojilu.Web.Mvc.Attr;
using wojilu.Common.AppBase.Interface;

using wojilu.Apps.Content.Domain;
using wojilu.Apps.Content.Interface;
using wojilu.Apps.Content.Service;
using wojilu.Web.Controller.Content.Utils;
using wojilu.Common.AppBase;


namespace wojilu.Web.Controller.Content.Section {

    [App( typeof( ContentApp ) )]
    public partial class ThumbSlideController : ControllerBase, IPageSection {

        public virtual IContentPostService postService { get; set; }
        public virtual IContentSectionService sectionService { get; set; }

        public ThumbSlideController() {
            postService = new ContentPostService();
            sectionService = new ContentSectionService();
        }

        public virtual void List( long sectionId ) {
            run( new ImgController().List, sectionId );
        }

        public virtual void Show( long id ) {
            run( new ListController().Show, id );
        }
        
        public virtual void SectionShow( long sectionId ) {

            ContentSection s = sectionService.GetById( sectionId, ctx.app.Id );
            if (s == null) {
                throw new Exception( lang( "exDataNotFound" ) + "=>page section:" + sectionId );
            }

            List<ContentPost> posts = this.postService.GetBySection( sectionId, 4 );
            ContentPost first = posts.Count > 0 ? posts[0] : null;

            bindSectionShow( sectionId, posts, first );
        }

    }

}
