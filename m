Return-Path: <linux-leds+bounces-4465-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A516A86D1D
	for <lists+linux-leds@lfdr.de>; Sat, 12 Apr 2025 15:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88208C6454
	for <lists+linux-leds@lfdr.de>; Sat, 12 Apr 2025 13:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5456A1E5B8E;
	Sat, 12 Apr 2025 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zb40OONT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8DD80B;
	Sat, 12 Apr 2025 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744463089; cv=none; b=AyHVEBlem9a8yBcGrw41PRcJ0HZChqbaQxectMO4SeTtxiDP6DJM2KUU0YXV9B9j7ghb9R2ddMx3etGhUTqQUfFVpPvaFPwoVJRS5Yk6DwwUw2B4JG7lqmRLvIjqkfG4I63q3DfUzxb6CClQIDHC69GFF2JbE35l1v36ruxKduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744463089; c=relaxed/simple;
	bh=T+kgOlCvxoAnQ1MopdtoUTigE/tI5eb4m3xUku3rKik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jsBwJgaqPzClZEKCxCKhkrRkB2spN8XA0SkDewIpwu9aml1zZYsLsTJEwRzA/aLVEwNmBUmxL5/b8ujzfeOwQnQ/5U6jnlZ7TvyE1QFMJwAVtcu4cKdACnlvNgbRADcuTUvX01NwJbFu25TOpxqvcbuSlhRH1YjGf+qCYgtWZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zb40OONT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF01C4CEE3;
	Sat, 12 Apr 2025 13:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463088;
	bh=T+kgOlCvxoAnQ1MopdtoUTigE/tI5eb4m3xUku3rKik=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Zb40OONTlEn+HE8ksmqmUXGZioqIoeUTL1YQssByv1CvHjxAQ1biFCSdWJaSPOO7o
	 PuR6OIjAyKmMubByyvuF+qkPQ06m7CZF/zwvEFj/lHapaR6X/m4KmciwLvQ8+1iWnI
	 RnNwv7PYEHAgEqhByoga7WhUZnNeT2R6ElVwrXtqlW3TJ75an4pBxZjc63zIwdazki
	 gLZdc66+WAxf/+sZBZmBd3fUP0Y4MKgU7sv+FoasWBf3meAltZ/M/QXdBcTWkrdT6K
	 frFU37C4E0Mq8EA8F8f6rl36Cl/jMSBGQaM79u69T1RuleVrE0T9QY1sSPXurdzO2Q
	 aYC+EPBKeD9+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD4C369AE;
	Sat, 12 Apr 2025 13:04:48 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:04:32 +0200
Subject: [PATCH v2] dt-bindings: leds: Allow differently named multicolor
 leds
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250412-multi-led-v2-1-56af86908744@posteo.net>
X-B4-Tracking: v=1; b=H4sIAN9k+mcC/23MQQrDIBCF4auEWdeiA1LsqvcoWUSdNAOpBrXSE
 rx7bdZd/o/Ht0OmxJThOuyQqHLmGHrgaQC3TOFBgn1vQIlaojTi+VoLi5W8MMYoQqktzR76f0s
 08/uw7mPvhXOJ6XPQVf3Wf0pVQgk9kXXOevT2cttiLhTPgQqMrbUvPNjQD6MAAAA=
X-Change-ID: 20250209-multi-led-9991e205befd
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463086; l=1614;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=a7MVW7lJ84PcK32/7G3ucUp7YIndCA/M048QSEAkvoA=;
 b=zq7jcq7nd/DWtjq3QNRNbNkPq+8Cpldi//o2EfFdnuzk/jWfS9b4gQM91iSibxLnntRxLBri0
 gY+s92S2WluAzm0JVz3NuHogrRGZqWd9Kp5xv99Pby9mXchLd65lnPw
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
name them differently, for example multi-led-a and multi-led-b. This
patch adds another node name pattern to leds-class-multicolor.yaml to
allow such names.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
V2:
- Add Krzysztof's review tag
- mention leds-group-multicolor in the commit message
- rebase on 6.15-rc1

Link to v1: https://lore.kernel.org/r/20250209-multi-led-v1-1-5aebccbd2db7@posteo.net
---
 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index bb40bb9e036ee00e06d21e2321ecd5a7d471c408..c22af25b6430be71300c0e37f696cd61112ea190 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -21,7 +21,9 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^multi-led(@[0-9a-f])?$"
+    oneOf:
+      - pattern: "^multi-led(@[0-9a-f])?$"
+      - pattern: "^multi-led-.*$"
 
   color:
     description: |

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250209-multi-led-9991e205befd

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



