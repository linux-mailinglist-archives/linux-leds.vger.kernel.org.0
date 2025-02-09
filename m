Return-Path: <linux-leds+bounces-3902-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E389A2E11D
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2025 23:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B28117A254E
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2025 22:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B325922332F;
	Sun,  9 Feb 2025 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvvR7aE2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546F1EC00B;
	Sun,  9 Feb 2025 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138839; cv=none; b=NMfILx1einYrXSGu5h+4dqb5hWLOz4NtXAMUopaWP4vJbxzT5Hovy9AwIBTdMYqXqhpvFAbU6hrhfd1SFlgfOh/ps7FjLAqXYyXZIBVyKLTt2CkH7rvoDHkc/aMl6W6+BBEBCWKeCoXwAjt5qih/EC+3+FqPg0l63kyPXsBnFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138839; c=relaxed/simple;
	bh=7bTmvynIcYiz/go7F/gd0OjRidGHVoLNQtWkgB0LMfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J0QQRGD300P4KQx4CCSmpLM70s/ta1+VKQLdXcKkmXsejDZbFoH+KfENP+I8zFJuhGv8MsLPr0SyfDAIYakLl/o1v9aeb0jW23lnZ+X0+ZY8CgD8pvSFYNPkvBHcEtjTfsKQ/WawGNbTqWCcsTouxLwvZppKoWUFi4q6b4IAH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvvR7aE2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3890C4CEDD;
	Sun,  9 Feb 2025 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739138839;
	bh=7bTmvynIcYiz/go7F/gd0OjRidGHVoLNQtWkgB0LMfk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RvvR7aE2IduKCZO2+HgeRAcZko10QKhYvzUG51AYBSkkQUarXIkf/5l1JRIm3/gN9
	 adorX8b+BVs+PEeVBKLbmkbM6YEOE4McByeoy/qBrECe5Xs6rD3UDH1HlTWKtdNHC/
	 zFhM3DX8D9Tisj2RyS71s1hSdBxi35sO2TbL3OS39nbyaPDMFpkoz2xu4HBMxdkxz2
	 DNliCZsFauUn5S4ITuzcLMfY/hZcPry3JYSgHUyQyZSHJ5CX+tLqqCyv7jWUnYUjPd
	 TYJIEfYFP//PSGLQOj2daTYB6Wup663MUDMdQxPUThmI8HYojSsruhVVQZziXSZP5R
	 X7+4Q+HScVTcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBD7C021A1;
	Sun,  9 Feb 2025 22:07:18 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Feb 2025 23:06:50 +0100
Subject: [PATCH] dt-bindings: leds: Allow differently named multicolor leds
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-multi-led-v1-1-5aebccbd2db7@posteo.net>
X-B4-Tracking: v=1; b=H4sIAPkmqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3dzSnJJM3ZzUFF1LS0vDVCMD06TUtBQloPqCotS0zAqwWdGxtbU
 AW+6O3FsAAAA=
X-Change-ID: 20250209-multi-led-9991e205befd
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739138838; l=1273;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=9DQV3fzmb755ljBlke0ZoorMkJDPL/aQrPGsmH2YR6s=;
 b=RP039EUEyquTEMyQNTLm+9+PhfrD1leUx+R6Jn1isuufyR91nebysUfOTuthgqMwqq5uI7H0b
 0oa6ntbmI4rBwKJKOU4QT1/MC4amAnO2bV3G77+zHucHk4VoTeiJNTp
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

In some cases, a board may have multiple multi-leds, which can't be
distinguished by unit address. In such cases it should be possible to
name them differently, for example multi-led-a and multi-led-b.
This patch adds another node name pattern to leds-class-multicolor.yaml
to allow such names.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
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
base-commit: 645b5c24cf8590eea322a4fd79c811817046a2e6
change-id: 20250209-multi-led-9991e205befd

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



