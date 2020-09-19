Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62464270FE2
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 20:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgISSDJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 14:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISSDI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 14:03:08 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2EDC0613CE
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 11:03:07 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 193F4140A76;
        Sat, 19 Sep 2020 20:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538586; bh=ZlUKK1dog0grnyApKCmCVZYsadv70dZ8DvWJtKGlfSM=;
        h=From:To:Date;
        b=oVySmMPzsSg0KwZ2yHVJ5F3ZuRo97j003eARNTbwY0RgXMYE8O+cYW/azlh5moVlG
         Yzhs/T0pxEXqyihcO8OcEc21f3WXzRmAp/iQU9GWvAZPPmyhVu5olin7c7a/BJaX/8
         KeTZiPqBMai+BwzJhOL8b2MynGuYZ87XX6WJXTjU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 4/9] leds: lm36274: do not set chip settings in DT parsing function
Date:   Sat, 19 Sep 2020 20:02:59 +0200
Message-Id: <20200919180304.2885-5-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919180304.2885-1-marek.behun@nic.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
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

These settings are not parsed from DT and therefore semantically should
not be set in function with a name lm36274_parse_dt.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index ee4f90f04f195..85a58a5cbdf9c 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -100,14 +100,6 @@ static int lm36274_parse_dt(struct lm36274 *chip,
 	fwnode_property_read_string(child, "linux,default-trigger",
 				    &chip->led_dev.default_trigger);
 
-	chip->lmu_data.regmap = chip->regmap;
-	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
-	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
-	chip->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
-
-	chip->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
-	chip->led_dev.brightness_set_blocking = lm36274_brightness_set;
-
 	return 0;
 err:
 	fwnode_handle_put(child);
@@ -142,6 +134,14 @@ static int lm36274_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	chip->lmu_data.regmap = chip->regmap;
+	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
+	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
+	chip->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
+
+	chip->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
+	chip->led_dev.brightness_set_blocking = lm36274_brightness_set;
+
 	ret = led_classdev_register_ext(chip->dev, &chip->led_dev, &init_data);
 	if (ret)
 		dev_err(chip->dev, "Failed to register LED for node %pfw\n",
-- 
2.26.2

