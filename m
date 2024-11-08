Return-Path: <linux-leds+bounces-3352-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0E9C1DFC
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A681E2878B0
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F621EB9F7;
	Fri,  8 Nov 2024 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxcTkPzE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B451EB9F2;
	Fri,  8 Nov 2024 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072555; cv=none; b=XwnW1EnuBVc4m2zfX/UMz5+PcsAXUU7Y/28bU5VzCLiROCv/KiW6vcqAbZwlwCSyWv4HO4swU4Rf6Ghc/1LiO0IL8aGy7eRxmF5Eh13sXaia4gYxGwvWv/2pIK1btv7iMiwNyPqaI1CO5STCaklObVoKP710gKdnSOsv3mSEK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072555; c=relaxed/simple;
	bh=IL6ApZj/AEN4ogtSsw2hRDlMG6U3NVDiHfarNqZTetA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiGgn6jhrDIDmt/YrT64vR6fscYaH3vGwOXufsXi4aeaXG9A5knXQbQIQLAGz5BpPw4o7gO67a0C93xOkAwJGxMnelIg5PpwR1dD8QE4nDd3N6XKmLtvXSima2oqlr6P8FsKYtdgfrJpTrsnO0jpqiepOG3LXmV2VAkU+ZzFkxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxcTkPzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A362C4CED9;
	Fri,  8 Nov 2024 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072554;
	bh=IL6ApZj/AEN4ogtSsw2hRDlMG6U3NVDiHfarNqZTetA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxcTkPzE8feuIqcjhDjR3p5UhmA5LgLvPrfxbiVeSw7P+d1FmBXmdpya+pNL/LFtp
	 gsJ5bi8vrmNSXCtiPAKOVtdELj00PDPTlFxxlUmL6Mo5a1qmFy53tn3h6Ywio7UWWv
	 VMKDZIs7EKyRcj0xb2HjH1XrI4f37Ee/eZ0qiym4xUG6+Wppej+HbmI48dlVF7W3fM
	 P8hod2IPWOtr7ORb6bEym0oP6Od2kc8qrfhjmfPTBytoLOe4MLvcuuDE240Oc8ptix
	 RadCtVaFFFnmxCZ9VwDCXUrwGRhetu8BUX5NgTG2dQwhrEFMifBTu/BciY0hb6EPS9
	 zR99xxNLPrazA==
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
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH leds v6 05/12] dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
Date: Fri,  8 Nov 2024 14:28:38 +0100
Message-ID: <20241108132845.31005-6-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.45.2


