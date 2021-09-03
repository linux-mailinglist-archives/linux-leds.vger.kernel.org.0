Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF5640070D
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350975AbhICUrR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351048AbhICUrO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:14 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D380C061575;
        Fri,  3 Sep 2021 13:46:12 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id h133so673379oib.7;
        Fri, 03 Sep 2021 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6RxZPutweWrWoAFf03RV/RX9kRQZgKxHijlvrwy4xeA=;
        b=RgPP6Ox8lfChSOGOvKCshakVU8K42fiVf9AekVvRd+sls6YR9BWYOJ+QnHFvLtCbUc
         dTp3QoWjxs673/bsgaCYI017mIXxfw+Gyt+lveYDg1Q+r781kFq9zYR/EIwtWn9NXVlU
         LhL8oIFMmsmoTliD/nwOy3xx/kXd7O3pIhX/YkHjTd7UMXS6KZPNXyPEzfRFufCyjY2f
         HfuabWsWmYWjAFYMEEIgru67GE0vlvLvkcp4t9pYZHZ9CU4cyFBAbDocmbsf2acXLdaW
         hwOgBKbuplFY2AEvr9tD8Dj9vF3bD/Yq3pL1mLNPJfGnD/i/3gVL2ZOfIlRZlMqRZUW/
         TL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6RxZPutweWrWoAFf03RV/RX9kRQZgKxHijlvrwy4xeA=;
        b=IQwzDF23iYvXN7x1uxrszURvoBLLvHQOMRUIVC1+Jx4W/l/h8/9LBRrJpIjbJubj4Q
         rDiVkEjS5rJYzwZo66JO1HhY40N8GoVLwvlzZ1HWbqc3lc2rKkuLOvnhzylxMMGJB4N9
         Ic+sPpMSHEhEpxWPxJE9i2fLiv7J96HxFF1ZVCZOVc3l3+AyGt0Wm/N5A+zqnaAnvAg7
         vcRLZAMZuu6dqLZ6K8lMdKE927Id1C6eOjpxC99rFiWWCMRE4UZmblPU9dl9K0ofI4vV
         vNR1SB4iHZyrV5QIfyAOqxa/WoTsKhvb/EDeqTfj6ZDtaBKnTA8TxI47oiBfK3ukI6gh
         G3qw==
X-Gm-Message-State: AOAM532FjmSAOejPHHlOqPquVUiDcVxMri5CctzIG9HTGXlUsa03zhRm
        Cs0g4dCUvR+/XIO31w4tGx4=
X-Google-Smtp-Source: ABdhPJyX1DP4KjospELGfmNuC3H0LsiPs0SiUM4J8LnFz91opZoawTlnBvfOqwgEOVpLq7a95+oUaA==
X-Received: by 2002:a05:6808:1911:: with SMTP id bf17mr536077oib.91.1630701971737;
        Fri, 03 Sep 2021 13:46:11 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:11 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 18/18] ledtrig-blkdev: Add initialization & exit functions
Date:   Fri,  3 Sep 2021 15:45:48 -0500
Message-Id: <20210903204548.2745354-19-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Init function:
 * Initialize interval (convert default value to jiffies)
 * Initialize __ledtrig_blkdev_disk_cleanup function pointer
 * Register the block device LED trigger

Exit functioon:
 * Unregister the LED trigger
 * Set __ledtrig_blkdev_disk_cleanup back to NULL

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 78 +++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index ec167633e329..e6ff5baada2e 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -687,3 +687,81 @@ static ssize_t blkdev_mode_store(struct device *const dev,
 
 static struct device_attribute ledtrig_blkdev_attr_mode =
 	__ATTR(mode, 0644, blkdev_mode_show, blkdev_mode_store);
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
+	int ret;
+
+	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
+	if (ret != 0)
+		return ret;
+
+	ledtrig_blkdev_interval = msecs_to_jiffies(LEDTRIG_BLKDEV_INTERVAL);
+	__ledtrig_blkdev_disk_cleanup = blkdev_disk_cleanup;
+
+	/*
+	 * Can't call led_trigger_register() with ledtrig_blkdev_mutex locked.
+	 * If an LED has blkdev as its default_trigger, blkdev_activate() will
+	 * be called for that LED, and it will try to lock the mutex, which will
+	 * hang.
+	 */
+	mutex_unlock(&ledtrig_blkdev_mutex);
+
+	ret = led_trigger_register(&ledtrig_blkdev_trigger);
+	if (ret != 0) {
+		mutex_lock(&ledtrig_blkdev_mutex);
+		__ledtrig_blkdev_disk_cleanup = NULL;
+		mutex_unlock(&ledtrig_blkdev_mutex);
+	}
+
+	return ret;
+}
+module_init(blkdev_init);
+
+static void __exit blkdev_exit(void)
+{
+	mutex_lock(&ledtrig_blkdev_mutex);
+
+	/*
+	 * It's OK to call led_trigger_unregister() with the mutex locked,
+	 * because the module can only be unloaded when no LEDs are using
+	 * the blkdev trigger, so blkdev_deactivate() won't be called.
+	 */
+	led_trigger_unregister(&ledtrig_blkdev_trigger);
+	__ledtrig_blkdev_disk_cleanup = NULL;
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
+}
+module_exit(blkdev_exit);
-- 
2.31.1

