Return-Path: <linux-leds+bounces-7957-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAkVCyF892kpiQIAu9opvQ
	(envelope-from <linux-leds+bounces-7957-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 18:47:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD114B6947
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 18:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF995302C6DB
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 16:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A96637FF48;
	Sun,  3 May 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyR0hsTk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2F3CF685
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826712; cv=none; b=b/RY31Wg7LbMb0bd5zd+SLRNxfQQggBT5CSYyua+9/Nhywm0hfy09/asL4ZPnxG3EIqYTTGhlBZW16Se/vs/Til/kxNuSAe6sij2BrPiY6Uc+bCv3JMdPNev0uLylWmDBcq3J0J/ON3HH7h1fbHRuXLKwqTKMrYgvwISisO8bmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826712; c=relaxed/simple;
	bh=i6Hj7U3fS4BqtoSibzAuYpq/vb5ugPkQKLtH35zOVx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4d3y4Y8BzyO1+EAvVcAE4r4woiTi07ph1eZ2XW6pr1IVEtK+2Yv0PaqoFWVMM86sghpfEzZCALXp4Yi/2tLsp74nWC64Wm12ErsqwaZYSH+bC+OZSKJGUveRie68irFJICMR60tmKOZA3gh4WtrzPOrMs8nLVyyqfUbZXjQKK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyR0hsTk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67b7c71c165so3521339a12.0
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826703; x=1778431503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtUh5EYJwmKXAER6m4XzUWsXnZUgq5RskppIOaQaosQ=;
        b=EyR0hsTkLyWd7nU7PyjOg6itw5Ms/Z/FdATDPgt8K9JeMkN68sfxeYOqYr0BxSoxpm
         5CcOetlS7NL+y8PT6Bs3+557dGORNNNv24duxoI73u/3oA5TkWRZ1Ejp08loI2Hri1KO
         D+YpROV/A9S9F8Jge8VOwk+s5RgGWU8VT1K65x05bpoz+VV7o7Pk1xKrRo6QPjWPn2Jc
         1ss2PsSXC+A0uR3CKT2tyioe2n1UXfqdCWPAXNyySy+OyMGLN6IX1oBFJ3vi2/eZh4Oc
         8LI2Gyo8uMdXrzUrHmYsALznWiliSJETMgcczHxHZPamm+8t52vxFLTVaLMX1n+DtTiW
         qxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826703; x=1778431503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EtUh5EYJwmKXAER6m4XzUWsXnZUgq5RskppIOaQaosQ=;
        b=IWbSvSi6f2bKVm6WPHYHFTr0PSf7JsLz/xESRpzF6/iXvFzVAPav5wqJRcQKNGukJu
         /6yz4iYfUW4o1gB7XdEc4Ep0lRrZTea+IrB4ZdRdl2Zp2K3WZKTWY2CgVzZPbZcLUo+u
         0kFFCGe04Uospm9vz1tKz1fNFU4Q+32JcEwhIx/v2W5cjbEh1z8MY55lRwpakhBTBzDe
         qc2qKLEYs9kHSEAqPqLixpsRIW/wBHCM8/gC2RTjHRkmhxXK69Vz0RZ8olmiRMYiY6wj
         qPXrC08yPFiiQSDTiczINkKE27TtHu+72ncE5hGY9eOVKVALt+Arjp+4WqWzysT54RLG
         JmpQ==
X-Gm-Message-State: AOJu0Yw94DeddOHSkNRKsR9jTFR6xK3KCZy1BwdLSaK6KGK0tzIdIAcf
	YvIlftbEJ5brtp8CNjWWJwwEXCCuBVx7KIqZAxwsiFDOmEqndGmoezCk
X-Gm-Gg: AeBDies/2HoGgQRpZJ7jfpfmp/fY+Dtyo3uSrOxT+OYO0Sm/SyndtEAIlkBW14ki/xP
	U502E0PHjhh9S9u/WQSW1hGLCFIOnoTBtuC9Cp+zZwsdzjbI2j1AF6/DQnYzMas+NMTEX8a0yPP
	ZfdMpYZrKvtuw+IQGAU1FvmrRCcGb4/+qN4eK8H1kZ8PgfMn027RdYv8zandR6M4/c78LwVI1K7
	Nm2Mo6n78lPrCIvqYS1taoAKdG1FNrdnyx3RNabJlZBGFUxM9Wnib9QVFrsLA8/7RTi5su+1Dk+
	7d3OC8wLNLZyY9kplSAXU7Ufl8QukR48Foc0pSt0eD9dsfebPBOhK/QfDuiIWpglvLTbwZ036qv
	ObcIpDo/nsOEmQOARL6hxWbriqhJL1AD1owphhExO2bm2t9jDiuYj6w0usByIiZWbPbp2eG8z4+
	BKFtp73voJ3t+qul7NqlbQGMo=
X-Received: by 2002:a17:907:6d13:b0:bad:a28:e09 with SMTP id a640c23a62f3a-bbffe3c7554mr287296966b.41.1777826703105;
        Sun, 03 May 2026 09:45:03 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:45:01 -0700 (PDT)
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
Subject: [PATCH v5 4/6] media: i2c: lm3560: Convert to use OF bindings
Date: Sun,  3 May 2026 19:44:43 +0300
Message-ID: <20260503164445.215540-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7FD114B6947
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
	TAGGED_FROM(0.00)[bounces-7957-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email]

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.

Converting to Device Tree assumes dynamic and independent registration of
LEDs. To monitor the configured LEDs, a bitmap has been added. This makes
LED cleanup more robust and less context dependent.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 143 ++++++++++++++++++++++++++-----------
 include/media/i2c/lm3560.h |  15 ----
 2 files changed, 102 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5b568ed9536b..ce4b09d1f208 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -9,11 +9,15 @@
  *			Ldd-Mlp <ldd-mlp@list.ti.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
@@ -43,22 +47,33 @@ enum led_enable {
  * struct lm3560_flash
  *
  * @dev: pointer to &struct device
- * @pdata: platform data
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
+ * @led_id: LED status holder
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
+	DECLARE_BITMAP(led_id, LM3560_LED_MAX);
+
+	enum lm3560_peak_current peak;
+	u32 max_flash_timeout;
+
+	u32 max_flash_brt[LM3560_LED_MAX];
+	u32 max_torch_brt[LM3560_LED_MAX];
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -269,8 +284,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -295,9 +310,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
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
@@ -339,15 +354,18 @@ static const struct regmap_config lm3560_regmap = {
 };
 
 static int lm3560_subdev_init(struct lm3560_flash *flash,
-			      enum lm3560_led_id led_no, char *led_name)
+			      enum lm3560_led_id led_no,
+			      struct device_node *np)
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
+	flash->subdev_led[led_no].fwnode = of_fwnode_handle(np);
 	rval = lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
@@ -378,7 +396,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -391,18 +409,22 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
-static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
-				  enum lm3560_led_id led_no)
+static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
 {
-	v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
-	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
-	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+	int led_no;
+
+	for_each_set_bit(led_no, flash->led_id, LM3560_LED_MAX) {
+		v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
+		v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+		media_entity_cleanup(&flash->subdev_led[led_no].entity);
+	}
 }
 
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
-	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct device_node *node;
+	u32 peak_ua;
 	int rval;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
