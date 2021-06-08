Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B805539EED2
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jun 2021 08:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhFHGjS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Jun 2021 02:39:18 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48]:42878 "EHLO
        mail-ej1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHGjQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Jun 2021 02:39:16 -0400
Received: by mail-ej1-f48.google.com with SMTP id k25so25231325eja.9;
        Mon, 07 Jun 2021 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4clZ8ZJRTuTc/QrguH4w64auSZ4LLlsG595KU1MPBM=;
        b=gdFEISbh5wEAU9s+anA5iwBXogIhTX4ZjmljXpjfOvRt0if2VxgUvGo1a8U9UIvVsd
         ahPBIJ7mK4CyJluB04DzVIabcOg7GKBJERR7Z0UrfE8ytwUN8uEJ4FVQXSXjKqR2KnmO
         LbIb4vrloLIoBAzDWAxeTe/bZIzTqVmLLwCmtj+wclXko3z/yg0RIRAC0FaNAFovRPXo
         cr2o0fQd5LojOm1Znk9VcP+YLHPFSxEVMCYH3Nbney8ljmNKHJ+8hn7tYErnLEZ3LcRy
         RuDVvzmsiwwXI8cwu3GnoA13xjy79eHWGNPMc1/6hDuX94kzACTYCo6rp2Hv0ZPYcciI
         iWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4clZ8ZJRTuTc/QrguH4w64auSZ4LLlsG595KU1MPBM=;
        b=EGnL16fb5A9yB2c6hi5MkRa9ggh9M+rHhmeHmO1MsclGimufqrTwH8/zn7Ov/bfG6g
         1THKfEPX5h0hTERge+Lht7orWy2wIHb3t2RBl5kDbONNak6DyZ/8tiXU5yhse17aazh1
         Y5Ad510bhggH52vzZGvUcHzzphQ/BLepSIPuXHjIIsYNV1BF9GAGmT+eyfjqxlpa+LkI
         yENhqtbJb8XjoZJ+99VGokPlzsgzg4XimcguvBdM4hNl197fMgasm+Zx2TPFOmlhf/Bf
         Cr8vGi6oFB3fVkHHbN+nB15ft1nP30G/O8GziWo7/hOcrRn2SyLUtAPL9tHfGxyckjhv
         eQOA==
X-Gm-Message-State: AOAM531QAZ9RY0kaEkTp+TSzvLuLb1chXCE5U6Nb6TBR2mUHifkCp8mC
        oybf0bu3TQna7T6qNU3zRUc=
X-Google-Smtp-Source: ABdhPJyp8tfR3YCL7Xz2xP/KTrRZqK8/X32bMlhjTbLfy7gYorXulA0FBaVLeo8X82MC6JEWNLnEQA==
X-Received: by 2002:a17:907:f9b:: with SMTP id kb27mr11592971ejc.44.1623134171806;
        Mon, 07 Jun 2021 23:36:11 -0700 (PDT)
Received: from fujitsu.fritz.box (p200300da6709910000b233666d22ecd9.dip0.t-ipconnect.de. [2003:da:6709:9100:b2:3366:6d22:ecd9])
        by smtp.gmail.com with ESMTPSA id ot30sm6698168ejb.61.2021.06.07.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:36:11 -0700 (PDT)
From:   Denis Osterland-Heim <denis.osterland.heim@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     denis.osterland@diehl.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Denis Osterland-Heim <Denis.Osterland@diehl.com>
Subject: [PATCH v8 2/2] leds: pwm: add support for default-state device property
Date:   Tue,  8 Jun 2021 08:35:54 +0200
Message-Id: <20210608063554.6590-3-denis.osterland.heim@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
References: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Denis Osterland-Heim <Denis.Osterland@diehl.com>

This patch adds support for "default-state" devicetree property, which
allows to defer pwm init to first use of led.

This allows to configure the PWM early in bootloader to let the LED
blink until an application in Linux userspace sets something different.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/leds-pwm.c | 49 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index d71e9fa5c8de..6832180c1c54 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -17,10 +17,12 @@
 #include <linux/err.h>
 #include <linux/pwm.h>
 #include <linux/slab.h>
+#include "leds.h"
 
 struct led_pwm {
 	const char	*name;
 	u8		active_low;
+	u8		default_state;
 	unsigned int	max_brightness;
 };
 
@@ -77,7 +79,38 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 	led_data->cdev.brightness_set_blocking = led_pwm_set;
 
-	pwm_init_state(led_data->pwm, &led_data->pwmstate);
+	/* init PWM state */
+	switch (led->default_state) {
+	case LEDS_DEFSTATE_KEEP:
+		pwm_get_state(led_data->pwm, &led_data->pwmstate);
+		if (led_data->pwmstate.period)
+			break;
+		led->default_state = LEDS_DEFSTATE_OFF;
+		dev_warn(dev,
+			"failed to read period for %s, default to off",
+			led->name);
+		fallthrough;
+	default:
+		pwm_init_state(led_data->pwm, &led_data->pwmstate);
+		break;
+	}
+
+	/* set brightness */
+	switch (led->default_state) {
+	case LEDS_DEFSTATE_ON:
+		led_data->cdev.brightness = led->max_brightness;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		{
+		uint64_t brightness;
+
+		brightness = led->max_brightness;
+		brightness *= led_data->pwmstate.duty_cycle;
+		do_div(brightness, led_data->pwmstate.period);
+		led_data->cdev.brightness = brightness;
+		}
+		break;
+	}
 
 	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret) {
@@ -86,11 +119,13 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		return ret;
 	}
 
-	ret = led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
-	if (ret) {
-		dev_err(dev, "failed to set led PWM value for %s: %d",
-			led->name, ret);
-		return ret;
+	if (led->default_state != LEDS_DEFSTATE_KEEP) {
+		ret = led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+		if (ret) {
+			dev_err(dev, "failed to set led PWM value for %s: %d",
+				led->name, ret);
+			return ret;
+		}
 	}
 
 	priv->num_leds++;
@@ -120,6 +155,8 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 		fwnode_property_read_u32(fwnode, "max-brightness",
 					 &led.max_brightness);
 
+		led.default_state = led_init_default_state_get(fwnode);
+
 		ret = led_pwm_add(dev, priv, &led, fwnode);
 		if (ret)
 			goto err_child_out;
-- 
2.25.1

