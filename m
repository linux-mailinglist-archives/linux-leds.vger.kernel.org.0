Return-Path: <linux-leds+bounces-2672-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE1977FF7
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 14:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91150B21C59
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 12:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9101DA0E4;
	Fri, 13 Sep 2024 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUj6nRav"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE71D932C;
	Fri, 13 Sep 2024 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230689; cv=none; b=N62QAauFm4aBvx4adVJX8esD4EpeE/hvwOo+rkA1YMri15ImDyX9qqyuKcFb4DeyCpoc6hqDIiY2WNlZ4H5ohZj73RTG7aQfiUaV8MsXSNcq2iA9D7CjIj0gMOGnofo3FkJ5KQn03aFDXeW3pSu1+wgKAjez8ro/h3drGxQz5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230689; c=relaxed/simple;
	bh=Rc6RMX/Ou5vQp7oqz2smW7DcckK88yQnbulZKZl+wtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFPfAxewTA2E1hNcXjOyeXkLWzEA5mMC/mjDiSWbz4MIKSB7jJHQ8da2F/5RaKPApftw+HZrO5OpWFXPSdeBBcax0lShXAQHk+PoImwRpSS5YMc8mLftaArwE+wvtmnjDaX4kb4KaqDYBb+G+HM51cqzRBlQcKXTflXmywbkweU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUj6nRav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EFAC4CEC0;
	Fri, 13 Sep 2024 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230689;
	bh=Rc6RMX/Ou5vQp7oqz2smW7DcckK88yQnbulZKZl+wtY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUj6nRavIucWq7wl1EtyAWlxCabHbK6J6fEUdY4+e2VFF3uTgpOLRVgmDoXJcZtKD
	 jJLPOsK/iwWu5vtLasnjsA54kCGCHYPJz+t1T2MvYG0pNE1la8yE1z12HDfF9Qt8/r
	 9RCKSOGTjxzHZ561i0+Ref+Kktah22n8ne8mYB1ZgefXKv39uroDbkurEvSrxvnQJl
	 s8krhb0ibLmo1jvdK87Vx1VItqmfeP3C2RJmGy7EANVh34d6Da/heRj2Vsac+LOyfB
	 kykHQX2kntIgOeJHG3boLZIiLUZJxtFr8bzcAMwt8j9Cu4KyDNlamds20PJ43KKBQd
	 lhF1p1HmjoYlQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v3 05/11] dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
Date: Fri, 13 Sep 2024 14:30:57 +0200
Message-ID: <20240913123103.21226-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the cznic,turris-omnia-leds binding with interrupts property,
specifying the global LED brightness changed by button press interrupt.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
index 34ef5215c150..f52f6304c79e 100644
--- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -23,6 +23,12 @@ properties:
     description: I2C slave address of the microcontroller.
     maxItems: 1
 
+  interrupts:
+    description:
+      Specifier for the global LED brightness changed by front button press
+      interrupt.
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
@@ -56,6 +62,7 @@ additionalProperties: false
 examples:
   - |
 
+    #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -65,6 +72,7 @@ examples:
         led-controller@2b {
             compatible = "cznic,turris-omnia-leds";
             reg = <0x2b>;
+            interrupts-extended = <&mcu 11 IRQ_TYPE_NONE>;
             #address-cells = <1>;
             #size-cells = <0>;
 
-- 
2.44.2


