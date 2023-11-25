Return-Path: <linux-leds+bounces-154-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A827F8E61
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51DC12814CA
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 20:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D0230D12;
	Sat, 25 Nov 2023 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="mq6VVJqw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2EB119;
	Sat, 25 Nov 2023 12:05:30 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 847E3120019;
	Sat, 25 Nov 2023 23:05:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 847E3120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700942729;
	bh=BXsUy6knDdfRassvseCqdaHwjejZFvkBLqoOvbLPVsc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=mq6VVJqwpX8ISnyXUDlWPJHrCHZILiiqQfHI/zeHuCcOV44V37+apPrp2xDSGBqrb
	 VjDPgEzAwT+6nwjVBsS864I22jMrVbHvZdYKedq/rFaULXAOy8mccm8f92UYxAVKJn
	 /cGOab/UDyC4w3K24Y7ADur0mJ5Tjg5gvhL+XQ1xOcA2hR5Bk8/NEnTfMG8M5D1XHY
	 at9enUs0tDBXftrxju/Ms1YaVFRC7mMSHPLJIPBi9oPPGWmY3ARumhZnHPWfpwBMQH
	 JRtdV07cCJkdqXc+4+dWcsxrttGyncE0aTdhzLFkkSZBjKeRVgAoEn1tABfLzsIZFP
	 XHGfbewUorPaA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 25 Nov 2023 23:05:29 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 25 Nov 2023 23:05:29 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, George Stark <gnstark@salutedevices.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v5 04/11] leds: aw200xx: calculate dts property display_rows in the driver
Date: Sat, 25 Nov 2023 23:05:12 +0300
Message-ID: <20231125200519.1750-5-ddrokosov@salutedevices.com>
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

Get rid of device tree property "awinic,display-rows". The property
value actually means number of current switches and depends on how LEDs
are connected to the device. It should be calculated manually by max
used LED number. In the same way it is computed automatically now.
Max used LED is taken from LED definition subnodes.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/leds/leds-aw200xx.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index d8f2fe57cbb7..91ba580edf87 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -379,6 +379,31 @@ static void aw200xx_disable(const struct aw200xx *const chip)
 	return gpiod_set_value_cansleep(chip->hwen, 0);
 }
 
+static int aw200xx_probe_get_display_rows(struct device *dev,
+					  struct aw200xx *chip)
+{
+	struct fwnode_handle *child;
+	u32 max_source = 0;
+
+	device_for_each_child_node(dev, child) {
+		u32 source;
+		int ret;
+
+		ret = fwnode_property_read_u32(child, "reg", &source);
+		if (ret || source >= chip->cdef->channels)
+			continue;
+
+		max_source = max(max_source, source);
+	}
+
+	if (max_source == 0)
+		return -EINVAL;
+
+	chip->display_rows = max_source / chip->cdef->display_size_columns + 1;
+
+	return 0;
+}
+
 static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 {
 	struct fwnode_handle *child;
@@ -386,18 +411,10 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 	int ret;
 	int i;
 
-	ret = device_property_read_u32(dev, "awinic,display-rows",
-				       &chip->display_rows);
+	ret = aw200xx_probe_get_display_rows(dev, chip);
 	if (ret)
 		return dev_err_probe(dev, ret,
-				     "Failed to read 'display-rows' property\n");
-
-	if (!chip->display_rows ||
-	    chip->display_rows > chip->cdef->display_size_rows_max) {
-		return dev_err_probe(dev, ret,
-				     "Invalid leds display size %u\n",
-				     chip->display_rows);
-	}
+				     "No valid led definitions found\n");
 
 	current_max = aw200xx_imax_from_global(chip, AW200XX_IMAX_MAX_uA);
 	current_min = aw200xx_imax_from_global(chip, AW200XX_IMAX_MIN_uA);
-- 
2.36.0


