Return-Path: <linux-leds+bounces-1961-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7E290A011
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0587A1F21A08
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAB76F066;
	Sun, 16 Jun 2024 21:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpzXmw4V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074BF4E1D1;
	Sun, 16 Jun 2024 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574951; cv=none; b=OWOnjKTS+PLvosVxYfE75tJRxXISPqFzzNNzN8g1SQY5o7Nee0PbhrirEsPEyCLz9a1iVYYsjOII99rDgBqM0G39rCTu101Ks1ld5W/kq+eSI2aOlEASzoKW7xPKcvy3v9+a0FsyperX6pY91Yvc3BGAQYFUr6uhR0JuRXU26x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574951; c=relaxed/simple;
	bh=uJNHCAS/njBj0P1AkFg9onLP6rk8u5HT5DX/4ybEeDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2X6I4rbrBQSKRf6lo+NFh5TEDlIKBoV2XE3Y5tyNzTHcTwTOfsOu6I0S+/VGuMThHHXIn+AGiKWGAm1U92KOmZaIhrU5U62n2g91HY+QVKMlB/VeHehuLxsiWdSWf0bL1EotubvnBxJW5WMjrIW4V/dLhiQkJSaFET5CEtpdBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpzXmw4V; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-354b722fe81so3450722f8f.3;
        Sun, 16 Jun 2024 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574948; x=1719179748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhl9kavocLfzcqvimV+c3enKC1Q7IIpoT3nV0k3W8no=;
        b=fpzXmw4Vprl7DXgacMimx1cKAlPeFXuKF7mSS27tWIybQsh7cjhQb5NRW6BhYlNywu
         gkASKUKzh+UQRXwBZEKJbGMNxyGMoOjY6RQAaUzqyHWYHsFmzQS3JSUOH0hw3VkvSDyS
         oSqionu91yUbQl0BD88Eo9X0TyMwwsOUFANvfupTRMdT9Ggy9EQwuXcn7Xcrwm3rm4UY
         JYpbSfUeoBEtWEIVydR54JT7wClFH9xuikCH+b3Xg6Ib1yU9f+caz9cN/Zl6b06mla3X
         VxrCmfh/T3gzvEnFJJE5MI9vJQsaJUj9AjFRCBlNDBG8fR/ElVWlRJ8Rg1yRPy/16ncy
         O3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574948; x=1719179748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhl9kavocLfzcqvimV+c3enKC1Q7IIpoT3nV0k3W8no=;
        b=KOebDACg5qp7eR2SV33zIZssvzSV5+GMXfOmQ4574JYflFWlzyoD/c7oHw0hZfb8pK
         jmDJcl2VLyqih9VIoMvsJp3+UMP3E2VyWTHAewDHTMrcJ/ChcaQyY9+iL3aOQpUyGPyI
         5cW1+QGFVxfCfZUPJiKCg5E4tHgB2agJOyUH3zqPuY5aZofM54vUyRZYIc0eILhX6DOB
         CpAdsglGAmSBcCUbxG7pzm1CJQbSZ06pcSh39mcxkyzPGsE+6pZ1a8Sbf0+41gLCXIL9
         RbiGQFJ+BKJ6tiloNj3Pq7WcYQ4gDjJHqTEU7ockuGLq9s72FAe1Aw7BKKK8W0HdzA+p
         Fkkg==
X-Forwarded-Encrypted: i=1; AJvYcCUtzwlvBMTKG2Le31jn2PoxYanYhN2xdUaK52KIF3bs3nAQC2MfkeCk6MaazcvH+doyuvL1Eg0dFrBJLAXN30/yO5/M+FFvgG0FCiOhAtptR/1SFgSGEh8MNEg65Hor1ENve68WqldgT3PzGb3zW2Gd9qi8zins3H+BHMBjlwmQh0dLkmw=
X-Gm-Message-State: AOJu0YxSu25WOo8cLjurcvmFBY8rg+UfiKfSV9YneglafLd4gPa9dt1c
	PzsnE1KN06Q67b4yCon0w5DHxVUYcBFRBqlLYo1Y0VW1S/xq4cGp
X-Google-Smtp-Source: AGHT+IEgDF94nZErxST7KQEgSvSxTmuAcS8oyKSZtBL8UmzZ7Exbh1J6JgGFQF3ns00JV5BnF7tVHw==
X-Received: by 2002:a5d:68c6:0:b0:34c:d5e8:faad with SMTP id ffacd0b85a97d-3607a78684dmr5145995f8f.58.1718574948216;
        Sun, 16 Jun 2024 14:55:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:47 -0700 (PDT)
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
Subject: [PATCH v6 01/20] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
Date: Sun, 16 Jun 2024 23:52:00 +0200
Message-ID: <20240616215226.2112-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616215226.2112-1-ansuelsmth@gmail.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
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
2.43.0


