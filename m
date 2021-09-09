Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB98C405F71
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345971AbhIIW0p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345433AbhIIW0i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:38 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB22C061574;
        Thu,  9 Sep 2021 15:25:28 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id bi4so64815oib.9;
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JA7MvqNCRAXbYo05TfGKX4daKtGDuTCNxMXvkKsnrrw=;
        b=Wpa5qcsKD3h1dxUxPkvXqucRseJMxsqBR1HCxJhdsXbr4dJJ0RmZr+H6Rk9dRHmby+
         5dEfveugg5KqVNdn2AEVV/Tr5cXPObo38HqLPCcDs9NsMziOZdwCx96rGTu7jeS1n+Ef
         sUn2lQ4QJOwEvC1Q3qRCuLpveehx1XDZIRoxlD2MjfCujitWZBsRgVXFctJRshz4ib8F
         CzZnEfFY4bVJ9Snth4SK6uDnai6xxyqp6iDUMTC/sETqY6KChUWQATMB4gs61r2nQ/kQ
         LuimEGNIOEvXB7L2mexoypPnLmO6aQbJge7esB1ku5C0p5BXaTBXzkpjyCILbKLha47u
         yDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JA7MvqNCRAXbYo05TfGKX4daKtGDuTCNxMXvkKsnrrw=;
        b=D3NKO7gR+T+gX1zh6cURBfE1gF8yhKUjwvDfSR+2VQVZH8wyh9AssEr2STf3DGvqPf
         QqFk80QgPquXk4F+WfkuS2LYzW4uWVsgeMm2OGokYr6ckaPFikDlnhZk2S/vvSmr01iB
         VQgVAHj+sYInkDDJNosghS/eIAcIEDZ69aaL8F7RNMPVIdPJWdLA6YuGnJnBeg0/zxdk
         L0JqF22yiXIHnCJ8QsOAgX3AoJNq7LoTn755jJsjb3/de1AbtfhsKzYndcUzcfyuJQLE
         bI6PJ0T2qfqBX77AJ+rnaSRhNrVu+drStHhYly6JT2S3S0XQjPnpVnfpuYgd6uZhjBrX
         F6WQ==
X-Gm-Message-State: AOAM5330XTfSjvi10RLfBRjT1mqXfQVbKa2qYRy+N35juQfB9Qou7H1e
        1EGbnJ9UdWtMc63+nGve2Tk=
X-Google-Smtp-Source: ABdhPJyTLkciEZWXP55CqUV0Z5GfYTsPtI4BadqhkY4+1ljfmHHr8iZaZDAuq2jBvcbmLNEdfyLf7Q==
X-Received: by 2002:a05:6808:1294:: with SMTP id a20mr1775934oiw.4.1631226327717;
        Thu, 09 Sep 2021 15:25:27 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:27 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 10/15] leds: trigger: blkdev: Add LED trigger activate function
Date:   Thu,  9 Sep 2021 17:25:08 -0500
Message-Id: <20210909222513.2184795-11-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
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
 drivers/leds/trigger/ledtrig-blkdev.c | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 40dc55e5d4f3..6f78a9515976 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -164,6 +164,62 @@ static void blkdev_process(struct work_struct *const work)
 }
 
 
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
+	/* Don't allow module to be removed while any LEDs are linked */
+	if (WARN_ON(!try_module_get(THIS_MODULE))) {
+		ret = -ENODEV;		/* Shouldn't ever happen */
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
+	led->dir = kobject_create_and_add("linked_devices",
+					  &led_dev->dev->kobj);
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
+
+
 /*
  *
  *	Initialization - register the trigger
@@ -185,5 +241,6 @@ static const struct attribute_group *ledtrig_blkdev_attr_groups[] = {
 
 struct led_trigger ledtrig_blkdev_trigger = {
 	.name		= "blkdev",
+	.activate	= blkdev_activate,
 	.groups		= ledtrig_blkdev_attr_groups,
 };
-- 
2.31.1

