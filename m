Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A76B405F60
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345526AbhIIW0i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344616AbhIIW0f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:35 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127B1C061574;
        Thu,  9 Sep 2021 15:25:25 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so4591493otf.2;
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4BSq92N5y+/fvChpos2+SAQ+rQstA94HqdG0a5jEzo=;
        b=Rk7b1HTG+dEF5nNseowxsTHvQqYhsIv9a7AarkSJMF1SCjTHZOF3C1Rzaa4g2Vj8Lr
         ahswkxsdBtjMhQDnNOGZuQCNDn3Bm2NNcNBSe96iC5Ro49kVRLRyBnea4foj6thCPxFS
         HfDK7E2BnEnylmUncFF4mC0kleyrtqdj/b9Zusv39OV2co/IPVg7UDWU5BQwS7OEds5x
         QmYPTv1QhcImXwNIFa/1qocERXzpGBkbaJM39HNBt0zL4kc7ZEeVp7N4614yMtrLNfXs
         PeyxBbUT+DF0agWkPYDAvClzheXvNcMHZ5YEL0D7t72XrugyZVWs3hf9c9Bjv+mGu0O0
         GprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4BSq92N5y+/fvChpos2+SAQ+rQstA94HqdG0a5jEzo=;
        b=FzogFgkf4IVwJLbqiHoqlNQixGqBCt5zMnQSOyAxRdhDLTLQNJy4IVDAmbq6P6KOd4
         Udql8JW66u0WOmUv6U2Ln4mH9gtiB9DjTYCy2tXOr1QJUjTXJIkzE6vtTXg05VB6LhkP
         2hx++5tYdZH/1HbSKKDb7lsfjEmMCg/YI4jTIT0uVaZHnEgVxJNZehZCZRV3omgx61e0
         EhZq7qVLjb1iiCkBwpXO6qIOHDicY0+eJkQ44BHy6FkETcsnL8wPh8BQpajpk64uEVBY
         voTkHwW061Jzo4926LhIPDgNbRha2ljyRScoxnXiGXphQCLsHl0NdMaSu4NFA53aucq/
         erlg==
X-Gm-Message-State: AOAM531DurgsMMVKTW+GH4xLQkLgd3lRdebGdik0iQ9GzzTfXNUAwB8C
        x01HSnJzz8t/t9Jg6S3wQiY/nXGwdKg=
X-Google-Smtp-Source: ABdhPJxvwnQrmgnDleol7tW5LVcQZ1GSLYMaxBeU/NiJJqjEYt6JJDa2tfsYa7V6C5bjnU8WlZhwbA==
X-Received: by 2002:a9d:72c5:: with SMTP id d5mr2004885otk.212.1631226324422;
        Thu, 09 Sep 2021 15:25:24 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:24 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 03/15] leds: trigger: blkdev: Add functions needed by block changes
Date:   Thu,  9 Sep 2021 17:25:01 -0500
Message-Id: <20210909222513.2184795-4-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add ledtrig_blkdev_disk_init() and ledtrig_blkdev_disk_cleanup()
placeholders.  (Function bodies depend on block subsystem changes
in next commit.)

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev-core.c | 11 +++++++++++
 include/linux/leds.h                       | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
index bd9e5f09b7e3..b0a455180b05 100644
--- a/drivers/leds/trigger/ledtrig-blkdev-core.c
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -6,4 +6,15 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/leds.h>
+
 #include "ledtrig-blkdev.h"
+
+/**
+ * ledtrig_blkdev_disk_cleanup - remove a block device from the blkdev LED
+ * trigger
+ * @gd:	the disk to be removed
+ */
+void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
+{
+}
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a0b730be40ad..38fb8b6e68fe 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/leds/common.h>
 #include <linux/device.h>
+#include <linux/genhd.h>
 #include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -605,4 +606,22 @@ static inline void ledtrig_audio_set(enum led_audio type,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV)
+/**
+ * ledtrig_blkdev_disk_init - initialize the ledtrig field of a new gendisk
+ * @gd:	the gendisk to be initialized
+ */
+static inline void ledtrig_blkdev_disk_init(struct gendisk *const gd)
+{
+}
+void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd);
+#else	/* IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV) */
+static inline void ledtrig_blkdev_disk_init(const struct gendisk *gd)
+{
+}
+static inline void ledtrig_blkdev_disk_cleanup(const struct gendisk *gd)
+{
+}
+#endif	/* IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV) */
+
 #endif		/* __LINUX_LEDS_H_INCLUDED */
-- 
2.31.1

