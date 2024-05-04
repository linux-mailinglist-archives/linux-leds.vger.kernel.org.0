Return-Path: <linux-leds+bounces-1583-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D528BBD2F
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2024 18:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CDF21C20E38
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2024 16:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFCE5A0E6;
	Sat,  4 May 2024 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="chp06knC"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FC5A0F9
	for <linux-leds@vger.kernel.org>; Sat,  4 May 2024 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840891; cv=none; b=AwX+LRWH95KOtSsAeNTvi0uPmmxiEcgSUU+fRaSnC1w5Q4encIu/fSRR3s8znwBzp5TzVZnDsntH9yfp7r2bk/27KZ59jZGMneRHN9cn41IuiXPLoyawxC3U3rD48XcnWWBgTsqPWLLWOBGeIdKhhwv2L5Dv72EHA2v8AbeCrIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840891; c=relaxed/simple;
	bh=oAaOX0mFkfF8Lep1L6RVIQKgGo7OyX39Zj3ebHl9mck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOXvIJTt8Xw6ANEHspwnW6fOg297ZjAfZ5jQ4vi4WqNMfqlHFClkwzZdiyv138uwmq+exHPa8TsKL6oyplrvVqCmydL4nBO3pa+cUs69FB65a3KEWMkJYirL+TAnsgOxivw18JYNsig3eZngjZGUfP9fKVMnPlG7D37vh7mm5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=chp06knC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714840888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFBingpjpDfRwTxUlurQ7OennTtxWuPwkEFGn/JyEKY=;
	b=chp06knCNXWR6INDhDf7+WHVwjjyQy7BmEhTUKuJUE9Lqjr1CVFvUt3cKq7SG+DfHeWFUm
	BZivmMnbLeGQmUZeFo/JlK3dPfKY5Yop8zQv391EKg0VjQTilBVWN1YVqHyTArWfqODznu
	yAym1s90L35dKSgHBoTTh3l9UoPLZnA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-anHJ6G1yMM2kiju7hY5tnA-1; Sat,
 04 May 2024 12:41:24 -0400
X-MC-Unique: anHJ6G1yMM2kiju7hY5tnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D4021C03150;
	Sat,  4 May 2024 16:41:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32454EC685;
	Sat,  4 May 2024 16:41:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v9 4/7] leds: core: Add led_mc_set_brightness() function
Date: Sat,  4 May 2024 18:41:02 +0200
Message-ID: <20240504164105.114017-5-hdegoede@redhat.com>
In-Reply-To: <20240504164105.114017-1-hdegoede@redhat.com>
References: <20240504164105.114017-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Add a new led_mc_set_brightness() function for in kernel color/brightness
changing of multi-color LEDs.

led-class-multicolor can be build as a module and led_mc_set_brightness()
will have the builtin callers, so put led_mc_set_brightness() inside
led-core instead, just like how led_set_brightness() is part of the core
and not of the led-class object.

This also adds a new LED_MULTI_COLOR led_classdev flag to allow
led_mc_set_brightness() to verify that it is operating on a multi-color
LED classdev, avoiding casting the passed in LED classdev to a multi-color
LED classdev, when it actually is not a multi-color LED.

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class-multicolor.c |  1 +
 drivers/leds/led-core.c             | 31 +++++++++++++++++++++++++++++
 include/linux/leds.h                | 20 +++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index ec62a4811613..df01c0e66c8b 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -134,6 +134,7 @@ int led_classdev_multicolor_register_ext(struct device *parent,
 		return -EINVAL;
 
 	led_cdev = &mcled_cdev->led_cdev;
+	led_cdev->flags |= LED_MULTI_COLOR;
 	mcled_cdev->led_cdev.groups = led_multicolor_groups;
 
 	return led_classdev_register_ext(parent, led_cdev, init_data);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 89c9806cc97f..ef7d1c6767ca 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -362,6 +363,36 @@ int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
+/*
+ * This is a led-core function because just like led_set_brightness()
+ * it is used in the kernel by e.g. triggers.
+ */
+void led_mc_set_brightness(struct led_classdev *led_cdev,
+			   unsigned int *intensity_value, unsigned int num_colors,
+			   unsigned int brightness)
+{
+	struct led_classdev_mc *mcled_cdev;
+	unsigned int i;
+
+	if (!(led_cdev->flags & LED_MULTI_COLOR)) {
+		dev_err_once(led_cdev->dev, "error not a multi-color LED\n");
+		return;
+	}
+
+	mcled_cdev = lcdev_to_mccdev(led_cdev);
+	if (num_colors != mcled_cdev->num_colors) {
+		dev_err_once(led_cdev->dev, "error num_colors mismatch %u != %u\n",
+			     num_colors, mcled_cdev->num_colors);
+		return;
+	}
+
+	for (i = 0; i < mcled_cdev->num_colors; i++)
+		mcled_cdev->subled_info[i].intensity = intensity_value[i];
+
+	led_set_brightness(led_cdev, brightness);
+}
+EXPORT_SYMBOL_GPL(led_mc_set_brightness);
+
 int led_update_brightness(struct led_classdev *led_cdev)
 {
 	int ret;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index db6b114bb3d9..e80a185e255a 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -107,6 +107,7 @@ struct led_classdev {
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_MULTI_COLOR		BIT(24)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -373,6 +374,25 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness);
  */
 int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
 
+/**
+ * led_mc_set_brightness - set mc LED color intensity values and brightness
+ * @led_cdev: the LED to set
+ * @intensity_value: array of per color intensity values to set
+ * @num_colors: amount of entries in intensity_value array
+ * @brightness: the brightness to set the LED to
+ *
+ * Set a multi-color LED's per color intensity values and brightness.
+ * If necessary, this cancels the software blink timer. This function is
+ * guaranteed not to sleep.
+ *
+ * Calling this function on a non multi-color led_classdev or with the wrong
+ * num_colors value is an error. In this case an error will be logged once
+ * and the call will do nothing.
+ */
+void led_mc_set_brightness(struct led_classdev *led_cdev,
+			   unsigned int *intensity_value, unsigned int num_colors,
+			   unsigned int brightness);
+
 /**
  * led_update_brightness - update LED brightness
  * @led_cdev: the LED to query
-- 
2.44.0


