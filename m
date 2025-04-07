Return-Path: <linux-leds+bounces-4425-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34964A7DA49
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 11:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045E33ADD1B
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531B522FF21;
	Mon,  7 Apr 2025 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hy296+X0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88044C91;
	Mon,  7 Apr 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019630; cv=none; b=rPC2A17bLhDVYt1o7bOQ/Bj6O6m16gFIFOxDlr7NKyrvYPFfHhdwRZbfNzbzQnBnrgzLP7Yz4cHRAUl4kludKPYvV46gYcq+KqgxBY5dHMjhp/dT5UMWsvmQgqTlDiU2ToxV9ug6FaBxKO5pW/OBTNsPOACl23AlVDqZOboukMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019630; c=relaxed/simple;
	bh=8Il7h+a5b3h05r8RBbvRTr1Tp8J/YjelC9cHTJWl8Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YE7f9NWZLSZ+XNmh8F3lKQ9dUwdIV00w7LL5Jjt4TxdUv+D4xzjBYAvcICWw454hu9FD9/egyV8x6ZcaFb3DDhl/QDYEr3ZoTqdq4QnFUZt6F7yTflkxCwJnIbgKfB+6PT8JsHH+rJESQoxDXW39QkkX50f7OU7w0G63T7muy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hy296+X0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22580c9ee0aso42929885ad.2;
        Mon, 07 Apr 2025 02:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744019628; x=1744624428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg9lEoL65QzJMd1p9NbRIABfnXtPImWz2QQY6zZN36Q=;
        b=hy296+X0A4550eqzwhEk5dMmXP0EkgfdW+XN212BR0geI5U9yTzbyk3qqQ1JNPXtRH
         UJ0ZlZzjg8dtuFZH7sdxmMufLj8PvrpJCVhzPqk+WAxBBGxeB77wpyiM4RCcxWtvX23y
         qEFY/RQ8y7+fQdNHOUxNtJrU/lAgEn/tzgn8YlebjSfMOv0RBq0A0HONNaMHCPmjAtOu
         QGiJcz+pDONZDVI2ITabr3bqG70jDoU1KSZqkwxKNhNtr2tb1Bir/+CTGOJwHYdQFRP3
         gp03v9sh1zBUnzt2P5qYQpiEF38bDyDg2pjkZBQNX0mqkyn7MrQ+yMf1rCmUZIukvQ9e
         CQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019628; x=1744624428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg9lEoL65QzJMd1p9NbRIABfnXtPImWz2QQY6zZN36Q=;
        b=nKaYahjzhMWA/Pf1p2VQSfpqzMp21abod+qKHqxNMb/FixylO2qYn8F6dHDwrDxSm0
         XnGb1Vx/4r8KWskIhj4DCOnkHtDcTHLVHeae1W2k/OqnE1Pcpys/CU9I/d502qvGP6wm
         wrAchnoNrxyXf1KVzn0fUbjJVkd1SM9qTScxoJJbgA8S/KmW4aqKaOuVr/y8eiR53m00
         jkrYqLcQCltFGVfhYeAZB+E6oOq4zLW6nTgin4UJNi1+j36gXWraqH2dTeJlTZegGEc/
         FUqwSMi6RK9ya/mTuWE1mMr02A81P5KuKFxyV7xEJ3kzCwt1TQjs0FkoywrjeM1M6obF
         BDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwkovU/B2FIYiyqty7JIR5D/ZWI65EdIpZvCE32yxp2FUopt24ucUvuSiC8SYFf1nqaJXrDnKZDBHkTcUe@vger.kernel.org, AJvYcCUypbOcF6c1MlM40dhjXSbKTa9dftcN88kcj8rfggAEVPQSeUKnbmQ9tU2Ab+AHGiZ4vvl6/anfpPZBYA==@vger.kernel.org, AJvYcCWNvNO/a2V9Cjs0u7T1KjuoI7m62JqSKu7POgj0OC7JPksjKubwIqxnlB/En3FSvJIiOs74/Q5BdZ87@vger.kernel.org, AJvYcCXy+MPidSgeRa8uXbvcC5m0kucQyDdcBUq6frSuVxEh2IprTb3tqeLh1snAi+i2m4m0U8Gz/eGUknXB8EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjd/lOd9AkqS8zRjI8ESwsZkOzNzYlvKFdDlzj23x6yfWmlmwz
	cB7Jh38PXQPALTCrdRPdJUUmgoH4I9a/paDO7/ixUpuJQPhDlFNj
X-Gm-Gg: ASbGncty/fAq/E2YvY6/eH0AT7kvevPA6iWrahDpU2Kft019CjfydsqJ2rxyFRW9q+b
	ZaI3dSIryMzTO4nHoEjztO275SEPFMr8LIc83sg7fIhevmamYs2J1oTbkjzlPSD7BCULRtbs+1w
	dSPcjAA2JooCjjoz8X1UNZsMlMkD3tnkHosuw/bV9tJqdiQNPlM2gKgIlLI1UslQMAc00LAeKl5
	SFmWM22fh/z9/7iH7nhdCXt+J0yBwSYLTTihrN0h5KjrKp022zHREQjcnwwJc3ynJC0hKpfUI9C
	2ib4LYdKyAaRi94oCDHFvbcZ+qUQuxUhDdTWkJ39C3hDl4yWOCDFSw==
X-Google-Smtp-Source: AGHT+IGqfDuPIWeY7/3IZ1+COET6x2KSkLggAv3zoC6YR9cO2KRSMw8l5ILuBVRm8a0vYSnxe49kKQ==
X-Received: by 2002:a17:903:3bc6:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22a8a8ced77mr154326345ad.42.1744019627964;
        Mon, 07 Apr 2025 02:53:47 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:53:47 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/4] dt-bindings: backlight: kinetic,ktz8866: add ktz8866 slave compatible
Date: Mon,  7 Apr 2025 17:51:16 +0800
Message-ID: <20250407095119.588920-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kinetic ktz8866, found in many android devices, nowadays, some oem use
dual ktz8866 to support a larger panel and  higher brightness, add the
binding for slave case.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../leds/backlight/kinetic,ktz8866.yaml       | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
index c914e1276..825a6fbf1 100644
--- a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: kinetic,ktz8866
+    enum:
+      - kinetic,ktz8866
+      - kinetic,ktz8866-slave
 
   reg:
     maxItems: 1
@@ -58,9 +60,16 @@ properties:
 required:
   - compatible
   - reg
-  - vddpos-supply
-  - vddneg-supply
-  - enable-gpios
+
+if:
+  properties:
+    compatible:
+      const: kinetic,ktz8866
+then:
+  required:
+    - vddpos-supply
+    - vddneg-supply
+    - enable-gpios
 
 unevaluatedProperties: false
 
@@ -68,7 +77,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    i2c {
+    i2c0 {
         #address-cells = <1>;
         #size-cells = <0>;
 
@@ -84,3 +93,13 @@ examples:
             kinetic,enable-lcd-bias;
         };
     };
+
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@11 {
+            compatible = "kinetic,ktz8866-slave";
+            reg = <0x11>;
+        };
+    };
-- 
2.49.0


