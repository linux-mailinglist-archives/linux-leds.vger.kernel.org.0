Return-Path: <linux-leds+bounces-3035-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167E9986AF
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFAF1F219CC
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 12:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701A91C68BC;
	Thu, 10 Oct 2024 12:54:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633391C2DC0;
	Thu, 10 Oct 2024 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564848; cv=none; b=Ur6EIvx9I2/HYDsHvRyvWZNp7clwiORrNogKB8Nnjop09I5xAv4sMZiVw09Q7W5K8BuJMtn5GxCCxPBq+OI0iWavCr+d7LLLuh7fQigD7WIk8QEdUasdT76FhXcuj/cviYMgfh82bAAOuP5rv1tO6GjuXWutAiaLP7CVsuilIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564848; c=relaxed/simple;
	bh=VgdWPTW7P0L+QIKLU0QKp4uLoRUrGlFZO6w8Mmj3fHU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GynSQKPt6siEddTV1Hl4yCL5HC5VBpUDCOTlIcNNfdppRvWotCGsDyCIo53+ZUSB3avNrkHeZ4Kx/J99Y39Ry9F3dWHBd/+SYx3p0uiFUc88KWbforXAUx4zOKq0OAcbLSVxf1rCCnX7iRAnN/5UZxhNyj9p1HDKzrBpz9GG9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sysfn-0000000039J-2wnk;
	Thu, 10 Oct 2024 12:53:43 +0000
Date: Thu, 10 Oct 2024 13:53:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xu Liang <lxu@maxlinear.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Robert Marko <robimarko@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/5] dt-bindings: leds: add 'active-high' property
Message-ID: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Other than described in commit c94d1783136e ("dt-bindings: net: phy:
Make LED active-low property common") the absence of the 'active-low'
property means not to touch the polarity settings which are inherited
from reset defaults, the bootloader or bootstrap configuration. Hence,
in order to override a LED pin being active-high in case of the default,
bootloader or bootstrap setting being active-low an additional property
'active-high' is required. Document that property and make it mutually
exclusive to the existing 'active-low' property.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2: fix commit sha truncation in commit message

 Documentation/devicetree/bindings/leds/common.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index bf9a101e4d42..7c3cd7b7412e 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -202,6 +202,12 @@ properties:
       #trigger-source-cells property in the source node.
     $ref: /schemas/types.yaml#/definitions/phandle-array
 
+  active-high:
+    type: boolean
+    description:
+      Makes LED active high. To turn the LED ON, line needs to be
+      set to high voltage instead of low.
+
   active-low:
     type: boolean
     description:
@@ -225,6 +231,14 @@ properties:
       Maximum timeout in microseconds after which the flash LED is turned off.
       Required for flash LED nodes with configurable timeout.
 
+allOf:
+  - if:
+      required:
+        - active-low
+    then:
+      properties:
+        active-high: false
+
 additionalProperties: true
 
 examples:
-- 
2.47.0

