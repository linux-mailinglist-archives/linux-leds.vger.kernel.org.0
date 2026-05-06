Return-Path: <linux-leds+bounces-8017-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM+kF5nk+mmGTgMAu9opvQ
	(envelope-from <linux-leds+bounces-8017-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:50:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 055024D6C6B
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 690EF30260DF
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 06:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E203E36EA88;
	Wed,  6 May 2026 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1yyYBiz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E847036DA04
	for <linux-leds@vger.kernel.org>; Wed,  6 May 2026 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050154; cv=none; b=jTu4oT4+CpjzQoSBeAWP4YdJkwtbu3gPZH1iaZFW8Z5qDvmwpapZWRmm3eONHo2QPCUVE5fPZ3dByoe6IRy/x4nnTbqfz17wiYwF5tOhYZ3xudTjJzWUwDbKbXtGnbRoYUqJ2q7/gU9hkZR4kXafyi84HOBODorbJKfzbRVXENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050154; c=relaxed/simple;
	bh=89540iaVZSqku3rNQPcP/FeBt8NoJGP35+1Y9aLPSUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nU+KJxqAx4M2gnajWKHm3fueuNsifSmw2y8Ml8SmtIWXWSEtrdJ7xsUODsP5UF+EFHmkqjiszYitiR4O6jjxTzl45kuNWbQQCpfhAZXbnuoikMvuQzgOiLfEsFMRPnfcbdlY4UJ9o1OPXSA7dYwEqsDEUGaaC5vx0YNYIfXdKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1yyYBiz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso57791335e9.2
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 23:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050151; x=1778654951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1A33MEOc97LDWAJfo5ET+7oDF3PRcg1aKX3rJdiUA4=;
        b=T1yyYBizbjFa1qUhxJgT3uxyhg91vV5PaRcwt3JpYRu5PyjJ9QNiTf0sFI+3+LCETF
         SN7/czf04i/G6IZ+XFKuUaMLw6ASlZi4og4XRb/SnubourxkaKD2BjLf8AiFszFyWQvV
         iLheH+itIf32DjrSxFVsF/PmItGLk+5zMEhrm3fArCbUi4hDQarDuop4s2yUpiQ/Klt+
         zjpAwMoZr1i0DtZ40XTVmyw4uqau2RXO3MCJraNFlVdPWTT/HUr229xxLeXSRdUfSBBJ
         X+Et1272S5qkzaJ+Lyqg3eu9nnZCdsVExuSeZoNlHc+vEUX55FPDCFRQ95sFs3wUxNmZ
         7YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050151; x=1778654951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1A33MEOc97LDWAJfo5ET+7oDF3PRcg1aKX3rJdiUA4=;
        b=tU4KmYzY2Udm+/FnUGy9K4at9pji9Ys0ZQad9a3sdVSy+yo7/d1738ZF30Q9eSwwHc
         B3ZbKiwPWt9Lda3TZjGttwv9Rz+0NegdOWOg2fJ3FGQVjd7t52+uib9A8j02NagTX3sP
         y6MBeBEmO/iEKhMvq4ckK1R1IZqxAVLa41Gnb3H85rx7sevOTONzMSLjDg91iWPy2O26
         SdKmpL8jE9CBHKEBaIBXXrHaaSQ+sg5ZtUw5Rmb3Fojddv0f5YneXF7LHj/5Aat35+r5
         muND+HkBWKqia8nzYjmgkstTJIWy1F3IbeoKRhopFpsm5zRmPabSNi6Z0hRo9YT0aaAG
         UtgA==
X-Gm-Message-State: AOJu0YyFMS2oP+oQFyOXllk736Yz/orC4p545aDs6cQYS7l3l2MQrp0a
	ru9swjGWl/YSKxEo9h1p5bcMcnIQB4kEtimnORgb0bcYcsNj6P439PBm
X-Gm-Gg: AeBDieuxz4VMOqwVHOMg8KDMFOyANli6Ht+fSZyfyi9rMg/kwiPM0WmbLlfBFfUwyRW
	PeUhTxfmnBtYCcdcg3ZZOj+ogPXl9IH3T/e4pSPWrsEYNy3DWxlTQOduQhKA0ZAU91zVNEogiJs
	tAOtQdx/rehTeom9lzgVN3WtJvPwUDndxykUlBBrGfwW5pZr4LXWZhSdfdaHhNtzIF//Fv94C8Z
	0OiSEVn8IRF2u2hz+VwYs36wTtqaVSglQDB3/y4jnmB+mqrME7MNgc2/0puUvygqPMUZdtumWBK
	d1McDbTVBfKxFvYBQN14YZRaoX0wiXmpgWjrumUVEfJs0JjkbPsJM0XUuwhWZ5vpx+BqwZFln4t
	LTQI6jRC0l5cIN4E+/46rpWPh75GcEhoSDNRXaXVOxEX2I4Vxjf2GdSVyVzv7ZDEHrjV9/tnyqj
	3Ytg/8ze4AqVoLEbf3VY7vZhc=
X-Received: by 2002:a05:600c:3208:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-48e51f46c07mr20345135e9.29.1778050151249;
        Tue, 05 May 2026 23:49:11 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v6 5/6] media: i2c: lm3560: Add support for PM features
