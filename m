Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F198F5716C4
	for <lists+linux-leds@lfdr.de>; Tue, 12 Jul 2022 12:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbiGLKJ5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Jul 2022 06:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiGLKJj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jul 2022 06:09:39 -0400
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CEAAB7F4;
        Tue, 12 Jul 2022 03:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1657620556; bh=bMVLpwURCtdlyJQbXLVquIPfxhhkdqs2u0k3NUi8+U8=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        b=UNWcU0kGATPp65bVS1YXuSNWIpf2fuSGmNtFp+N/dxhbEWxiboZCcbyMVdm7/YLyJ
         nqzIZEge7GitHZU5nyukzmmFTeVChMsubmXeLAaLzbsB1qA4WUFstpjGBmLfu6k0m/
         Okm/sQQW83yXRy3qiECpFsBe6R9/Fhb2ebSL1iGE=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via [213.182.55.207]
        Tue, 12 Jul 2022 12:09:16 +0200 (CEST)
X-EA-Auth: BFeD1CU2ySu5iUPhCd6/rNPySwQZq0NUQwp80ty+NRfqUe1Xf6OkZbJNq7XpfUGedf5GtN9DM/Jb7tQ4vvvwNgorElPXTyoc/X0JI7W8iXk=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        hns@goldelico.com
Subject: [PATCH v5 06/12] leds: is31fl319x: Add support for is31fl319{0,1,3} chips
Date:   Tue, 12 Jul 2022 12:08:32 +0200
Message-Id: <20220712100841.1538395-7-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220712100841.1538395-1-vincent.knecht@mailoo.org>
References: <20220712100841.1538395-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Set specific chipset structs values for is31fl319{0,1,3}
so that those chips can actually work.
Datasheets:
https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf
https://lumissil.com/assets/pdf/core/IS31FL3191_DS.pdf
https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
v4:
  - keep container_of() call on one line
  - remove dev_dbg() call after regmap_read()
  - change is31fl3190_microamp_to_cs() to return directly
    from the default case
  - fix non-standard place for comment
  - add missing space before }
---
 drivers/leds/leds-is31fl319x.c | 161 ++++++++++++++++++++++++++++++---
 1 file changed, 147 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index fe0cb68b583b..2314922bc009 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -21,6 +21,31 @@
 
 /* register numbers */
 #define IS31FL319X_SHUTDOWN		0x00
+
+/* registers for 3190, 3191 and 3193 */
+#define IS31FL3190_BREATHING		0x01
+#define IS31FL3190_LEDMODE		0x02
+#define IS31FL3190_CURRENT		0x03
+#define IS31FL3190_PWM(channel)		(0x04 + channel)
+#define IS31FL3190_DATA_UPDATE		0x07
+#define IS31FL3190_T0(channel)		(0x0a + channel)
+#define IS31FL3190_T1T2(channel)	(0x10 + channel)
+#define IS31FL3190_T3T4(channel)	(0x16 + channel)
+#define IS31FL3190_TIME_UPDATE		0x1c
+#define IS31FL3190_LEDCONTROL		0x1d
+#define IS31FL3190_RESET		0x2f
+
+#define IS31FL3190_CURRENT_uA_MIN	5000
+#define IS31FL3190_CURRENT_uA_DEFAULT	42000
+#define IS31FL3190_CURRENT_uA_MAX	42000
+#define IS31FL3190_CURRENT_MASK		GENMASK(4, 2)
+#define IS31FL3190_CURRENT_5_mA		0x02
+#define IS31FL3190_CURRENT_10_mA	0x01
+#define IS31FL3190_CURRENT_17dot5_mA	0x04
+#define IS31FL3190_CURRENT_30_mA	0x03
+#define IS31FL3190_CURRENT_42_mA	0x00
+
+/* registers for 3196 and 3199 */
 #define IS31FL3196_CTRL1		0x01
 #define IS31FL3196_CTRL2		0x02
 #define IS31FL3196_CONFIG1		0x03
