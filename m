Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D5E4006FC
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351053AbhICUrO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351041AbhICUrM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:12 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349C6C0617A8;
        Fri,  3 Sep 2021 13:46:06 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s20so695702oiw.3;
        Fri, 03 Sep 2021 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3IpWY6hC6vHRC5+LJLa1BK+7bWdECMM9FiUHKFu/VA=;
        b=oqSzxLsNghPexCOOhno0g6Lv//8JbqpywNeCIiF8cuseSEpzr0W9szJr+630j/2fYR
         9zqIrXOnlO6RdDm4UZ8WS/WasTNlesC2ei//QCBBmim00iC/uYS6cMsXm2fb86N5SEgR
         HP1otL7KshsSzgFSyZzi4zVfJZEJUuuZZh5sbtVl+AQA2GUW2wPmU4qFmMo96csesr+F
         ZD6eyglZsOLN1I53gKx6mPYSqHsomL0YYAF1Vwsg1n/Iv2v0yOe/HOvQc/bIasGQbvT4
         z0hsl9q1WgNy2RLNrIWKWfwsNtlsDiM2Vi9Rh3lzrTNo8VanjloF0JLQ+Juw3D2AYdo9
         zRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3IpWY6hC6vHRC5+LJLa1BK+7bWdECMM9FiUHKFu/VA=;
        b=rgb5Zn+3Q8P90f77tS6bP/sH/1NvIMVegsyvhl0wQwprgoQegtP/6jyOZo+HkERA5V
         08WcRLriPpnzILLt7NCf8/R/EtCiy5FUPHyzNrmXcsdcNiRIZGYYfGvq7u0hRmrSo8zt
         a/0U4gBOVkf6K0uvx1SOfSSRUys6WhbdkoiUbpX89wBgSy6Dgq6J4Jpcyy9BMsoY3KiQ
         +Aziupt96tUby0T0+i04NYnPK2p2sAJEp3dz007E8hYO52LUk3pV+e11Esdbd7eLoHzh
         jtUXctxzko33bczG8HOl0ggBarbkz6I3GkoebdRydLn0wwDjPHiULBRqM02pE4ExLCaA
         /N8w==
X-Gm-Message-State: AOAM532BpKoZm5rAwu1cPZtc00OaRr9dt3V3BQxTwFG6zUtEljgx/oTo
        6ioPePqu0SSmWIYeXbFRwo6lRDEXBFr0Nw==
X-Google-Smtp-Source: ABdhPJzLcOQXa3N/OD1cL1ho5sT+kfch84I/CVG+3Ubt8gmtcXkolDXBVTkHKmVWaRUQqQwbUp9Sng==
X-Received: by 2002:a05:6808:5c7:: with SMTP id d7mr525910oij.147.1630701965608;
        Fri, 03 Sep 2021 13:46:05 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:05 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 10/18] ledtrig-blkdev: Add function to associate the trigger with an LED
Date:   Fri,  3 Sep 2021 15:45:40 -0500
Message-Id: <20210903204548.2745354-11-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allocate per-LED data structure and initialize with default values

Create /sys/class/leds/<led>/block_devices directory

Increment module reference count.  Module can only be removed when no LEDs
are associated with the trigger.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 37ba9bb3542e..bbf71ff18057 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -198,3 +198,57 @@ static void blkdev_process(struct work_struct *const work)
 	delay = READ_ONCE(ledtrig_blkdev_interval);
 	WARN_ON_ONCE(!schedule_delayed_work(&ledtrig_blkdev_work, delay));
 }
+
+
+/*
+ *
+ *	Associate an LED with the blkdev trigger
+ *
+ */
+
+static int blkdev_activate(struct led_classdev *const led_dev)
+{
+	struct ledtrig_blkdev_led *led;
+	int ret;
+
+	if (WARN_ON(!try_module_get(THIS_MODULE))) {
+		ret = -ENODEV;		/* -ESHOULDNEVERHAPPEN */
+		goto exit_return;
+	}
+
+	led = kmalloc(sizeof(*led), GFP_KERNEL);
+	if (led == NULL) {
+		ret = -ENOMEM;
+		goto exit_put_module;
+	}
+
+	led->led_dev = led_dev;
+	led->blink_msec = LEDTRIG_BLKDEV_BLINK_MSEC;
+	led->mode = LEDTRIG_BLKDEV_MODE_RW;
+	INIT_HLIST_HEAD(&led->disks);
+
+	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
+	if (ret != 0)
+		goto exit_free;
+
+	led->dir = kobject_create_and_add("block_devices", &led_dev->dev->kobj);
+	if (led->dir == NULL) {
+		ret = -ENOMEM;
+		goto exit_unlock;
+	}
+
+	hlist_add_head(&led->leds_node, &ledtrig_blkdev_leds);
+	led_set_trigger_data(led_dev, led);
+	ret = 0;
+
+exit_unlock:
+	mutex_unlock(&ledtrig_blkdev_mutex);
+exit_free:
+	if (ret != 0)
+		kfree(led);
+exit_put_module:
+	if (ret != 0)
+		module_put(THIS_MODULE);
+exit_return:
+	return ret;
+}
-- 
2.31.1