Date: Wed,  6 May 2026 09:48:46 +0300
Message-ID: <20260506064847.37795-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506064847.37795-1-clamor95@gmail.com>
References: <20260506064847.37795-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 055024D6C6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8017-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add support for power management features to better control the LM3560
within the media framework. To achieve the desired PM support, the HWEN
GPIO and VIN power supply were added and configured into power on/off
sequences. Added PM operations along with the PM configuration setup.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 609fd0339345..49030bc0f441 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -12,12 +12,15 @@
 #include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
@@ -48,6 +51,8 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
+ * @hwen_gpio: line connected to HWEN pin
+ * @vin_supply: line connected to IN supply (2.5V - 5.5V)
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
@@ -62,6 +67,9 @@ struct lm3560_flash {
 	struct regmap *regmap;
 	struct mutex lock;
 
+	struct gpio_desc *hwen_gpio;
+	struct regulator *vin_supply;
+
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
@@ -176,12 +184,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_active(flash->dev))
+		return 0;
+
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
-		if (rval < 0)
+		if (rval < 0) {
+			pm_runtime_put(flash->dev);
 			return rval;
+		}
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -191,6 +204,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -200,6 +215,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_active(flash->dev))
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -245,6 +263,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -408,6 +428,38 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static int __maybe_unused lm3560_power_off(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+
+	return 0;
+}
+
+static int __maybe_unused lm3560_power_on(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+	int rval;
+
+	rval = regulator_enable(flash->vin_supply);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to enable vin power supply\n");
+		return rval;
+	}
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
+
+	rval = lm3560_init_device(flash);
+	if (rval < 0) {
+		lm3560_power_off(dev);
+		return rval;
+	}
+
+	return 0;
+}
+
 static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
 {
 	int led_no;
@@ -440,6 +492,17 @@ static int lm3560_probe(struct i2c_client *client)
 
 	bitmap_zero(flash->led_id, LM3560_LED_MAX);
 
+	flash->hwen_gpio = devm_gpiod_get_optional(flash->dev, "enable",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(flash->hwen_gpio))
+		return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gpio),
+				     "failed to get hwen gpio\n");
+
+	flash->vin_supply = devm_regulator_get(flash->dev, "vin");
+	if (IS_ERR(flash->vin_supply))
+		return dev_err_probe(flash->dev, PTR_ERR(flash->vin_supply),
+				     "failed to get vin-supply\n");
+
 	flash->peak = LM3560_PEAK_1600mA;
 	rval = device_property_read_u32(flash->dev,
 					"ti,peak-current-microamp", &peak_ua);
@@ -467,9 +530,19 @@ static int lm3560_probe(struct i2c_client *client)
 				 &flash->max_flash_timeout);
 	flash->max_flash_timeout /= 1000;
 
+	rval = regulator_enable(flash->vin_supply);
+	if (rval < 0)
+		return dev_err_probe(flash->dev, rval,
+				     "failed to enable vin power supply\n");
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
+
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
-		return rval;
+		goto error_disable;
+
+	pm_runtime_set_active(flash->dev);
+	pm_runtime_enable(flash->dev);
 
 	device_for_each_child_node_scoped(flash->dev, node) {
 		u32 reg;
@@ -490,10 +563,10 @@ static int lm3560_probe(struct i2c_client *client)
 
 			rval = lm3560_subdev_init(flash, reg, node);
 			if (rval < 0) {
-				lm3560_subdev_cleanup(flash);
-				return dev_err_probe(flash->dev, rval,
-						    "failed to register led%d\n",
-						    reg);
+				dev_err(flash->dev,
+					"failed to register led%d: %d\n",
+					reg, rval);
+				goto error_clean;
 			}
 
 			set_bit(reg, flash->led_id);
@@ -502,7 +575,23 @@ static int lm3560_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, flash);
 
+	pm_runtime_set_autosuspend_delay(flash->dev, 1000);
+	pm_runtime_use_autosuspend(flash->dev);
+	pm_runtime_idle(flash->dev);
+
 	return 0;
+
+error_clean:
+	pm_runtime_disable(flash->dev);
+	pm_runtime_set_suspended(flash->dev);
+
+	lm3560_subdev_cleanup(flash);
+
+error_disable:
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+
+	return rval;
 }
 
 static void lm3560_remove(struct i2c_client *client)
@@ -510,8 +599,22 @@ static void lm3560_remove(struct i2c_client *client)
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
 
 	lm3560_subdev_cleanup(flash);
+
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		lm3560_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
+static const struct dev_pm_ops lm3560_pm_ops = {
+	SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
+};
+
 static const struct of_device_id lm3560_of_match[] = {
 	{ .compatible = "ti,lm3559" },
 	{ .compatible = "ti,lm3560" },
@@ -530,7 +633,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
 static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
-		   .pm = NULL,
+		   .pm = pm_ptr(&lm3560_pm_ops),
 		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
-- 
2.51.0