@@ -93,6 +118,38 @@ static bool is31fl319x_readable_reg(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool is31fl3190_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* volatile registers are not cached */
+	switch (reg) {
+	case IS31FL3190_DATA_UPDATE:
+	case IS31FL3190_TIME_UPDATE:
+	case IS31FL3190_RESET:
+		return true; /* always write-through */
+	default:
+		return false;
+	}
+}
+
+static const struct reg_default is31fl3190_reg_defaults[] = {
+	{ IS31FL3190_LEDMODE, 0x00 },
+	{ IS31FL3190_CURRENT, 0x00 },
+	{ IS31FL3190_PWM(0), 0x00 },
+	{ IS31FL3190_PWM(1), 0x00 },
+	{ IS31FL3190_PWM(2), 0x00 },
+};
+
+static struct regmap_config is31fl3190_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = IS31FL3190_RESET,
+	.cache_type = REGCACHE_FLAT,
+	.readable_reg = is31fl319x_readable_reg,
+	.volatile_reg = is31fl3190_volatile_reg,
+	.reg_defaults = is31fl3190_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(is31fl3190_reg_defaults),
+};
+
 static bool is31fl3196_volatile_reg(struct device *dev, unsigned int reg)
 {
 	/* volatile registers are not cached */
@@ -131,6 +188,60 @@ static struct regmap_config is31fl3196_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(is31fl3196_reg_defaults),
 };
 
