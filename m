Return-Path: <linux-leds+bounces-153-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3127F8E60
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE00A1F20D3A
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 20:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0E330D05;
	Sat, 25 Nov 2023 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="lQTIvF8Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2996718C;
	Sat, 25 Nov 2023 12:05:33 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C16DE12001D;
	Sat, 25 Nov 2023 23:05:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C16DE12001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700942731;
	bh=Nz6KMI06TAaOZ9MntU69qR3R1MQfjHcEyVZW5vm7XRg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lQTIvF8QnLV5wyaSvYRsggp9VWwurc4dhac7y3yQt28HL6ZXQCDPShRFmqCBTFSd+
	 7ovtRVrSe0NiEzcYC4GG1PS96N+ekfA+drualE/farafqN37EvTDQ8DxbxEDzjmLXG
	 CyHESYRwN4d64YNOOpdWPoxr+6ndfVfEEnHWCs0BVVM7z9XWFP4LzoB0aWbimbq1Ez
	 h2i2wwUJDMtpGVeWfOo9inU2k4M1vNOZfrly6FAB59ol/0FjuAiOKksRgYMBvrq+XF
	 i8NLMpD+J7ofDUBZwD7U5oqwAfreeh2BpquCQSCB3EE3Lwyar6g5AK8fK9KwtnYdSZ
	 ER3QALOd28nIA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 25 Nov 2023 23:05:31 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 25 Nov 2023 23:05:31 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, George Stark <gnstark@salutedevices.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v5 08/11] leds: aw200xx: improve autodim calculation method
Date: Sat, 25 Nov 2023 23:05:16 +0300
Message-ID: <20231125200519.1750-9-ddrokosov@salutedevices.com>
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

From: George Stark <gnstark@salutedevices.com>

It is highly recommended to leverage the DIV_ROUND_UP() function as a
more refined and mathematically precise alternative to employing a
coarse division method.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-aw200xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index c6a51152a494..e125b6c68c23 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -87,6 +87,8 @@
 #define AW200XX_REG_DIM(x, columns) \
 	AW200XX_REG(AW200XX_PAGE4, AW200XX_LED2REG(x, columns) * 2)
 #define AW200XX_REG_DIM2FADE(x) ((x) + 1)
+#define AW200XX_REG_FADE2DIM(fade) \
+	DIV_ROUND_UP((fade) * AW200XX_DIM_MAX, AW200XX_FADE_MAX)
 
 /*
  * Duty ratio of display scan (see p.15 of datasheet for formula):
@@ -195,9 +197,7 @@ static int aw200xx_brightness_set(struct led_classdev *cdev,
 
 	dim = led->dim;
 	if (dim < 0)
-		dim = max_t(int,
-			    brightness / (AW200XX_FADE_MAX / AW200XX_DIM_MAX),
-			    1);
+		dim = AW200XX_REG_FADE2DIM(brightness);
 
 	ret = regmap_write(chip->regmap, reg, dim);
 	if (ret)
@@ -462,6 +462,7 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 		led->num = source;
 		led->chip = chip;
 		led->cdev.brightness_set_blocking = aw200xx_brightness_set;
+		led->cdev.max_brightness = AW200XX_FADE_MAX;
 		led->cdev.groups = dim_groups;
 		init_data.fwnode = child;
 
-- 
2.36.0


