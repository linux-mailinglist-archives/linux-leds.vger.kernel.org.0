Return-Path: <linux-leds+bounces-985-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5C866B24
	for <lists+linux-leds@lfdr.de>; Mon, 26 Feb 2024 08:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61B801F219B9
	for <lists+linux-leds@lfdr.de>; Mon, 26 Feb 2024 07:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7C42206B;
	Mon, 26 Feb 2024 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJZFy6W4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268EA208AF
	for <linux-leds@vger.kernel.org>; Mon, 26 Feb 2024 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708933045; cv=none; b=ihYQhNYKG6fBsv+lUsoGfbU++9eqDXw6Ux3lJ8rS7u8cXPsJVOM2y9OOMC9DOEkie0zeYaZJfvErTMcn8tlQm9WHh+OhFL1fMBmhzBwTSFaKBZd07WYeMR2ELotDCZORVzn3D5MQu32wKYPqyXhcA9wq3atq7N3rTszGPcTMomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708933045; c=relaxed/simple;
	bh=MSLO6p6CLg5E7T6Q8ECa0ZNmYj3H9/YuL9uFR+h/0zA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kCI69Efnk7WLt52LugJv8zvcF+IMzGqWbC8ccztlVGtJPr1mqmgociaN8Dj5GjWZ7xablyzHclWDBVO2J4GxqyoHFrLDyb4EP0EKRoFFTb6BvgwU7dpNvuWDG9MATOr4XEr+JH5YkaVpDPNsUv1B8d90lPo2DIpPjmNajkUcufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJZFy6W4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3e5d82ad86so375924566b.2
        for <linux-leds@vger.kernel.org>; Sun, 25 Feb 2024 23:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708933039; x=1709537839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtudR6y+jW6q5p42Avp54tksFKxCeQO9bbxUbvEIoSc=;
        b=bJZFy6W4LqWlWMS15YCdClvA9Lv55qoJo9ttPxxUlm7VZD8ECtoYKW495w1qk1YSvr
         55L0WIIYKfvk662/yvcqtrisvg1yCcek0at7E1iwX0jkUUUdRE97LJ6udcoRg67cnNAZ
         mCUkx9IheL5bpLgXq7w8Qr95YWuloroSJPQkBra6F0n9pPX0dho/YDk4dWiOGrv7p45o
         NZ6Kv5TDFckQnwCq9qEDqcF6Uc8pBEe/R1JqcQysdoDqeD871ni3hZLmc7YiyVmABRUB
         xVMVSFc+Ia2fk7e3Z2HOIAXhIckGrTfM1Vivy8R+ahGSMJvKDKocsYwYp6xHZKfA0ygE
         A50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708933039; x=1709537839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtudR6y+jW6q5p42Avp54tksFKxCeQO9bbxUbvEIoSc=;
        b=JhagSdoMWX+KECBI8CcZmrWCSpSrmORcjiNFrDqsndLs8CBgUVYHtQDjZtykmIfAQG
         qSlCq0hN1XTRsnQCNSh0DdTrEW32eUtxy83+WzXCa1M9QZQiulPb4YObnvGPCBiPHinO
         1bg0kctzFVfJN244hXQhl6vWxSzydV0qPU59E9bBCDe98T/FiQCMfpL8c99jRtHM7rDc
         giI5BrRWMF5hXz795Zf5ncfciKk5T2Nvb7zirguMt0P5eeDliVkDwNqxruSFfJaUfj68
         8T7C9dPDyb2HRSNH2xML5+EYv7fU7wk4RBUyjdi583sFJN+pDcslq0KTbDWKTWaQOm57
         6lCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr/5Wtt0pquV+tXK+6XmBHsJ90aIMEyNr+sKHL5B1w2UkodMBHC4Ax+xzLhnv4cpf5lXIo4QU+nqZ9550HIkSVu3MvNkXcTzKjmQ==
X-Gm-Message-State: AOJu0Yy+TV3VoVRwXvNh87i4WOX5S5PtubnXFgeJfi3XqDGuciNiBkMi
	XAfI4jWtlgzleMU+CStLjBOZdhnbMhPXsRnTN1HiH1nsjpOeS8WVwM+TurgFSS0=
X-Google-Smtp-Source: AGHT+IFVp6TpNqDWsEk0yqoJn5EaMgZgKDSvrj3Y1Kg9YWhf2qj+4uBY9G7da3cgtt8HkiK9LAofrg==
X-Received: by 2002:a17:906:140c:b0:a3e:dcd2:2746 with SMTP id p12-20020a170906140c00b00a3edcd22746mr4391929ejc.3.1708933039586;
        Sun, 25 Feb 2024 23:37:19 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id y8-20020a170906558800b00a3e8c3fc3ffsm2187425ejp.10.2024.02.25.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 23:37:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: leds: qcom-lpg: Narrow nvmem for other variants
Date: Mon, 26 Feb 2024 08:37:13 +0100
Message-Id: <20240226073713.19045-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226073713.19045-1-krzysztof.kozlowski@linaro.org>
References: <20240226073713.19045-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only few variants support PPG and store LPG per-channel data and pattern
in SDAM modules.  Disallow the nvmem for other variants to make the
binding precise.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/leds-qcom-lpg.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 699db7995dd5..54a428d3d46f 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -130,6 +130,26 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm660l-lpg
+              - qcom,pm8150b-lpg
+              - qcom,pm8150l-lpg
+              - qcom,pm8916-pwm
+              - qcom,pm8941-lpg
+              - qcom,pm8994-lpg
+              - qcom,pmc8180c-lpg
+              - qcom,pmi8994-lpg
+              - qcom,pmi8998-lpg
+              - qcom,pmk8550-pwm
+    then:
+      properties:
+        nvmem: false
+        nvmem-names: false
+
   - if:
       properties:
         compatible:
-- 
2.34.1


