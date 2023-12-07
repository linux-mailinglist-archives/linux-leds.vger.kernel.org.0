Return-Path: <linux-leds+bounces-296-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055B8088AC
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 14:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5BF1F2139C
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3573D0DF;
	Thu,  7 Dec 2023 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="hAeLIl3z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65FC10B;
	Thu,  7 Dec 2023 05:00:00 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 563E8100004;
	Thu,  7 Dec 2023 15:59:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 563E8100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701953999;
	bh=GY597t9bNMfE8L/JYxzrDZ2BNTho7Ti4uvnl1pJPCxw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=hAeLIl3z2B4Tpd8uu8PnB3cbBWLcoKZkSgLZNY6+sVAJZz4Que39EvpVWLwAa6BCI
	 Tyj61ixQfHbJzidhY+JFbM2RKsIej9lcFEH0DuySFzB7grF8G+gz7kd6tCbJbnb2XS
	 Zv71ZrHlGK0F/eAphkzY9kkboNcJaPJABup5w3s4VCLTwsF2+gOx7e9zqpEHRDcYUa
	 oMEAY3g25ttPdB5iYkrtqKxXiFrzIzf/9gT9aOSz7skLnumQ8lKW9Q0O1IQrodO26P
	 jHBZb/+xefr0HRHmEhZJrHjEqvt23uiV9w7HZoBcWgoTxnQ0EoElqudWuG9MtWEngI
	 tTkEIHF+xSZeQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Dec 2023 15:59:59 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 15:59:58 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1 0/2] leds: aw200xx: support for hw pattern controllers
Date: Thu, 7 Dec 2023 15:59:36 +0300
Message-ID: <20231207125938.175119-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181937 [Dec 07 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/07 02:56:00 #22627289
X-KSMG-AntiVirus-Status: Clean, skipped

This led-controller supports 3 pattern controllers for auto breathing or
group dimming control. Each pattern controller can work in auto
breathing or manual control mode. All breathing parameters including
rising/falling slope, on/off time, repeat times, min/max brightness
and so on are configurable.

Martin Kurbanov (2):
  leds: aw200xx: support for hw pattern controllers
  dt-bindings: leds: aw200xx: add 'interrupts' property

 .../testing/sysfs-class-led-driver-aw200xx    | 108 +++
 .../bindings/leds/awinic,aw200xx.yaml         |   6 +
 Documentation/leds/leds-aw200xx.rst           | 274 ++++++++
 drivers/leds/leds-aw200xx.c                   | 649 ++++++++++++++++++
 4 files changed, 1037 insertions(+)
 create mode 100644 Documentation/leds/leds-aw200xx.rst

--
2.40.0


