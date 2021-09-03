Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AF44006FA
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351029AbhICUrN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351023AbhICUrF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:05 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED32C061757;
        Fri,  3 Sep 2021 13:46:05 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso502614otv.12;
        Fri, 03 Sep 2021 13:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xcnelpo7t5BlhbZmew1I72TlJ5Ge0X8Iqq9vAi6Pzo4=;
        b=pZPFRWZefwAIyVDAlJgBJj0edi/nyKfqgqOGA8LifzzU9+m9fm6UC2Zr9QsrH548Qu
         U+EedOsbJhyCpHN35BdNgongKEHZzl2nw0JJe1ukjSa4thw9Sjd56J5J6tfVYyWSwhd1
         /CKuKL8xVzwSu96+fFAc2htovPaRDQImRvPbXyAHNFpFbq2cp6gZhw4AM+5XPKqElMNY
         lQHIeB9UvVPferfZMgMaS33223pJT6CFtYh1DPBepdUOEOvREzkXJy+jlTliHRLc8eqy
         9UZSMny8tZyp/AXG+64wszduEy0gvrlReYrkcfSp2pLVwdi672GoSkRTfBuIaL2jT94q
         kRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xcnelpo7t5BlhbZmew1I72TlJ5Ge0X8Iqq9vAi6Pzo4=;
        b=krCNPiHHFiXuEkZyj7CiV365bVlrUAuoukNQUaSORCM4A1LpiIatKaJaJFUbEErfCt
         5NdFi2BxFos5qVMaK852Gr07yMColuB5MBnC/poCLYgkM3KFXbUgxyZ6AE6sdQzQWL0T
         qL+Eo0eG9tgs1f91ljpYnH3nMrxinR+Xt+52OSAqp5he74zS5ZKu/DQWEGDgWpQCO+hG
         L7vr7ZxUYjZZOReDXU8ZI56YW/TAOxyNKFjtMVbXjyc04MQRqcBqe/qO8/39qbUPlza9
         oPfHiiOPPKiITmMuacHP7xF7ySD6mbfruXvaW0qa1yaul/y96bN3o6BICteazcERnpuR
         J6eQ==
X-Gm-Message-State: AOAM530i9ptT/AG6A1S28zyEi9svXQ4g+HffPKukg7QWOyUgxKFCqCfE
        ZonJp1Xjeimk7VaD+C2ds6h6tXZaXpveEw==
X-Google-Smtp-Source: ABdhPJz7GD2OEruboJ46wpX9yD1maLSpMRkh6Q1RNpsuGOOiED+UojxftWPR0MAyWI8KIHT1pEqL2w==
X-Received: by 2002:a05:6830:3145:: with SMTP id c5mr826729ots.211.1630701964497;
        Fri, 03 Sep 2021 13:46:04 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:04 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 09/18] ledtrig-blkdev: Periodically check devices for activity & blink LEDs
Date:   Fri,  3 Sep 2021 15:45:39 -0500
Message-Id: <20210903204548.2745354-10-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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
 drivers/leds/trigger/ledtrig-blkdev.c | 88 +++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 1f319529c3be..37ba9bb3542e 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -7,7 +7,9 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/part_stat.h>
 
 #include "ledtrig-blkdev.h"
 
@@ -68,6 +70,10 @@ static unsigned int ledtrig_blkdev_count;
 /* How often to check for drive activity - in jiffies */
 static unsigned int ledtrig_blkdev_interval;
 
+/* Delayed work used to periodically check for activity & blink LEDs */
+static void blkdev_process(struct work_struct *const work);
+static DECLARE_DELAYED_WORK(ledtrig_blkdev_work, blkdev_process);
+
 
 /*
  *
@@ -110,3 +116,85 @@ static bool blkdev_write_mode(const enum ledtrig_blkdev_mode mode)
 {
 	return mode != LEDTRIG_BLKDEV_MODE_RO;
 }
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
-- 
2.31.1

