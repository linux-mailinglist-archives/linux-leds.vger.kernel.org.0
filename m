Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F92825F28D
	for <lists+linux-leds@lfdr.de>; Mon,  7 Sep 2020 06:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIGEfz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Sep 2020 00:35:55 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgIGEfr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2020 00:35:47 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.148]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N7RDn-1kbqGg0IVp-017j3H; Mon, 07 Sep 2020 06:35:27 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kF8sH-0003E0-0w; Mon, 07 Sep 2020 06:35:25 +0200
Received: (nullmailer pid 3032 invoked by uid 2001);
        Mon, 07 Sep 2020 04:35:21 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v3 1/2] leds: pwm: Allow automatic labels for DT based devices
Date:   Mon,  7 Sep 2020 06:34:58 +0200
Message-Id: <20200907043459.2961-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200907043459.2961-1-post@lespocky.de>
References: <20200907043459.2961-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 5d1699e822705c24f051c25a2c63fb4e
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:fRUX15+uW7mKd6C8CLI+hAGFYFkzmXvrZBEIi7c1LGY6RtF5StJ
 nVX9keIxJ2/J6uWXJohAy2NbirnapmDtiuY1O1XjhhEzgP2HZPec2L0suu+MyueyAkVU50h
 X8KIyVFNfYAl1fchQnDq/BgQSKuOMFbaV8oaBwWwqzxG31VPmDDMsvKMmiFDyPzO9RqKrSe
 e4tWPEZaVDJbi9XizLYKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eT4etPF3VQs=:GpYLEuBkskH0xCbwM8veRj
 IzPvVPh+3YA2sLQGbKVLpg92rbsUdSUxUJapvDI2LifXP8AcocClNz90PT74L8tdYYwfJ/vmN
 9IAcWPQ4YB2/4yW8PWCYI3bVwlBpmZNoWO30eZj9B78+hqHz06YzAiOpH0/bEEuA7kH+xCAfS
 xjpYf6UwN/48MaXnRfyJFe+TTugZ/0GtRvTOE/7hfM8Lb44uCP/qck3FhWORsXW/ZXRzkS889
 piJ1qUnzpc+X3O6D6k6kZZTpJ8w1Vd3hDccbLSXdj7AnZHx2IdP9y1NjoEmqkJxx+ziM9esjz
 fYOzvQZHXf5VaPSiw7CZSAtmzfyIoAjJ0Sb9sRFcKwFk38hqpYs5IppIeP0hRCen3Qa0NJqRd
 zk3zX0HHGbZTw2f7stcvK1uYZvwUFLVHcl3uPOAlS0lQ3wRI2oQ3gzaDh4DH17T8j+pfMyvig
 1hYsAqYknXNqt2lcGGVDZYbdHZPbwo/t9QUeJxvXstXqjdp4mIcnz0P1fSqQ5b6Le7S8SidJc
 yZci0fDeCKDI7xiSLaNiNncBHoEqAmqYsT1BVK9mwVha88muCRVetvyNVvpeu4rhdKiaxky6g
 ORKYgIlgFgBILBVHB3B41C1mGkjj2X1yFyTc+uWaSXsofYoM1Z0kJIzKvNcbohQDxv5iHYsKH
 vTxsXeG1c48BO7SfdumAcY2YCDfltnuC/vaf7i/xNn3nje3HMuaI8SRKn1rPcn0sXxPTlP5PW
 MskHAQJhZfTgXuyef2yVncsbCyO8Imq2Yr544hX+B9RqLkFgQz45b7z6mIM5NFqNTkb9lalk+
 b3k/06PORbfk+mMWzDGngCDyv6pIvawvXxgsN5W582tUcPCAb5TgQ9s1+JExbANqlwxE6TQ
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---

Notes:
    v2 -> v3:
      * added Acked-by

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
2.20.1

