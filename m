Return-Path: <linux-leds+bounces-6660-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F90D2CF84
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 08:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C700302BA58
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 07:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D977334D926;
	Fri, 16 Jan 2026 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mXNE8yHP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="h1s4936+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1811EA7CB;
	Fri, 16 Jan 2026 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547419; cv=none; b=DpfVg3YuyBEOOXVVplayv0nnYNn0qLw7QWkkPXVLzxWLq8wrCExncFB6fGYASkBmH+PaQCP4OAYepHxKNaX+fZRvTd5FqE6oFAJohXLxjuQgD6kaVQwFjZ8Kma2wDjStKRgBSajKo0GiplxeG+0I7kx13zkpGYqYOlaATycxemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547419; c=relaxed/simple;
	bh=PidD8m5Mw2TKAXvnhCtNThX7/HJ7hIwRGosYDb9dcWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4RRmQA5J4qOGbQPE87APKB4bzrbrDZublR5tER+X6sOnjMBikwTJdlWvw52YI36Dx1xQsv6w9fKNeDCWfEz+zjLll5G6hZm8M5dCrE96uSIfYovPWRuWYw632OuB90PO1OE+w8QnxRhdqGMFYL07M9lhrpuJpcGeYBixnRhsco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mXNE8yHP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=h1s4936+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547278; bh=EwLy3thexIFvKpK2xg4+tHj
	kVfjlA8BeeqelEzYnxLY=; b=mXNE8yHP4KFTq+OL7fX6islFuIS9Vn9LiFh8Tqa+cAKRsb3H2d
	yXgmN6Kjb6fFcGlWu121x+8Ig9+xrrIYsRzNKw0ltYYosYoJT7/h6gE6LlVSRU2En6/ut18izPq
	VFm1APEjGBvofbcwCPRUFh/n3Nqm75We57KCTTHfTBkKgHAHEerlzU0ciDxqiZCL/M4xcMbD8fn
	GkxRtlgy1iO7jnbLQs2c7N7uWZ+E59dU6iAwqxonrvejN2DZeYGTFxeAsg34EbBq+CulppTm5lS
	mw37wyUbnPXWECXzKqeQvGqDzNY1amVgU7uCW32BRMGgPkWs408+WOQZg12VOHDR5BQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547278; bh=EwLy3thexIFvKpK2xg4+tHj
	kVfjlA8BeeqelEzYnxLY=; b=h1s4936+KEGbNC+J4hr+YXYAnDdPCdxMM3wdc+0nRWc5grszjJ
	BiQ+ftvRTLSalIz8RiK+K1GhtOO8flCtY9BQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:33 +0100
Subject: [PATCH v3 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-1-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=1588;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=PidD8m5Mw2TKAXvnhCtNThX7/HJ7hIwRGosYDb9dcWc=;
 b=h4XJe8lzk8hkUVV7y2UtZJJa53nhVHGPNNXRtwTDsk2TBYBiTkX5kYSphfzJirqsp59gRtoxT
 QE5ibAbM2pqCuPT5illFr9zj6rs6tLWfJnPpUsZJOOVdXNK8X+drukw
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document ovp values supported by wled found in PMI8994.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index a8490781011d..19166186a1ff 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -98,8 +98,8 @@ properties:
     description: |
       Over-voltage protection limit. This property is for WLED4 only.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [ 18100, 19600, 29600, 31100 ]
-    default: 29600
+    minimum: 17800
+    maximum: 31100
 
   qcom,num-strings:
     description: |
@@ -239,6 +239,24 @@ allOf:
           minimum: 0
           maximum: 4095
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pmi8994-wled
+
+    then:
+      properties:
+        qcom,ovp-millivolt:
+          enum: [ 17800, 19400, 29500, 31000 ]
+          default: 29500
+
+    else:
+      properties:
+        qcom,ovp-millivolt:
+          enum: [ 18100, 19600, 29600, 31100 ]
+          default: 29600
+
 required:
   - compatible
   - reg

-- 
2.52.0


