Return-Path: <linux-leds+bounces-3288-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BBD9BD55F
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 19:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDBCD281809
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 18:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC9F1F4FCA;
	Tue,  5 Nov 2024 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="GoQ4aj2d"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE411E7C16;
	Tue,  5 Nov 2024 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832645; cv=none; b=a4upg/6zEmbjATtnuX7R6RRwjpkz2Hm7pSe2gnqGWZucupuLTz3XVn4eO+pTZcAlAN6khMYxH4KjCdRdC70k9XKVofdP+j8QgAN3UtypV5ktHv/FkAPSRiAwcvBUJZicMzyDDcfMkEqqsLWAF4UwieuIV5q2RYx61LqvQvl0vNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832645; c=relaxed/simple;
	bh=VAX0+82+Fngu708Lh3AZW1e6Egd2QTv/qONgohR6bRA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XYrvq5TkyiBq32dlA5cwoalYT+0jIrvXtFYEbA9XmXMaoYo7VZiFKyKwxg+tdmCjB7My1BxZxqQay8tiNO9d+IulDIW6USI3c4guKCFRBYuoTCZ2rdH0nCca//2X32yXbbMJFf7mGeTBfIqeyXmD6QVoG6lBJdTUn//l6zgtWxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=GoQ4aj2d; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BC14F100016;
	Tue,  5 Nov 2024 21:50:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BC14F100016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730832628;
	bh=y6nAAzzkMDWuNh//5mJoh4cSqksisQKY3QkAgnMbq5E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=GoQ4aj2dIIuKphyj3RjeeaqZx/TL/S6BKSZQLzQHgYMJ6EN/wn4jIL8r4mrv6Dd2q
	 L9VpCDttQnyZ3qUmJSAB6T94NP2C5ibCdlZUoKsbEsB6XMSTWFSyFxfXXIQw2fBLTI
	 IRdGXhtgibbq8C+G5dclu3Y605Q3xLaKp/Vylg60rdb8VhgsD5O2FvwsouTo9vhsvw
	 OOkQjDLkAan8tk8qTEVpmuTK1GTaFuHC2nDG8brgkGDum6i9IfUvmgdNK1M/qyjkyN
	 SIA4iPL1n/2OQnYT5wvTxJj5twuLqrgl8W5q4H3lKvO5W021NCA6T0MYOOnp4y3Eui
	 2sIZTx+v47Qpg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  5 Nov 2024 21:50:28 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [RESEND PATCH v2 0/2] leds: pwm: Add default-brightness property
Date: Tue, 5 Nov 2024 21:50:04 +0300
Message-ID: <20241105185006.1380166-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
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
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/05 17:30:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/05 17:47:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/05 17:19:00 #26822794
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


