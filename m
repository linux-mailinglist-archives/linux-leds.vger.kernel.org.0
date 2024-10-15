Return-Path: <linux-leds+bounces-3097-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ACE99F0C8
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 17:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED591F218A7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9378A1CBA0F;
	Tue, 15 Oct 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="LTXOS2p8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7EC1CBA07;
	Tue, 15 Oct 2024 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005271; cv=none; b=gEVrwShOZHYdc51HELsLvw3bBITW4X0OJnwS+gDA+kD4/uTKMe5WUzP7ECVMOtqkXYFSsLjUoXz0QorTT7W2qvU6Jjt0zxRw5j/D2uGALPGuNczZmOgRi6+cXOfnM+UXrzV23WXmJrUG3H3ktPhEt+lOHSZS5zytKNKObNvfrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005271; c=relaxed/simple;
	bh=lazf32CoxSyj614cm2Mrmcr74+H3vT0Umdqs2/LXc+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XL0PwrY4UJ2BST7iDvqjbHydXQ+TWvj+zYNqzhJ7hChjvYFvnG0T5GnHiyAfsOJs9214cat4Hlmjt06U1YE+y91jbKFMDmSOVVjxDFNnqiWKiVcQkDns2fdkvFwt/RtLhD5mijLS81Mt82eNTGhKG4ZYsB2pUHQYmGiuIBZgnQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=LTXOS2p8; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9BA69120019;
	Tue, 15 Oct 2024 18:14:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9BA69120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729005258;
	bh=DgHLH+41zl5GK77OYraBFgcXwbuWqP38YKFjixubQRc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LTXOS2p8sWLts9zxfJnFdotMtxTQGpI9D+PGP0nEuc44NXMl5JYlqz5HSZgvN98Bd
	 qgiczDSGtxgA7VccwP5KhnZ9XhCu83k/lNZ4kwkQQmE9eOKvgQLTb3cNgzYBhNky7W
	 V8Ft9kSp5Mf61hIew69UyqmHbRNn1V9UzKferKsn+TStFWehCOR9lOlPMJH6QayCck
	 Yt52ZJmN82bdSnaC8nb6N7UxhiCcTX2AD06oWgCm/1XXMR+LxPimk9wC/w9DUXyW2i
	 TYIuBnb7insLAo9qgOiNLCtqZWkAhzgQjtUFUTcNCa4SbI1rMx5fK4vH6RhxjorxhT
	 6VA7Hv3kyTptw==
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
Subject: [PATCH 1/2] dt-bindings: leds: pwm: Add default-brightness property
Date: Tue, 15 Oct 2024 18:14:09 +0300
Message-ID: <20241015151410.2158102-2-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/15 13:03:00 #26756955
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


