Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD8026E8EA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgIQWgj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgIQWeA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:00 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A5EC06174A;
        Thu, 17 Sep 2020 15:33:56 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id AD65B140A7D;
        Fri, 18 Sep 2020 00:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382034; bh=jJvOc2XdLe1mhBOZdhONqVvFbjD8Z3fnX62K60JuT7Y=;
        h=From:To:Date;
        b=o+GnToks2H1CpY3tK8E7CP00lpn7vNtxiarRbi07022j9IqelYpblTpnGh+GNwAP6
         +WxQwI+JqV3pIAFYdWAITa3b2rkjaHNUaFnUCu630kwhwcS642qHQ/6vyTdBx772dJ
         KHx89Oz+8Wdh+4IE0L35c26evRSTp+0MONGgvOdE=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH leds v2 05/50] leds: various: guard of_match_table member value with of_match_ptr
Date:   Fri, 18 Sep 2020 00:32:53 +0200
Message-Id: <20200917223338.14164-6-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Change
  .of_match_table = xxx,
to
  .of_match_table = of_match_ptr(xxx),
in various drivers.

This should be standard even for drivers that depend on OF.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/leds/leds-aat1290.c      | 2 +-
 drivers/leds/leds-as3645a.c      | 2 +-
 drivers/leds/leds-bcm6328.c      | 2 +-
 drivers/leds/leds-bcm6358.c      | 2 +-
 drivers/leds/leds-cpcap.c        | 2 +-
 drivers/leds/leds-cr0014114.c    | 2 +-
 drivers/leds/leds-el15203000.c   | 2 +-
 drivers/leds/leds-gpio.c         | 2 +-
 drivers/leds/leds-is31fl32xx.c   | 2 +-
 drivers/leds/leds-ktd2692.c      | 2 +-
 drivers/leds/leds-lm3532.c       | 2 +-
 drivers/leds/leds-lm3601x.c      | 2 +-
 drivers/leds/leds-lm3692x.c      | 2 +-
 drivers/leds/leds-lm3697.c       | 2 +-
 drivers/leds/leds-lp50xx.c       | 2 +-
 drivers/leds/leds-lp8860.c       | 2 +-
 drivers/leds/leds-max77650.c     | 2 +-
 drivers/leds/leds-max77693.c     | 2 +-
 drivers/leds/leds-mt6323.c       | 2 +-
 drivers/leds/leds-netxbig.c      | 2 +-
 drivers/leds/leds-pca955x.c      | 2 +-
 drivers/leds/leds-pca963x.c      | 2 +-
 drivers/leds/leds-pm8058.c       | 2 +-
 drivers/leds/leds-powernv.c      | 2 +-
 drivers/leds/leds-pwm.c          | 2 +-
 drivers/leds/leds-sc27xx-bltc.c  | 2 +-
 drivers/leds/leds-sgm3140.c      | 2 +-
 drivers/leds/leds-spi-byte.c     | 2 +-
 drivers/leds/leds-syscon.c       | 2 +-
 drivers/leds/leds-turris-omnia.c | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 5a0fe7b7b8bc7..c78a29ab8e9fb 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -545,7 +545,7 @@ static struct platform_driver aat1290_led_driver = {
 	.remove		= aat1290_led_remove,
 	.driver		= {
 		.name	= "aat1290",
-		.of_match_table = aat1290_led_dt_match,
+		.of_match_table = of_match_ptr(aat1290_led_dt_match),
 	},
 };
 
diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index e8922fa033796..50b12e440d88d 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -757,7 +757,7 @@ MODULE_DEVICE_TABLE(of, as3645a_of_table);
 
 static struct i2c_driver as3645a_i2c_driver = {
 	.driver	= {
-		.of_match_table = as3645a_of_table,
+		.of_match_table = of_match_ptr(as3645a_of_table),
 		.name = AS_NAME,
 	},
 	.probe_new	= as3645a_probe,
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index bad7efb751120..65a3857efa4ed 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -477,7 +477,7 @@ static struct platform_driver bcm6328_leds_driver = {
 	.probe = bcm6328_leds_probe,
 	.driver = {
 		.name = "leds-bcm6328",
-		.of_match_table = bcm6328_leds_of_match,
+		.of_match_table = of_match_ptr(bcm6328_leds_of_match),
 	},
 };
 
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 94fefd456ba07..44fd1ba4be57e 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -220,7 +220,7 @@ static struct platform_driver bcm6358_leds_driver = {
 	.probe = bcm6358_leds_probe,
 	.driver = {
 		.name = "leds-bcm6358",
-		.of_match_table = bcm6358_leds_of_match,
+		.of_match_table = of_match_ptr(bcm6358_leds_of_match),
 	},
 };
 
diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
index 7d41ce8c9bb1e..263e4bbf3fda5 100644
--- a/drivers/leds/leds-cpcap.c
+++ b/drivers/leds/leds-cpcap.c
@@ -216,7 +216,7 @@ static struct platform_driver cpcap_led_driver = {
 	.probe = cpcap_led_probe,
 	.driver = {
 		.name = "cpcap-led",
-		.of_match_table = cpcap_led_of_match,
+		.of_match_table = of_match_ptr(cpcap_led_of_match),
 	},
 };
 module_platform_driver(cpcap_led_driver);
diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 2da448ae718e9..a2f5638eda5f7 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -291,7 +291,7 @@ static struct spi_driver cr0014114_driver = {
 	.remove		= cr0014114_remove,
 	.driver = {
 		.name		= KBUILD_MODNAME,
-		.of_match_table	= cr0014114_dt_ids,
+		.of_match_table	= of_match_ptr(cr0014114_dt_ids),
 	},
 };
 
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 298b13e4807a8..bcd13a7fc9d02 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -345,7 +345,7 @@ static struct spi_driver el15203000_driver = {
 	.remove		= el15203000_remove,
 	.driver = {
 		.name		= KBUILD_MODNAME,
-		.of_match_table	= el15203000_dt_ids,
+		.of_match_table	= of_match_ptr(el15203000_dt_ids),
 	},
 };
 
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index cf84096d88cec..aa740267eb232 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -311,7 +311,7 @@ static struct platform_driver gpio_led_driver = {
 	.shutdown	= gpio_led_shutdown,
 	.driver		= {
 		.name	= "leds-gpio",
-		.of_match_table = of_gpio_leds_match,
+		.of_match_table = of_match_ptr(of_gpio_leds_match),
 	},
 };
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index acf51e17e8df6..408eb5fad4cb0 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -485,7 +485,7 @@ MODULE_DEVICE_TABLE(i2c, is31fl32xx_id);
 static struct i2c_driver is31fl32xx_driver = {
 	.driver = {
 		.name	= "is31fl32xx",
-		.of_match_table = of_is31fl32xx_match,
+		.of_match_table = of_match_ptr(of_is31fl32xx_match),
 	},
 	.probe		= is31fl32xx_probe,
 	.remove		= is31fl32xx_remove,
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 670efee9b1317..63917db8cac39 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -402,7 +402,7 @@ MODULE_DEVICE_TABLE(of, ktd2692_match);
 static struct platform_driver ktd2692_driver = {
 	.driver = {
 		.name  = "ktd2692",
-		.of_match_table = ktd2692_match,
+		.of_match_table = of_match_ptr(ktd2692_match),
 	},
 	.probe  = ktd2692_probe,
 	.remove = ktd2692_remove,
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 946ad67eaecb7..3670cc64eee7b 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -752,7 +752,7 @@ static struct i2c_driver lm3532_i2c_driver = {
 	.id_table = lm3532_id,
 	.driver = {
 		.name = LM3532_NAME,
-		.of_match_table = of_lm3532_leds_match,
+		.of_match_table = of_match_ptr(of_lm3532_leds_match),
 	},
 };
 module_i2c_driver(lm3532_i2c_driver);
diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index d0e1d4814042e..e12b9fbac4c1a 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -468,7 +468,7 @@ MODULE_DEVICE_TABLE(of, of_lm3601x_leds_match);
 static struct i2c_driver lm3601x_i2c_driver = {
 	.driver = {
 		.name = "lm3601x",
-		.of_match_table = of_lm3601x_leds_match,
+		.of_match_table = of_match_ptr(of_lm3601x_leds_match),
 	},
 	.probe_new = lm3601x_probe,
 	.remove = lm3601x_remove,
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 1d7ea1b76a125..ba535ee8fd252 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -525,7 +525,7 @@ MODULE_DEVICE_TABLE(of, of_lm3692x_leds_match);
 static struct i2c_driver lm3692x_driver = {
 	.driver = {
 		.name	= "lm3692x",
-		.of_match_table = of_lm3692x_leds_match,
+		.of_match_table = of_match_ptr(of_lm3692x_leds_match),
 	},
 	.probe		= lm3692x_probe,
 	.remove		= lm3692x_remove,
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 024983088d599..5d14f3d2220af 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -379,7 +379,7 @@ MODULE_DEVICE_TABLE(of, of_lm3697_leds_match);
 static struct i2c_driver lm3697_driver = {
 	.driver = {
 		.name	= "lm3697",
-		.of_match_table = of_lm3697_leds_match,
+		.of_match_table = of_match_ptr(of_lm3697_leds_match),
 	},
 	.probe		= lm3697_probe,
 	.remove		= lm3697_remove,
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 47144a37cb945..1f8be335084d5 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -621,7 +621,7 @@ MODULE_DEVICE_TABLE(of, of_lp50xx_leds_match);
 static struct i2c_driver lp50xx_driver = {
 	.driver = {
 		.name	= "lp50xx",
-		.of_match_table = of_lp50xx_leds_match,
+		.of_match_table = of_match_ptr(of_lp50xx_leds_match),
 	},
 	.probe		= lp50xx_probe,
 	.remove		= lp50xx_remove,
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index ac2f5d6272dc0..6eb323212da3c 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -484,7 +484,7 @@ MODULE_DEVICE_TABLE(of, of_lp8860_leds_match);
 static struct i2c_driver lp8860_driver = {
 	.driver = {
 		.name	= "lp8860",
-		.of_match_table = of_lp8860_leds_match,
+		.of_match_table = of_match_ptr(of_lp8860_leds_match),
 	},
 	.probe		= lp8860_probe,
 	.remove		= lp8860_remove,
diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index a0d4b725c9178..56a37d4b7df63 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -144,7 +144,7 @@ MODULE_DEVICE_TABLE(of, max77650_led_of_match);
 static struct platform_driver max77650_led_driver = {
 	.driver = {
 		.name = "max77650-led",
-		.of_match_table = max77650_led_of_match,
+		.of_match_table = of_match_ptr(max77650_led_of_match),
 	},
 	.probe = max77650_led_probe,
 };
diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index fec56090c2ba3..1d8e2ffe7ad46 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -1047,7 +1047,7 @@ static struct platform_driver max77693_led_driver = {
 	.remove		= max77693_led_remove,
 	.driver		= {
 		.name	= "max77693-led",
-		.of_match_table = max77693_led_dt_match,
+		.of_match_table = of_match_ptr(max77693_led_dt_match),
 	},
 };
 
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 7b240771e45bb..80b57a39445cb 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -482,7 +482,7 @@ static struct platform_driver mt6323_led_driver = {
 	.remove		= mt6323_led_remove,
 	.driver		= {
 		.name	= "mt6323-led",
-		.of_match_table = mt6323_led_dt_match,
+		.of_match_table = of_match_ptr(mt6323_led_dt_match),
 	},
 };
 
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index ceceeb6a0e966..7f3313e321fa6 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -617,7 +617,7 @@ static struct platform_driver netxbig_led_driver = {
 	.probe		= netxbig_led_probe,
 	.driver		= {
 		.name		= "leds-netxbig",
-		.of_match_table	= of_netxbig_leds_match,
+		.of_match_table	= of_match_ptr(of_netxbig_leds_match),
 	},
 };
 
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc9..7da2b88a89197 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -579,7 +579,7 @@ static int pca955x_probe(struct i2c_client *client,
 static struct i2c_driver pca955x_driver = {
 	.driver = {
 		.name	= "leds-pca955x",
-		.of_match_table = of_pca955x_match,
+		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
 	.id_table = pca955x_id,
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index d288acbc99c7c..d3969c7914656 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -473,7 +473,7 @@ static int pca963x_remove(struct i2c_client *client)
 static struct i2c_driver pca963x_driver = {
 	.driver = {
 		.name	= "leds-pca963x",
-		.of_match_table = of_pca963x_match,
+		.of_match_table = of_match_ptr(of_pca963x_match),
 	},
 	.probe	= pca963x_probe,
 	.remove	= pca963x_remove,
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index 7869ccdf70ce6..d9e8ea80cd167 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -173,7 +173,7 @@ static struct platform_driver pm8058_led_driver = {
 	.probe		= pm8058_led_probe,
 	.driver		= {
 		.name	= "pm8058-leds",
-		.of_match_table = pm8058_leds_id_table,
+		.of_match_table = of_match_ptr(pm8058_leds_id_table),
 	},
 };
 module_platform_driver(pm8058_led_driver);
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index cd43d5dff7f48..d803726300ff4 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -338,7 +338,7 @@ static struct platform_driver powernv_led_driver = {
 	.remove = powernv_led_remove,
 	.driver = {
 		.name = "powernv-led-driver",
-		.of_match_table = powernv_led_match,
+		.of_match_table = of_match_ptr(powernv_led_match),
 	},
 };
 
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e35a97c1d8285..02c9c7a32251e 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -190,7 +190,7 @@ static struct platform_driver led_pwm_driver = {
 	.probe		= led_pwm_probe,
 	.driver		= {
 		.name	= "leds_pwm",
-		.of_match_table = of_pwm_leds_match,
+		.of_match_table = of_match_ptr(of_pwm_leds_match),
 	},
 };
 
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index 0ede87420bfc7..3401ad389c8d9 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -347,7 +347,7 @@ MODULE_DEVICE_TABLE(of, sc27xx_led_of_match);
 static struct platform_driver sc27xx_led_driver = {
 	.driver = {
 		.name = "sprd-bltc",
-		.of_match_table = sc27xx_led_of_match,
+		.of_match_table = of_match_ptr(sc27xx_led_of_match),
 	},
 	.probe = sc27xx_led_probe,
 	.remove = sc27xx_led_remove,
diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
index f4f831570f11c..92ce22024d91b 100644
--- a/drivers/leds/leds-sgm3140.c
+++ b/drivers/leds/leds-sgm3140.c
@@ -300,7 +300,7 @@ static struct platform_driver sgm3140_driver = {
 	.remove	= sgm3140_remove,
 	.driver	= {
 		.name	= "sgm3140",
-		.of_match_table = sgm3140_dt_match,
+		.of_match_table = of_match_ptr(sgm3140_dt_match),
 	},
 };
 
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 9632eb84f8de1..21ec02c4f8dac 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -144,7 +144,7 @@ static struct spi_driver spi_byte_driver = {
 	.remove		= spi_byte_remove,
 	.driver = {
 		.name		= KBUILD_MODNAME,
-		.of_match_table	= spi_byte_dt_ids,
+		.of_match_table	= of_match_ptr(spi_byte_dt_ids),
 	},
 };
 
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index b58f3cafe16f4..b56a5c82bf759 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -134,7 +134,7 @@ static struct platform_driver syscon_led_driver = {
 	.probe		= syscon_led_probe,
 	.driver		= {
 		.name	= "leds-syscon",
-		.of_match_table = of_syscon_leds_match,
+		.of_match_table = of_match_ptr(of_syscon_leds_match),
 		.suppress_bind_attrs = true,
 	},
 };
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bb23d8e166144..2a69d2085a225 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -284,7 +284,7 @@ static struct i2c_driver omnia_leds_driver = {
 	.id_table	= omnia_id,
 	.driver		= {
 		.name	= "leds-turris-omnia",
-		.of_match_table = of_omnia_leds_match,
+		.of_match_table = of_match_ptr(of_omnia_leds_match),
 	},
 };
 
-- 
2.26.2

