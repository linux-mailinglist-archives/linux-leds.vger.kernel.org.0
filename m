Return-Path: <linux-leds+bounces-1202-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B2877372
	for <lists+linux-leds@lfdr.de>; Sat,  9 Mar 2024 20:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD351C20A81
	for <lists+linux-leds@lfdr.de>; Sat,  9 Mar 2024 19:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01514C626;
	Sat,  9 Mar 2024 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kfiieu8X"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255704A2A
	for <linux-leds@vger.kernel.org>; Sat,  9 Mar 2024 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710011325; cv=none; b=WuyHkd2QHiO5ywVJiZ+m+M35FikDOGk3ZXKYoCa8pt3QGDwya6uIqoMc2B8Q6b1duM9pQxDuMNhh7CJIIUhR830Z3B2GVvWsIG3CXxM6Ju82CwU4w9DRsjC/p+lKFUPZTtUL7nUJKcgpiWGetaDR9RUrqscEukFQIKq+X5Y8vIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710011325; c=relaxed/simple;
	bh=HOS0yUxWSvjQj5bmrVf6Q8FnmBzrt5b8k9JKtbCzaVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ei1SCq9BfW3SBowN8BU92gr17xYV09Vj4Rf/1yV2UHOhNpzvMfS6zLCzuyqUz1d4KGEsN7GjokHbNpOk2Vq9MtW/33mQU9G0fO2mBrfAFOhlEZqaZi6HgZ4Dl8/bOgKXHKxRmD5Hm69d7MvyW9JUmWLVavLEaFeG1zFmtjmKZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kfiieu8X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710011323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8o/gnuQdrOI6Eypxc3N2qhWfsOWwmV1ZKkzkdiZ5/nY=;
	b=Kfiieu8X9W6GklkR050TXuEVzwyg2yOyLDhQN85j4hVZh0skaQaB7Zj8WTOwNGHGnMfQWw
	1w1HGSUgtINbhRkwiWZ9Ee2SwEGEyGCpQ7/pr+M31+Jq4fLuspUs1xpdgG2EKUXaoHZGpx
	Oywrju+zFgfWyBFrLcbxhWvX4ur0neU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-mMF__XR3NN2JoADjgVAiig-1; Sat, 09 Mar 2024 14:08:38 -0500
X-MC-Unique: mMF__XR3NN2JoADjgVAiig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE8BA101A526;
	Sat,  9 Mar 2024 19:08:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD631C05E1C;
	Sat,  9 Mar 2024 19:08:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Dan Murphy <dmurphy@ti.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [RFC 1/2] leds: core: Add led_mc_set_brightness() function
Date: Sat,  9 Mar 2024 20:08:34 +0100
Message-ID: <20240309190835.173703-2-hdegoede@redhat.com>
In-Reply-To: <20240309190835.173703-1-hdegoede@redhat.com>
References: <20240309190835.173703-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Add a new led_mc_set_brightness() function for in kernel color/brightness
changing of multi-color LEDs.

led-class-multicolor can be build as a module and led_mc_set_brightness()
will have builtin callers, so put led_mc_set_brightness() inside led-core
instead, just like how led_set_brightness() is part of the core and not
of the led-class object.

This also adds a new LED_MULTI_COLOR led_classdev flag to allow
led_mc_set_brightness() to verify that it is operating on a multi-color
LED classdev, avoiding casting the passed in LED classdev to a multi-color
LED classdev, when it actually is not a multi-color LED.

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
index 89c9806cc97f..5889753ebc74 100644
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
+ * it is used in kernel by e.g. triggers.
+ */
+void led_mc_set_brightness(struct led_classdev *led_cdev,
+			   unsigned int *intensity_value, unsigned int num_colors,
+			   unsigned int brightness)
+{
+	struct led_classdev_mc *mcled_cdev;
+	unsigned int i;
+
+	if (!(led_cdev->flags & LED_MULTI_COLOR)) {
+		dev_err_once(led_cdev->dev, "%s: error not a multi-color LED\n",  __func__);
+		return;
+	}
+
+	mcled_cdev = lcdev_to_mccdev(led_cdev);
+	if (num_colors != mcled_cdev->num_colors) {
+		dev_err_once(led_cdev->dev, "%s: error num_colors mismatch %d != %d\n",
+			     __func__, num_colors, mcled_cdev->num_colors);
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
index 4754b02d3a2c..fed88eb9e170 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -115,6 +115,7 @@ struct led_classdev {
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_MULTI_COLOR		BIT(24)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -392,6 +393,25 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness);
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
2.43.2


