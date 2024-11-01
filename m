Return-Path: <linux-leds+bounces-3233-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37B9B94BE
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 16:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8508D1F221F8
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 15:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EE71C9B97;
	Fri,  1 Nov 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Puwmproe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689CF145A17;
	Fri,  1 Nov 2024 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476137; cv=none; b=Gd5sjkIZJl9q1rBzM9jDTPkkcQwjjQj/Ss2IcyX9YRaVSagWNK/vNiS3aOWqQ5lEA6PUhiRv3WHIuCZ8QwhAdsJDhtBQWBYIClcCArJ2iDR1Fakwvni856HbjVDpwiinOaSAzW2TIh7L/cD+8EsVM4jn/AGQo3sssLZjoY4t3X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476137; c=relaxed/simple;
	bh=owxthw8apBkSEWYqs4yWEGhY3z/N/jKewtQA8W3IS6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAp5WwA1F9QWCJrr2AK31/gVSZH1F8TbSdpuVTZhROQ0/BsmtIHvxclzyx3rEVjStlFKnOPaQkXk5fXZ5iPgBWT27Zq3MrnP3UMYIgpj6pO/Mz/7AgZSe0bRwOcL/qiRiJzuYXwDN2M9cQAVXyycDiiiyvKSWWnd8z+j6jlB9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Puwmproe; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id ADF0912001E;
	Fri,  1 Nov 2024 18:48:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru ADF0912001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730476132;
	bh=Gzt6Advx4UA3v5SWZS0PBIz63eWIsrEtoOW6jR3P4MQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=PuwmproesWqVjgnD5FEo83cKFfO6XHX+GIXQKFKGXpLdnhHoLMMZBc4yY6FaweMeA
	 GDo2LS18MjrzFP996lf+iOdmyR7KmAZsERyUQCh9z2K4+8uhsDXiqzwFYQ2opTBTNJ
	 HZhedhi62LduB1rSq2HrqXwaK1OLtFSqPIh+H6WID4BBqoEBBVOeaW/7TC+YJuUJQh
	 hRhK001MOGWatH+R96lNuiXsOFK2MPtYHHaZcIqPKRcogKXyx/GSDfb4Zxz4O46C0p
	 GOY3PDa1EgzqSSnEO0T22H4E9/cFgpsde8nli/RBNqP7wYlkzH1LWFZHeqa8CxINbw
	 nzdlkeTxTVjQg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  1 Nov 2024 18:48:52 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH v2 2/2] leds: pwm: Add optional DT property default-brightness
Date: Fri, 1 Nov 2024 18:48:44 +0300
Message-ID: <20241101154844.1175860-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241101154844.1175860-1-gnstark@salutedevices.com>
References: <20241101154844.1175860-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188910 [Nov 01 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/01 12:35:00 #26800049
X-KSMG-AntiVirus-Status: Clean, skipped

When probing if default LED state is on then default brightness will be
applied instead of max brightness.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-pwm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 7961dca0db2f..7636ee178c39 100644
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


