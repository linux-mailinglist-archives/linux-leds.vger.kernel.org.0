Return-Path: <linux-leds+bounces-1701-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB58CFD6A
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 11:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012111C20C06
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD42F13A40C;
	Mon, 27 May 2024 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efm13NHb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEC13A86E;
	Mon, 27 May 2024 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803268; cv=none; b=lH+JP6AUcIBRpWfznk5BUvTMqk1sbpfsVeam/ErmcfcN2K0lyydHv8YPMjh/k+W0v+hxzg/FtWDitD5oFrYbMuLQP7YxZ66tOln2lq8DzQ/fFBR8Aqh5NHoffECEX0wnEuV1PKEw1ipUjmEs8AK6XG437W93KeAo3xnPMa2aolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803268; c=relaxed/simple;
	bh=zmlEeR9fqWoZOWgKSIAR0BnYHc5xX8dghAkYYfuCWLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qU/W5hzeT53763mwRQNPNqusj8ZhztRG0MQ5GX8Ih1cSW3n4shzKdHchPLgPUXLwLDD9WWpwxzGgN4otoUkqr2lA/k3pqy1SuBBG2mRQcFXPZTlo7OD4hF3yTvndIxNFXY/yCALooim2dRnxhj4+sVT4FzVN9GtQhRx6FbprKXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efm13NHb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-529b22aabc1so535163e87.2;
        Mon, 27 May 2024 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716803265; x=1717408065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqbOftymuJZXxV4IxHBqDJd32xD2wTJjXnpBj9fmizg=;
        b=efm13NHbxJp2/XPWLrG6oQD2n2wueCQE/pUquhCWdjcjiuigICxxuqN0zR67t1JTOo
         R+ghmggrnsGpAK2zDphh11oZS9teZvOrWOsPcyeCGjGmzznLNZEvaWOahQVu6D2TtDbe
         ZYUfURpDyJmI18f4sZW8RDE8vPC8e3v46FWWsWyvzmgjjfJbG6DTsHoSg9+Y8aW/Gq7C
         /y5H+khufKqfMJ+NuLSepX7/CxVia1E7cFrTGgc4m1eW9FqacdzkhK1JJqPKxj6IQqF0
         CO6QnYModqABWEzdfEwV8B2AeMemB4pkKLTgif2Sx59S3XtVYkSGberDEJhchbJkt2XR
         va3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803265; x=1717408065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqbOftymuJZXxV4IxHBqDJd32xD2wTJjXnpBj9fmizg=;
        b=ZdXrIIa7dJUo3H323bNUGQcdkmf7kYiIJgD6QfqgrjLt893AahITAaiSU4MUdi35BD
         mGDsRdjD039fMGEFADZZHs+MQHqTxHph8kNg4qWwJFkwz3BXoDymRbLdJg/1XyoECRz0
         L8utQ+Rm8taepjbZVC/6XiNAYLgwO1lPT8R1et4oadAFHMuZ+wHZh126BIg6riH0b7wy
         U2XhVVpmqSUN2sOEWRpwQDQAxbeo+IEdhvzGsEn8RQ2ix3L/WAw0YZcj3zhBozMeSaij
         4QgMliMfCxG6fn5efQrVomeX370rXysDxoem+V6h7CpNrmxHbMVxHv4C3zigzkGHAxw5
         L+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUElwC3xADM1LYytYXqnMAp/IaKye2JQwCzpLENROoZq2zePq8/2VGGbygMPsuObRILY6zPwkdYFNgbv0xBVgiwLMnHDO4XXlEGpSMPgVP3DL1EkIudZy0P+JFOJI9OgtQn7ZhwGK6im5QVFwTUu2Af6/NuqdymK6a8X1cIZcydHcmRqlE=
X-Gm-Message-State: AOJu0YwuN+ahSPikKs+QCHEgvt7f+WnS/DlYwTgavBA0Ta75/VyV34ac
	7C9kTAGKCio1EVwJN0dR6xHVfANKCJt7wzwDi2C1Lqqpy0wFQ1kxVcr5Zw==
X-Google-Smtp-Source: AGHT+IEUKp2XxLj7Tf/e2aZ31Wxs02KBx/sE/wWtaF87IkxQYhkU6JqH2MtlFGmr8zCA0WUgkvvc1Q==
X-Received: by 2002:a05:6512:287:b0:523:5602:7438 with SMTP id 2adb3069b0e04-529646df120mr4787786e87.26.1716803264975;
        Mon, 27 May 2024 02:47:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-420fd37c1d2sm156356915e9.1.2024.05.27.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:47:44 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
Date: Mon, 27 May 2024 11:47:32 +0200
Message-ID: <20240527094737.13354-1-ansuelsmth@gmail.com>
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


