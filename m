Return-Path: <linux-leds+bounces-6515-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E6CED37F
	for <lists+linux-leds@lfdr.de>; Thu, 01 Jan 2026 18:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32E573007631
	for <lists+linux-leds@lfdr.de>; Thu,  1 Jan 2026 17:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380CE28751D;
	Thu,  1 Jan 2026 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADndU1JB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02910212554;
	Thu,  1 Jan 2026 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767287974; cv=none; b=nTn+BJH4Kge+aER9snYKEuaEcbYOfljDZGs5b1YsJ9xiGn9KNpn/ZfVmjCvMQV02Lvmvv7kwzngbQL7oVzbxOdMaVXn5Ftajg49gdS2swCfpebPyhRCmhkw5+BDPKv3v5Wd/F3VZintGwgC6JQDR5KMhOv0LZRYKLkMuF+gwBXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767287974; c=relaxed/simple;
	bh=djNDOH+0uykJyPElvpfIfaMEx2yHH15LX2sOxrc9jCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iWGzgJqIX4q8y6ylWnqUrkl72s7KjP9OfQI7Sa4sJPNJv0Ac3vPNrUrtfWjdevmajHsn71IYEROKDsiViCblTg/FHN3i3hLp9PUtx8SIwos0fzkhkfYRIUj2cqLBbWgJS+hEVWILtuyAydnua8Ly/EyDNos2Ws/T5yG7KWp+HX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADndU1JB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A9C9C4CEF7;
	Thu,  1 Jan 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767287973;
	bh=djNDOH+0uykJyPElvpfIfaMEx2yHH15LX2sOxrc9jCE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ADndU1JBJw4KMqCYC5fbZLCxTRy6Z+mefMjN7AMCgAFRDnPTEiu9Wthywm96mbZTr
	 kKtyNBiukE6vVnEHlN1emth8I49qwUDVeHm1DAGyb/+gzyovb7Axs3H8eBfpbf4Xlo
	 2hB8CaPg+A/A63vsd12P6/N1BX882i2lq7KxXtBPGCugRZC5jpUo8oyggb73i0kRfE
	 FM4utbKm3sz9remaFePuEIIKiXiSKg2nwBtEmuIRSoPNYTG1AD7tc8QdfOA90aGUeX
	 4cpTdkI9GL8hXaGbdsf2rpU5O2RjS7bxwkn2c06B9gdehCLGmBA+cUJ+yKmQo+rFRY
	 son97l/T68hwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB31EEB57C;
	Thu,  1 Jan 2026 17:19:33 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 18:19:26 +0100
Subject: [PATCH v3] dt-bindings: leds: Allow differently named multicolor
 leds
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260101-multi-led-v3-1-e29ca8dedd37@posteo.net>
X-B4-Tracking: v=1; b=H4sIAJ2sVmkC/22Myw6CMBBFf4XM2pp25FVW/odxQekgTZCStjYaw
 r9b2KiJy3Nzz1nAkzPkockWcBSNN3ZKcDpk0A3tdCNmdGJAjgVHLtn9MQbDRtJMSikIeaGo15D
 +s6PePPfW5Zp4MD5Y99rTUWzrv0oUTLCiJdV1SqNW1Xm2PpA9ThRgy0T8qLnAbxU3tWz7upS8r
 vL8R13X9Q1MC2Tr3gAAAA==
X-Change-ID: 20250209-multi-led-9991e205befd
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767287972; l=1829;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=mXBr8+Rkn2am3xPSPchutPQF/ATdJJQ3PJqfCR/tUHk=;
 b=w+z4hvQeQdjdUS91KVFVKDjebkNbSuZ9D2a8S5kQjv5G5RTCNGyK4l6OGL2dM+mMiake3QbLz
 y1cZT6nxyJFBKJ06nfnjBuAWaoN3w0pZjN0fCbPDYUugTA61gEzvxV0
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

In some cases, for example when using multiple instances of
leds-group-multicolor, a board may have multiple multi-leds which can't
be distinguished by unit address. In such cases it should be possible to
name them differently, for example multi-led-0 and multi-led-1. This
patch adds another node name pattern to leds-class-multicolor.yaml to
allow such names.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
V3:
- Combine patterns into one, instead of using oneOf schema
- Change examples in commit message to use numeric suffixes
- Restrict pattern to allow only numeric suffixes after the dash
  following Rob Herring's suggestion

V2:
- Link: https://lore.kernel.org/r/20250412-multi-led-v2-1-56af86908744@posteo.net
- Add Krzysztof's review tag
- mention leds-group-multicolor in the commit message
- rebase on 6.15-rc1

Link to v1: https://lore.kernel.org/r/20250209-multi-led-v1-1-5aebccbd2db7@posteo.net
---
 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index bb40bb9e036ee0..7bfc3d807acae3 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -21,7 +21,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^multi-led(@[0-9a-f])?$"
+    pattern: "^multi-led(@[0-9a-f]|-[0-9]+)?$"
 
   color:
     description: |

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20250209-multi-led-9991e205befd

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



