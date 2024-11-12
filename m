Return-Path: <linux-leds+bounces-3389-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 609109C4CB8
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 03:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193B61F235C2
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 02:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5347205ABF;
	Tue, 12 Nov 2024 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/vUqAWA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53E4206E;
	Tue, 12 Nov 2024 02:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379275; cv=none; b=G2n0/o6QULdk8qOnQwNdgkxtcakVibFbnTaQeMJueXqx/A8uTh4DLZxIxioV6rmUw+NgMpNJLc6kVLBKth5+4GwSEUl61p8fmhHt7Q4kPL2xjxssu6tg03vDmZbNgkFai0iIAxVzzxefsAkvqGUglg6584WQ3ZtA8S8yazc3aOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379275; c=relaxed/simple;
	bh=jl6088SbsfXaW9MfUE9nm15VLjSxMoeK4y1C4WyPoWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sy4HijmWBgDyyw8Vz1Xy7rZw4XtgGPJAAdcNpXibLXOcBffZbywZDuqpWAyNB78EPXFRTgBIw+EMyKG8u2VNaOdlYwlSG5/6JEMFGVuJZGS2bl8ahWrQU8+lzWmsg23TduFv7YHmEr/lkw7p8mIuDvOEdPWjXCwQy8zkkyOOAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/vUqAWA; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ce3fc4e58bso30090186d6.0;
        Mon, 11 Nov 2024 18:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731379273; x=1731984073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v4c0zVwDO/ANV8imc9i8efR9gG0vcKpmvgynk89r4A=;
        b=c/vUqAWACNlJTFmaHSF+2khdRs0o9RrClBRZXC6qJXxSH00iAlgLL2JgzrKXCq4XZ2
         pXE4t59GX1u34T7IeKd537efIu0sIYgTo74cPhsBy3Poymo7mgVAguJLo9LWUMk1sKRo
         mqnYAC0gfJ1oSJY8ufJgrQBRwhnr11941rFVh5jCEjTBHm46RbT0cv5YDklnwE9Zjs8j
         X7TtuK6rizXHbXwxSm6Hz3R6GdXgAzrfkEXjjL4fJUjsoZ2IeLh2o52xC4bH9k/JSnY+
         eifc1+Xi1ZsMSayyK9rQbXNLgceDMIBNf5/BvE08QEEeyxe2uMHGaOkm9dcOH0eEDNrt
         XRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379273; x=1731984073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3v4c0zVwDO/ANV8imc9i8efR9gG0vcKpmvgynk89r4A=;
        b=TJxNaxEd/8MsoekBPH9t8Y4NDTAtmfEUQLbWzSenwfpq7zeJY/Q8taFWjCOUI1Ce+1
         HzUOH82MTzgDa9xji88wEAZUo1GqO9S6wgfPJwFk3XOebXJd4dpAr34isnJ170ZPqf6P
         N0lO3NBeu4RS1WQYm2XJIB/ECyRzTSTzApYeYI9Qp4+4MlE1oikYt/jRAMq/loXxkMHN
         Co3MB0hKQagSf5CicxAfBLsiq8qFQ7d/BpeRqJ/7M/UWwHdu+qbqcu+/Wb6NDTlXZ6jJ
         XTgKaObwQQYiNzJjBedRp9oMQmtdlObYOydyWOI4gkh8Q9tc1A+2QiW5jG1vGwZB2A1p
         0qFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrWdUJFD2H+1GxHyyleFCef8xDKwql8kWEH/jt3f5gjKsENbhWWYaWpYXxoawBXHXkioh0GIP1M4Y2QQ==@vger.kernel.org, AJvYcCUv8NxD5qkC+VCloRwAqlMqJel10X/jdM4F2WiOhO6R+w2GlLNvw7dPL6KU4YLcAktbv2DEa5K0IIMl@vger.kernel.org, AJvYcCXQ7w5gMVcGp16wHfArrz+RdoOAaipIUtCXUsqYtM727tFmdNCt8YN0iyMH551gAkZ+/cCeiyGLGCyVZ+XFyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKRDoBltYCub3d0Zq17S7SH+hxctdY0rV8QwZVNFLQUq4+46E
	3FL9EMUkLHzIQmrgcgHcs1Hq0wK/2B640xxooNTfxgnrXNgx5bOa
X-Google-Smtp-Source: AGHT+IFCQ58KKXKUpst2SbH+kU4dpZM+zMjooOk5Hq6hMCmenGuC+lWAArOCKyq1xd+nFmFOonomLQ==
X-Received: by 2002:a05:6214:3389:b0:6d1:9f29:2e3b with SMTP id 6a1803df08f44-6d39e12534fmr186574896d6.13.1731379272861;
        Mon, 11 Nov 2024 18:41:12 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::ea7f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396204b2csm66196616d6.60.2024.11.11.18.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:41:12 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: add pm660l compatible
Date: Mon, 11 Nov 2024 21:40:52 -0500
Message-ID: <20241112024050.669578-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112024050.669578-6-mailingradian@gmail.com>
References: <20241112024050.669578-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the flash LED controller on the PM660L PMIC.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index 1ba607685f5f..bcf0ad4ea57e 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - qcom,pm6150l-flash-led
+          - qcom,pm660l-flash-led
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led
-- 
2.47.0


