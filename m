Return-Path: <linux-leds+bounces-2961-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4EF99183C
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 18:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 643C3282D17
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 16:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9186F156F39;
	Sat,  5 Oct 2024 16:24:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD7155382;
	Sat,  5 Oct 2024 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728145480; cv=none; b=fZ56M69y2oaEG1bTOGMWGJyrbEwqP9Rvl2iLw+/BJt6W94imDeURj2UtEex1N1ezD9CO+3v5yFN7T0jETWFLeJ/d2lEJ/2vEE+mDb+nQAC+KLOCwf8V2PT5kWNktO7c+ws+F7Q2hgFPo3hGXnnHNLN+PHm+6wcJPjU23H+dfBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728145480; c=relaxed/simple;
	bh=Pz6y3RVpUOlfgcBuail+i/YSJfZ2G/ZQCi1nZWUTkEw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n7upFb52VASRQsms395rN/fGmsEWpvHeZ3IPGnuWSP7WIkX7i4HlQ2k3DLfRvCHskd/9XgohHkVQNt7C5pEGZvYYc9MkX+aVceon6xk4onX2B9MJf23J7/YNFG21neR40wFpqfS+b7a768zR/g/gr+vYJo2VhPe+u6BMqCtRuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sx7Zw-0000000044D-0vFj;
	Sat, 05 Oct 2024 16:24:24 +0000
Date: Sat, 5 Oct 2024 17:24:20 +0100
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
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next 1/4] dt-bindings: leds: add 'active-high' property
Message-ID: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Other than described in commit c94d1783136 ("dt-bindings: net: phy: Make
LED active-low property common") the absence of the 'active-low'
property means not to touch the polarity settings which are inherited
from reset defaults, the bootloader or bootstrap configuration.
Hence, in order to override a LED pin being active-high in case of the
default, bootloader or bootstrap setting being active-low an additional
property 'active-high' is required.
Document that property and make it mutually exclusive to the existing
'active-low' property.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
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
2.46.2

