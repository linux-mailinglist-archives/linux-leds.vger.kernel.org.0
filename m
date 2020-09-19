Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B0F270AE9
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 07:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgISFiD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 01:38:03 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:35647 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgISFiD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 01:38:03 -0400
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 01:38:02 EDT
Received: from methusalix.internal.home.lespocky.de ([92.117.44.159]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAtoX-1kCfqh2xQ1-00BLrK; Sat, 19 Sep 2020 07:32:30 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kJVTv-0004nL-2Z; Sat, 19 Sep 2020 07:32:28 +0200
Received: (nullmailer pid 7650 invoked by uid 2001);
        Sat, 19 Sep 2020 05:32:18 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v5 2/3] leds: pwm: Allow automatic labels for DT based devices
Date:   Sat, 19 Sep 2020 07:31:44 +0200
Message-Id: <20200919053145.7564-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200919053145.7564-1-post@lespocky.de>
References: <20200919053145.7564-1-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 09af0b23b5b967e4a9b70abe2712470c
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:0ROL4hCNah2uLQm6AeiHUgcNWsVO18uCbMk7h8IfdBnTQ7ZBM/h
 cloPvjgiH2stTOVhu0HWMffuADoAL0QA+zuvDrbAM9v60EkR1SG95xf4xys/mQYmgjORqJ1
 I6/six9CnKdg11rdqQF4wv+xEbxg2t/lKTlNfEht2gYTsybdYKSZsxmZTvBKyVDuXGXazQt
 b5A+V6jP3bcKlikfe7sVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CQr5XYCP1Hk=:4dlZ+SN/2rAP/OxMoXeTn1
 DkuvohQXqsSkzFnzxZdkSmjoKArGUV5YazbClPMl7jIj0U2ipjsVz4dTbDw1kPjDM4onTQNiS
 rH7kHHMlOnJBZnQSfd+US3AazVqFAQJgOqp99WkwwPu5OLVetP0R+eFPlpH8iUM7PQYcPnp5K
 i06MGTDpl5y1tbWsyc3iA4UPx2HJ2kPAKCa7TpCLQHxXyj01kQ2phuHvs7Sbi535mZh5mWuFG
 sm4iJQ66nTbgxqUUpWrxzB2lzyB5H3Xk5iDsGKvrNmD4Nm6l1RpM2gNcSlWRP3m/N76xRRQal
 p5TslcyVzTYMjMQZ/LcVfse7kf4/4RLtZcH/suL5XpE+A+z8AGmC8uctYPcJpJ2xXXYA+avgK
 BgraezcFuVem57Mtv7hU05cP+vphdQBfjB+UM5QyzuRnMWWraag/WxYSnNmF5RA7ZknGaEsTX
 wmtyEXyNW40Fl8lM6ETVlRorSsA/EM2T6l2rW8kv/FYm+O5SHi4SbAH9J5qZ5pRvtaArDGlz6
 GEmqsvJ2v/AQECq5FrI11Vw3ggm0C6w8muQPTQnbNy66n9jomGS+OE4SInmJ8U85j4jdA0SOs
 RVvWjYYyJpAo4QTiREIqMppsWg85aRLFAKj+H+O4R1xobC7df6Mb/8xG9F+FgTVJbNJIU5vaI
 XfYAt7O9tiS0/rBv6w8H4Xgc1mhD2+vzyuIycIS87SX1R+9ARsyvtKHB2PgCWc7dTCctCJGKI
 Rfx3lD0jZzlm8swC7CVwhVR+r2Hl1jaRhqB/IEWoYmxtjXIeUBIoUITeBDFfAfZg63fO/k1PB
 4zMbyN9z6IQ9RLtJSjfdQIFZGNtpeR1hGgK9qGwY/fckk7070MXtw0hdlt83P6mR3y/Hlxf
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

For the following node from dts the LED appeared as 'led-5' in sysfs
before and as 'red:debug' after this change.

        pwm_leds {
                compatible = "pwm-leds";

                led-5 {
                        function = LED_FUNCTION_DEBUG;
                        color = <LED_COLOR_ID_RED>;
                        pwms = <&pwm0 2 10000000 0>;
                        max-brightness = <127>;

                        linux,default-trigger = "heartbeat";
                        panic-indicator;
                };
        };

Signed-off-by: Alexander Dahl <post@lespocky.de>
Cc: Marek Behún <marek.behun@nic.cz>
---

Notes:
    v4 -> v5:
      * updated commit message
    
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
index 4e9954f8f7eb..8881d465701d 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -61,6 +61,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
 	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
+	struct led_init_data init_data = { .fwnode = fwnode };
 	int ret;
 
 	led_data->active_low = led->active_low;
@@ -80,7 +81,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 	pwm_init_state(led_data->pwm, &led_data->pwmstate);
 
-	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret) {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
 			led->name, ret);
-- 
2.20.1

