Return-Path: <linux-leds+bounces-7882-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IH0F5eg8GnrWQEAu9opvQ
	(envelope-from <linux-leds+bounces-7882-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:57:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7729484622
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDC3D3141FEE
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 11:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B703F2112;
	Tue, 28 Apr 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1gzpOYL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934773EF0D3
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376393; cv=none; b=XfPjeWeDeZPmkOfj147QU72o54bOLf8zxtsvBbfGK5RvqG+OrlP9sXYFO+6WBtXIPWf7IJCIjCWLCzc3EMYhuMXpCXr6MMoteU5ZdoYxOnk1fnwPA/ZRhxIX1uqm62ht/QvVx8v2uG6nWEhRmJbTqA+8Eu1USjt2e3A23NkRm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376393; c=relaxed/simple;
	bh=liWseIjFkuXVt4TWv2i3U3BN73xnSKmtLaF9Z6gcVcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeIi5aVs/DmtDY+b1eCaFLCNzTqm6ANk7zhh8RVjx/0yQi796QNFQve7sJTcv0QWPHL3USyuXz0vTvalv0jGSr7v7bpABb7vs/gQZs2oFoZaFf9eJmWrcWkTgprgc8EbbUZHRN49ck3XizlBYm4Rc76UmRM4bHf7HwPJv5R1m+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1gzpOYL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso94085585e9.3
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376388; x=1777981188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iONjqkBbha9vIXYKPOr4JdhI2heccbufxTPWG9w70fs=;
        b=c1gzpOYLEp6OZtxkgha/y4PHz86quAHV0F6O18LwvgydXWjUvzoP2cX2qNKaTZ8HeP
         wCQHpz4z1owhcpvaONdrR+ETgXzgtFjY/823KCboBSXRgqxAftvQRV2itTcigTS0G1os
         XRN7Ta6HhifMDsaRhuR6LcU07cpd6ECRrluucI5sbNSHfeV0hhEl1eVQig54KLDAAZo3
         c13OkUwll9+uA3kyfrfk18Qca7b3FLDPkXBNYy8gN4AIDL05pTVp+QoFb51zir5pJD61
         skZ7a6EXksvKl2X8QL21QOTQdPH+fb24LU7l0ZZRfyhPsEI6P3DgqRQc+1IPK36YeV+L
         7rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376388; x=1777981188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iONjqkBbha9vIXYKPOr4JdhI2heccbufxTPWG9w70fs=;
        b=RZnwa4KtHVmdJFRWO1a3rRfksIPvCfytLUuF9VS7gwfbCG3hdufwcIXomhKDfp1e/b
         nQf0cAgDQkboUQnulq/6qNR3ueusG46EG3cGDahIFI/c0NuhpAaGr+XZn4/Yj4jYg6QJ
         ujAzSZotVR6+fzb54pxDSXvg6527AlPN5uHs1RASaJ7weGwXWJRf93Zt16Q6Ie772bz8
         dIVgXp5j2TC/2bVENWTzGOIH2IvQmLXlH2/HBsmTE6nvcQuFmGMmsIWFls4evHZOJPNv
         y7QcX+mFVXPk2UPVd6FDDjSE7g5NrmpT+bnXIStAXTfqisJWS8RAydTtXByq+/eeHtr+
         VA4w==
X-Gm-Message-State: AOJu0YxcVkR4xhiySaMbIIwrcgBEjZnmW0MoZlCoG/TfuQXWIr5I1PP+
	/yWJhIZCZaAlf2vu7JB/AA0qGZ4U0JcxB7VsIqixmD3DwMmzfN/ECpN8
X-Gm-Gg: AeBDieuqDLESYORgvhGnqp/ySoHorGfaIdwrCOg/DAzhCj47v94hZu313c9ckIgW3kd
	+Cb4pN0QbfqWg/fpxVlJrlwwcdnODFW8FKW0szXKI7dXCDuNrUu67+xmN81Cu5ZSRv7QsVDuyjh
	42Rgh9Jq1UEkE3WS/F6+wdZB0a6QTrDJFXnWWt00oTHzgH/5m46W2gtawALUTYxlMqMepuyWl9e
	xy9p7boG3XiyMmH3l61cGgUalwYwAD5um12tnfjSuBPxTj/M7/6dVyYFmk8M7JEVaDK0mYJrj5e
	374FPnSWz6rVqafoUP6TzovQQNX9gp7bqHYoA4HU/kKhhsGSGfCS37npAPYGNP9QNLangIFjRHr
	Kw77jlrCZ1D59Ap9g8zn4EHboo9R7vo+wGZwfLn7mXuzXwJ5/0AKgQHum4agnBayU8z3kT9QBM0
	G6I0OJwN6VryXGSQOLyPrwHzM=
X-Received: by 2002:a05:600c:8582:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48a77af3ddamr28904405e9.4.1777376387345;
        Tue, 28 Apr 2026 04:39:47 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:46 -0700 (PDT)
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
Subject: [PATCH v4 5/5] media: i2c: lm3560: Add support for PM features
Date: Tue, 28 Apr 2026 14:39:22 +0300
Message-ID: <20260428113923.112920-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7729484622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7882-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add support for power management features to better control the LM3560
within the media framework. To achieve the desired PM support, the HWEN
GPIO and VIN power supply were added and configured into power on/off
sequences. Added PM operations along with the PM configuration setup.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 1052c11f42e8..29f3ee98e0ca 100644
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
 
+	if (!pm_runtime_get_if_in_use(flash->dev))
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
 
+	if (!pm_runtime_get_if_in_use(flash->dev))
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
 
+static int lm3560_power_off(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+
+	return 0;
+}
+
+static int lm3560_power_on(struct device *dev)
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
@@ -441,6 +493,17 @@ static int lm3560_probe(struct i2c_client *client)
 
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
@@ -468,9 +531,19 @@ static int lm3560_probe(struct i2c_client *client)
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
 
 	device_for_each_child_node(flash->dev, node) {
 		rval = fwnode_property_read_u32(node, "reg", &reg);
@@ -490,10 +563,10 @@ static int lm3560_probe(struct i2c_client *client)
 			rval = lm3560_subdev_init(flash, reg, node);
 			if (rval < 0) {
 				fwnode_handle_put(node);
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


