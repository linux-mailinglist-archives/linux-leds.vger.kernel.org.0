Return-Path: <linux-leds+bounces-3099-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F04999F0F4
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 17:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53566283652
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 15:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86911CBA11;
	Tue, 15 Oct 2024 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="dBA0OsQg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE851CB9F0;
	Tue, 15 Oct 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005766; cv=none; b=tCMvbi0bWsA3ywS8MrcVx9M03JpGjXV7er7sSaCDCFdWn3JXkRxbNAKAF0CDtUiPmjYGAAQC6RQ9Wbfx7dOmf1BCHN2sNiB99/d3q+p6nJqct3VhI4e0Ij0kxpovdqV2/qRspfxEp8NdyDVZFl24UzKkaw8PRyV7EF46C8Vazic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005766; c=relaxed/simple;
	bh=V/lSdhZG5JQdZTKZUF2yHDoCzCh4qnhs8hMlIfBsvJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ON3O0g43l5qKsxMkb/lovBwgOwI9BgSuf5wH4I4luFIDFPfgq+xvChXDDe7JVrm1ka3YTwwSyZFl+QJycVU6pz9jGaK2si4A7tnFWNPsHpDIvEk1n3mtcgSVzIhp++FJH+basJyt4wJbM5OKetrzMKYZWVEXzUeewOnFZJLpb3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=dBA0OsQg; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C45DC10000B;
	Tue, 15 Oct 2024 18:14:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C45DC10000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729005258;
	bh=W+KmumfI3s3WpmWV3OWJsuZ0UfZfjFsxZ9apYOIiG2w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dBA0OsQgzVaaOLxU3KTV9Zpl431KR15/Kqsy1zwihxCC6lzk9ztagdkm6eVc8ot1I
	 MinCvPJwKQ4j+A6hdrSTshGcgEwknbJPc3dO7mqr1jNRXOv1U8WgbbMMPoEo1BD4qX
	 WjTzwSGsVvNw+BH1kwZk+gceTLcGsgfK5ScvmkX3rMCrULI033KTvUF6u9u+OauNK3
	 HfoSlcBynlYAhgi9dyG2Br9eqqxP2OF1gonol2FsLXcC+m46Fc6eBFnm9do3+BgvoN
	 wonEFrWkQVM6uYCGBuQG8vDchtf5spCiu8mOOtiPKExE1fC0+ZetPHpnaB+ZJwuO5Q
	 F8mdkTuEyh/5w==
Received: from smtp.sberdevices.ru (unknown [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 15 Oct 2024 18:14:18 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH 2/2] leds: pwm: Add optional DT property default-brightness
Date: Tue, 15 Oct 2024 18:14:10 +0300
Message-ID: <20241015151410.2158102-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241015151410.2158102-1-gnstark@salutedevices.com>
References: <20241015151410.2158102-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188453 [Oct 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/15 13:03:00 #26756955
X-KSMG-AntiVirus-Status: Clean, skipped

When probing if default LED state is on then default brightness will be
applied instead of max brightness.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-pwm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 7961dca0db2f..514fc8ca3e80 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -65,7 +65,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 
 __attribute__((nonnull))
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
-		       struct led_pwm *led, struct fwnode_handle *fwnode)
+		       struct led_pwm *led, struct fwnode_handle *fwnode,
+		       unsigned int default_brightness)
 {
 	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
 	struct led_init_data init_data = { .fwnode = fwnode };
@@ -104,7 +105,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	/* set brightness */
 	switch (led->default_state) {
 	case LEDS_DEFSTATE_ON:
-		led_data->cdev.brightness = led->max_brightness;
+		led_data->cdev.brightness = default_brightness;
 		break;
 	case LEDS_DEFSTATE_KEEP:
 		{
@@ -141,6 +142,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 {
 	struct led_pwm led;
+	unsigned int default_brightness;
 	int ret;
 
 	device_for_each_child_node_scoped(dev, fwnode) {
@@ -160,7 +162,12 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 		led.default_state = led_init_default_state_get(fwnode);
 
-		ret = led_pwm_add(dev, priv, &led, fwnode);
+		ret = fwnode_property_read_u32(fwnode, "default-brightness",
+					       &default_brightness);
+		if (ret < 0 || default_brightness > led.max_brightness)
+			default_brightness = led.max_brightness;
+
+		ret = led_pwm_add(dev, priv, &led, fwnode, default_brightness);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1


