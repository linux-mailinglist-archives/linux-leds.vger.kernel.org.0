Return-Path: <linux-leds+bounces-6203-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BBC6CDD5
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 07:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A1DE4ED375
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 06:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99020313E19;
	Wed, 19 Nov 2025 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9nAq9jN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D59D313289;
	Wed, 19 Nov 2025 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532407; cv=none; b=qi7VS35ArEVw/Qv2iM82GcOhWfvgWDhLmFENURZS8iWSp1Je8mKHZ/ruMnQ/7nC+vKBvN6Hg1NQKAkhSS5KSE6OjO42B9z4Sd0rqJFNBsO3uzwUsIjavdLYABgkaeCzb9MVsafXXCT+ZLkxQm/3tr6z5S7l81SmK659g9ALfm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532407; c=relaxed/simple;
	bh=89WwsAWdh3wEglD1apJUjoL/jDlcEx+ykI6cEcrYEPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftC6n+03nMD/zlEVxexX8+MEtpeffqpNBLupqB1MpPGUIdWbmnv0Rmx6MmAF9ZxcbhoEVvQKDgWshxgIIsiCS+6lZ+qGxdF2wma1G+SLJNFK5Ju4wxGwCJE7zkvrjHagjdINsDWmg56D5PKPDGGCzazZ2vV8uRqZBmtsL3TT2Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9nAq9jN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D718CC116B1;
	Wed, 19 Nov 2025 06:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763532406;
	bh=89WwsAWdh3wEglD1apJUjoL/jDlcEx+ykI6cEcrYEPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V9nAq9jNsfcETjLMXGYyDW7/QUE0iefH/3MMwxPw074hosRYm/28Nokru1gI9fFVW
	 Zha9W5z8MopLhfKmFje8qBChzc70CGVK+2CExrVwfLCsgHy/J9FMp7Na1+uimM5iTA
	 TGzOEyQrzDiwMlfdPBTPqs/LwhQ/ghgXdOoy1wv8OL03M5jxW/78CRQ6FjDIoHLC01
	 XRbhBAGJavh8jPlgMZjimRkrvJYsvqfvKle2X0ejSThBCHfrGYkoQ83qXiQRc7v/4c
	 ESHLj98F/jk4+WMvwKTuqn0Dg2gHOkJWvQgzv5a+UOOJ1HXwVV4+vu8Sah5sw5Bs/B
	 PSLtRMKAWVGyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7B0CF258E;
	Wed, 19 Nov 2025 06:06:45 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Wed, 19 Nov 2025 14:06:42 +0800
Subject: [PATCH v3 1/2] dt-bindings: leds: qcom-lpg: Explain standalone PWM
 usage
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-lpg_triled_fix-v3-1-84b6dbdc774a@oss.qualcomm.com>
References: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
In-Reply-To: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763532404; l=1399;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=fm6f+mHZk9XQAu2fqBegNtPPu3AH+lJL7icnO/wPnuA=;
 b=7esyEgh0jpdYkUrVM6O/QNlvNQdL8cIhftNM37xGPAgzGa4njb6xJH69lrB4JqnN5TooTy6Ff
 O6/ODUy4YCxD2lqBB3Ae84FxYPF8MSguiw3Ynmumi7q6+TlWcHYK7k6
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

LPG channels can be used for only outputting PWM signals by routing to
PMIC GPIOs without enabling TRILED. Explain this usage in the description
for better clarity.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 841a0229c472a4764426d25d9dbb900adc20fc11..c4b7e57b251845a6970b34bc9ae0c00647b1bf96 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -13,6 +13,11 @@ description: >
   The Qualcomm Light Pulse Generator consists of three different hardware blocks;
   a ramp generator with lookup table (LUT), the light pulse generator and a three
   channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
+  The light pulse generator (LPG) can also be used independently to output PWM
+  signal for standard PWM applications. In this scenario, the LPG output should
+  be routed to a specific PMIC GPIO by setting the GPIO pin mux to the special
+  functions indicated in the datasheet, the TRILED driver for the channel will
+  not be enabled in this configuration.
 
 properties:
   compatible:

-- 
2.34.1



