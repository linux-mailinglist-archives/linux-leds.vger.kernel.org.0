Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19BF270FE8
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 20:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgISSDJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 14:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgISSDJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 14:03:09 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137AEC0613D1
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 11:03:09 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 3D84C140A7D;
        Sat, 19 Sep 2020 20:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538586; bh=H3ubpsoxqKfDX9EbJ7DA107Geu4xBCUOsmfPWVe5jkI=;
        h=From:To:Date;
        b=L4kl+Qg8K4Tuj8++WL0H4Sw+GeiAMkr7SV/BR4tf6R9TJPNI77MHICHRiKNIi47qj
         ZWIU+irP+WOinjgPkwD8uzG3NNgoHi1Jwk209DnwIMrF8uVxOAA3rkgeSWJZnULX3e
         3Vy1p7r4c7PVXts72P25xtsGQ8llMNOR3hWBadMk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 5/9] leds: lm36274: use platform device as parent of LED
Date:   Sat, 19 Sep 2020 20:03:00 +0200
Message-Id: <20200919180304.2885-6-marek.behun@nic.cz>
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

Instead of registering LED under the MFD device, this driver sets the
parent of the LED it is registering to the parent of the MFD device (the
I2C client device).

Because of this we cannot use devres for LED registration, since it can
result in use-after-free, see commit
a0972fff0947 ("leds: lm36274: fix use-after-free on unbind").

The only other in-tree driver that also registers under the MFD device
(drivers/regulator/lm363x-regulator.c) sets the parent to the MFD
device.

Set the parent of this LED to the MFD device, instead of the I2C client
device.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 85a58a5cbdf9c..74c236d1a60c8 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -69,7 +69,7 @@ static int lm36274_init(struct lm36274 *chip)
 static int lm36274_parse_dt(struct lm36274 *chip,
 			    struct led_init_data *init_data)
 {
-	struct device *dev = &chip->pdev->dev;
+	struct device *dev = chip->dev;
 	struct fwnode_handle *child;
 	int ret;
 
@@ -118,7 +118,7 @@ static int lm36274_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	chip->pdev = pdev;
-	chip->dev = lmu->dev;
+	chip->dev = &pdev->dev;
 	chip->regmap = lmu->regmap;
 	platform_set_drvdata(pdev, chip);
 
-- 
2.26.2

