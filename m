Return-Path: <linux-leds+bounces-5021-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D491AFE81C
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 13:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95016587961
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3222A2D9EF4;
	Wed,  9 Jul 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VBt9VV5B"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87E2D8782
	for <linux-leds@vger.kernel.org>; Wed,  9 Jul 2025 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061611; cv=none; b=LLQMc6ENWDl0cG34LqDoHa1uuOIm2EPggLdLj38iAHQtdixAKKFv2BXl/VIw5WulTEiSMrCUn6ZaNN3rms8CAZ5mG9e1JiCDtw4ht718RdHR8EyoVPLF1puHOyo2DNMXbxL3lyfJlTqQ6UJW1MWoyuUZXE/DzsCEfeuWIGSR5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061611; c=relaxed/simple;
	bh=PvZsZ3xz+u5VNLl2F5wB5XkOzE0mkB7Ym735VGNcjBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bAsKlZ5bsO6c/XZfCkd7oXi5a+NaF5CyP6dzM1DvymsUHpBxm1P1LpT28p3uNF0fobciwxd5V+DB5r6tNIbR4G4/P0W1VYjKWXZ0H50ZL7UoQz4qhVximN5KpkSrwrLRdmZGk2zdCP8P/XaEcOjTx/UbReKJLHY69BFTuq36M/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VBt9VV5B; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1122296166b.3
        for <linux-leds@vger.kernel.org>; Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061607; x=1752666407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EegHvYrrPCIQqgQ2t8JqZ4VMYnZfDGCQ8pNV8iQc7CU=;
        b=VBt9VV5BGjG2qdOtZZi+3n2SISEIPJcgZK2ad7HSrLHG5Ci9UrUZKnqAvEtE8cVxPP
         ioOxHwEmswnyGrTCwSd6mzPxR/fKNLnSvmIdWygdAAoY8r8N5w/lr+nBr0R8S4pDfcUm
         qR/JqiNftu24j76EjMgcegC+fpurN6T8/LWYDAxcmN/x9QmvrRmezMi3+M+a8XW8vKnj
         70MkceQMDFmgJglNViG8V5Z/VQkQE4PvS6OvLriE61c8uYcy6dgkBB6wrgahJbOp67XZ
         8WeJ6FpoL9rnoXGbNQgvM0QbZFr2YdO1z1yLyi2NyShmRS98WQ7kyD6671HGS/ZlKCBE
         68TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061607; x=1752666407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EegHvYrrPCIQqgQ2t8JqZ4VMYnZfDGCQ8pNV8iQc7CU=;
        b=gi+YBehrWsa/KGYveN5WCt0L6uCWbrPGeA0I5Dqo315lc6yeTOld9hH7hEI6kfFIJx
         CNR/vFO4ilDe8Hag1qKUIlckyMeAgkqBJxnkLS+hE0QJqD7fWFpQHCOKDizmb/ODzHQC
         0TB/h92BamdZWTIel+G/6Uuf90Qj0Q8dQDAZ41oN20qkd9WMK7E3yPlM60jBQXpItUk0
         5fNG3vCPQahABic7Fp9vDfKMnmQGwLR9QBiwEL41/03vE1N1ru2bBqlXeK9hW68t79rB
         1aYFXL+1FlOGBpMOBmPqzA2uwKu5mpmsOU+ieopsrfi/HVDZ4LRezY4LtIl+vSh7F8Ma
         S18A==
X-Forwarded-Encrypted: i=1; AJvYcCX9K+pyBOVeZQ/OIC7I68yWMlZ5ABPjJ3jfbhaScOR+DAVtpN37FtSE0zdqZD3wvK+VB6mi4z3y5a55@vger.kernel.org
X-Gm-Message-State: AOJu0YzuydAQKeE0KCUWOzxlKpggmgrjYB6E4WiupKjhZnh3wtpyDsir
	L8mImHib2kuGoI2b+hzknuEu9I56vPmqbQQo1U5ZWMflGzqExF8Or+6XpWJxCx19Foc+/kSPyhi
	4H5yI
X-Gm-Gg: ASbGnctk3Mc2cfNssuC0eKdMLQoQBwFPfZn+8Cr+edLE4uWOuzTRS4G7HLy3qGXD/Q3
	BlQ0fCu/xy5nBIBC6u+VxeufWLJ9sChpDGNXGK5n250gtN7n0tKfVT/tXg2FmwuyVmdsKzOnH61
	tc8NjbQO2MgVJe3Xc7JuluMNz7UIKWdnlWJ1iK5Rqwuc1/vBIW3qHQXemHGOoz5xhk0Nvte74kN
	jqrvO55MsH79rm2f6byRbwKuu3g3bDLOgJbeCakFORm9oIwjVB01Dmz1VJQg/RI0tzaqaMLWyzr
	KBFHajw7nzbVVncSkqXypA4AGkWd0ej7uy+snR+q15b0WNC7fOvJ/1Y+bREret/QICD+Etbq+WO
	b3qTaGQDj4FXoG3h+Urklbddyge4LxrzT
X-Google-Smtp-Source: AGHT+IH8++sSptF4PFmgOO2SoVkqa8kWBrD2klC0z8ScVA3E4cagnkpuHMUm8tmFrS3e+H+BAb/SOw==
X-Received: by 2002:a17:907:9304:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ae6cf68abd3mr244682766b.20.1752061606800;
        Wed, 09 Jul 2025 04:46:46 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:33 +0200
Subject: [PATCH v2 2/5] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-2-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=805;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PvZsZ3xz+u5VNLl2F5wB5XkOzE0mkB7Ym735VGNcjBg=;
 b=+Lg9tCTaCrXGzDssZR84RrQo5jkI/91wtmSjNyg3a8RuAWb1/jKnh/d5ruDCxQ1+jtnzmbuLO
 xjJddmrddxpCCKc9p8vN9KaA1+nGMo2J39cjNnhUTDGOED0PeVOsLG2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PM7550 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..d0c54ed6df38db82e626ebc0687cd5d3887abc5b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,pm7250b
           - qcom,pm7550ba
           - qcom,pm7325
+          - qcom,pm7550
           - qcom,pm8004
           - qcom,pm8005
           - qcom,pm8009

-- 
2.50.0


