Return-Path: <linux-leds+bounces-7774-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDSnM36i5GmUXgEAu9opvQ
	(envelope-from <linux-leds+bounces-7774-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 11:38:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 559294238A8
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 11:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF7863043AEA
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 09:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9019937DEA5;
	Sun, 19 Apr 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKYD7h5t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE4A37C118
	for <linux-leds@vger.kernel.org>; Sun, 19 Apr 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591283; cv=none; b=FoNe2+4o92Xq2j9WyuI9iOKVpcrsp8O2NSCPkgBKW+51F3SCPkw3e7Y/ygdhhVxPJ+0jWCjXIuWWJVwP+jhQs2zfDFmBH7goKZH+V1RHJ/HJQIPLrI5fRjkt2e2mtYiXB7q9R4kLnEvoKmkQPA1kRcxZ9v8a0lwNooT4XEwmoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591283; c=relaxed/simple;
	bh=AaqElH9zuTNCv1HJ0+GB1hU2qCY3xf1+6Kn/cjf0+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIZILibTCPLcR+WIW0ypI+0BqrASS7LJUu/lrXtR6GgMdhHbm6l0arSu7Gk5AuF66z4FohO4IndpRtuBUQgvt0J2IqMK25yLz/ga3b9jbvXJZWKzJUXR+QH/hmpdHLOH6p6zI3q8aVDEVAbg50uwuVOyu5Bd4nW/FcRqDxnP4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKYD7h5t; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so2131087e87.3
        for <linux-leds@vger.kernel.org>; Sun, 19 Apr 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591280; x=1777196080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaoyCyrMENabXEPbF12o+TCRZ1+bwFFYGgCjy5VoZDY=;
        b=KKYD7h5txO1H9kd7zkSNSeEt91dMvR7KBLUVn8I8MLa7b1Ocb5jD6BJp0neDROBHie
         DNVmlPyzk4s4WESUYGuBE9HUIsIdmoegC+A8ywALAQFmdE77V7CTy3ukzXSQPBJwchQ8
         qSTUVlLeXTmGdMD0r+di7eIIYqWF/DSVbzOTwDOmzDrIXE8lrdZqUye2mr0xApYnuRo/
         KfdkCZGg05GKRN4RXif6K/v7umPGVZ3J9M5RFDAPl2os0P8pvywVGppNcAUwP+2+kaTh
         QPS9drRFjcmrir0I56tFSV29uXlYNckP5c1IwPHfHCs2KRPK/jwizJd5qi+0oLCVVmYH
         p2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591280; x=1777196080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaoyCyrMENabXEPbF12o+TCRZ1+bwFFYGgCjy5VoZDY=;
        b=K3kFgzPtQ5MovDjT9S1YhbOqKqwSYyhMms3KqT/hR+TZl6FoilHWQHGClXKjL01NbL
         C28whElFa5mENbFozKvbEeuOEJyCrBQ1lTsPZg1IKJZ2lwZHLQeLl+5yd/jIg5L5mks/
         zIwPqsRzfzfwYp23T+gPGhh0rza3jrGkXvYrNz7BwzVZdudytzEDsCK+n2qAl5BPHwIa
         FGW8hneco588wWH/9NRCMBU12xGHEwcIwFfA1HA8RmbaXTvnlR0m/5B4fzzZyWbwG49n
         x2cP9XzGYBKAhpY2kLz/CWUhhWXEEF98c5lThSAd4vdPI6EM2VbltuGzc6HvJaYwhLQS
         evNw==
X-Gm-Message-State: AOJu0Yw6pHYMTe+XeqnubeoGUHmVEX64X10CrotuQR1MZAWTttj+ZT2T
	LCvcl5YwaC9m3cbNNUYCua6kPlwK3S0ZLptUm3qw7V+RvZbr9dTgO1dFBqZh+I80
X-Gm-Gg: AeBDievv5eTX6y4bEmi9H9k1y6q9CydZ935le08xpfOv3wdSjBeX+mpBP8cLlM5cwp3
	kPNGvqMspSpsYm97f5xm7BgMKvFp+yeOWfS2l9tPcbGaVZPift4OogHXcGa/o0ik9g/EcEmPdMU
	FfwUGRAQ9tkviMNuLqxelUTwTKC/UWjFHqt55K/CV0w1IL9MIPSabB/23iCTN8afqirr5hxsmYa
	rzmNa5pSJSbRnZLCWluedd0XONpoCDNMe36AJwcrcSHpuTGYix9kwXU6Dj0UnaHV1gYodk6rvgK
	l4dhL+2qXl3C9Bmy330vBXchBpkWYxkDAZrY7XKwT6bwXdoBiooTgW9jMlqNzKLAkuiR569ZnF6
	TPN7yKjzPAuh5p8aHFoTzSc6iil4w/tphmwCuNkcTsw2qfiuMevowGBd1DJl2Ott4LoKo72SEFj
	eLBWwd1qbemMek6AWQnAP9/9wA9oUXjXcJOA==
X-Received: by 2002:a05:6512:39cc:b0:5a4:ab6:81ac with SMTP id 2adb3069b0e04-5a417302144mr3422597e87.34.1776591279593;
        Sun, 19 Apr 2026 02:34:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:38 -0700 (PDT)
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
Subject: [PATCH v2 4/5] media: i2c: lm3560: Convert to use OF bindings
Date: Sun, 19 Apr 2026 12:34:11 +0300
Message-ID: <20260419093412.40796-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7774-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 559294238A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since there are no users of this driver via platform data, remove platform
data and switch to using device tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 112 ++++++++++++++++++++++++++-----------
 include/media/i2c/lm3560.h |  15 -----
 2 files changed, 79 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5cd22c2fbb64..022a6a76befb 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -13,7 +13,9 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
@@ -43,22 +45,30 @@ enum led_enable {
  * struct lm3560_flash
  *
  * @dev: pointer to &struct device
- * @pdata: platform data
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
+ * @peak: peak current
+ * @max_flash_timeout: flash timeout
+ * @max_flash_brt: flash mode led brightness
+ * @max_torch_brt: torch mode led brightness
  */
 struct lm3560_flash {
 	struct device *dev;
-	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
+
+	enum lm3560_peak_current peak;
+	u32 max_flash_timeout;
+
+	u32 max_flash_brt[LM3560_LED_MAX];
+	u32 max_torch_brt[LM3560_LED_MAX];
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -269,8 +279,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -295,9 +305,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	/* flash strobe timeout */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
 			  LM3560_FLASH_TOUT_MIN,
-			  flash->pdata->max_flash_timeout,
+			  flash->max_flash_timeout,
 			  LM3560_FLASH_TOUT_STEP,
-			  flash->pdata->max_flash_timeout);
+			  flash->max_flash_timeout);
 
 	/* flash brt */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
@@ -339,15 +349,18 @@ static const struct regmap_config lm3560_regmap = {
 };
 
 static int lm3560_subdev_init(struct lm3560_flash *flash,
-			      enum lm3560_led_id led_no, char *led_name)
+			      enum lm3560_led_id led_no,
+			      struct fwnode_handle *fwnode)
 {
 	struct i2c_client *client = to_i2c_client(flash->dev);
 	int rval;
 
 	v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3560_ops);
 	flash->subdev_led[led_no].flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(flash->subdev_led[led_no].name, led_name,
-		sizeof(flash->subdev_led[led_no].name));
+	snprintf(flash->subdev_led[led_no].name,
+		 sizeof(flash->subdev_led[led_no].name),
+		 "lm3560-led%d", led_no);
+	flash->subdev_led[led_no].fwnode = fwnode;
 	rval = lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
