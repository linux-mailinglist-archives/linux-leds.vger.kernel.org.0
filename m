Return-Path: <linux-leds+bounces-2228-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16892CAD2
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 08:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FFEF1C22649
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 06:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B6D59168;
	Wed, 10 Jul 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAAdwfXL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BCE4174C;
	Wed, 10 Jul 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592198; cv=none; b=W0tVZerBPqikXGzwWErD3SmXi3w1vk+grjvS30BYEzJ6XHFzoUouNA/6VgpM4thOVIDZA0JuJGbFuPj0aTakXN8AkYFDK+4Gvuc4o+KM3tEn97xn56bzCEwlwPFcUNGnFIkIq3XlWHo86sD9Epzy9idZPJ508Uzdd3yJWKO+aHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592198; c=relaxed/simple;
	bh=sQGRKHYyUBnLtnNjNzSntGJJ0TML0Q0pNMboDvlvEdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjYzVv1a+pn6ezmc+Ik+000tRfwvEf0EmDv17umslKHjNOQr/9+oqhQ6eCRcI2RirIJx+J/T7jxZg46VPUgImIZ14wWh8a38xzI1RCEVxrtfiJ+NdndF746tZyTKEtV4DzV32xwsB8JLWwx4wf7LeHfhgpWKIaSNE7CvytkNNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAAdwfXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D02FAC32786;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720592197;
	bh=sQGRKHYyUBnLtnNjNzSntGJJ0TML0Q0pNMboDvlvEdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KAAdwfXLeAwCHq49tZ2ANwjWk2rDj0RgThTYBQzPWssupzevrpbV+gXNRyPTN29qP
	 16hry/XxRdJo7XMG6rNAohPdLI9AQuQ/lI8V1KTKfoNp4E2h5KuGVsl+z7tyd9e+/7
	 PiWdMQ/0y+e/gNaqt5YCyoakK4X9E0fpQZTtwqjJTGGOA2DlfU9jPQTNFOtD68WWUy
	 gorXUhJMfZmVLEuItJ0Vh5U9diX2chXG5l84JE9H6HInwKiAb+0ppO7lnOGDcqaZeI
	 uxzO9hGoZ+0Pre3hWX0OiHLQxvP558MxZQhUrsbP0uDH2P8RvYpgh5hioObE2Hqcia
	 SiZT3XrkAiTDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9843C3DA45;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Wed, 10 Jul 2024 08:15:44 +0200
Subject: [PATCH 1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-pca995x-v1-1-545015603000@gmail.com>
References: <20240710-pca995x-v1-0-545015603000@gmail.com>
In-Reply-To: <20240710-pca995x-v1-0-545015603000@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720592196; l=1434;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=67XvHPHWm9qC9A2Dk+54xKh+fje/rVRRduKWF/PTAgU=;
 b=N6HMpbTs7p639Ryp7vvizi+mZgMu1Io9bNGtxGa0nuBVM3MiE7VlK9an4TIEY8gnyOqz5JSEX
 Yd5Nusk57mAASAKginWYLWXprJCyHPWzTVn0dae+op8zNlvYd/U30zs
X-Developer-Key: i=pieterjanca@gmail.com; a=ed25519;
 pk=gSAHfvqQjVhNa1MhUClqbt7d3S+fviKz6FdQVaWFRyM=
X-Endpoint-Received: by B4 Relay for pieterjanca@gmail.com/20240709 with
 auth_id=182
X-Original-From: Pieterjan Camerlynck <pieterjanca@gmail.com>
Reply-To: pieterjanca@gmail.com

From: Pieterjan Camerlynck <pieterjanca@gmail.com>

Add nxp,pca9956b compatible, which has 24 instead of 16 outputs. Adjust
the documentation for the difference.

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



