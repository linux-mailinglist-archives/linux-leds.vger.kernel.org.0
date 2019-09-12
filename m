Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAE4EB15E4
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 23:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbfILVdz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 17:33:55 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:52626 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728679AbfILVdy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Sep 2019 17:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ry3rTAwYOrmDl9OdvOy1DjyuQCzbDXcHgFV8Rl+fzx8=; b=a7dW65RnDXHgHqP7ooBZKmtatL
        SPVOUgeWPI+a6fgPKsCokUeMkuUtKjr3jl1CYciPwQfdyIsvHvRzmGfS7USJlEk0H3LmraufxTCYX
        qKt6Dzcgl+jdTBoTViG2P2pytxqaY6+PxsdfK9Zk1c5g2NENvBBmyC5F6LYsVDzl1N7U=;
Received: from p200300ccff1554001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff15:5400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i8Wim-0006Rr-Ih; Thu, 12 Sep 2019 23:33:46 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1i8Wim-0006Jr-AP; Thu, 12 Sep 2019 23:33:44 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 2/2] backlight: lm3630a: add an enable gpio for the HWEN pin
Date:   Thu, 12 Sep 2019 23:32:57 +0200
Message-Id: <20190912213257.24147-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912213257.24147-1-andreas@kemnade.info>
References: <20190912213257.24147-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

For now just enable it in the probe function to allow i2c
access. Disabling also means resetting the register values
to default and according to the datasheet does not give
power savings.

Tested on Kobo Clara HD.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
changes in v2:
- simplification
- correct gpio direction initialisation

changes in v3:
- removed legacy include

 drivers/video/backlight/lm3630a_bl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 8f84f3684f04..d9e67b9b2571 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 #include <linux/interrupt.h>
 #include <linux/regmap.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pwm.h>
 #include <linux/platform_data/lm3630a_bl.h>
 
@@ -48,6 +49,7 @@ struct lm3630a_chip {
 	struct lm3630a_platform_data *pdata;
 	struct backlight_device *bleda;
 	struct backlight_device *bledb;
+	struct gpio_desc *enable_gpio;
 	struct regmap *regmap;
 	struct pwm_device *pwmd;
 };
@@ -535,6 +537,13 @@ static int lm3630a_probe(struct i2c_client *client,
 	}
 	pchip->pdata = pdata;
 
+	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(pchip->enable_gpio)) {
+		rval = PTR_ERR(pchip->enable_gpio);
+		return rval;
+	}
+
 	/* chip initialize */
 	rval = lm3630a_chip_init(pchip);
 	if (rval < 0) {
-- 
2.20.1

