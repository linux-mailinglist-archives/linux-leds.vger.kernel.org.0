Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86BFB7CE679
	for <lists+linux-leds@lfdr.de>; Wed, 18 Oct 2023 20:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjJRS37 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Oct 2023 14:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjJRS35 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Oct 2023 14:29:57 -0400
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E39E119;
        Wed, 18 Oct 2023 11:29:55 -0700 (PDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
        by mx1.sberdevices.ru (Postfix) with ESMTP id 18DCE10000F;
        Wed, 18 Oct 2023 21:29:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 18DCE10000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
        s=mail; t=1697653794;
        bh=gUJedlfidw0iNo5WabTRQ7jltNs0msaVOJBzN45ynHc=;
        h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
        b=BG9E8J1LhLzq0xCVt5jpP98UVy4jHdMUv7ODTtwkWvYKgzd0p2Rbf7UBThUUsGSax
         TIZAHqRNPcOQtgktbjlgRgncKhgNRVytslU/nFvjePQvKNQvnNUSKKue6qwAz4puVY
         uZkGLdGja5IrG2gm9JULXgktr9X4gaH9a1kpdj5y3bNVMQ3cbVmCYTnHF0bwyVmfPa
         775hCNExo76mVSJhh8EDQU4YupYTsKoFVbn82+OsKSKiLOGYq1HBGrbhbQzEebI2jb
         nlNf8EV2kfBXT+GLkvUyknGjGe79APMMP/ly5PWDnUTMULfNw+cpmhZnhTOLzKmhJi
         Eee2vmWXz+peg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.sberdevices.ru (Postfix) with ESMTPS;
        Wed, 18 Oct 2023 21:29:53 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 18 Oct 2023 21:29:53 +0300
From:   Dmitry Rokosov <ddrokosov@salutedevices.com>
To:     <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andy.shevchenko@gmail.com>
CC:     <kernel@sberdevices.ru>, <rockosov@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>,
        Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v2 02/11] leds: aw200xx: support HWEN hardware control
Date:   Wed, 18 Oct 2023 21:29:34 +0300
Message-ID: <20231018182943.18700-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20231018182943.18700-1-ddrokosov@salutedevices.com>
References: <20231018182943.18700-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180713 [Oct 18 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 541 541 6f62a06a82e8ec968d29b8e7c7bba6aeceb34f57, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/18 17:21:00 #22224798
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

HWEN is hardware control, which is used for enable/disable aw200xx chip.
It's high active, internally pulled down to GND.

After HWEN pin set high the chip begins to load the OTP information,
which takes 200us to complete. About 200us wait time is needed for
internal oscillator startup and display SRAM initialization. After
display SRAM initialization, the registers in page 1 to page 5 can be
configured via i2c interface.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/leds/leds-aw200xx.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 842a22087b16..911c3154585f 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/mod_devicetable.h>
@@ -116,6 +117,7 @@ struct aw200xx {
 	struct mutex mutex;
 	u32 num_leds;
 	u32 display_rows;
+	struct gpio_desc *hwen;
 	struct aw200xx_led leds[] __counted_by(num_leds);
 };
 
@@ -358,6 +360,25 @@ static int aw200xx_chip_check(const struct aw200xx *const chip)
 	return 0;
 }
 
+static void aw200xx_enable(const struct aw200xx *const chip)
+{
+	gpiod_set_value_cansleep(chip->hwen, 1);
+
+	/*
+	 * After HWEN pin set high the chip begins to load the OTP information,
+	 * which takes 200us to complete. About 200us wait time is needed for
+	 * internal oscillator startup and display SRAM initialization. After
+	 * display SRAM initialization, the registers in page1 to page5 can be
+	 * configured via i2c interface.
+	 */
+	fsleep(400);
+}
+
+static void aw200xx_disable(const struct aw200xx *const chip)
+{
+	return gpiod_set_value_cansleep(chip->hwen, 0);
+}
+
 static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 {
 	struct fwnode_handle *child;
@@ -517,6 +538,10 @@ static int aw200xx_probe(struct i2c_client *client)
 	if (IS_ERR(chip->regmap))
 		return PTR_ERR(chip->regmap);
 
+	chip->hwen = devm_gpiod_get_optional(&client->dev, "hwen", GPIOD_OUT_HIGH);
+
+	aw200xx_enable(chip);
+
 	ret = aw200xx_chip_check(chip);
 	if (ret)
 		return ret;
@@ -537,6 +562,9 @@ static int aw200xx_probe(struct i2c_client *client)
 	ret = aw200xx_chip_init(chip);
 
 out_unlock:
+	if (ret)
+		aw200xx_disable(chip);
+
 	mutex_unlock(&chip->mutex);
 	return ret;
 }
@@ -546,6 +574,7 @@ static void aw200xx_remove(struct i2c_client *client)
 	struct aw200xx *chip = i2c_get_clientdata(client);
 
 	aw200xx_chip_reset(chip);
+	aw200xx_disable(chip);
 	mutex_destroy(&chip->mutex);
 }
 
-- 
2.36.0

