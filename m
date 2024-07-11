Return-Path: <linux-leds+bounces-2250-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C904992E151
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 802E31F21239
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 07:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770351509AC;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEqn8c+M"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860914AD3A;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684382; cv=none; b=g9ljL3CHV1qeCe1nm1cahO0fD0O1V7cj7nASXQGruM9vrZsNp1LgWSGsgDUx2TAJIjOoAwwfu7Ft70yFXarVECghh6579QXJoxxfADhHWuKeID3K6pwnF4z8GIahSlk/JScRI/FMn4zXsqVSkeoEXLnYR0JcQq1XuUI1IuTcx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684382; c=relaxed/simple;
	bh=2S6wiPTFHPJdM/v1Q7GToqIDc7o81c9D6s45n8dLLl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7+rQNxSiU7sl7Y/8/FG6kx1NrPlrQRE5BCZBxVr59Xffy/QZPOTRZkIbhvQvDCETAIOFmMeQG2SVUj/4xZ8pgLOeYCXwbe1kaePxKPhMTBGCywfca1DZii+D1MMmmZ+qZrWPM4IL0P4cFgu99ARgyACWGuk/pz8gfMK5fxxWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEqn8c+M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5D74C4AF07;
	Thu, 11 Jul 2024 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720684382;
	bh=2S6wiPTFHPJdM/v1Q7GToqIDc7o81c9D6s45n8dLLl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cEqn8c+MXZAaItOanA5QuQz7wz5AtliLoYnHnudfvBYGY8G+kfIgeFib8WxWx6KVn
	 uU8l34+RMyksUvLEa5TwR4FPVRwUjWUZKyaRtlGDaSFRiauu8dea+9Oj1v7QtiiesA
	 LavmcJDvLTeuKgpNI8q69MmfJzodJA9PyBgUbPHZGKvfXW1Kl4XJZvnlGT2vMn99R7
	 /RgtjdJ7JxYAe8heRQcanuuGVU+s4n58Iwd+rrmlHeJLi1ULNi5Rwv2RyVlcbqGSO+
	 GlSbfjoQu1Ni8CJnJeoc9nOfiFIyGc1nfVhqiTQT2pIFluUm8phVRmWGPIOuBfDolg
	 pkMOidEUBWu7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3F0C3DA4A;
	Thu, 11 Jul 2024 07:53:01 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Thu, 11 Jul 2024 09:52:22 +0200
Subject: [PATCH v3 1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-pca995x-v3-1-a1bf1f3c3f5a@gmail.com>
References: <20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com>
In-Reply-To: <20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720684380; l=1529;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=6vO+6FBkF83NNJD/iYLLMy7G/J0jk6c6K0j7e/z+Ghg=;
 b=lcpfwozm+yHjGkn5w9DxH4qwh9/8K0HZqODFGYd3kJJDQ6YYUo+QrRGKEE6YZTMgl4emHxNgQ
 8oo4xUWMoLdA0M2ZuCNbg1kJD0jeUVvW5bo4ZdZbIv2iTeIOTLa4afM
X-Developer-Key: i=pieterjanca@gmail.com; a=ed25519;
 pk=gSAHfvqQjVhNa1MhUClqbt7d3S+fviKz6FdQVaWFRyM=
X-Endpoint-Received: by B4 Relay for pieterjanca@gmail.com/20240709 with
 auth_id=182
X-Original-From: Pieterjan Camerlynck <pieterjanca@gmail.com>
Reply-To: pieterjanca@gmail.com

From: Pieterjan Camerlynck <pieterjanca@gmail.com>

Add nxp,pca9956b compatible, which has 24 instead of 16 outputs. Adjust
the documentation for the difference.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index 654915c1f687..ab8c90cbadb5 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -11,19 +11,21 @@ maintainers:
   - Marek Vasut <marex@denx.de>
 
 description:
-  The NXP PCA9952/PCA9955B are programmable LED controllers connected via I2C
-  that can drive 16 separate lines. Each of them can be individually switched
+  The NXP PCA995x family are programmable LED controllers connected via I2C
+  that can drive separate lines. Each of them can be individually switched
   on and off, and brightness can be controlled via individual PWM.
 
   Datasheets are available at
   https://www.nxp.com/docs/en/data-sheet/PCA9952_PCA9955.pdf
   https://www.nxp.com/docs/en/data-sheet/PCA9955B.pdf
+  https://www.nxp.com/docs/en/data-sheet/PCA9956B.pdf
 
 properties:
   compatible:
     enum:
       - nxp,pca9952
       - nxp,pca9955b
+      - nxp,pca9956b
 
   reg:
     maxItems: 1

-- 
2.45.2



