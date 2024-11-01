Return-Path: <linux-leds+bounces-3231-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8689A9B94B8
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 16:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A941A1C20DAB
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 15:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DA81C760A;
	Fri,  1 Nov 2024 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="esQxyEFG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA72CAB;
	Fri,  1 Nov 2024 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476136; cv=none; b=gLCjUcfmDr18LFXXJoymxGJ60WDLgPOMhO5+apLCfL61OVzCzH2/n1Dk8h+M1Gh1sFYQThQl+YDmhz12I9hsxPgasWNhEbQQZIrDiuCrQLEhwndInG7ubmo7nkxMoz+Hckix8jlqLej+mjo1ocSLA7riU7mf0txyxgyANhqF0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476136; c=relaxed/simple;
	bh=VAX0+82+Fngu708Lh3AZW1e6Egd2QTv/qONgohR6bRA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gWyiY4auXqwmukQc7AKtdEs5+7hAgyMUQR2Y6Pkvtp0atEW6/NT4WEyBbOStyv+AJLPX9lRIbvhb2Pwz9x1gvmR4hS5RfRFyHMJkuC4QiR67VcBF590dixc564NlzJHgelSPB8kDm1ZvEVGjweP6bcmj9Kk1jHG9NIZJJFxxg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=esQxyEFG; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 459A5120019;
	Fri,  1 Nov 2024 18:48:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 459A5120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730476132;
	bh=y6nAAzzkMDWuNh//5mJoh4cSqksisQKY3QkAgnMbq5E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=esQxyEFGffJ8kEkICowqUGUXgUM/WcUBdrQbsjZTaS2vPYHTPnLpv/DhfJD9MKp3/
	 Upv8h9OLhqoSGETHHFRJSRi7aWVrkEMk4LEbl1HQvOYK0tf+B4m1VpBDftcQ6zHZ08
	 +4P4eaR7ObOMjGxoB2aNMy+KiB6czbzV2P5BWigFTeXhmhIKsm32JZxxnov+SDr4gT
	 v9qscAYIttF1V0aXee7eyoya/fVlCbpjJyUgKZnfmUvh2ITmq+dkw8tALm9o8xDjlL
	 B85teiedzJDVQS8l6bKeqo5DsUPDvniVYLtzlNmJX9hXrYi3AmWzSiCLXhIi+y7mGO
	 WBi3P/MquOpFA==
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
Subject: [PATCH v2 0/2] leds: pwm: Add default-brightness property
Date: Fri, 1 Nov 2024 18:48:42 +0300
Message-ID: <20241101154844.1175860-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
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
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/01 15:17:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/01 15:16:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/01 12:35:00 #26800049
X-KSMG-AntiVirus-Status: Clean, skipped

led-pwm driver supports default-state DT property and if that state is on then
the driver during initialization turns on the LED setting maximum brightness.
Sometimes it's desirable to use lower initial brightness.
This patch series adds support for DT property default-brightness.

Things to discuss:
If such a property is acceptable it could be moved to leds/common.yaml due to
several drivers support multiple brightness levels and could support the property
too.

Changes in v2:
  leds: pwm: Add optional DT property default-brightness
    - refactor patch to make it more accurate
  link to v1: [1]

[1] https://lore.kernel.org/lkml/20241015151410.2158102-3-gnstark@salutedevices.com/T/

George Stark (2):
  dt-bindings: leds: pwm: Add default-brightness property
  leds: pwm: Add optional DT property default-brightness

 .../devicetree/bindings/leds/leds-pwm.yaml      |  6 ++++++
 drivers/leds/leds-pwm.c                         | 17 ++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

--
2.25.1


