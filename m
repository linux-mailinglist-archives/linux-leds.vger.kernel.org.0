Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BC23F109C
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhHSCvo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbhHSCvn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:43 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269DDC061764;
        Wed, 18 Aug 2021 19:51:08 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so6808846otv.11;
        Wed, 18 Aug 2021 19:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KN3RdtaPCPi2Hj7PNHCIU6zyZs4TyPkyQvFttMGrQr8=;
        b=SF+WcaoPyMlBNsME6TVNfMNiAF4SMkeIw2pw3VxZTre7ZxXbQxZ/ID9blfTbtnLceG
         X2yfgyXnYdGUypUpvHi941CK/WaRDh19ThrN3kZgQVYRXvLAnv0Z7a0gKSQoG0gLSQ6H
         P6cEwU909lAEhtwyVScYVFAX/X8UpFUR1RtgnAWt3JqxM0TfuXIr0AUoQgM+CHu3Da7z
         DXTlHt0B9i/4bCps0H7D5/YTm/u0GpY8fco1SKMPJA2tPab9VhSbDnMa6e8SXJo0I84N
         gr8rvrFfgiXnH/03EkPfTUwtAloNAIj4BUppdAsRot5kkF6EM/wCvOA2ifpZgg8eCdYI
         EZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KN3RdtaPCPi2Hj7PNHCIU6zyZs4TyPkyQvFttMGrQr8=;
        b=uGhe+y6uSmyaeEZ+FpZ9vZ2zQ5WA7QX0lpXVG72chc71b51f644SmG3rbs35505Mxv
         KltJGvqbI4UbIdul/IEgxC2T91s7DR9t2beT/XT+uVKiuzbfjD3IQhhyyKsdZfB1OdJr
         MLn6HDAz48gdt6/HWOaOBHYgxyoGHzAetOHzmLktlDN9Z+ZLrTvCXy6/aCTwXQSPwb0v
         3v+z86yAFQmZHXVwZXnGvwPCbe4+NYk+TrZaxYlxN+KWwWvBapPpvgIs2uUvwp3dDp/9
         CK4K6u5UqKdHkXm4FEat6BsEIuNgE/iVgkRa9Fpv19ockjKGXC2Kd2MvA6hSSAC9QkRG
         BwyA==
X-Gm-Message-State: AOAM531jijKtBq3mKLk4A0ke5Xb8JJ/k9ClaV2ZJUrAPqJJu0BQJMY5I
        ztZsGjGTY0fvFWSrhM3nw71kUr5ikRFCUOBP
X-Google-Smtp-Source: ABdhPJym1+41WRSy25qtKnor96Xjxwr+V2eqznOK887iLdvIcDbRvWVehE9Gjvrx+fARt1Bmhlhsrg==
X-Received: by 2002:a9d:4c89:: with SMTP id m9mr10214504otf.255.1629341467287;
        Wed, 18 Aug 2021 19:51:07 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:06 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 05/18] ledtrig-blkdev: Periodically check devices for activity & blink LEDs
Date:   Wed, 18 Aug 2021 21:50:40 -0500
Message-Id: <20210819025053.222710-6-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
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
 drivers/leds/trigger/ledtrig-blkdev.c | 87 +++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index fcae7ce63b92..e9c23824c33c 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -7,9 +7,11 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/genhd.h>
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/part_stat.h>
 
 /* Default blink time & polling interval (milliseconds) */
 #define LEDTRIG_BLKDEV_BLINK_MSEC	75
@@ -66,6 +68,9 @@ static unsigned int ledtrig_blkdev_count;
 /* How often to check for drive activity - in jiffies */
 static unsigned int ledtrig_blkdev_interval;
 
+static void blkdev_process(struct work_struct *const work);
+static DECLARE_DELAYED_WORK(ledtrig_blkdev_work, blkdev_process);
+
 
 /*
  *
@@ -138,3 +143,85 @@ static bool blkdev_write_mode(const enum ledtrig_blkdev_mode mode)
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

