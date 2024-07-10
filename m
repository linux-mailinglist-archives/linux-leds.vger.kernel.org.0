Return-Path: <linux-leds+bounces-2241-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9392D44A
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 16:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCE3281D2C
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 14:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B8A19412D;
	Wed, 10 Jul 2024 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWkS5gmP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8BE1940AB;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622070; cv=none; b=hJ2A5ljGSgkPdgmUwXqKHzeVm1S2MQR/lH8WZn7JJhiaJZXd86reODKWslCRoDbrMDlJ2PJnGghlHN51u65rs31obY1AxJgrpuqxFw2ngubTtjMe/LyYZWT6cLMAIFK4b3IeOVtLYTEdhGpxM8wOPwbcyx92x81VBXlSW+eQwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622070; c=relaxed/simple;
	bh=2S6wiPTFHPJdM/v1Q7GToqIDc7o81c9D6s45n8dLLl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfxT4ddutrVr2Y94SHjJyixebNmdUG+jS3rqUbh/t1NrBOfwRYBpGdB+7tYAVXT29vvesOzfYJorKqVjxEX4fohQJIGQCf/kPyaNadGtMfcxGRnwj0DO2kaoT7TW1K1c88r05wsBxjYt4JvsxbC0CQx9I1nZmErsoA9of3BEuHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWkS5gmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69FDFC4AF4D;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720622069;
	bh=2S6wiPTFHPJdM/v1Q7GToqIDc7o81c9D6s45n8dLLl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JWkS5gmPB/gwJ7QtPNYy7KLR1GK4tLsm1gDPVWv5V84S3FV8wIJ4C7nPCbz+hAIny
	 0A0hKnfQSnODtLZQLo1+qixc9FwTPxjwqZHarTDJEn37eCRaReDxlyoI/fiYG6dbDa
	 dmlOZXteqyxaXKVvKZbkkxgBaFHCjEhsHZVYU3ivN5WRXX4OHiabTUIP39a4K0wuby
	 4l+qvKVTkxJfFBsBxIWZxsY/c+GKknIjnTne7vWQQdVxqUYgcdAtBsvO/3qVE7bjJC
	 Prjbpc2zlgIXAhgflb2KEwPjLkR7UK/dUnqQlwp2MCEOr8lpy2gzCJYftyjRRq5UML
	 o2UBBsRbrKJsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59373C3DA47;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Wed, 10 Jul 2024 16:32:41 +0200
Subject: [PATCH v2 1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-pca995x-v2-1-8fafb6e4b7d5@gmail.com>
References: <20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com>
In-Reply-To: <20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720622068; l=1529;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=6vO+6FBkF83NNJD/iYLLMy7G/J0jk6c6K0j7e/z+Ghg=;
 b=BXYTI3rjON12iAtJ3DR9Cmlx4DClvKRBpE4dlu/HzFT8/Uk2JPEU2xTMTzqDtKhMnYsSkJw7O
 LLmF0ib3fQEBdYpJsO0tOAQHd0McOH0EET2jPlb41jHJQIKmhfN2jxJ
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



