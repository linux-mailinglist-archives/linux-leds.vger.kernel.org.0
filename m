Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124D3252A51
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 11:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgHZJhx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 05:37:53 -0400
Received: from mail.thorsis.com ([92.198.35.195]:50379 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbgHZJhp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Aug 2020 05:37:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 6C7ED46E1;
        Wed, 26 Aug 2020 11:37:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Wtvtf5oFOyjP; Wed, 26 Aug 2020 11:37:42 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 3E5BE471B; Wed, 26 Aug 2020 11:37:41 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RELAYS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from adahl by ada.ifak-system.com with local (Exim 4.92)
        (envelope-from <ada@thorsis.com>)
        id 1kArs9-0007Yb-BO; Wed, 26 Aug 2020 11:37:37 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>
Subject: [PATCH] leds: pwm: Allow automatic labels for DT based devices
Date:   Wed, 26 Aug 2020 11:37:37 +0200
Message-Id: <20200826093737.29008-1-ada@thorsis.com>
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Alexander Dahl <post@lespocky.de>

If LEDs are configured through device tree and the property 'label' is
omitted, the label is supposed to be generated from the properties
'function' and 'color' if present.  While this works fine for e.g. the
'leds-gpio' driver, it did not for 'leds-pwm'.

The reason is, you get this label naming magic only if you add a LED
device through 'devm_led_classdev_register_ext()' and pass a pointer to
the current device tree node.  The approach to fix this was adopted from
the 'leds-gpio' driver.

For the following node from dts the LED appeared as 'led5' in sysfs
before and as 'red:debug' after this change.

        pwm_leds {
                compatible = "pwm-leds";

                led5 {
                        function = LED_FUNCTION_DEBUG;
                        color = <LED_COLOR_ID_RED>;
                        pwms = <&pwm0 2 10000000 0>;
                        max-brightness = <127>;

                        linux,default-trigger = "heartbeat";
                        panic-indicator;
                };
        };

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v1: based on v5.9-rc2, backport on v5.4.59 also works

 drivers/leds/leds-pwm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index ef7b91bd2064..a27a1d75a3e9 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -65,6 +65,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
 	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
+	struct led_init_data init_data = {};
 	int ret;
 
 	led_data->active_low = led->active_low;
@@ -90,7 +91,13 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 	pwm_init_state(led_data->pwm, &led_data->pwmstate);
 
-	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	if (fwnode) {
+		init_data.fwnode = fwnode;
+		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
+						     &init_data);
+	} else {
+		ret = devm_led_classdev_register(dev, &led_data->cdev);
+	}
 	if (ret) {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
 			led->name, ret);
-- 
2.27.0

