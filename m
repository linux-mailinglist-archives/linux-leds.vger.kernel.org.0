Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F2B405F6F
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346831AbhIIW0p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345349AbhIIW0h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:37 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69AFC061575;
        Thu,  9 Sep 2021 15:25:27 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so4565999otf.6;
        Thu, 09 Sep 2021 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLOPme3bTnjA2h6AchbcXlnzuUCG5BQ91CmIdjqTch4=;
        b=LtponteebQeI+Jw8nG5IkAAZtIy0uuRsADT1LEelc7mhkRfU6dT4xN/bTUpevL3O3R
         BUQHn2ij7mY2Y/IWgVEwZVuWG4NKHF75At+3ly4UbWR74ZfI4BpVcSUWYxL+zJiZq+f0
         uWBRlSLoTsMHO9eRvv398Qpzh285jIA2kmc0isMnuMyjeyAZJWbdQuRwPRLgSy35RRYA
         HK3aa/7rXYBAHod21AFUAWMfqgEQvCC4eGCLsWN4upLOWVKlubmOWDtgvDvYTvJJepQm
         CvuWltVSJczZMdzd4dU6Rrmh3FdKHUpkn3zBN4OL3nxLZyx2pzIYPO17XGDkf+kGTXDE
         HWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLOPme3bTnjA2h6AchbcXlnzuUCG5BQ91CmIdjqTch4=;
        b=AvP6w2UVwCUG1YTnxF/WJQYHNComzhgkUbzbvGPKBBUTil2sa8AvPDcD2Em532JNvM
         qRsM7HBolhR9TnuQtKiXZgUL+jJjTqhADx1ieUy9kEiFUVmixjKZvebZxJmxIINSjZht
         wJOamRWsLc6FW0N23VKEHTNkQVUq9Tb0ul6q5r139gpGtclpq5t25dn/CZVLDHZMfyA1
         YGwUqUF/b2VHVDWNaL+UqyMiLROHOznEqP5xcnhEc8mWdIPtQ1QnX88P+PmXUCD26/X5
         kBxfZRQKlF6VbzQOc6WUEGqIM4TAlb6dldY0i1px7nIrxwGh4RJyNe5AkGn4w4D9HKLv
         7yow==
X-Gm-Message-State: AOAM531ZB5Z3YNBdDiivdb+rPf2xf92iH44AJDSytlz1Hrz8pqlDQ1AQ
        hg0506cwqSjZQTi5JBUEg1Y=
X-Google-Smtp-Source: ABdhPJymhcAar4MC37SQkwoGEHEL+ZOu0WpDW4mlRmyEcb8UmY18fPxgWhceTeD9mVthrLwBuYE/4Q==
X-Received: by 2002:a9d:4910:: with SMTP id e16mr1893390otf.170.1631226327264;
        Thu, 09 Sep 2021 15:25:27 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 09/15] leds: trigger: blkdev: Check devices for activity and blink LEDs
Date:   Thu,  9 Sep 2021 17:25:07 -0500
Message-Id: <20210909222513.2184795-10-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use a delayed workqueue to periodically check configured block devices for
activity since the last check.  Blink LEDs associated with devices on which
the configured type of activity (read/write) has occurred.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 53b62e320491..40dc55e5d4f3 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -8,6 +8,7 @@
 
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/part_stat.h>
 
 #include "ledtrig-blkdev.h"
 
@@ -60,6 +61,108 @@ struct ledtrig_blkdev_led {
 	enum ledtrig_blkdev_mode	mode;
 };
 
+/* All LEDs associated with the trigger */
+static HLIST_HEAD(ledtrig_blkdev_leds);
+
+/* How often to check for drive activity - in jiffies */
+static unsigned int ledtrig_blkdev_interval;
+
+/* Delayed work used to periodically check for activity & blink LEDs */
+static void blkdev_process(struct work_struct *const work);
+static DECLARE_DELAYED_WORK(ledtrig_blkdev_work, blkdev_process);
+
+
+/*
+ *
+ *	Periodically check for device acitivity and blink LEDs
+ *
+ */
+
+static void blkdev_blink(const struct ledtrig_blkdev_led *const led)
+{
+	unsigned long delay_on = READ_ONCE(led->blink_msec);
+	unsigned long delay_off = 1;	/* 0 leaves LED turned on */
+
+	led_blink_set_oneshot(led->led_dev, &delay_on, &delay_off, 0);
+}
+
+static void blkdev_update_disk(struct ledtrig_blkdev_disk *const disk,
+			       const unsigned int generation)
+{
+	const struct block_device *const part0 = disk->gd->part0;
+	const unsigned long read_ios = part_stat_read(part0, ios[STAT_READ]);
+	const unsigned long write_ios = part_stat_read(part0, ios[STAT_WRITE])
+				+ part_stat_read(part0, ios[STAT_DISCARD])
+				+ part_stat_read(part0, ios[STAT_FLUSH]);
+
+	if (disk->read_ios != read_ios) {
+		disk->read_act = true;
+		disk->read_ios = read_ios;
+	} else {
+		disk->read_act = false;
+	}
+
+	if (disk->write_ios != write_ios) {
+		disk->write_act = true;
+		disk->write_ios = write_ios;
+	} else {
+		disk->write_act = false;
+	}
+
+	disk->generation = generation;
+}
+
+static bool blkdev_read_mode(const enum ledtrig_blkdev_mode mode)
+{
+	return mode != LEDTRIG_BLKDEV_MODE_WO;
+}
+
+static bool blkdev_write_mode(const enum ledtrig_blkdev_mode mode)
+{
+	return mode != LEDTRIG_BLKDEV_MODE_RO;
+}
+
+static void blkdev_process(struct work_struct *const work)
+{
+	static unsigned int generation;
+
+	struct ledtrig_blkdev_led *led;
+	struct ledtrig_blkdev_link *link;
+	unsigned long delay;
+
+	if (!mutex_trylock(&ledtrig_blkdev_mutex))
+		goto exit_reschedule;
+
+	hlist_for_each_entry(led, &ledtrig_blkdev_leds, leds_node) {
+
+		hlist_for_each_entry(link, &led->disks, led_disks_node) {
+
+			struct ledtrig_blkdev_disk *const disk = link->disk;
+
+			if (disk->generation != generation)
+				blkdev_update_disk(disk, generation);
+
+			if (disk->read_act && blkdev_read_mode(led->mode)) {
+				blkdev_blink(led);
+				break;
+			}
+
+			if (disk->write_act && blkdev_write_mode(led->mode)) {
+				blkdev_blink(led);
+				break;
+			}
+		}
+	}
+
+	++generation;
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
+
+exit_reschedule:
+	delay = READ_ONCE(ledtrig_blkdev_interval);
+	WARN_ON_ONCE(!schedule_delayed_work(&ledtrig_blkdev_work, delay));
+}
+
 
 /*
  *
-- 
2.31.1

