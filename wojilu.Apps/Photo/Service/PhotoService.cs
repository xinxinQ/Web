﻿using System;
using System.Collections.Generic;
using System.Text;
using wojilu.Apps.Photo.Domain;
using wojilu.Apps.Photo.Interface;

namespace wojilu.Apps.Photo.Service {

    public class PhotoService : IPhotoService {

        public virtual void UpdateCount( PhotoApp app ) {

            int count = PhotoPost.count( "AppId=" + app.Id );
            app.PhotoCount = count;
            app.update( "PhotoCount" );
        }

        public virtual PhotoApp GetByUser(long userId) {
            return PhotoApp.find( "OwnerId=" + userId ).first();
        }

        public virtual List<PhotoApp> GetAppAll() {
            return PhotoApp.findAll();
        }

    }

}
