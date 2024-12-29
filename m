Return-Path: <linux-leds+bounces-3709-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310B9FDEBA
	for <lists+linux-leds@lfdr.de>; Sun, 29 Dec 2024 12:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A8E37A11D0
	for <lists+linux-leds@lfdr.de>; Sun, 29 Dec 2024 11:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B0A157A5A;
	Sun, 29 Dec 2024 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCerw5/L"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B67156678;
	Sun, 29 Dec 2024 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470851; cv=none; b=jVIPuTNdKjjcM6yuRir8V7LpqPG/bm2ngqy4oGsrauQkg6v9bCc3YWnvgUHLweNCVXdJg3LUKzy8zulalFnWvk3F4Md/XU5VqSmaMSfWA41pTql+4GIIxaNKbLXJB7TLrmD9H14UZr7YckMVBOfFmEy+IOUNVsURo7sVsxgtT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470851; c=relaxed/simple;
	bh=O3rKEWl5r7FbliJwJ7bQIkLZxxlXeVzYgSqaveO1SG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ie9F5gVKnWkaIS/5TG07Kmr9v8pDtifOTs/hgivuryhjMcofJy6zFKe/SjYBtMWnJutCnlxklHaVanGlBeYNVufV6jaN58ZCPIxvPlLOIHljsOcjBHt2m3DjI/zZ03a8nD8jNTXwF6kLhxEl2xIZxNRvvBclUAcm0i3LSd7TecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCerw5/L; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2156e078563so94013525ad.2;
        Sun, 29 Dec 2024 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470849; x=1736075649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
        b=QCerw5/LQLgBHPhTJoxzV8hz/R6DVRr7QSyAyRiziCc2NnXsTH0SY3hxtAQha8O6uv
         HdKY3HRwJquYRfQs79YUp9rACvsQ1/cLlQd8gMM/gOFs2Vt7a2QG/31QULRr7plJWVr8
         OOuSZfIDJV4ENqrhzEJ8wZdu+SUHlSs8YRMNpO+s+3UiC5qKMHXw0WP+YNH0YqT4ect8
         QCO/e0MMbc2cdxOoV+XH8ZHHdXU572Ae68RjUqtIG5M+UIGHR2ScfHtqBBOIVPatSo8D
         HYIgAhPYjyfdTZ/wb+WJDRnkmAbCdWT2aRVywgi08r15hpcBnlEambboeCnPakbcXFhM
         2hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470849; x=1736075649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
        b=P41R9kbLRPTBQHitMU4NCaLyV1fSf6Ab99VhfUcLBcu7hd05GUIklz4XgTZ0n1De00
         k42bJBbm3qGxNtqypWeQzghU7mbc7Q/9M7k6AcXZmuZgKuJxAKazE6KmhWeQ+7FlUB6S
         7y/yhmB1KcBdHcdTw+ZAR6uOjCO64TZnGPxoHWhwM8YHanwQh02+6ylZpqgw0AWnPUau
         ZC7v2WxlaDv8LlHkFqY+hfG3VAecXh+PB2bqoW7krjNyDYiOgZyMKM4BgnUkVRE3HAo6
         wK81P9nV30rx++nIqpzUAY0fV1MxvMtN/eGRYwkxzUOe6yBTaOwcfEKvfJ6+2ydJeIEM
         T9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPT9FILXuxuo+5xGPQky5AMGzCScjzAAFARTBDCtkMF1F1OvRa962bFlFd5eVXjwpJlRk0velUKOaUmhE=@vger.kernel.org, AJvYcCVxOKpVijSUUXv+mOKK0HkOUR74CFTxmQG/tfgzB+JoLVbf9+YeRrAhyvISuS5uMVSwgUj3jA7rtEfPob8N@vger.kernel.org, AJvYcCWjYTw9yI5Nbd7pSLlTo26GTrgibm8f0HvtifS8qwIrGEnO2xjtHt6DGty6FF+3xztUrppRXff0dSFLIw==@vger.kernel.org, AJvYcCWrHv4PDmhOg1c6jG0XKsOtT4iz5drbmpw634KqzJ/iCI1kOwAVl+83RZw1XB6LhOyCv1nRQdreP2G0@vger.kernel.org
X-Gm-Message-State: AOJu0YwhuKGrp9XxR4KlLNditHIEHDZkkFc3wTAE0tdi15h+GIJJrQix
	Ab/sFqoqmfgKqbxK5Hnl3yWaAtgd9T4MxwROQn4ygaAJA1tHi3Y1
X-Gm-Gg: ASbGnct5Wv9en8mqsAxRFbE8hl4m3M/Ntuf71/+FAqN/MAkIEqQvRsg8yb/iFTOblyO
	DEeecN2upEycHRlGaB5DHl0iJNgvAaqW0vgWIIAThUz2z3RHv1RJIBQGrN2oB9fC72qOI6thJW6
	hXoQO6dggNDRq1vf12H2FXDVEjbwZaXzJjOwb89tmQVENSHxUJ/ovgJlfIaesnGQD2bUZvQNEqe
	46S9COEsi2uGAAltnZUdCRSZ3cmPxmKApBFUyjJQxkR83NEvwr361qNXw==
X-Google-Smtp-Source: AGHT+IHw2F+g8azy9+A2CTTjFUe3/G4dCC8p/k0dOHQU8Dj6MYf/830XflujqJ4t4aGM+bWVkhywyw==
X-Received: by 2002:a17:903:94e:b0:215:96bc:b670 with SMTP id d9443c01a7336-219e6e9df70mr420824845ad.18.1735470849111;
        Sun, 29 Dec 2024 03:14:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:08 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 RESEND 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Sun, 29 Dec 2024 19:11:17 +0800
Message-ID: <20241229111322.4139-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1


