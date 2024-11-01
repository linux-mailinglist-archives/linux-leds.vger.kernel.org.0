Return-Path: <linux-leds+bounces-3232-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C401F9B94BB
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 16:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003581C20BC3
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 15:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC581C9B65;
	Fri,  1 Nov 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="DgWB++Ch"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2315B0E2;
	Fri,  1 Nov 2024 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476137; cv=none; b=o8ywSKeqhIiab+TSnxaQFGORJb4RcKJMQl7f+h4RRKbVZiU5+yqIsaqxM2F6MFnCmd1lhJQqN9gD+nOWCxXx/83rlycrz8m4/HwOb+N/wCNOd7wqxpo0eowIKvNHjiPYq90mtCDqQS/elkB3mfyjaBQj4HkZhw5V3u0YUslab14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476137; c=relaxed/simple;
	bh=lazf32CoxSyj614cm2Mrmcr74+H3vT0Umdqs2/LXc+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+JFYVMnXV1lWpBsL1HpRmKngN3F9B5Aj2YLtsp8tJ7Z1lL0nFYh1OgNBCOMk/sqQqO5ULTjeWwiZBw6mv5QgX+wwBzQZ3jICz+F+kzBStdqgkub8yzPNraAYa/7P/7BEQLICQmGoprtFhWgabL51Kxj0cgTw/nvl+AXBJT7KGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=DgWB++Ch; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 785B012001D;
	Fri,  1 Nov 2024 18:48:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 785B012001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730476132;
	bh=DgHLH+41zl5GK77OYraBFgcXwbuWqP38YKFjixubQRc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=DgWB++ChLjYNAEguWSNY5bTsOCmrrDyU/JhFxWxHl+HyfXwrYqJRTkW2UaiGWQT4c
	 sgGtgictT5SPvYgVGVsefL7OekTMFJ5Z0x2AI+Imd56kxBgVXZ/Hk25cfgkWn5Pz2V
	 aZcnKJtX0oiyceY0OSJxwEA985HlLBasGpCdWGxG1gMhwffQpyE30T6iPl32NaqSnH
	 g3KtgpVfCr5eUNTenhX9tzQY1NcDIHXQU4iiiuAXz/yAYAL5qIfD/dZNsJc1BvSg1U
	 +mKj2fheHkGUmYLq6/RrhC7o9qdCIcHEkngk+NvEFb+d4T3SxCZImPS/uF5Xti0wtV
	 dx34dQHl0vahw==
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
Subject: [PATCH v2 1/2] dt-bindings: leds: pwm: Add default-brightness property
Date: Fri, 1 Nov 2024 18:48:43 +0300
Message-ID: <20241101154844.1175860-2-gnstark@salutedevices.com>
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

Optional default-brightness property specifies brightness value to be
used if default LED state is on.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 113b7c218303..61b97e8bc36d 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -34,6 +34,12 @@ patternProperties:
           Maximum brightness possible for the LED
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      default-brightness:
+        description:
+          Brightness to be set if LED's default state is on. Used only during
+          initialization. If the option is not set then max brightness is used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
     required:
       - pwms
       - max-brightness
-- 
2.25.1


