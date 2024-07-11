Return-Path: <linux-leds+bounces-2262-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70C92E889
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9DB7B2587D
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F4815B554;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUdj8Ohg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4971E892;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720702204; cv=none; b=KQLwqCYt6Sk+Ym7QYaWnpQW/Fb6yOsY9bbfiXB5rnhPXmU5OVhfV6SlZWaqnrSjCJclsz2SSqJrlme7lA6CPtuLypc3W9/Z0R0sgUvMYFTVV9qDpd1lRlkBcHwWAgBesW+A9jHZqITo8fI1byf3gEkN+GsvXCj/fEd+eDqV3zIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720702204; c=relaxed/simple;
	bh=2S6wiPTFHPJdM/v1Q7GToqIDc7o81c9D6s45n8dLLl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4P4pglwdJUhXTP5CZLUh2GSwVWsIAomMtY1plHdQ/Zv+swqfcI2n1TjHlUGxLKNHF5Qn6/3rDHL9TmAM9jFn7dndhjtoouRuTPqGF9ykOHNnvnuKsJvu946jjBKhC1sNTdqxwnbcYSdy7I/QKjXPpXZ+CTyDSIPdNPc/uxiT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUdj8Ohg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30FC6C4AF07;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720702204;
	bh=2S6wiPTFHPJdM/v1Q7GToqIDc7o81c9D6s45n8dLLl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TUdj8OhgVu+xwIpAi7gXmZ41mLjGy1wZLsMej0ZwAy17IcxJuhVWdTVroyu7CKbQC
	 p1++B9q3bo1m9QSVbY8nQacwKsW/moWO8E8V7PapRfOIbHtjGxPyszDdhq+sL9xYfA
	 QD5n655OqkULy4GAKjhCqgjZSW0Bhj1aRVdbAdOepxJXpIcYX3C7xKr7rYmuDSPn01
	 FEGOzdmYrJb8bRvBP5ITVKz5+440iFlpEZiLuAvZgzTdRoXzrkI41Ex64HMQPrMBYj
	 4R3XFpj4ILptfmry0rnPlruoVCOdNbLjSOhI09hyeuv3dT+K8MQHB+94VA84JNq2NY
	 C02kAZoaZgp3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E096C3DA41;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Thu, 11 Jul 2024 14:49:50 +0200
Subject: [PATCH v4 1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-pca995x-v4-1-702a67148065@gmail.com>
References: <20240711-pca995x-v4-0-702a67148065@gmail.com>
In-Reply-To: <20240711-pca995x-v4-0-702a67148065@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702203; l=1529;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=6vO+6FBkF83NNJD/iYLLMy7G/J0jk6c6K0j7e/z+Ghg=;
 b=GUnNEmh0FyyZTNKqn3AY72mRzXaK+C2ZMPDAmBBY9oTGMGqhB5/3KklfWAdJNfdBDCybuSLes
 nA67CZL0PQGDEa98kY/OyFf/3Oklmd3f6Q64PrSOTmcFnrG1ULFQyQ6
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