@@ -377,7 +390,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -393,8 +406,9 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
-	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
-	int rval;
+	struct fwnode_handle *node;
+	u32 peak_ua;
+	int rval, reg;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
 	if (flash == NULL)
@@ -406,36 +420,60 @@ static int lm3560_probe(struct i2c_client *client)
 		return rval;
 	}
 
-	/* if there is no platform data, use chip default value */
-	if (pdata == NULL) {
-		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-		if (pdata == NULL)
-			return -ENODEV;
-		pdata->peak = LM3560_PEAK_3600mA;
-		pdata->max_flash_timeout = LM3560_FLASH_TOUT_MAX;
-		/* led 1 */
-		pdata->max_flash_brt[LM3560_LED0] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED0] = LM3560_TORCH_BRT_MAX;
-		/* led 2 */
-		pdata->max_flash_brt[LM3560_LED1] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED1] = LM3560_TORCH_BRT_MAX;
-	}
-	flash->pdata = pdata;
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
-	if (rval < 0)
-		return rval;
+	flash->peak = LM3560_PEAK_1600mA;
+	rval = device_property_read_u32(flash->dev,
+					"ti,peak-current-microamp", &peak_ua);
+	if (!rval) {
+		switch (peak_ua) {
+		case 16000000:
+			flash->peak = LM3560_PEAK_1600mA;
+			break;
+		case 23000000:
+			flash->peak = LM3560_PEAK_2300mA;
+			break;
+		case 30000000:
+			flash->peak = LM3560_PEAK_3000mA;
+			break;
+		case 36000000:
+			flash->peak = LM3560_PEAK_3600mA;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
-	if (rval < 0)
-		return rval;
+	flash->max_flash_timeout = LM3560_FLASH_TOUT_MIN * 1000;
+	device_property_read_u32(flash->dev, "flash-max-timeout-us",
+				 &flash->max_flash_timeout);
+	flash->max_flash_timeout /= 1000;
 
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
+	device_for_each_child_node(flash->dev, node) {
+		fwnode_property_read_u32(node, "reg", &reg);
+
+		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
+			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			fwnode_property_read_u32(node, "flash-max-microamp",
+						 &flash->max_flash_brt[reg]);
+
+			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			fwnode_property_read_u32(node, "led-max-microamp",
+						 &flash->max_torch_brt[reg]);
+
+			rval = lm3560_subdev_init(flash, reg, node);
+			if (rval < 0)
+				return dev_err_probe(flash->dev, rval,
+						    "failed to register led%d\n",
+						    reg);
+		}
+	}
+
 	i2c_set_clientdata(client, flash);
 
 	return 0;
@@ -453,6 +491,13 @@ static void lm3560_remove(struct i2c_client *client)
 	}
 }
 
