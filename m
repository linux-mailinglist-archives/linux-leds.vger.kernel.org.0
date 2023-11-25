Return-Path: <linux-leds+bounces-148-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E607F8E54
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B711C20BB9
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 20:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AEB3066C;
	Sat, 25 Nov 2023 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Xtyijmev"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD4513A;
	Sat, 25 Nov 2023 12:05:30 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 70487120017;
	Sat, 25 Nov 2023 23:05:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 70487120017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700942728;
	bh=k2ICLTg3g/YTKg9a+5BAKN9PM/DviSRtbLaUHvSu/7s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XtyijmevGQoKjbUC2xSYcctSxiEiB4odz4Smi17w6Xt3n96XzrQV1V3iABtDcJ1UV
	 HxGMUQGbi26wt08hfqEk0CvQ/f4ck8mORxAoxOT7cJO6Sv3y/a3ae2PpoGNtnp1dL6
	 vmGSOu0CTRPjyiUxcu2T1CL8PR0FPR8KpA/FUpQsvm3xYG2fcng+kDgOC/djvapfqB
	 6hk8xIJ/JV0r2QiMwXqaoKKTo7Z+HUc6WtOcNDDQjwHX0rJntG/zuPYfZ81kfQKBzg
	 gH7W2ZZ3gQCUP9bseWUz93tIYwOpT8WGjwPnu8LNVhcb3+gvpJs85Luhkd3Eimmz9/
	 ugoTVHhEUHZbg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 25 Nov 2023 23:05:28 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 25 Nov 2023 23:05:28 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v5 02/11] leds: aw200xx: support HWEN hardware control
Date: Sat, 25 Nov 2023 23:05:10 +0300
Message-ID: <20231125200519.1750-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20231125200519.1750-1-ddrokosov@salutedevices.com>
References: <20231125200519.1750-1-ddrokosov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181593 [Nov 25 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 4 0.3.4 720d3c21819df9b72e78f051e300e232316d302a, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/25 18:32:00 #22537065
X-KSMG-AntiVirus-Status: Clean, skipped

HWEN is hardware control, which is used for enable/disable aw200xx chip.
It's high active, internally pulled down to GND.

After HWEN pin set high the chip begins to load the OTP information,
which takes 200us to complete. About 200us wait time is needed for
internal oscillator startup and display SRAM initialization. After
display SRAM initialization, the registers in page 1 to page 5 can be
configured via i2c interface.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/leds/leds-aw200xx.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 842a22087b16..d8f2fe57cbb7 100644
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
@@ -517,6 +538,14 @@ static int aw200xx_probe(struct i2c_client *client)
 	if (IS_ERR(chip->regmap))
 		return PTR_ERR(chip->regmap);
 
+	chip->hwen = devm_gpiod_get_optional(&client->dev, "enable",
+					     GPIOD_OUT_HIGH);
+	if (IS_ERR(chip->hwen))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->hwen),
+				     "Cannot get enable GPIO");
+
+	aw200xx_enable(chip);
+
 	ret = aw200xx_chip_check(chip);
 	if (ret)
 		return ret;
@@ -537,6 +566,9 @@ static int aw200xx_probe(struct i2c_client *client)
 	ret = aw200xx_chip_init(chip);
 
 out_unlock:
+	if (ret)
+		aw200xx_disable(chip);
+
 	mutex_unlock(&chip->mutex);
 	return ret;
 }
@@ -546,6 +578,7 @@ static void aw200xx_remove(struct i2c_client *client)
 	struct aw200xx *chip = i2c_get_clientdata(client);
 
 	aw200xx_chip_reset(chip);
+	aw200xx_disable(chip);
 	mutex_destroy(&chip->mutex);
 }
 
-- 
2.36.0


