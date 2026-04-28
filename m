Return-Path: <linux-leds+bounces-7881-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAzNKcqi8GlAWgEAu9opvQ
	(envelope-from <linux-leds+bounces-7881-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 14:06:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A6484889
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 14:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D74E30EAD77
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0883E92A0;
	Tue, 28 Apr 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gpesw2fz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEA3AEF4A
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376391; cv=none; b=kV5TuFTmO4OZQbAMpsZQnApgWiSTdASekZkSXllW5Mv5UOhzOVShj9KYnXnoCPg0Se83svg7YdS4HGuR2wwgC8ACn1SsRAS3JpdiALbYtB0uvJX3dcpqpdwIIKAJv36+Wy/2DWLrIiWKRBZ0zz4eLSGOhMDF3g1tfXNneJRP6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376391; c=relaxed/simple;
	bh=if5fzn6EiYAdYQ0JVkfWJ2iUwqyjky8GCm3SoGv3Ckg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUQrDcq9w9b5Afr6fLXA3J3wQfx0UlQ8XXl2aMPJiNsBYvEk8aS0aeJzhYrTGQoqucJk9t8vXAbNVBmx9DMa/rWdXPXGyVlRPG9uYxeN5WK/JrGLprkklFpH16u16TtEUGL2b16KUhPiGBE1wYkhayOUTNLZIbexvbFqrSOMafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gpesw2fz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so66840845e9.1
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376386; x=1777981186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1tztVTuc1e4/H1fOczCbpXpJF5rF4H8B95UHFGdg+4=;
        b=Gpesw2fzFTKz3Pv8OOpjrTU6vMEMZxzdC62fZuAlAc9+DzxFwLt9EPwtoNR1noA+qj
         ZB8pfS5t/itOop1S15LBigamXHxTgpP+3ciiC6AZXIQ7g4g5D96Jn0n8qLTEih8Iroud
         f4jUkcTDGr5uPw1QBQRZcgOjT9VgfAneFLOcmbsQrJI4vnyPtse4qtLeuxeXQxQVl9Aa
         ENchRSgd+Qfyys+gElBGGpPbASYJaTgd1C2GqorM+NwUVLyCeoYCY4W2h4SzbPYWPyl9
         lyDEm3i7pakwl3ukdAc4BNweUfKoszccRSANmL8ObQXzz+eELFn8HVWZ2pR4YtsXMdMD
         Qv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376386; x=1777981186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1tztVTuc1e4/H1fOczCbpXpJF5rF4H8B95UHFGdg+4=;
        b=R3cICIbhCkYLMIR5bJGrg9/9ezBKqquSyhfW6GOzCX0nG/kpUzu1e0ZbHyd4hGglWT
         nzlTPXXcEqVuGNgh3td8ucSkaL1oIrK463+cOMJCt7KQxAv0IFmx+p3G7pjputyU+67U
         ygYHt4RecXdo5dFQedm4FEMHW3kRJ6ys94SD1XEHdPGXB4vW9OKVyyNDotVi+bSUqETN
         C6Ipl845lCXftmcygBKrl1cQHWiYkEFRHEzcZE4o+g06IRf0ZmXPoKHuT2Vfcoiua45C
         uueZDbrjbFQQdO4JnoAjTuOVhZAfpNxo8aqkgyhkvM7fspekCl7WVRYJmrN1EV8wYB0t
         HzDA==
X-Gm-Message-State: AOJu0YwCF3RL3yQAMGATjaaQEdWit7wlg/IuZh3Fpu/cX7YE31A+qwnO
	V8XeKWFnH/UzvgsYyCiv3SRpGajsa1Bo46e0js2sVZsDeAx2Q6Eo2899
X-Gm-Gg: AeBDieud9B00VD9i8KGrM7vmffw6hEZr5xsBmg7KgAx6ENZD/IV361IO0pycp+Q30zR
	VUzANQKZT54pvsJMwAdauw0g4BUFpfcyEH09yaqZ5dTukM+LUsqulj1prToGvtABDu4BxUjKVGa
	4R3x4M4wuChH9ob55KASy1xOCFfzruk0teafOQA2vuIuFI8j7b7OYJBbuwAadeSymcnRH3Ku3so
	B6kOuX2QHwT53e+P9FNskqEeRkeJ2OfJseZV6NMSz1x/FLce5/QWiTdIsAWFYdhkssm94om3kQg
	hqYQilfYuBpnJhPgN8kHQ8l9f6JrkWasHl/9VGPw3N14BbTQ0+5mpjGENjtO1icK38lXA0bxqdp
	4on0L4ViW+0hEqQRoDb7scbpGaS/meoCzHg5SjdxkA4g9ceKZUQj1BW0O1DleQ3m4+wbdjCMuDz
	86INw/XutO3ic25p/Puyr61KM=
X-Received: by 2002:a05:600c:3e19:b0:48a:569c:abab with SMTP id 5b1f17b1804b1-48a77b12a61mr46745105e9.14.1777376386237;
        Tue, 28 Apr 2026 04:39:46 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:45 -0700 (PDT)
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
Subject: [PATCH v4 4/5] media: i2c: lm3560: Convert to use OF bindings
Date: Tue, 28 Apr 2026 14:39:21 +0300
Message-ID: <20260428113923.112920-5-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 213A6484889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7881-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email]

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.

Converting to Device Tree assumes dynamic and independent registration of
LEDs. To monitor the configured LEDs, a bitmap has been added. This makes
LED cleanup more robust and less context dependent.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 145 ++++++++++++++++++++++++++-----------
 include/media/i2c/lm3560.h |  15 ----
 2 files changed, 102 insertions(+), 58 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5b568ed9536b..1052c11f42e8 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -9,11 +9,14 @@
  *			Ldd-Mlp <ldd-mlp@list.ti.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
@@ -43,22 +46,33 @@ enum led_enable {
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
@@ -269,8 +283,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -295,9 +309,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
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
@@ -339,15 +353,18 @@ static const struct regmap_config lm3560_regmap = {
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
@@ -378,7 +395,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -391,19 +408,23 @@ static int lm3560_init_device(struct lm3560_flash *flash)
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
-	int rval;
+	struct fwnode_handle *node;
+	u32 peak_ua;
+	int rval, reg;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
 	if (flash == NULL)
@@ -415,36 +436,68 @@ static int lm3560_probe(struct i2c_client *client)
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
 
-	rval = lm3560_init_device(flash);
-	if (rval < 0)
-		return rval;
+	bitmap_zero(flash->led_id, LM3560_LED_MAX);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
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
+	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
-	if (rval < 0) {
-		lm3560_subdev_cleanup(flash, LM3560_LED0);
-		return rval;
+	device_for_each_child_node(flash->dev, node) {
+		rval = fwnode_property_read_u32(node, "reg", &reg);
+		if (rval < 0)
+			/* We care only about nodes with reg property */
+			continue;
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
+			if (rval < 0) {
+				fwnode_handle_put(node);
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
@@ -455,12 +508,17 @@ static int lm3560_probe(struct i2c_client *client)
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
@@ -473,6 +531,7 @@ static struct i2c_driver lm3560_i2c_driver = {
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


