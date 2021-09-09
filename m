Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF51405F6C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346669AbhIIW0n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345284AbhIIW0h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:37 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC190C061760;
        Thu,  9 Sep 2021 15:25:26 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id m11-20020a056820034b00b0028bb60b551fso1070035ooe.5;
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t5T+AFlgbNoGcPrVLT53gG0D4KLaxBBE1fEOtdfcLqE=;
        b=Cg1rpKDFgQ3EhEFN0AzLXlkGd/m9G1+XdFsD8fySprsOVbAmlByxUGxW0OTh7Xtjzl
         sSKwvR1QXvYlO00x7RouJ/jvIVkJgvxru8cfVd9DtXubdVr2xqTjcTjlMuIN6uQ1wKV7
         I4Lu1HgWw4dqZ8QXXelY7ylGffElTqTX+zPPvzvljTT8hhZeQ1OXaQYLKwmpMs/BHM9+
         VDJxHGXOlgKgbnHk5J7wzXSF8EJHfeZJMN3ISBPgnlSxXkjPJdMGEL6SXficb3k3DsyY
         RayuJUuqgzQpF7zhMaVbJ97IjsQjMH3H1c7fNKeJ+uXwlQcoWdI1vZ6BX+NDS17YcmpJ
         hCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t5T+AFlgbNoGcPrVLT53gG0D4KLaxBBE1fEOtdfcLqE=;
        b=2zpccEbidYfrrdvOHawFbOkkO0E3MGjtk+RBl1sZ7KZ07Zi4HbJ9fEgfdKLvlwRNz3
         bBx1A0E/EJ2QlsTqL8R6f9lxxb3d5HFqT2onuKfce8HSIT/P1Qpko0xikvun7usuGyx7
         OHJ5+kd8PWS/mRnv8mD6t/Fjk006dcnixZA6X22S80NVVWGtYUEFMK10QnAayuOaFKJT
         yU16y1Vzlq8jOwQoIJFG7fkgeHrIaDrc8uBI9Qi4KLsklN0HdSoBpXlYwaghRd20GPPx
         4UDtgf6A+caUAKN5tw3c+2be0xwKtTXbi7+kOQNhciYt2S+3pkyxh8Pjpsz6rUXqXZ9s
         DFww==
X-Gm-Message-State: AOAM533xUlzxqNbg/jWEZUxbpOccnsOBGg/3MKvkA74GijoVeT1MTnQx
        5jdMGIdOtg2ionYMdWA53Ww=
X-Google-Smtp-Source: ABdhPJyYrYBPaw6ekxeII0CMS8TKIPFMx/YqnPYNX0Lp7CUmQiAxXUJnw79CVApfd8k5tzKMiqx7TA==
X-Received: by 2002:a05:6820:613:: with SMTP id e19mr1798819oow.67.1631226326272;
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 07/15] leds: trigger: blkdev: Add constants and types
Date:   Thu,  9 Sep 2021 17:25:05 -0500
Message-Id: <20210909222513.2184795-8-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Avoid bloating gendisk structure by storing per-device trigger data in
ledtrig_blkdev_disk

Support many-to-many device/LED associations with ledtrig_blkdev_link
struct.  Per-device (ledtrig_blkdev_disk) and per-LED (ledtrig_blkdev_led)
structures both include a list of links, so a device can be linked to
multiple LEDs, and an LED can be linked to multiple devices.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 7f85e6080ea1..38a2cd2df85c 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -15,3 +15,47 @@ MODULE_DESCRIPTION("Block device LED trigger");
 MODULE_AUTHOR("Ian Pilcher <arequipeno@gmail.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(LEDTRIG_BLKDEV);
+
+/* Default blink time & check interval (milliseconds) */
+#define LEDTRIG_BLKDEV_BLINK_MSEC	75
+#define LEDTRIG_BLKDEV_INTERVAL		100
+
+/* Minimum blink time & check interval (milliseconds) */
+#define LEDTRIG_BLKDEV_MIN_BLINK	10
+#define LEDTRIG_BLKDEV_MIN_INT		25
+
+enum ledtrig_blkdev_mode {
+	LEDTRIG_BLKDEV_MODE_RO	= 0,	/* blink for reads */
+	LEDTRIG_BLKDEV_MODE_WO	= 1,	/* blink for writes */
+	LEDTRIG_BLKDEV_MODE_RW	= 2	/* blink for reads and writes */
+};
+
+/* Per-block device information */
+struct ledtrig_blkdev_disk {
+	struct gendisk		*gd;
+	struct kobject		*dir;		/* linked_leds dir */
+	struct hlist_head	leds;
+	unsigned long		read_ios;
+	unsigned long		write_ios;
+	unsigned int		generation;
+	bool			read_act;
+	bool			write_act;
+};
+
+/* For many-to-many relationships between "disks" (block devices) and LEDs */
+struct ledtrig_blkdev_link {
+	struct hlist_node		disk_leds_node;
+	struct hlist_node		led_disks_node;
+	struct ledtrig_blkdev_disk	*disk;
+	struct ledtrig_blkdev_led	*led;
+};
+
+/* Every LED associated with the blkdev trigger gets one of these */
+struct ledtrig_blkdev_led {
+	struct kobject			*dir;		/* linked_devices dir */
+	struct led_classdev		*led_dev;
+	unsigned int			blink_msec;
+	struct hlist_head		disks;		/* linked block devs */
+	struct hlist_node		leds_node;
+	enum ledtrig_blkdev_mode	mode;
+};
-- 
2.31.1

