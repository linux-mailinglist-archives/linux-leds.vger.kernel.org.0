Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932AA6C5031
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjCVQKN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjCVQKB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:10:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C044DE20;
        Wed, 22 Mar 2023 09:09:59 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFD511AE7;
        Wed, 22 Mar 2023 17:09:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501386;
        bh=5O8A7MyJYloFejDLmqIUwe4p0b0RhtgGmZc5Wdz/hQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fRCYvyuYIneMBgZ+OyYir5MJASaL8XSpN+v80odf1YBc85WKKRDxf+ICQx1iEDOiD
         GgHFNMw332TjJiRBQvuk/RBkfcZnTeOiEAJZmj2ui15tEVqhUiXyZWGsakepvggNzr
         PXipy+mvcnfIur/mQhvMphOuzF7gYICv//XDg+xo=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 6/8] leds: tps68470: Support the WLED driver
Date:   Wed, 22 Mar 2023 16:09:24 +0000
Message-Id: <20230322160926.948687-7-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322160926.948687-1-dan.scally@ideasonboard.com>
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The TPS68470 PMIC provides a third LED driver in addition to the two
indicator LEDs. Add support for the WLED. To ensure the LED is active
for as long as the kernel instructs it to be we need to re-trigger it
periodically to avoid the IC's internal timeouts.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/leds/leds-tps68470.c | 102 ++++++++++++++++++++++++++++++++++-
 include/linux/mfd/tps68470.h |  12 +++++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
index 44df175d25de..abcd3494b1a8 100644
--- a/drivers/leds/leds-tps68470.c
+++ b/drivers/leds/leds-tps68470.c
@@ -8,6 +8,7 @@
  *	Kate Hsuan <hpa@redhat.com>
  */
 
+#include <linux/clk.h>
 #include <linux/leds.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/module.h>
@@ -15,7 +16,10 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/workqueue.h>
 
+#define work_to_led(work) \
+	container_of(work, struct tps68470_led, keepalive_work)
 
 #define lcdev_to_led(led_cdev) \
 	container_of(led_cdev, struct tps68470_led, lcdev)
@@ -26,20 +30,25 @@
 enum tps68470_led_ids {
 	TPS68470_ILED_A,
 	TPS68470_ILED_B,
+	TPS68470_WLED,
 	TPS68470_NUM_LEDS
 };
 
 static const char *tps68470_led_names[] = {
 	[TPS68470_ILED_A] = "tps68470-iled_a",
 	[TPS68470_ILED_B] = "tps68470-iled_b",
+	[TPS68470_WLED] = "tps68470-wled",
 };
 
 struct tps68470_led {
 	unsigned int led_id;
 	struct led_classdev lcdev;
+	enum led_brightness state;
+	struct work_struct keepalive_work;
 };
 
 struct tps68470_device {
+	struct clk *clk;
 	struct device *dev;
 	struct regmap *regmap;
 	struct tps68470_led leds[TPS68470_NUM_LEDS];
@@ -52,11 +61,33 @@ enum ctrlb_current {
 	CTRLB_16MA	= 3,
 };
 
+/*
+ * The WLED can operate in different modes, including a Flash and Torch mode. In
+ * each mode there's a timeout which ranges from a matter of milliseconds to up
+ * to 13 seconds. We don't want that timeout to apply though because the LED
+ * should be lit until we say that it should no longer be lit, re-trigger the
+ * LED periodically to keep it alive.
+ */
+static void tps68470_wled_keepalive_work(struct work_struct *work)
+{
+	struct tps68470_device *tps68470;
+	struct tps68470_led *led;
+
+	led = work_to_led(work);
+	tps68470 = led_to_tps68470(led, led->led_id);
+
+	regmap_update_bits_async(tps68470->regmap, TPS68470_REG_WLEDCTL,
+				 TPS68470_WLED_CTL_MASK, TPS68470_WLED_CTL_MASK);
+	schedule_work(&led->keepalive_work);
+}
+
 static int tps68470_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
 {
 	struct tps68470_led *led = lcdev_to_led(led_cdev);
 	struct tps68470_device *tps68470 = led_to_tps68470(led, led->led_id);
 	struct regmap *regmap = tps68470->regmap;
+	const char *errmsg;
+	int ret;
 
 	switch (led->led_id) {
 	case TPS68470_ILED_A:
@@ -65,8 +96,59 @@ static int tps68470_brightness_set(struct led_classdev *led_cdev, enum led_brigh
 	case TPS68470_ILED_B:
 		return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_ENB,
 					  brightness ? TPS68470_ILEDCTL_ENB : 0);
+	case TPS68470_WLED:
+		/*
+		 * LED core does not prevent re-setting brightness to its current
+		 * value; we need to do so here to avoid unbalanced calls to clk
+		 * enable/disable.
+		 */
+		if (led->state == brightness)
+			return 0;
+
+		if (brightness) {
+			schedule_work(&led->keepalive_work);
+
+			ret = clk_prepare_enable(tps68470->clk);
+			if (ret) {
+				errmsg = "failed to start clock\n";
+				goto err_cancel_work;
+			}
+		} else {
+			cancel_work_sync(&led->keepalive_work);
+			clk_disable_unprepare(tps68470->clk);
+		}
+
+		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
+					 TPS68470_WLED_EN_MASK,
+					 brightness ? TPS68470_WLED_EN_MASK :
+						      ~TPS68470_WLED_EN_MASK);
+		if (ret) {
+			errmsg = "failed to set WLED EN\n";
+			goto err_disable_clk;
+		}
+
+		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
+					 TPS68470_WLED_CTL_MASK,
+					 brightness ? TPS68470_WLED_CTL_MASK :
+						      ~TPS68470_WLED_CTL_MASK);
+		if (ret) {
+			errmsg = "failed to set WLED START\n";
+			goto err_disable_clk;
+		}
+
+		led->state = brightness;
+		break;
+	default:
+		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
 	}
