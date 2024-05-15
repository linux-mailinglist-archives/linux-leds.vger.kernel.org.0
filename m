Return-Path: <linux-leds+bounces-1672-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB228C68BE
	for <lists+linux-leds@lfdr.de>; Wed, 15 May 2024 16:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C9F61F23CD9
	for <lists+linux-leds@lfdr.de>; Wed, 15 May 2024 14:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52F8143C6A;
	Wed, 15 May 2024 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBu3h28U"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D49143C47;
	Wed, 15 May 2024 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783512; cv=none; b=ubC8uUhwjHhL9dI4CBro/dsy/E2+HkGJ773tOl04MYqbuDQXyhaY58LMjyzLogWy3lTLALJKoLlCNd9jaK7rqIf3XsxDMaQCZcOh/2lAZIGPsSQXSuUzxT7cPTopXxA8NyAS8tKd/4vuW9XwjV6DnRqQhjoImEFbsNb4EjKyIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783512; c=relaxed/simple;
	bh=ax35zVvMpZ7YpBaDMktu8RlntdfY/v5JxB/kgwoeI4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSYAhM/HmVhCThWrbZ8/A8PvR/Zi0rAnmh4cEwT0f2FB/eaQTk96mqTZYaDvUKAVZPZZ7TNuKeeafuDfxGqpO+XXMbkq5aJGmOg9JhXmT23k+v/jMSPnlamVFXOgYwllC6ipenliUCUBEd39TOfYRkZdEqEB8cCAYVwJs+dejxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBu3h28U; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34d8f6cfe5bso5423716f8f.3;
        Wed, 15 May 2024 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715783509; x=1716388309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3o07VRMVpwb16MqNXJLEDn9KQoBGTq/2iz5EAlrtis4=;
        b=ZBu3h28UN0nSHYu7B/gzdKS1mNE7I+OO8uPlCUyT7K0fwVbLDFVPRGerrinrHOFo1b
         bF1XSj27g9odVQCvdflRVjplhJfjH80V3025znOwsOS5sT/At1gKWPiDEWttZkPsOyP+
         /XkbSY7o4WAGXFSrRBjQdQAbPtAt7HpU6pEjAxCgAGxBdylGyERnp66lLUgEV84XbILB
         k14UOt8q/grz0B6D4UE9wi7zLrN5gs1aegr8tCIscQk1x9vLxSa/EOrCiZvezg3LZAlE
         RIuPCV09ZczXh14e/V33GDNOlY6fZ6s7JwRxtPKDtgfowjhNGC4dp9xW2SV1zexFPyO9
         5r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783509; x=1716388309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o07VRMVpwb16MqNXJLEDn9KQoBGTq/2iz5EAlrtis4=;
        b=WO2DWvJ0iG15YuPyZCkECxPTC3sJRX4BI0vWhk1/YmQlg3CNRokQlJx5m3qMQdqWrj
         3z+e/zPfoqTZTIYA4hKOEfbLAhClnzB4M9eMMY7lOxbSt53ND/1wd99OvhItsVnZGgrI
         pKJvEI9KL8WCOYsWTUAl1s4ecXnVC5JONeGxcG6ScUhBeu6iRTwdNLszLwllsEQg/heS
         VK3N9bAM7LURYzI0Hm8b47K79vJXkRduSpUWPnTHHJ/gxgY0bjTk4ucNfA2pIuqQeugT
         TGSSx7MXuxqF3moPI6Twd9m243LqBLMieip6VOSDX0l9TF4yYQKNGtrfCiv20cU+evog
         rbsw==
X-Forwarded-Encrypted: i=1; AJvYcCWh8jSafK5GtFv7M59CP5JGyOXeB6kC2SBI+8DNzJpHSVlp3SskFWwL9lykUgSNeSkdnphzyWM8svYwEZVe6rO89sT8EcQp//jXt0a1kdu2ZEIWZwbxj3x+vkBRmSikA0ctrY33Oa81DJYXeYaae9vcGbZrUdnB4/4su7nZfa5Cb2kjYCw=
X-Gm-Message-State: AOJu0YyHRve0MUr0WkPV7iJebKZMa9L4nqWmXQwJMOrB/OQbUFFG/Q3p
	h+pXOrrEvlmgyWgCkL2bVUHFqmIWPy8Jp/I+YHd7+WN7vjIuGgdS
X-Google-Smtp-Source: AGHT+IGPFp/R2XwNQS3idq76dJsTGQWChd6arRoNvToZEcaJ5sf7Pvqgt8zRaVPKGu1/d7JmH7ekCw==
X-Received: by 2002:a05:6000:d82:b0:351:bc37:c68d with SMTP id ffacd0b85a97d-351bc37c731mr6101727f8f.49.1715783508933;
        Wed, 15 May 2024 07:31:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b896a06sm16763660f8f.27.2024.05.15.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:31:48 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
Date: Wed, 15 May 2024 16:31:26 +0200
Message-ID: <20240515143129.31557-1-ansuelsmth@gmail.com>
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
2.43.0