@@ -415,36 +437,69 @@ static int lm3560_probe(struct i2c_client *client)
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
 
+	bitmap_zero(flash->led_id, LM3560_LED_MAX);
+
+	flash->peak = LM3560_PEAK_1600mA;
+	rval = device_property_read_u32(flash->dev,
+					"ti,peak-current-microamp", &peak_ua);
+	if (!rval) {
+		switch (peak_ua) {
+		case 1600000:
+			flash->peak = LM3560_PEAK_1600mA;
+			break;
+		case 2300000:
+			flash->peak = LM3560_PEAK_2300mA;
+			break;
+		case 3000000:
+			flash->peak = LM3560_PEAK_3000mA;
+			break;
+		case 3600000:
+			flash->peak = LM3560_PEAK_3600mA;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	flash->max_flash_timeout = LM3560_FLASH_TOUT_MIN * 1000;
+	device_property_read_u32(flash->dev, "flash-max-timeout-us",
+				 &flash->max_flash_timeout);
+	flash->max_flash_timeout /= 1000;
+
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
-	if (rval < 0)
-		return rval;
+	for_each_available_child_of_node(dev_of_node(flash->dev), node) {
+		u32 reg;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
-	if (rval < 0) {
-		lm3560_subdev_cleanup(flash, LM3560_LED0);
-		return rval;
+		rval = of_property_read_u32(node, "reg", &reg);
+		if (rval < 0)
+			/* We care only about nodes with reg property */
+			continue;
+
+		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
+			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			of_property_read_u32(node, "flash-max-microamp",
+					     &flash->max_flash_brt[reg]);
+
+			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			of_property_read_u32(node, "led-max-microamp",
+					     &flash->max_torch_brt[reg]);
+
+			rval = lm3560_subdev_init(flash, reg, node);
+			if (rval < 0) {
+				lm3560_subdev_cleanup(flash);
+				return dev_err_probe(flash->dev, rval,
+						    "failed to register led%d\n",
+						    reg);
+			}
+
+			set_bit(reg, flash->led_id);
+		}
 	}
 
 	i2c_set_clientdata(client, flash);
@@ -455,12 +510,17 @@ static int lm3560_probe(struct i2c_client *client)
 static void lm3560_remove(struct i2c_client *client)
 {
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
-	unsigned int i;
 
-	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++)
-		lm3560_subdev_cleanup(flash, i);
+	lm3560_subdev_cleanup(flash);
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
@@ -473,6 +533,7 @@ static struct i2c_driver lm3560_i2c_driver = {
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


