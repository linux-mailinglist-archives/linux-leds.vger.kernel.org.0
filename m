Return-Path: <linux-leds+bounces-3098-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56299F0CA
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 17:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 087C8B2139D
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 15:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8FC1CBA14;
	Tue, 15 Oct 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="siujvhGl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8221CBA09;
	Tue, 15 Oct 2024 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005271; cv=none; b=aWJDsTtflwG7stRw7r8JPF+ZtEZIr1PfcbjDJA6fefDrWUzF1+tVfx/cAiDHRRQiWw1+4mAmaBvXkWfLVcVPpkQJZRksYoLO6XouUZKO5tTKTusRBhqQiBGP7x9YJWOrL/j+MsLoW/DoezpI1t54YAPVLgSRBHZbKv+iQVKrrbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005271; c=relaxed/simple;
	bh=af5hA12wtCgJgRQxCM6+7ungS/ZgJoHvpxVS3/Qw6jw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dpncu2apDVgsoUleagclPlGvFMpq63VuJ/Dd+DkQGMTH1ZCv6ISJElo5ZpnWUE+fzdYwXvBeadyu7qSlCeBUGsRW2BJPl9dmUFjjl3aE21NeCuy/g6nhV1Mt42r2sswL4y60lowqbio7muew9sTzeq6SOO7uM95v66eK6cV3IWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=siujvhGl; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6BAF4120002;
	Tue, 15 Oct 2024 18:14:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6BAF4120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729005258;
	bh=KcDB/6bAqUSW6IHwbKmuuiRhmj/TWddIdiCUfYTr50A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=siujvhGlHeicx9I4Ic47DKSN7Exv//wgBMbbQjGyAiV/dVzE08M213xmDg6Ri/ARL
	 YWzjHE4dvGdKR/miaYBmNMnu1/sAhunzHuxNT0O/xp5EuaNdhHJjK4prhDXrWcp3vr
	 aOcjkVfDeByQDzI2C+cZnlDH8jADVSG5Q5xf6k6RmT1PuWbW2+ESvp/qQOZXiU2YlG
	 DS3nM8IMBHMdl6wBQKGwzXJIQN+/qCGU2iLJNrIM/B5qhwlxEqlrzp7eYwITc3KFnV
	 IWAVVKg+6nFIPkju2fu6dDMvaXSctKtfm5DahMYIJTsGRsp71IXesyzp2NVvA2cLja
	 YSFYfLpuTu26Q==
Received: from smtp.sberdevices.ru (unknown [172.16.192.103])
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
Subject: [PATCH 0/2] leds: pwm: Add default-brightness property
Date: Tue, 15 Oct 2024 18:14:08 +0300
Message-ID: <20241015151410.2158102-1-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/15 13:03:00 #26756955
X-KSMG-AntiVirus-Status: Clean, skipped

led-pwm driver supports default-state DT property and if that state is on then
the driver during initialization turns on the LED setting maximum brightness.
Sometimes it's desirable to use lower initial brightness.
This patch series adds support for DT property default-brightness.

Patch series is prepared for linux-next

Things to discuss:
If such a property is acceptable it could be moved to leds/common.yaml due to
several drivers support multiple brightness levels and could support the property
too.

George Stark (2):
  dt-bindings: leds: pwm: Add default-brightness property
  leds: pwm: Add optional DT property default-brightness

 .../devicetree/bindings/leds/leds-pwm.yaml          |  6 ++++++
 drivers/leds/leds-pwm.c                             | 13 ++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

--
2.25.1


