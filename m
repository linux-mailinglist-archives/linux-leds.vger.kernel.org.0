Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EC7266311
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 18:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgIKQJy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 12:09:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34143 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgIKPnT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 11:43:19 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.56]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MFshF-1kJFLs3aFb-00HPgf; Fri, 11 Sep 2020 17:41:03 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kGlAb-00013B-Hm; Fri, 11 Sep 2020 17:41:02 +0200
Received: (nullmailer pid 28466 invoked by uid 2001);
        Fri, 11 Sep 2020 15:41:01 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v4 2/3] leds: pwm: Allow automatic labels for DT based devices
Date:   Fri, 11 Sep 2020 17:40:03 +0200
Message-Id: <20200911154004.28354-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911154004.28354-1-post@lespocky.de>
References: <20200911154004.28354-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 581c7ffa71bd056d31bcd0d50462ce09
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:vd9UlApDbNcfwPEYFW0CXQ5k2yys8xV/ckjs/vE1n5cNGUt7WaY
 9l6aRrLvcHeN8aDpvR/SFqWKVLKDT9rDQJ/Bz6xeKBXBt2ATGa2HIuLO3akCzAZ1JzhGBJg
 CyVUVE3qbA4lYa56ASIscbrPd/avSDg4NzA6p5LOGfeCOl7AnnKD2BbT+YDpjs7qUVtMQX7
 m9hCLm2dFYHSoEaqDfICQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NyKJnXc0b+Y=:DcH8f6D7zQZ/YwUeJV//dM
 k/G4wc3L7ZwmIgMSjxH9Y++hSUSCHkqrtlIConOPST/4oJveZlEwvqAEm+jXzYkYvSj2kVNua
 ySRxoSGLXCaSEOY86GtLgV7cKUtDx6IngZktkf3A108qg7HE5yEFgbO/XyQ5T1kuWXm5jX5hO
 9FWteWLs/bDqHz+RPjWJBFAOhMKocLxF01BlLpAff9uih2lv03dP40rwCPHkuzkNoKGK94z7O
 QD6uf2ZKrtituSS1nUfU7s/08Q/zYEoK8aJJREpCelYbwF4YTIHkw9PTFGpQAyyQAvIIMv2gj
 7EdV3pdh728QbwvLb6Icp6o32bISjThtf+7eBO4dNqkMKwNj0FbhrSmaeeOn55V2dTZS/KR7e
 7GW8Jn80P7fsWVBVKG2cDJyRQNfcSPdVs98uKqWurgOgjUXwxfRd2Nh3ycmD9YQYMjhlVUy5Z
 1I8WpNUYEtBt5Ppz4aCCGTbO1aYAF8LoZKJKA48v0usfetPOXBDnTw62SDlT+rSIr62gbJzaJ
 Py19OV9/+7sHcGQopcg0XKe1qw+R5EUVmx+17jedKNc/8+eaKMIg9yhSKBnXDcl2XCfccZnUt
 4+3m89034JIJqXRJmG61M3MWGOawyRtNqIDw0Z9DqDdMhdgfHK6RP4HqMs5fUGEOZ9FG1nwgt
 k/+aormNAEuRGDUaqr/W3eq0yIW0dZwWpzmoOihHdhOX/xls8IKzFdYTTG7M8p4AiJV1cnw1G
 cHbsft3oxOuav9N/1DIVwmaO06bHsReSlwysMhep66MR6xmy3q8Qs5aQm+RdJ2hWH0V4hO7Pc
 sHD18rfR06+jJllnvV5vZ9FzRO7uyaShkVlfRDpmk9imFI12fB1hyjqlb2fn7mAOOQOILiA
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
the current device tree node.

The approach to fix this requires a change to led-class checking on
init_data->fwnode being NULL early.

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
    v3 -> v4:
      * simplified implementation based on a new change in led-core
      * removed Acked-by due to changed implementation
    
    v2 -> v3:
      * added Acked-by
    
    v1 -> v2:
      * no change to this patch

 drivers/leds/leds-pwm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index ef7b91bd2064..9017d3e7dd94 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -65,6 +65,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
 	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
+	struct led_init_data init_data = { .fwnode = fwnode };
 	int ret;
 
 	led_data->active_low = led->active_low;
@@ -90,7 +91,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 	pwm_init_state(led_data->pwm, &led_data->pwmstate);
 
-	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret) {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
 			led->name, ret);
-- 
2.20.1

