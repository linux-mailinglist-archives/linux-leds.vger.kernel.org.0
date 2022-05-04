Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBBA51AD51
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 20:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352835AbiEDSyG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 14:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377400AbiEDSxp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:53:45 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B40C1AF22
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 11:50:08 -0700 (PDT)
X-Virus-Scanned: Yes
From:   Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651690206;
        bh=lKmzXR7mOMYcUu4dVFz3q+Y6DX+4qRzLa96kkMbnA6s=;
        h=From:To:Cc:Subject:In-Reply-To:References;
        b=DHojgH3kBNsoBGUmNW/CgRn/6s6sE1QGjplm5cwumLGhAwxifim2c9l9SrlUJ7LfV
         kOXFnqSkh+gcFb1648/jWmKz2g7FrAlFCBf7CjPleQACN3ydrE94nQe3MG8Eu0gpX4
         jLAGEFX4H4Jom66tkolDXTTx9ZghV1aGcdnTCIn5sn6IsSxMln4y8T1S138cBCKrJ4
         HcQmnVEhGeqWx826K2+uNHdYXHNehnDd1kQRNXvPNjOASJj7iungwRZjBLJfWxy628
         8a5VULP3o/KGv0kaSvh73EMKXmoCAW7oNYzjr7Br5nXxL0xvCjgDIuVFnM2gYQJ3Ts
         AUv6RFBlPgxsg==
To:     linux-leds@vger.kernel.org, pavel@ucw.cz
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Subject: [PATCH v1] leds: Move pwm-multicolor driver into rgb directory
Date:   Wed,  4 May 2022 20:49:46 +0200
Message-Id: <20220504184946.1203959-1-sven@svenschwermer.de>
In-Reply-To: <20220504174744.GD8725@duo.ucw.cz>
References: <20220504174744.GD8725@duo.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

The drivers/leds/rgb subdirectory is relatively fresh, so we move this
new PWM multi-color driver into it.

Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
---
 drivers/leds/Kconfig                         | 11 -----------
 drivers/leds/Makefile                        |  1 -
 drivers/leds/rgb/Kconfig                     | 10 ++++++++++
 drivers/leds/rgb/Makefile                    |  3 ++-
 drivers/leds/{ => rgb}/leds-pwm-multicolor.c |  0
 5 files changed, 12 insertions(+), 13 deletions(-)
 rename drivers/leds/{ => rgb}/leds-pwm-multicolor.c (100%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ea4481000bfe..a49979f41eee 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -552,17 +552,6 @@ config LEDS_PWM
 	help
 	  This option enables support for pwm driven LEDs
 
-config LEDS_PWM_MULTICOLOR
-	tristate "PWM driven multi-color LED Support"
-	depends on LEDS_CLASS_MULTICOLOR
-	depends on PWM
-	help
-	  This option enables support for PWM driven monochrome LEDs that are
-	  grouped into multicolor LEDs.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called leds-pwm-multicolor.
-
 config LEDS_REGULATOR
 	tristate "REGULATOR driven LED support"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c6a147865705..4fd2f92cd198 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -73,7 +73,6 @@ obj-$(CONFIG_LEDS_PCA963X)		+= leds-pca963x.o
 obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
-obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 5dd27ad80856..63fd40b257ec 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -2,6 +2,16 @@
 
 if LEDS_CLASS_MULTICOLOR
 
+config LEDS_PWM_MULTICOLOR
+	tristate "PWM driven multi-color LED Support"
+	depends on PWM
+	help
+	  This option enables support for PWM driven monochrome LEDs that are
+	  grouped into multicolor LEDs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-pwm-multicolor.
+
 config LEDS_QCOM_LPG
 	tristate "LED support for Qualcomm LPG"
 	depends on OF
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index 83114f44c4ea..0675bc0f6e18 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_LEDS_QCOM_LPG)	+= leds-qcom-lpg.o
+obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
+obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
diff --git a/drivers/leds/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
similarity index 100%
rename from drivers/leds/leds-pwm-multicolor.c
rename to drivers/leds/rgb/leds-pwm-multicolor.c
-- 
2.36.0

