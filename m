Return-Path: <linux-leds+bounces-1682-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F58E8C9144
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2024 15:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A76D281C0B
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2024 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B749376F1;
	Sat, 18 May 2024 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0SzZDXJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE531A8F;
	Sat, 18 May 2024 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716037194; cv=none; b=FsJidj+5oFLiGTt5svM42clsBNYFbUdJu+68QQi91qwTUEP3XfdB57nYH+mrCiwjRKr71TF9Y+aukhu07X1CdkUp6m3YcBB5CYpjOKZp34EzK2ppwLomNOpTVc6p8xf5BM1I4PLMiJCYRZQf4yQEFbWjSaWFqPj2rOFpWEa9wPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716037194; c=relaxed/simple;
	bh=ax35zVvMpZ7YpBaDMktu8RlntdfY/v5JxB/kgwoeI4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sLpiyCuVAKT90Ge7RmT9aNj+g2AitKEaGSMsr8b86tA2hmnSu4Hsd/SBCd794KGUwDVaTPckiPDZCAAkunHksF8I+a4X8WnD5908bz6xkPSf65HAHmm1dLq/14XEFs5vnwRSBaKNitO+uatRql6KpeFKaGz6bOzJxpCMzPdqDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0SzZDXJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-351d309bbecso847244f8f.2;
        Sat, 18 May 2024 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716037191; x=1716641991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3o07VRMVpwb16MqNXJLEDn9KQoBGTq/2iz5EAlrtis4=;
        b=k0SzZDXJ6h+m3VC1g5PH+BcXA3//rKnSJzlc6HGgHDV5Yg6x1foOSrXNBolLcD/SfB
         jEpDc+TKBt4DypG2lCCGQw5a2aBv1gXuVS/1+9wvfZlOVRAKjpwRnUOZEb3M4/9RPgwL
         1RiogKVUOkAHJEEb4eBMUTjNCkYaUaknm2PfiMZEwImacYwDEjBFw43/3LWxYyQQyLP/
         8UVqcMyzo2a2BeZkmkU3G/FIem/fiMiHbh0oW0KPRQbbH0BQ4C36SeYeRTtVKFkz9F+e
         08ybWrSswcRWAtq8fWvfPPEKor9SwcOVZP6uvFlqhLJ9pQf7gTHDO1o0UI9PMqwlABDG
         tIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716037191; x=1716641991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o07VRMVpwb16MqNXJLEDn9KQoBGTq/2iz5EAlrtis4=;
        b=GaS+qXwt9dnmR37yMJjZu2cY7Xa0cqxizRAfcaTkhNqV8QxJ3XQm8G1NzqPTf+HHSC
         rputE8r79cXSmn0bvfiioRYg/YlABAwQWqXovQOlglPC5UUAJPfBhhORC/IB1mV8dxHT
         K62otF3RWp+gRNm3quM1TPWvr4j7kBKPeF8o7kRN1GoCi0z55+LmZecadgMsbHIOh2x6
         PHLPnQM9+ACvubxq227rLu7wKtMzwcWxcwK4CeDCflFckZnwgNxig2K3s0pWn0knKrMC
         SfjDWuo1YM2biO5xe5fxSRnGpIB+wYjvWAsdml/Ne76WGbxdlOLd0bauUdVdjcpsxZgV
         Yvqg==
X-Forwarded-Encrypted: i=1; AJvYcCUipOH7km2sAxyLWqlUoNJ8sqoKr/A8ZwR1z+Fc+HPUTiNk5o7Jl2Mmm8cQ5dGLjR7REy4x86//Jpy57KA9lB7rQBjYqdupAl3E5DUlefhRG+j/qmFmCO9L4IQRfnno63PKaWQbBNLBtc25czpLOW5361O2rF1Ffo81tIt9PSce9ZpTHbk=
X-Gm-Message-State: AOJu0Yz6ZI7MJ0y+quvMHqILJ0hYcM7IsUJc3DKZaAe0wJYlYkbRoxTm
	eSXyWsSFbuaPDyJ45j9ovYmsGKoZROf7HtaBToW1fHVKsoDEn+7N
X-Google-Smtp-Source: AGHT+IFr/j73PtF+LPJ6yD8z41dCT9PFsEquq3T/uzJC8Q7Tie81IddGmDWOKy1LsfKa6YIBz+qY1w==
X-Received: by 2002:adf:e40b:0:b0:351:d6f4:5e11 with SMTP id ffacd0b85a97d-351d6f45fc4mr6759154f8f.37.1716037190852;
        Sat, 18 May 2024 05:59:50 -0700 (PDT)
Received: from localhost.localdomain ([93.182.74.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a5cdc712ae2sm391499366b.19.2024.05.18.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 05:59:50 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
Date: Sat, 18 May 2024 14:59:11 +0200
Message-ID: <20240518125914.2938-1-ansuelsmth@gmail.com>
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


