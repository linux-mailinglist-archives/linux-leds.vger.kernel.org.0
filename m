Return-Path: <linux-leds+bounces-402-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F758138A7
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1810B20A2B
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 17:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B4465EDF;
	Thu, 14 Dec 2023 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="vf3iDbz/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7530E114;
	Thu, 14 Dec 2023 09:36:26 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 070AC100011;
	Thu, 14 Dec 2023 20:36:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 070AC100011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702575385;
	bh=h+tOY1bGBGofUvQs5Gx6JcaxFJQ0t9mJrPXrCf8ZZ+M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vf3iDbz/Hf5f3AZLMQGgmqCE267TVwZ5mAyGWJkbUScHS2C9LWP2mYXmQ9KA7oimr
	 c1jEhhaxuIcA1z8eIdcFFNnkvvt5dzlAeSYQfq+Z21rwCo4DYP4UCZsvMEJwyjQq8b
	 ukn/3ecALO6VdMbpwhC1EFYHUABJdY3eL6JyWe9I3daJH3gIl73KqumZBEvzkI9ShM
	 qCgHDHYrscJwWl1duKceuqhnh1Wx/TAzVuzAx5A6h/c50mK3b2Il1bYzV3kWCO/y3w
	 kX3/2lH+FG8R8Wzdfkl48OgkJ/rZomGDC+8M+ermO16IVYRkUtIgngGeZpAxbJKDS8
	 7NlzSPonW0i/A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 20:36:24 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 20:36:24 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>, Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v4 03/10] leds: aw2013: use devm API to cleanup module's resources
Date: Thu, 14 Dec 2023 20:36:07 +0300
Message-ID: <20231214173614.2820929-4-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214173614.2820929-1-gnstark@salutedevices.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Lua-Profiles: 182125 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 10:50:00 #22693095
X-KSMG-AntiVirus-Status: Clean, skipped

In this driver LEDs are registered using devm_led_classdev_register()
so they are automatically unregistered after module's remove() is done.
led_classdev_unregister() calls module's led_set_brightness() to turn off
the LEDs and that callback uses resources which were destroyed already
in module's remove() so use devm API instead of remove().

Signed-off-by: George Stark <gnstark@salutedevices.com>
Tested-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/leds/leds-aw2013.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index c2bc0782c0cd..863aeb02f278 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Driver for Awinic AW2013 3-channel LED driver
 
+#include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -318,6 +319,11 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	return 0;
 }
 
+static void aw2013_chip_disable_action(void *data)
+{
+	aw2013_chip_disable(data);
+}
+
 static const struct regmap_config aw2013_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -334,7 +340,10 @@ static int aw2013_probe(struct i2c_client *client)
 	if (!chip)
 		return -ENOMEM;
 
-	mutex_init(&chip->mutex);
+	ret = devm_mutex_init(&client->dev, &chip->mutex);
+	if (ret)
+		return ret;
+
 	mutex_lock(&chip->mutex);
 
 	chip->client = client;
@@ -378,6 +387,10 @@ static int aw2013_probe(struct i2c_client *client)
 		goto error_reg;
 	}
 
+	ret = devm_add_action(&client->dev, aw2013_chip_disable_action, chip);
+	if (ret)
+		goto error_reg;
+
 	ret = aw2013_probe_dt(chip);
 	if (ret < 0)
 		goto error_reg;
@@ -398,19 +411,9 @@ static int aw2013_probe(struct i2c_client *client)
 
 error:
 	mutex_unlock(&chip->mutex);
-	mutex_destroy(&chip->mutex);
 	return ret;
 }
 
-static void aw2013_remove(struct i2c_client *client)
-{
-	struct aw2013 *chip = i2c_get_clientdata(client);
-
-	aw2013_chip_disable(chip);
-
-	mutex_destroy(&chip->mutex);
-}
-
 static const struct of_device_id aw2013_match_table[] = {
 	{ .compatible = "awinic,aw2013", },
 	{ /* sentinel */ },
@@ -424,7 +427,6 @@ static struct i2c_driver aw2013_driver = {
 		.of_match_table = of_match_ptr(aw2013_match_table),
 	},
 	.probe = aw2013_probe,
-	.remove = aw2013_remove,
 };
 
 module_i2c_driver(aw2013_driver);
-- 
2.25.1


