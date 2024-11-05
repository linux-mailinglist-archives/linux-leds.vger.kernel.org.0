Return-Path: <linux-leds+bounces-3287-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CEB9BD558
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 19:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7392817BE
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 18:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D559F1F471F;
	Tue,  5 Nov 2024 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="N3mhdkb0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFFB1EB9EC;
	Tue,  5 Nov 2024 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832642; cv=none; b=hPC6kh7Cyk6beYzxKT2J2zBIa4dAzUYzc1OuCNkVJZM/OC5++Eutt0uj9UOtUJabkn3I7C3mMmFkhe94qpFD/yuD71asgB79YqUp1LRds2Bw6zEFvvLusUC4Bhb40EcFJrFgynRR1Oh6qGWlE5j+GH565AVmbeeST8hygc/tPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832642; c=relaxed/simple;
	bh=3Lk9YQDRiu7Xe9+9aR1SOK4PXEo0DGhpzguMq2dFRrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSz4kNdh5f9iidYjMp7zOhzkGzr4d/4dfxX08MpqJhzKonDh5PFTnjzGvj0AwMZ1UV3WUCTTJrjuBZIIMhvJi1zZyX/1IMA7HQBTJYZafu4XGS9Q3FAGxWR4IJwuJVzF3YxVMrAplgfEG1BB2h4FRXAOLTjmjYbX75Lt5w/scv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=N3mhdkb0; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 00E1812001A;
	Tue,  5 Nov 2024 21:50:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 00E1812001A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730832629;
	bh=0uko2DGOqBQDkeDEpra5tojET53uvNmONL7PkmqRMAk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=N3mhdkb0Zgh+f0xsXAtTojVzWRxEkPo+eO1cAb84579jSRG5YC5dwDqAFTDQNmizl
	 UqMWhSTFspikdZyMMopSVB5XYcfmQw4vuHTPJsuxg26a8VFFkHJGq0KWJ/H54PJ15n
	 2UJwcKObbLfIGSiG6NevcPlu1iIB1GsgSx3IUKyjb+7xmXtzvkTw6LtwxyUpnSPSF8
	 IievDLjmvDbQp1SRJ4jeWF8En/cdjhpll/UJkV97ZVD8mlq7ts3zQkg+ZqD73rVM97
	 KBS5ZzKq6sGTkEpicRkm7zxnVisJJEQM+uLThvKRsKyxc0j49wC3ZkjmLV5Fg4UFGd
	 HceolfSak7waA==
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
Subject: [RESEND PATCH v2 1/2] dt-bindings: leds: pwm: Add default-brightness property
Date: Tue, 5 Nov 2024 21:50:05 +0300
Message-ID: <20241105185006.1380166-2-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/05 17:19:00 #26822794
X-KSMG-AntiVirus-Status: Clean, skipped

Optional default-brightness property specifies brightness value to be
used if default LED state is on.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


