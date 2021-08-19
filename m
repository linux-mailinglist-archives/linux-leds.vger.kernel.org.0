Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497BA3F10BF
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbhHSCwV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236292AbhHSCwC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:02 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0666C0612A8;
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so6809182otv.11;
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRx3WSbHN2621ogL+fq9TI54goN5jX542hotfGdhgzw=;
        b=mkWoo3nCDSds4T6Pec/mDgTgogMejNa+jb5y5TNgUo5dQSgA9J2IozvxbsAcq8wKfV
         7AeHMMvkxEQEa2TJf921T6s+7vqzAhBMwgK3eOlmXrNhDtZnG4Y2+U0wA6cC6FQhj3x2
         PV8Qu0E4GcYvx60HEwcQNOeXGQb9jHrXAIQHGvSMoKYhh/oYgFmGIqjRpg7hegxzBxzI
         MejAfRc16AAyIVouwqzmlrngD2LwB03N/9C/nZ3Z/qatAexqxgGuA9a4T00BPDcetiSM
         MvUMaEGFrJtNLCI++/LgBdhQucNPoFfPAAHta0970g4FjJ/YVsKHed1lbuH28YHB1El+
         zqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRx3WSbHN2621ogL+fq9TI54goN5jX542hotfGdhgzw=;
        b=htRFrgEpPzaz9h3mi5BOMSswMBOyHk6tPNXuw7b+bwTDvGukv2Xcg4uSSuymqGHtHg
         FslNgGR4oH8KeeCzWGwDeKOEU9rBzJLifAcoj9oukeVFu6DoSJFBcymWRwebKIyvIR6U
         9d8iAeccp7AkZKSx0cySmbxmS0mYmb4HhIDQtUctIyLDVk2tAtQbivz2DjQ7p6NgblvH
         xVIEgW6jCIZVpjmx2X46m+RNb3rn6Vsbg34z3MTImQDJEjLvQcTjlXN2WNes6XmF1wLu
         xZZOucFJxxVkuwXIkuZGOO2LzvrLLkl+kUJlBbZwOcrRkxf1bUq7RXzdgbkxZuBeBHGp
         KhLg==
X-Gm-Message-State: AOAM531eR9yzJ9nbXY/DXvuJq4IczIlcD4Mf1Fn1y3Ev6QGFGHlOqBal
        /vytvivbw8v1IxXVMtORQUbfNRiheDvonnbW
X-Google-Smtp-Source: ABdhPJxrsxdNPMLvfHIHS78EckYX3kJNIRuhzveQuJ3F8cMkhyV6Op38Jh6v+q04PvHdzuRyP4uDbQ==
X-Received: by 2002:a05:6830:31ac:: with SMTP id q12mr9836670ots.152.1629341477061;
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:16 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 17/18] ledtrig-blkdev: Add initialization function
Date:   Wed, 18 Aug 2021 21:50:52 -0500
Message-Id: <20210819025053.222710-18-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Register the block device LED trigger

Initialize interval (convert default value to jiffies)

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 01573c1ad855..f152b00a4f1a 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -729,3 +729,42 @@ static void blkdev_deactivate(struct led_classdev *const led_dev)
 
 	mutex_unlock(&ledtrig_blkdev_mutex);
 }
+
+
+/*
+ *
+ *	Initialization - register the trigger
+ *
+ */
+
+static struct attribute *ledtrig_blkdev_attrs[] = {
+	&ledtrig_blkdev_attr_add.attr,
+	&ledtrig_blkdev_attr_del.attr,
+	&ledtrig_blkdev_attr_blink_time.attr,
+	&ledtrig_blkdev_attr_interval.attr,
+	&ledtrig_blkdev_attr_mode.attr,
+	NULL
+};
+
+static const struct attribute_group ledtrig_blkdev_attr_group = {
+	.attrs	= ledtrig_blkdev_attrs,
+};
+
+static const struct attribute_group *ledtrig_blkdev_attr_groups[] = {
+	&ledtrig_blkdev_attr_group,
+	NULL
+};
+
+static struct led_trigger ledtrig_blkdev_trigger = {
+	.name		= "blkdev",
+	.activate	= blkdev_activate,
+	.deactivate	= blkdev_deactivate,
+	.groups		= ledtrig_blkdev_attr_groups,
+};
+
+static int __init blkdev_init(void)
+{
+	ledtrig_blkdev_interval = msecs_to_jiffies(LEDTRIG_BLKDEV_INTERVAL);
+	return led_trigger_register(&ledtrig_blkdev_trigger);
+}
+device_initcall(blkdev_init);
-- 
2.31.1

