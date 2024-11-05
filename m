Return-Path: <linux-leds+bounces-3286-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EB09BD557
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 19:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BECD28420B
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 18:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF1F1EBA11;
	Tue,  5 Nov 2024 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="avA+uQq6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE01CAA4;
	Tue,  5 Nov 2024 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832642; cv=none; b=QnBrej7kFdmpmTN7mP7Jq+Ql2FblvEP2BjcSlDyGOt4JoN0VFu8RW3jKf8rgTAIRilf1w75IEMNs0DJd4ZXERnN8FYCNiiX9cdNG3BKjD2hYEkZLyUTpEi1uO72VatBv7F4geG0A+SwDGW+L3cYflInQWljuBFRAVMDE65Ybq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832642; c=relaxed/simple;
	bh=tc33BlF+++yaNIJrDdxxet0iPbWU0odSLWUHCkJbMYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYeK7DQqEBvdNXEgkUO/VAkDLua7V6TqKvFvpvuPXZDjovalNuZ9P8Cd88t+Fm5mgnCUL2VYW2zVA23uVh8drwc4kskWhBlzSQsyNp6t6SQCZueInJeIEgpiOhTS1SJIAZR7OZO821uS8qrAmS8RkGRM0SkIRr1oGZfr3zvY5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=avA+uQq6; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 36361100026;
	Tue,  5 Nov 2024 21:50:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 36361100026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730832629;
	bh=1MON+KDxVDacLvuo/uLJDGvIBD9XWHkJIUeNVWR1IGQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=avA+uQq6CNZr6TY81bkvve5xZcQUCPeik6szq0L+vuXKRVcTMY2VfaSdsbQKKJNiV
	 rW7IB9vibvyFEdMDwpj7ITZOAsK4l95Btosz+Ku99PQ9ssxnp76HYhJdqlWrngVEFH
	 NTmoswms6H70srXEPUuBlylRwYiEB/zENbwN+5bG2IT0JEaDMUfbkUul+YWRWg8EoK
	 s04Zs/qw5t1vtfT9ZBL87eCsJGAXAwLjk42IxDh1fQNAZHeiqcKEfX6CO4XRG6z4lt
	 xswpmsyoMSdsXzOiemsu6auGevQ8HHUwWk2dfmDO+l1ZB+eaYF/RPznY3G7+HBP/yO
	 bt+hJps2EGXZA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  5 Nov 2024 21:50:29 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [RESEND PATCH v2 2/2] leds: pwm: Add optional DT property default-brightness
Date: Tue, 5 Nov 2024 21:50:06 +0300
Message-ID: <20241105185006.1380166-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105185006.1380166-1-gnstark@salutedevices.com>
References: <20241105185006.1380166-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188977 [Nov 05 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/05 17:19:00 #26822794
X-KSMG-AntiVirus-Status: Clean, skipped

When probing if default LED state is on then default brightness will be
applied instead of max brightness.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-pwm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e1b414b40353..a591cc399704 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -63,6 +63,20 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	return pwm_apply_might_sleep(led_dat->pwm, &led_dat->pwmstate);
 }
 
+static int led_pwm_default_brightness_get(struct fwnode_handle *fwnode,
+					  int max_brightness)
+{
+	unsigned int default_brightness;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "default-brightness",
+				       &default_brightness);
+	if (ret < 0 || default_brightness > max_brightness)
+		default_brightness = max_brightness;
+
+	return default_brightness;
+}
+
 __attribute__((nonnull))
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
@@ -104,7 +118,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	/* set brightness */
 	switch (led->default_state) {
 	case LEDS_DEFSTATE_ON:
-		led_data->cdev.brightness = led->max_brightness;
+		led_data->cdev.brightness =
+			led_pwm_default_brightness_get(fwnode, led->max_brightness);
 		break;
 	case LEDS_DEFSTATE_KEEP:
 		{
-- 
2.25.1


