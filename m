Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C5A26E8BB
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgIQWfn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:43 -0400
Received: from lists.nic.cz ([217.31.204.67]:35870 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbgIQWeL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:11 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 8E2871419EB;
        Fri, 18 Sep 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382038; bh=1hlwfk8rq8NSYp0jTDWjpaScS7LmAnksJzFjTkvBxBg=;
        h=From:To:Date;
        b=uoU2uo5Q8an32KPeW1WXHEZG/RVfvElSFTxdeCkY+RlY37dh+wwclFV6ZIUmIzchd
         wMhNyTnrbyI9vpspbZtqpviof7+9FSWh/2hW5xONMO+/rhWX8KuwPeX1x7lHTmLsWo
         WeF0CZle6ytahM7LvDK1ttCw1alxTj+w5Yff/5Fo=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Grant Feng <von81@163.com>
Subject: [PATCH leds v2 29/50] leds: is31fl319x: cosmetic: use reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:17 +0200
Message-Id: <20200917223338.14164-30-marek.behun@nic.cz>
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

Only a cosmetic change: use reverse christmas tree variables
declaration.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl319x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 1dae319b03d60..15bdbc6378d93 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -111,9 +111,9 @@ static int is31fl319x_brightness_set(struct led_classdev *cdev,
 						  cdev);
 	struct is31fl319x_chip *is31 = led->chip;
 	int chan = led - is31->leds;
+	u8 ctrl1 = 0, ctrl2 = 0;
 	int ret;
 	int i;
-	u8 ctrl1 = 0, ctrl2 = 0;
 
 	dev_dbg(&is31->client->dev, "%s %d: %d\n", __func__, chan, brightness);
 
@@ -340,12 +340,12 @@ static int is31fl319x_parse_and_register(struct device *dev,
 static int is31fl319x_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
-	struct is31fl319x_chip *is31;
 	struct device *dev = &client->dev;
 	struct gpio_desc *shutdown_gpio;
+	struct is31fl319x_chip *is31;
+	u32 aggregated_led_microamp;
 	u32 audio_gain_db;
 	int err;
-	u32 aggregated_led_microamp;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EIO;
-- 
2.26.2

