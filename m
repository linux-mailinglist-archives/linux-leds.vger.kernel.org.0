Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AA131ACB5
	for <lists+linux-leds@lfdr.de>; Sat, 13 Feb 2021 16:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhBMPv1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 13 Feb 2021 10:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhBMPv0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 13 Feb 2021 10:51:26 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61486C061574;
        Sat, 13 Feb 2021 07:50:44 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id y18so3273743edw.13;
        Sat, 13 Feb 2021 07:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tlv0Bk04Vbqv9/ybuzyPTe5LdOVFwHd7RnmbI+YE1kA=;
        b=hkV9exA+5v9d3FKUlzRTKkmqbsnMpEZlRgn65k+21cHmJBFUpPnOhguohcKoQgyXyk
         c6/tgbdhnnE0Qq5GC42xuUw/VBnfDOSTzTcJefRZxa/Ihm1EAduI0m3m/sOvn4xme1UC
         AmYu0KdNSAc5TNxkin8n2qSi7j4UvNomnMxF4sd0UzRVdOWyO7x/+quYhc3vcIZxFxuV
         i9MiI0I+pbEDwl7ClYkDXAN6V3zb7Vx2sWv1QDrbIymUYh9bhByYfBcUV18rQFK1Tk/p
         KM1WDgaAl5C9fduVb4WyY9I31z6NZx+/5eZgODnOpSM/KGp403E1HOguwpNXjOVMqGZS
         KTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tlv0Bk04Vbqv9/ybuzyPTe5LdOVFwHd7RnmbI+YE1kA=;
        b=q4jcMEU9bYF7aM5nEajTdkkdKOQ9TCg+4BkAls3vwr0HqziH5SvgsUH4fIUJu1GVRc
         B34RYurhnI1NNIiVvNWTN9QACMLj0WurExIOXF6fnHHUrWqaAK5L1zzOTbi2eKcLLGUt
         4hwsyL2n/cQh2tEoyftTi3oQAonMwxgncF9LL8f2z+G1ZSuZf8j8Dk2jjGCIQ8k52/bZ
         jhdZfUjiHh0sqAK6sECmw9+SEIBykYuPCi7663EgIwv2oYMF5Hb3poXvlgOct5msgOF0
         9fdnZjChkZ9iZfbWPVmaCDBDMzaG0MMSCy/HFUalu5t2udUyBgI2rH8Mz0xNFyhqUBeU
         zBrg==
X-Gm-Message-State: AOAM531qxv7ATCCiiwYfoUfIBTugQjjTeWVcjuIjzfnYF/3xA7sUXK2R
        KPdCalEkcascmMv/koEVAmWl+TVVKsg=
X-Google-Smtp-Source: ABdhPJxlkaVHVHuTNHirCAARP7AneWOVVWeZcTvR4EYzaz1ETHnpKmw+vttpybRUWB0x0EzcnC+pVQ==
X-Received: by 2002:aa7:d98f:: with SMTP id u15mr8180514eds.267.1613231443060;
        Sat, 13 Feb 2021 07:50:43 -0800 (PST)
Received: from localhost.localdomain ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id f22sm7939244eje.34.2021.02.13.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 07:50:42 -0800 (PST)
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] leds: trigger: timer: Optionally stop timer trigger on reboot
Date:   Sat, 13 Feb 2021 16:47:36 +0100
Message-Id: <20210213154736.2905933-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This functionality is similar to heartbeat and activity triggers and
turns the timer-triggered LEDs off right before reboot. It's configurable
via new module parameter "reboot_off" to preserve original behaviour.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/leds/trigger/ledtrig-timer.c | 39 +++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 7c14983781ee..3eadcb0a629a 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -16,6 +16,11 @@
 #include <linux/device.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/reboot.h>
+
+static bool reboot_off;
+module_param(reboot_off, bool, 0444);
+MODULE_PARM_DESC(reboot_off, "Switch LED off on reboot");
 
 static ssize_t led_delay_on_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -97,7 +102,39 @@ static struct led_trigger timer_led_trigger = {
 	.deactivate = timer_trig_deactivate,
 	.groups = timer_trig_groups,
 };
-module_led_trigger(timer_led_trigger);
+
+static int timer_reboot_notifier(struct notifier_block *nb, unsigned long code,
+				 void *unused)
+{
+	led_trigger_unregister(&timer_led_trigger);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block timer_reboot_nb = {
+	.notifier_call = timer_reboot_notifier,
+};
+
+static int __init timer_trig_init(void)
+{
+	int ret;
+
+	ret = led_trigger_register(&timer_led_trigger);
+	if (ret)
+		return ret;
+	if (reboot_off)
+		register_reboot_notifier(&timer_reboot_nb);
+	return 0;
+}
+
+static void __exit timer_trig_exit(void)
+{
+	/* Not afraid of -ENOENT */
+	unregister_reboot_notifier(&timer_reboot_nb);
+	led_trigger_unregister(&timer_led_trigger);
+}
+
+module_init(timer_trig_init);
+module_exit(timer_trig_exit);
 
 MODULE_AUTHOR("Richard Purdie <rpurdie@openedhand.com>");
 MODULE_DESCRIPTION("Timer LED trigger");
-- 
2.19.1

