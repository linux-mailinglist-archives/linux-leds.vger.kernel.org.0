Return-Path: <linux-leds+bounces-2077-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE659114DC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5ADA1F239B3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6939B84E18;
	Thu, 20 Jun 2024 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia1YVTJU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956A80605;
	Thu, 20 Jun 2024 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919698; cv=none; b=Af6uLoqGo8AVj4xU4xEgsdyCEZjgl25LIjSeeq/ItLML5dTHkndSDH3mUxDvLewqpVeIjUGxGLCQbdsG3bkR++EY1lG3f0c4bb9wruN8pnqzl/2BaunyG3kLBG9xbTb/nezxMYNn362DroeJ+DG2bb6oVomlwOMpmOJWDSinWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919698; c=relaxed/simple;
	bh=qIfrIKATqfuPjRd1rJItllla07DSiqttjga7AD3nt70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OShQXk4NFe/dnTX4Upozv9CzeFpZ91pnU662EuN+SO//pqai33hUxeg8rbwf1tT4ar6cV9vTfvHrSA6kjpqFY9aXgUGKlt8vUo/MxJs1fAcKVEIA0clbS0E8cxRbhCOWwsx0heFZRdC12mZ1nNW9FbHttkjli9bV79ZQLVQQevA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia1YVTJU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217990f997so10940905e9.2;
        Thu, 20 Jun 2024 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919695; x=1719524495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO3bPIz654pf/D6EIkpGpwR8o7HByTNexKTs9bSHTKU=;
        b=Ia1YVTJUYGWoboidLnoYCEA8opzxMZTmANN0z7KxB3lDXAX47LIn6mS8P8Yji3McN8
         v5hIXEP71ioslhr38/C5TalnHz9cFtB+IvgWPJiMVIg4E1hXqYlgdEbXQgnyPdmTjdU6
         7kAjWQEGPfacUPed/ts6s0pJbVzFaqM1nmMWdNtVLbsGhuTM2PA+UHOJKdPvIaMBL52U
         mX/O0ORiTFnpJoG8eYGFj1jhYfF1b4s1912q304ApTd/+VYmr+a/xUBfaydpE9lmV1pE
         fcC531Dq3Rk9fltO++fALN8Up2d8a4Jnj2lyy37UXcbUcmJ1aM7LqBHnN9uvMHhd8R6f
         lywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919695; x=1719524495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO3bPIz654pf/D6EIkpGpwR8o7HByTNexKTs9bSHTKU=;
        b=pVT5iseLnjwTcLeJQcrBqgZJNOuXVxLzZTYfkk6rJQAyV/+844UonFIDfyMg0W3nau
         iJfu6zFXtQwkpeouADI9mcDA9z7FwpSNOLwiMEw0VkoK3Hc3zMtnpxCGabGFAvT1H+UK
         k9FjP6aaSnIJovTsA2b6/Wjwd/nX1ZtyJrZCQCuP5ggzP3ccDRUgL1Z/0Oes9VQ/fGTx
         7rrOyBuSGg1Fk4uR7Zrc5TmIXYNjaCcBBoOKgVMaGc+IUdxIQmNJWKVtjpw+aJACM6gF
         HvPcKmu7U48+dh4ZMJZjEgkGQlpfBRw5Gzl+cMzwevJIlVNwUivSVvY3T1ei68h42jnl
         JWPA==
X-Forwarded-Encrypted: i=1; AJvYcCVySfdTMs34ti377mw8qd+KbOZqYDHfwOAH/60+DrcponXWA1dcixy5aIQD8+Yt90O6eymwMBVZNysKWtTb6U+RopgcEEvGh4Dz+qFfrsw3FDSzU/xhjBtW9DwVAbxDZY1yNML884yCJJnw3rzF4Ae2yV5i7z1oSBKFIaerSxHQktIxEwU=
X-Gm-Message-State: AOJu0YykIn+Y0eBczCiUKRC5S3Zui+MaHPvYq0T6LS0ul2lFu7TYX3Rd
	DWZtqYTKdJ3fsnO71Zag64Q1StrQBQJeVab8ZYhzLX/0gEg7FtAi
X-Google-Smtp-Source: AGHT+IFEzWusxFXvMZvw4UyCquqT84VRYUFkbHavE4G7q+sRDOdCEFBP5v2CiIv83oXTkKD3pDnYdQ==
X-Received: by 2002:a5d:6a51:0:b0:35f:2a43:3b16 with SMTP id ffacd0b85a97d-36317d7365emr5143753f8f.33.1718919694915;
        Thu, 20 Jun 2024 14:41:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 01/20] dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
Date: Thu, 20 Jun 2024 23:03:17 +0200
Message-ID: <20240620210401.22053-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pwr-sel property is specific to ti,lp8501, make it conditional of the
related compatible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-lp55xx.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index e9d4514d0166..77828dedbb9f 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -151,6 +151,16 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         description: name of channel
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: ti,lp8501
+then:
+  properties:
+    pwr-sel: false
+
 required:
   - compatible
   - reg
-- 
2.45.1