-	return -EINVAL;
+
+	return ret;
+
+err_disable_clk:
+	clk_disable_unprepare(tps68470->clk);
+err_cancel_work:
+	cancel_work_sync(&led->keepalive_work);
+	return dev_err_probe(tps68470->dev, ret, errmsg);
 }
 
 static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
@@ -88,6 +170,14 @@ static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev
 		value &= led->led_id == TPS68470_ILED_A ? TPS68470_ILEDCTL_ENA :
 					TPS68470_ILEDCTL_ENB;
 		break;
+	case TPS68470_WLED:
+		ret = regmap_read(regmap, TPS68470_REG_WLEDCTL, &value);
+		if (ret)
+			return dev_err_probe(led_cdev->dev, ret,
+					     "failed to read LED status\n");
+
+		value &= TPS68470_WLED_CTL_MASK;
+		break;
 	default:
 		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
 	}
@@ -177,6 +267,11 @@ static int tps68470_leds_probe(struct platform_device *pdev)
 	tps68470->dev = &pdev->dev;
 	tps68470->regmap = dev_get_drvdata(pdev->dev.parent);
 
+	tps68470->clk = devm_clk_get(tps68470->dev, NULL);
+	if (IS_ERR(tps68470->clk))
+		return dev_err_probe(tps68470->dev, PTR_ERR(tps68470->clk),
+				     "failed to get clock\n");
+
 	for (i = 0; i < TPS68470_NUM_LEDS; i++) {
 		led = &tps68470->leds[i];
 		lcdev = &led->lcdev;
@@ -206,6 +301,11 @@ static int tps68470_leds_probe(struct platform_device *pdev)
 			if (ret)
 				goto err_exit;
 		}
+
+		if (led->led_id == TPS68470_WLED) {
+			INIT_WORK(&led->keepalive_work,
+				  tps68470_wled_keepalive_work);
+		}
 	}
 
 	ret = tps68470_leds_init(tps68470);
diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index 2d2abb25b944..103ff730e028 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -35,6 +35,11 @@
 #define TPS68470_REG_GPDI		0x26
 #define TPS68470_REG_GPDO		0x27
 #define TPS68470_REG_ILEDCTL		0x28
+#define TPS68470_REG_WLEDMAXF		0x2F
+#define TPS68470_REG_WLEDTO		0x30
+#define TPS68470_REG_WLEDC1		0x34
+#define TPS68470_REG_WLEDC2		0x35
+#define TPS68470_REG_WLEDCTL		0x36
 #define TPS68470_REG_VCMVAL		0x3C
 #define TPS68470_REG_VAUX1VAL		0x3D
 #define TPS68470_REG_VAUX2VAL		0x3E
@@ -98,5 +103,12 @@
 #define TPS68470_ILEDCTL_ENA		BIT(2)
 #define TPS68470_ILEDCTL_ENB		BIT(6)
 #define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
+#define TPS68470_WLEDMAXF_MAX_CUR_MASK	GENMASK(4, 0)
+#define TPS68470_WLEDC_ILED_MASK	GENMASK(4, 0)
+#define TPS68470_WLED_MODE_MASK		GENMASK(1, 0)
+#define TPS68470_WLED_EN_MASK		BIT(2)
+#define TPS68470_WLED_DISLED1		BIT(3)
+#define TPS68470_WLED_DISLED2		BIT(4)
+#define TPS68470_WLED_CTL_MASK		BIT(5)
 
 #endif /* __LINUX_MFD_TPS68470_H */
-- 
2.34.1

