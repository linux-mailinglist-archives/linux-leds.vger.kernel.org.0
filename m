Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074E6258334
	for <lists+linux-leds@lfdr.de>; Mon, 31 Aug 2020 23:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgHaVEC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Aug 2020 17:04:02 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:39357 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgHaVEA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Aug 2020 17:04:00 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.54.199]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLAAs-1jvjoq3UzS-00IAKB; Mon, 31 Aug 2020 23:03:42 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kCqxo-0003pb-9O; Mon, 31 Aug 2020 23:03:41 +0200
Received: (nullmailer pid 28165 invoked by uid 2001);
        Mon, 31 Aug 2020 21:03:40 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v2 1/2] leds: pwm: Allow automatic labels for DT based devices
Date:   Mon, 31 Aug 2020 23:02:30 +0200
Message-Id: <20200831210232.28052-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200831210232.28052-1-post@lespocky.de>
References: <20200831210232.28052-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 2e89b8130284c79aa2484230574bb425
X-Spam-Score: -2.6 (--)
X-Provags-ID: V03:K1:8ogXi9Xj3uh4k9IAvOEBXYv3Ny/nWMnLu8VlhhajVQSh3FUKBhU
 W43zhv0LZDqtK82u/rQqICDOIj/cULi6aBwVKnJgqQf6kLA4PHHE74uAJxy194iZyZYlVp2
 pdETsb7Zt8fkezsqZj7/xM85OVE4hBE4YOQ94fHa5X9IbZ5iPK6YXRLMyLLAgDfj2AGY2r6
 o1mf5LaatqeE68puGUSgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DPMYoC02w2w=:d3FEutZrAVBlLBRsXCNxBy
 RnoqfWnBN3RCJzHhaGicll7B89OmB0N029kjonsR0NS0kJPjbPqDgYchWChgl1SepX3aXagrm
 2QEMFYhiKqO4AQR+OgKot3EUduxLdKcc61TJLH4OlGSZejQPfyDGjk3Foh3rVoQyLGDxQ+ZoD
 SGrM95CdDbprQSkli8RVHi1Xy9rKZTpumxoO232G8ywlBRKBEJD8yDcEfbnIkGJU60sRAqh3V
 kaIEpmYh9lYlkSEy5HE/U1DchXPxV9UXAjAWw1PIsm+Eqmw0v2jordsFpoWia/VoM55xHaKwa
 0PIhuQkQtUk8/mOyyHm/TTh7z+pgN5hpwJOSwwsnmE2sNnfREwHbN187uN1f8RqRdxOM7VuFp
 DrtejEe+bg6T4TdWgDnTl63Q2WHl/8NQkkwiKgiaNfU6HNFLbONl4oGSl3zC+Kxu999dRzNmM
 wtw/rA69CSwtlf8VKjY69gUAG8IQnM40IIvicmomZLf/jbr2l6RvTa24X4S8ToEpBKKxuASFK
 EJbLSX8l3aQ5KwLgYmcGWQmU5eNwRkIOJKiPfsOOjM3JGD++zsH4IAbOcfWV9eboC565WGQ61
 2h7Uzyu83vVy1CJliM0+/+CPurbG2oDgDJ02w80WYgu+mVIHzVgFFTX+jSOCvQ7r2vs4kB3MS
 ap6vixa92HtvthCHFPZ9hkjk9TitWxbi+vYNVFACaDEmFJDDmyCER9ORrjTsUs7JYCM5bldUe
 WY3BOLcRhZiJz9B3nyiyM1/pS9OPTbf2Tm9YH0goyrEIZk2sAIQLWhvkAA+z6sTZrqRIb3KpR
 UagLfK0TkTsF3tydw3Z1NxU7vPY9eW6mCELKdiV5aDqNwGmril9Sob+rfd8fKedhMb90L/+
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
---
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

