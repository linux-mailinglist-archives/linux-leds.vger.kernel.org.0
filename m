Return-Path: <linux-leds+bounces-6655-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B3D2CEC4
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 08:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D16BB303BAA6
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 07:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86EE34FF4C;
	Fri, 16 Jan 2026 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jq0DgXC6";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QyLhnFtR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584022517AA;
	Fri, 16 Jan 2026 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547288; cv=none; b=dVd7mRNGLaj9oCNfuyuBkLcENiKyc+0m6JXj8FfA1N5+KVrrGGmEHL3cKsrP9ise2jD8L1ZLGId3cZquFsK8aCAnKv1Jy+wuHSGTH39HqwVOe6DNkI5/hRDcHZDA9IPs2B9O1XRcrQbaTcKAPfwEeHgAOwQzKGdfW0HlKSNhXiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547288; c=relaxed/simple;
	bh=+Z+7Ue/bQvJDRGQtEfV4EMexSZzq4Mmr/AfR4LmNRJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwMBZCM6kfkLD1wpmVz+cl/Drd68QigHXNInV1UiX9b7mcOnMRDud7VLK4MFYhD3xYNygE+PLKbVDcyYxc+ESKuImvOtkP2gvrWJPH3K3tZtylEqQ8xdkcdnqxd/FhP4E4673YbVEd73Bm35jloAXGmgbUbWRlQRFqoRcEpkRZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jq0DgXC6; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QyLhnFtR; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547279; bh=Yj3R3LSXDIKMIRJ4s80qRXc
	cHrtpbMjXCkt9lKktnz8=; b=jq0DgXC6xSypmYksl+WVs7NotZVYiM+yV802jyfjaVTFnipHvc
	8+9z6tCTYlP7dEqOwGqSaYI5/ttPtT6anMgQGf2vG4UkZ698pN0L/OiNNGvszFgSMILJnQmDGys
	McMhTUYcYzAiMURyvNQqJn67yn3fxI/E0QwYnoCqW3ULc5SizagPpq+wg4jH0MziLwVI3IcNkQY
	Ux30Ft8Ai0qolr8qFen13KM5cwzv7HCgSLz2Vkk5fgqZzKHnsUwC7DZ4E0XlTMQl5HnAtCDAyEn
	XnRpribPpC7wUnX+6Guxa4tG/0FrrvvTHH6q0xN664O+CTGrn6TIn0QKhYrgBo7R5IQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547279; bh=Yj3R3LSXDIKMIRJ4s80qRXc
	cHrtpbMjXCkt9lKktnz8=; b=QyLhnFtRqcso5qNbQhH+SH7V33ZbcLSIcMQ5Up5gEcG9k+M+aE
	0bp8F+h1sHcM1eRGmlinurHrndd9Sl2oq9DA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:35 +0100
Subject: [PATCH v3 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-3-e6c93de84079@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=989;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+Z+7Ue/bQvJDRGQtEfV4EMexSZzq4Mmr/AfR4LmNRJs=;
 b=GsU6er1FmH6yqzdsXoCg+LFLlsU+cRar5sXphkj4GZcsAG0lfvwJ4tUpVPBSi19DHNfY4FMgU
 o8mF1DkMfj9DD80melNoEsI56Y3LPv5WAVSDxfedvH05CbKhgasbYoL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document ovp values supported by wled found in PMI8950.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 19166186a1ff..a54448cfdb38 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -243,7 +243,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,pmi8994-wled
+            enum:
+              - qcom,pmi8950-wled
+              - qcom,pmi8994-wled
 
     then:
       properties:

-- 
2.52.0


