Return-Path: <linux-leds+bounces-6549-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1895CFE0A7
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 14:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D6831655F2
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A845F339876;
	Wed,  7 Jan 2026 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ltDKaNuY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wfJCZuig"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602F339862;
	Wed,  7 Jan 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792819; cv=none; b=Bn3XZXmBgXJhXtAXATt0SvoBYeY6ZkS+ZtGY0Fq0YUXhCaDD3DdGqUPZxJ+FFrrHSkrtDhoR5k+9QQnYuIf/KrtM9dn/ZSUmx3I0x6mIjUpRy4W0tGZhGnVXTvnnaQVNt2UeyXALS6pE9R9hwNpAmeqoErqXxxTLBVvSP5IiOEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792819; c=relaxed/simple;
	bh=j0wARNgyBwNrwja4s6edywoSF9O2PWD3jbvuDFwhujk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPKVn0PC46buLhW8sxZAeRieADAKUphsRzHtXgJafpl1L2vtF727Enuk28Yessc9oPLj0koklufb1HJXtzyyoOCB+6M8thg+wzDcwGAOl6HH+G/vL6q+sUu1TYdO0lvuL24ixcKnXvq+VceiswLj+BtpX4kbQTmZJuhjqYmrxbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ltDKaNuY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wfJCZuig; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792673; bh=uqqoupHuz5q+FhYfRmGG1xu
	6sV1Pynys3Jf3ygjytGc=; b=ltDKaNuYevLunHgGBnQsQtp3fePjrtUlzk74lNOn/LxUhWob2O
	fZ/xqM+/xRG41nvDbfKQ+Gl4Z66H/Gy18X3MApEHHfmBSZ7AM7k8CsULCb590y0kdVJFxtQ17hZ
	MkIsaBuodJ1/yEoR4ub3MdAqUp1DwugSm8PyoAdlJze62L8XHG1X3sJU72V1xhiak8atlv4j5MC
	EmTgBCF2c4xrsDMCr6lCAe0rTqbMpsql16f9Ly1rY5qvvHf/AKflSt8fkyuE0/nPD5kols58YWr
	hs8QUzLTrgpvx1iPSHboayYiYgSfAbL+RuDOqxpCHQqblAD6wBa+O2I1mKxs5U+Ut7g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792673; bh=uqqoupHuz5q+FhYfRmGG1xu
	6sV1Pynys3Jf3ygjytGc=; b=wfJCZuigWTplWp/itIvuYfdAaOBv+CFYgvwK2sV80AhJRnuM/Y
	MQyTs2uMQyPoRwCD/SQC9c59gjC0E9b+ucBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:05 +0100
Subject: [PATCH 1/5] dt-bindings: backlight: qcom-wled: Document ovp values
 for PMI8950
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
In-Reply-To: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=1412;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=j0wARNgyBwNrwja4s6edywoSF9O2PWD3jbvuDFwhujk=;
 b=hD0UQniE76+D+waZhCOZPHGQ+ZR8xVVp0HDOnsdn6pEUyqQmFoYqzSp+VFB0tP/h+akiycXVp
 7L6BIVDKXSoCP1Vh2nAzr1rKQ6gKjRrtpH3nsrLzdLHuOXr0kdIRL0p
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document ovp values supported by wled found in PMI8950.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml           | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index a8490781011d..306fb6642617 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -98,8 +98,6 @@ properties:
     description: |
       Over-voltage protection limit. This property is for WLED4 only.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [ 18100, 19600, 29600, 31100 ]
-    default: 29600
 
   qcom,num-strings:
     description: |
@@ -239,6 +237,24 @@ allOf:
           minimum: 0
           maximum: 4095
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pmi8950-wled
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