+static int is31fl3190_brightness_set(struct led_classdev *cdev,
+				     enum led_brightness brightness)
+{
+	struct is31fl319x_led *led = container_of(cdev, struct is31fl319x_led, cdev);
+	struct is31fl319x_chip *is31 = led->chip;
+	int chan = led - is31->leds;
+	int ret;
+	int i;
+	u8 ctrl = 0;
+
+	dev_dbg(&is31->client->dev, "%s %d: %d\n", __func__, chan, brightness);
+
+	mutex_lock(&is31->lock);
+
+	/* update PWM register */
+	ret = regmap_write(is31->regmap, IS31FL3190_PWM(chan), brightness);
+	if (ret < 0)
+		goto out;
+
+	/* read current brightness of all PWM channels */
+	for (i = 0; i < is31->cdef->num_leds; i++) {
+		unsigned int pwm_value;
+		bool on;
+
+		/*
+		 * since neither cdev nor the chip can provide
+		 * the current setting, we read from the regmap cache
+		 */
+
+		ret = regmap_read(is31->regmap, IS31FL3190_PWM(i), &pwm_value);
+		on = ret >= 0 && pwm_value > LED_OFF;
+
+		ctrl |= on << i;
+	}
+
+	if (ctrl > 0) {
+		dev_dbg(&is31->client->dev, "power up %02x\n", ctrl);
+		regmap_write(is31->regmap, IS31FL3190_LEDCONTROL, ctrl);
+		/* update PWMs */
+		regmap_write(is31->regmap, IS31FL3190_DATA_UPDATE, 0x00);
+		/* enable chip from shut down and enable all channels */
+		ret = regmap_write(is31->regmap, IS31FL319X_SHUTDOWN, 0x20);
+	} else {
+		dev_dbg(&is31->client->dev, "power down\n");
+		/* shut down (no need to clear LEDCONTROL) */
+		ret = regmap_write(is31->regmap, IS31FL319X_SHUTDOWN, 0x01);
+	}
+
+out:
+	mutex_unlock(&is31->lock);
+
+	return ret;
+}
+
 static int is31fl3196_brightness_set(struct led_classdev *cdev,
 				     enum led_brightness brightness)
 {
@@ -197,24 +308,24 @@ static int is31fl3196_brightness_set(struct led_classdev *cdev,
 
 static const struct is31fl319x_chipdef is31fl3190_cdef = {
 	.num_leds = 1,
-	.reset_reg = IS31FL3196_RESET,
-	.is31fl319x_regmap_config = &is31fl3196_regmap_config,
-	.brightness_set = is31fl3196_brightness_set,
-	.current_default = IS31FL3196_CURRENT_uA_DEFAULT,
-	.current_min = IS31FL3196_CURRENT_uA_MIN,
-	.current_max = IS31FL3196_CURRENT_uA_MAX,
-	.is_3196or3199 = true,
+	.reset_reg = IS31FL3190_RESET,
+	.is31fl319x_regmap_config = &is31fl3190_regmap_config,
+	.brightness_set = is31fl3190_brightness_set,
+	.current_default = IS31FL3190_CURRENT_uA_DEFAULT,
+	.current_min = IS31FL3190_CURRENT_uA_MIN,
+	.current_max = IS31FL3190_CURRENT_uA_MAX,
+	.is_3196or3199 = false,
 };
 
 static const struct is31fl319x_chipdef is31fl3193_cdef = {
 	.num_leds = 3,
-	.reset_reg = IS31FL3196_RESET,
-	.is31fl319x_regmap_config = &is31fl3196_regmap_config,
-	.brightness_set = is31fl3196_brightness_set,
-	.current_default = IS31FL3196_CURRENT_uA_DEFAULT,
-	.current_min = IS31FL3196_CURRENT_uA_MIN,
-	.current_max = IS31FL3196_CURRENT_uA_MAX,
-	.is_3196or3199 = true,
+	.reset_reg = IS31FL3190_RESET,
+	.is31fl319x_regmap_config = &is31fl3190_regmap_config,
+	.brightness_set = is31fl3190_brightness_set,
+	.current_default = IS31FL3190_CURRENT_uA_DEFAULT,
+	.current_min = IS31FL3190_CURRENT_uA_MIN,
+	.current_max = IS31FL3190_CURRENT_uA_MAX,
+	.is_3196or3199 = false,
 };
 
 static const struct is31fl319x_chipdef is31fl3196_cdef = {
@@ -362,6 +473,25 @@ static int is31fl319x_parse_dt(struct device *dev,
 	return ret;
 }
 
+static inline int is31fl3190_microamp_to_cs(struct device *dev, u32 microamp)
+{
+	switch (microamp) {
+	case 5000:
+		return IS31FL3190_CURRENT_5_mA;
+	case 10000:
+		return IS31FL3190_CURRENT_10_mA;
+	case 17500:
+		return IS31FL3190_CURRENT_17dot5_mA;
+	case 30000:
+		return IS31FL3190_CURRENT_30_mA;
+	case 42000:
+		return IS31FL3190_CURRENT_42_mA;
+	default:
+		dev_warn(dev, "Unsupported current value: %d, using 5000 µA!\n", microamp);
+		return IS31FL3190_CURRENT_5_mA;
+	}
+}
+
 static inline int is31fl3196_microamp_to_cs(struct device *dev, u32 microamp)
 { /* round down to nearest supported value (range check done by caller) */
 	u32 step = microamp / IS31FL3196_CURRENT_uA_STEP;
@@ -438,6 +568,9 @@ static int is31fl319x_probe(struct i2c_client *client,
 		regmap_write(is31->regmap, IS31FL3196_CONFIG2,
 			     is31fl3196_microamp_to_cs(dev, aggregated_led_microamp) |
 			     is31fl3196_db_to_gain(is31->audio_gain_db));
+	else
+		regmap_update_bits(is31->regmap, IS31FL3190_CURRENT, IS31FL3190_CURRENT_MASK,
+				   is31fl3190_microamp_to_cs(dev, aggregated_led_microamp));
 
 	for (i = 0; i < is31->cdef->num_leds; i++) {
 		struct is31fl319x_led *led = &is31->leds[i];
-- 
2.35.3



