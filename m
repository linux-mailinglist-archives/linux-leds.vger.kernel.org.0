Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DA93F10C6
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbhHSCwZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236283AbhHSCwB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:01 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A850C0612A5;
        Wed, 18 Aug 2021 19:51:16 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so1371218ooq.9;
        Wed, 18 Aug 2021 19:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q2wKLNEH0ZbYjrDUELnu5nn9p/lz6FhQakpvCaCv3rE=;
        b=YWxti5zs+mKQ5MU1obAIyR/98ONUoXFb+Wu0HCWdHerS8lTXAHy83b6/AdOPe/qKKW
         253R2Orr/ORDqIMkVoNGSo023X2JICmGWHjD+meUuacBXGyoYjbya5EMrv31m3p4KL2j
         jGXMXABSLs9jMMgCD7R4mTwFEUuEyzK31lCmiHTH40x1/l7itPAqNSrXI80604fT2uHt
         70QU2riCrN2O01Y6JJ944OJWBk5wzYF30KOCtNeTXcfawn78EfgT9Ek68FowpLt6VDQz
         FJAZR4uX8KaeUMg0pYrBX1b1haTpwGH4jFfRm++dEaGAU+HAGbBoQjeHGtL+MzxQb5yx
         bs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q2wKLNEH0ZbYjrDUELnu5nn9p/lz6FhQakpvCaCv3rE=;
        b=IIDE38or8I5oMh3lcyZF2plc6Jn54bRbiVJKVgfcuVetB0FZKATaG3u9LZA02egHjj
         tjZ6s4owjJGEVfjzvQ6hfk4HOw4dLEkgilcyJeZHbft+KX+IVzmuoOXUnq7gQuerJPh7
         CUyvZlq+vZ6qBJudgQI0zk/a+8Evh2W8lOKzSytOESzCgTMBNtr5tZyUB87CEp5+X8DJ
         AnrXfMxdTVzwyTdfQCZ/hhU0pX2KtZOOh7UHOstkFYFTQYpwvvywv8CGATKOdNpcrRIS
         tJEfAiFNTgq5+lORz6//+Tw2jX4wtSKNUpirh1ctgTX7r55bNE5tcyqm0qH4r6xAkVF+
         1UqA==
X-Gm-Message-State: AOAM530xPp4+yVN2HuTdG/yjvqKToZYy51ecSqGc40ghQd0hcm+ZVu8N
        mw0+FE2dUAa1aF/BFKycwMQ/VvMgJfTNhj5O
X-Google-Smtp-Source: ABdhPJwemmZ3CuBWp9AqP4vNAAw1NnZ2hQjX2k4dKeVfqVDO91v9PVNXgDBvFWRrKAYgV5LkShw8gw==
X-Received: by 2002:a4a:1e46:: with SMTP id 67mr9370484ooq.38.1629341475424;
        Wed, 18 Aug 2021 19:51:15 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:15 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 15/18] ledtrig-blkdev: Add function to associate blkdev trigger with LED
Date:   Wed, 18 Aug 2021 21:50:50 -0500
Message-Id: <20210819025053.222710-16-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allocate per-LED data structure and initialize with default values

Create /sys/class/leds/<led>/block_devices directory

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 88e2a11af1a9..b331e3f24b04 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -658,3 +658,49 @@ static ssize_t blkdev_mode_store(struct device *const dev,
 
 static struct device_attribute ledtrig_blkdev_attr_mode =
 	__ATTR(mode, 0644, blkdev_mode_show, blkdev_mode_store);
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
+	led = kmalloc(sizeof(*led), GFP_KERNEL);
+	if (led == NULL) {
+		ret = -ENOMEM;
+		goto exit_return;
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
+	led->dir = blkdev_mkdir("block_devices", &led_dev->dev->kobj);
+	if (IS_ERR(led->dir)) {
+		ret = PTR_ERR(led->dir);
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
+exit_return:
+	return ret;
+}
-- 
2.31.1