+static const struct of_device_id lm3560_of_match[] = {
+	{ .compatible = "ti,lm3559" },
+	{ .compatible = "ti,lm3560" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3560_of_match);
+
 static const struct i2c_device_id lm3560_id_table[] = {
 	{ LM3559_NAME },
 	{ LM3560_NAME },
@@ -465,6 +510,7 @@ static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
 		   .pm = NULL,
+		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
 	.remove = lm3560_remove,
diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
index 770d8c72c94a..b56c1ff8fd49 100644
--- a/include/media/i2c/lm3560.h
+++ b/include/media/i2c/lm3560.h
@@ -66,19 +66,4 @@ enum lm3560_peak_current {
 	LM3560_PEAK_3600mA = 0x60
 };
 
-/* struct lm3560_platform_data
- *
- * @peak :  peak current
- * @max_flash_timeout: flash timeout
- * @max_flash_brt: flash mode led brightness
- * @max_torch_brt: torch mode led brightness
- */
-struct lm3560_platform_data {
-	enum lm3560_peak_current peak;
-
-	u32 max_flash_timeout;
-	u32 max_flash_brt[LM3560_LED_MAX];
-	u32 max_torch_brt[LM3560_LED_MAX];
-};
-
 #endif /* __LM3560_H__ */
-- 
2.51.0


