Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1361639EECF
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jun 2021 08:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhFHGiS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Jun 2021 02:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHGiS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Jun 2021 02:38:18 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC57C061574;
        Mon,  7 Jun 2021 23:36:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id k7so30660644ejv.12;
        Mon, 07 Jun 2021 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IQ1reIr/EeLy5o44C9PRoDTkNRjsd05SHkFRgCdg5Zs=;
        b=arCOl0+HaIsUiXCImZB9LT51Z7gOytLc8ScsiaDMF+7UZgwVRdl9dex2kFWJcquIGi
         QykylGDQPS/un2094D3ubWY2bfhGMveY5BzmMko+t9IB572ore3IQ8mbSdD4QL8c+xi+
         AA1wOwvvuKIJYsbcsLWRdAzqVL8UQExA/94/QirkaMpCtb+PvZrwk2EYdTAkxMUk2RWM
         y8KwDf3xk4/5yK3CE3O1u84vdEJHd7BAK1bbWvubUpHEtOGl1rAaxFXkMU62IVpMFoKu
         GSLV5Bsw20VqeiEsBFUXw1F9C2JQRme8lsyyZTmtcF5Wd9Inb+vrUvaAJhxc/mU7udCD
         7thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IQ1reIr/EeLy5o44C9PRoDTkNRjsd05SHkFRgCdg5Zs=;
        b=CnYspECiwKf74zMcssoCOJaUjKZA/vrPCK4lYXiFyDfSuIuNs1MF7apgh7R9zmSdlr
         Q1P362ZFDPqyHX4P74YOn/msrEnBhvGq+6ETaicCNQftSmdKKtL4m1VtI9CxkeFXxVwG
         0gv6kZIbgh8xMzbW0Qc41Q9FV+zALv7YybUuk2q/Szg6g1nue3k37JrTSbaxio0lyTvH
         BHsjUNw+hpHBXGqcZR07Nn1MFUjXuLrMqgyXBVXEIYf8aOVQ1WAKS2HeO+8oQOhFqCNt
         7NLbdtwq3a8oKZCrHDdDBCcuXpKwjAQgYpo9vdn69M3CUAGolQHiecKglL1yDvabV7C8
         XzYg==
X-Gm-Message-State: AOAM531Qoaw4w+jlM/yYEJl2yUNx32CO+TBSj5KA35GoWkfrbkqqfUAR
        rCDKO7mxsZS9PeqhkFnWG+k=
X-Google-Smtp-Source: ABdhPJysrdk7SHW4HBrMbnOEcTuf35rlqPzpl2WT2CSTS1YSRmy85MvdLcRlg7zmYDRIb1TR1BfUkQ==
X-Received: by 2002:a17:906:724b:: with SMTP id n11mr22001443ejk.338.1623134171128;
        Mon, 07 Jun 2021 23:36:11 -0700 (PDT)
Received: from fujitsu.fritz.box (p200300da6709910000b233666d22ecd9.dip0.t-ipconnect.de. [2003:da:6709:9100:b2:3366:6d22:ecd9])
        by smtp.gmail.com with ESMTPSA id ot30sm6698168ejb.61.2021.06.07.23.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:36:10 -0700 (PDT)
From:   Denis Osterland-Heim <denis.osterland.heim@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     denis.osterland@diehl.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Denis Osterland-Heim <Denis.Osterland@diehl.com>
Subject: [PATCH v8 1/2] leds: move default_state read from fwnode to core
Date:   Tue,  8 Jun 2021 08:35:53 +0200
Message-Id: <20210608063554.6590-2-denis.osterland.heim@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
References: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Denis Osterland-Heim <Denis.Osterland@diehl.com>

This patch introduces a new function to read initial
default_state from fwnode.

Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/led-core.c  | 15 +++++++++++++++
 drivers/leds/leds-gpio.c | 12 ++----------
 drivers/leds/leds.h      |  1 +
 include/linux/leds.h     | 12 +++++++++---
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 8eb8054ef9c6..4a97cb745788 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -477,3 +477,18 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(led_compose_name);
+
+enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)
+{
+	const char *state = NULL;
+
+	if (!fwnode_property_read_string(fwnode, "default-state", &state)) {
+		if (!strcmp(state, "keep"))
+			return LEDS_DEFSTATE_KEEP;
+		if (!strcmp(state, "on"))
+			return LEDS_DEFSTATE_ON;
+	}
+
+	return LEDS_DEFSTATE_OFF;
+}
+EXPORT_SYMBOL_GPL(led_init_default_state_get);
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index b5d5e22d2d1e..092eb59a7d32 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "leds.h"
 
 struct gpio_led_data {
 	struct led_classdev cdev;
@@ -144,7 +145,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 	device_for_each_child_node(dev, child) {
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
-		const char *state = NULL;
 
 		/*
 		 * Acquire gpiod from DT with uninitialized label, which
@@ -161,15 +161,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 
 		led_dat->gpiod = led.gpiod;
 
-		if (!fwnode_property_read_string(child, "default-state",
-						 &state)) {
-			if (!strcmp(state, "keep"))
-				led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
-			else if (!strcmp(state, "on"))
-				led.default_state = LEDS_GPIO_DEFSTATE_ON;
-			else
-				led.default_state = LEDS_GPIO_DEFSTATE_OFF;
-		}
+		led.default_state = led_init_default_state_get(child);
 
 		if (fwnode_property_present(child, "retain-state-suspended"))
 			led.retain_state_suspended = 1;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 345062ccabda..aa64757a4d89 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -27,6 +27,7 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
+enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 329fd914cf24..a0b730be40ad 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -33,6 +33,12 @@ enum led_brightness {
 	LED_FULL	= 255,
 };
 
+enum led_default_state {
+	LEDS_DEFSTATE_OFF	= 0,
+	LEDS_DEFSTATE_ON	= 1,
+	LEDS_DEFSTATE_KEEP	= 2,
+};
+
 struct led_init_data {
 	/* device fwnode handle */
 	struct fwnode_handle *fwnode;
@@ -520,9 +526,9 @@ struct gpio_led {
 	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
 	struct gpio_desc *gpiod;
 };
-#define LEDS_GPIO_DEFSTATE_OFF		0
-#define LEDS_GPIO_DEFSTATE_ON		1
-#define LEDS_GPIO_DEFSTATE_KEEP		2
+#define LEDS_GPIO_DEFSTATE_OFF		LEDS_DEFSTATE_OFF
+#define LEDS_GPIO_DEFSTATE_ON		LEDS_DEFSTATE_ON
+#define LEDS_GPIO_DEFSTATE_KEEP		LEDS_DEFSTATE_KEEP
 
 struct gpio_led_platform_data {
 	int 		num_leds;
-- 
2.25.1

