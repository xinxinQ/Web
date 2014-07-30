﻿using System;
using System.Collections.Generic;
using System.Text;

namespace wojilu.Apps.Forum.Domain {

    public class AttachmentDownload : ObjectBase<AttachmentDownload> {


        public long UserId { get; set; }

        /// <summary>
        /// 下载记录只针对主题，不针对具体的附件
        /// </summary>
        public long TopicId { get; set; }

        public DateTime Creeated { get; set; }


    }

}
