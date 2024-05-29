Return-Path: <linux-leds+bounces-1720-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C18D3EAE
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 20:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA1B1C22459
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 18:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35231C2309;
	Wed, 29 May 2024 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBXp68ye"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A6181CE2;
	Wed, 29 May 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717009157; cv=none; b=JIjeuo4+DMRHmEk++xoTJQZAb349FVMhtgQ6fjcJckMzMr6zeJriSQcMgNPQVXE5cjn+gMizbLFfhqnBcJJgTrWspdyNCBQNu4DyOkeIMyji1Y2k8hzwQo7lGAyvkwKwqfn9TxnhGgnL4Qd08KYykNWwAKpY0NjX5VG862f06C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717009157; c=relaxed/simple;
	bh=zmlEeR9fqWoZOWgKSIAR0BnYHc5xX8dghAkYYfuCWLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCuc8r4ENiyGCxFLCCuy4wxGSRc1n7F/hrn3Cj2Z0QHAwmLNzq73vRVXfJS1r7v43alAIiSQ4mXR6BTrXy6heoreS7O7jITMuaSl4txXApkJDIh9lKeCyXKXpSruT1xhXW1y4GKmbCwjIvunDxvK0Lh1Il8/6kyPE0JlnSFFKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBXp68ye; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42108856c33so1715395e9.1;
        Wed, 29 May 2024 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717009155; x=1717613955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqbOftymuJZXxV4IxHBqDJd32xD2wTJjXnpBj9fmizg=;
        b=CBXp68ye26i/duNQ+eu3esOiDGOj3FNn48aiB3h2P7fsCZxM9f/8PQ/5Kf2XWtD6fY
         ZJQMBY5xRenT7W6Yi1VURupt5FDnIt/RMWRIY2HKTslyAiYdV78Xzgjx5x928lOh0xCp
         ysmLtgGICavtegmiLevwvw1Os3dSu/Of/n+LFTqWd6NIEL56zE6iGy4jTv52uSdPvHZH
         qZFJ2dfbUMT35p0+RTNufiHYicugSimbqSAizsznhdhssWXrKaj7eA5i4klpIRFY5IWj
         qOIQYn+aPED36GqaqQwyyHnW0QmDVvwVSjbcdt3iLXCLAAJMKKiSr8hoy9MeKi6gUicd
         kSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717009155; x=1717613955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqbOftymuJZXxV4IxHBqDJd32xD2wTJjXnpBj9fmizg=;
        b=VufOoVvvjbKG8OyEgqhJ4dpZZeNg1am+vDsy/pFiRN62GVIh5qDE1Gfh2PiEw1y5Pb
         NpG/xEEKXtJwtyyENukTXQgMpz1GmKLYN6Gg6k0ymevI6xnH0bjaZJo19adbf6OZ3Mjq
         GiWVB2M4UqnB5t8dNYA44xmSNCI+3iMfKr1IDyHgis8E5oHVDMiTM+nymW0hO2eSQrNH
         OJdJIx6fjf+Wp4L2KJJGttZQ8psVpcMyHbc8ijO82XlyggrD5egBzAZRMJrv/jCxf8r9
         s6kPYQ5rw84pXb2CM4z7r3lfss1HrKcgYWRsORCYT74AwPkiTq7kGcUUZsEovfveAcHf
         1q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqT1vEYt+IcfhTKk7t63h7YIKnUf7DgUMOTMdlhG3hczCYH24PDMZAcmb2xnwT+brHWmhQDhLHCi6YfPSvLF1Aa6lu7oXd2i572YW6KoXUTFpOs0cCVAzKRpdIWWQKUqO8Qn2D8tbdaKsKtrY1RMVgB5WBfiI+gtEpc0OTl8m0eAmpcuU=
X-Gm-Message-State: AOJu0Yw5VV9oVE00av7uc+FswUXJ3EUij07a7Na0l4zt03TDSTOO5hHC
	VRSom3AjXy8eVdlh3SKXm/0/Hfh18XwITje+dWRO5RG5+o6RbME9
X-Google-Smtp-Source: AGHT+IE0Bp8p6GFXluVGroj2syo7ny2QqXmVMy2O0CvTgED4mSVn7KSmMpe8hWySue0ZO/88SnVamw==
X-Received: by 2002:a5d:68d0:0:b0:34d:b0bf:f1b5 with SMTP id ffacd0b85a97d-35c7c6988c7mr2302699f8f.35.1717009154370;
        Wed, 29 May 2024 11:59:14 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3557a0931c9sm15442206f8f.65.2024.05.29.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:59:14 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
Date: Wed, 29 May 2024 20:59:00 +0200
Message-ID: <20240529185904.1448-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
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
v3:
- Add ACK tag

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
2.43.0


