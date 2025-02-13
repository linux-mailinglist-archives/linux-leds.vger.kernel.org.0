Return-Path: <linux-leds+bounces-3973-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA1EA34EC1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 20:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962981890719
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 19:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C8624A07F;
	Thu, 13 Feb 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VIf+hNUC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C324A06A;
	Thu, 13 Feb 2025 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476498; cv=none; b=dVStbte7OyqpVRE4yDuYyEQs7EcOte46foTlwTe/DMACxMCA2Bgb0JcuwIUqaL9wqog3er4jU3NRxUn4gwoQ3JiqS38j6HObmZisE4Ug8yPjIgqTGiws0xMJXBIsLhRrTedbzPGVe9dpUWPYh7af+gJQn9oFjjXarAOQUSSCKE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476498; c=relaxed/simple;
	bh=yQ+yZqSC2THtcqvSadW/Sj93NBtrZeQuFK22KFvPb0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tp7DDFKIawoKttECJ0b5WhLxX3vYxODjUOj/V2Yxs2zI7Eq1zG2q0G3w1WfTJ/v4p73l5Wv2oyx3X/KBAa23ohJ2gAmQj3EG6+UFW9quwv/BFAEuFfxKGoXAceamovzbVIlSCmH25bIGWFb8id1vxvSMhy7pnnEKUyXbtN4usmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VIf+hNUC; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C08C9.nat.pool.telekom.hu [37.76.8.201])
	by mail.mainlining.org (Postfix) with ESMTPSA id C0E8DBB837;
	Thu, 13 Feb 2025 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739476489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzxpk7hXgkZO4dVg/m2OCYGoHOodAZp0rVH2XDhtHtw=;
	b=VIf+hNUCvIuNv71AskKr8shluIKg51erdcrD9+IDHSEn2cOf77jYdIvJ0yhPkGGgiqRWnA
	jPxco4G7fmCrnWUcliknqDksRMmc2xfFGAeR3EUUeZdE/J5G43pzY8S2He6SVKLBStDLJl
	5MRC6D/bhe1Ff8X0e5XAd72IMSnWwobp2WtldLGCxXHh6vJLQSw0alqDorRVgPfUkEWiNB
	WdsMkN2v/XCD2GKSGirpRj3ASlQekq/1/cX2J6GR5FCNhGJZe2K3xzGqQoMmI349kOtW2U
	zxffI+E2aznJyIEKX6Z217ZWvu5KLbAZJcUaRQklsr6b5AxqymaGLITHw5k3dw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 13 Feb 2025 20:54:47 +0100
Subject: [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: Document PM8937 PWM
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250213-pm8937-pwm-v2-1-49ea59801a33@mainlining.org>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
In-Reply-To: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739476487; l=958;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=yQ+yZqSC2THtcqvSadW/Sj93NBtrZeQuFK22KFvPb0Q=;
 b=N5tmZ3B27EdaMvA2SREnKrLfUUL/64bZ9yZsGRt/TYwJjwL3r7FAsbz2G0QjWKtGl+/3+cb1W
 PReOWzFEBUtAsc1Y/oTDh+UrRiUNE/XOb5qeQVlOPl9abiLI0McHVI2
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

The PM8937 PWM modules are compatible with the PM8916 PWM modules,
document the PM8937 PWM compatible as fallback for the PM8916 PWM.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 8b82c45d1a48be6ff63193aae9d67625a943a72b..841a0229c472a4764426d25d9dbb900adc20fc11 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -39,6 +39,10 @@ properties:
           - enum:
               - qcom,pm8550-pwm
           - const: qcom,pm8350c-pwm
+      - items:
+          - enum:
+              - qcom,pm8937-pwm
+          - const: qcom,pm8916-pwm
 
   "#pwm-cells":
     const: 2

-- 
2.48.1


