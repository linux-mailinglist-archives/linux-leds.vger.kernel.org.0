Return-Path: <linux-leds+bounces-1673-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B016C8C68C4
	for <lists+linux-leds@lfdr.de>; Wed, 15 May 2024 16:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BE8E281FB5
	for <lists+linux-leds@lfdr.de>; Wed, 15 May 2024 14:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2C2144D1F;
	Wed, 15 May 2024 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SveB9fSr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FF8143C79;
	Wed, 15 May 2024 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783514; cv=none; b=oCPi96JTxwkO23Mj8n2UEZzUpZTK/f75USCRElXfK2J9lWYUmirU1+XAvmLYaMthkuC8XRrwZJktv24F4i429AcRM7w8Xay/AebnL4ImtTw7ieW3h51drSNLHpK1h2GDwuDJgSrVKz3QmlKR9oACPh0Z6URifQykHb6f1tpp7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783514; c=relaxed/simple;
	bh=eWYj0/hqY+Fw6eLWFmYy17nfNL5ep+EuUvImJX8xRHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4UgvEwly5aj9PedugT+e/W0N3HygLltq6IacTVxNaLqOpMtWLCl3IF+PNFEwc+ZURZW3+nFTFG7BooecMqYMK9qYW1W17qsuZEgoJQohOjzoh+PDNVgarQ5fbYaMj6U74EyJYMmoSNfEp6HzI8G+P0qoC19gcVJpdiSSwsUYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SveB9fSr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso6199228e87.0;
        Wed, 15 May 2024 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715783511; x=1716388311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g78boGP61E96y0EUDWF3ntR5jmo7DFLPaV6z3u/9Fck=;
        b=SveB9fSrPgYEdYap/7c5lSvkPPq3dvan3Yk6gf/IyfhUiQjTUp3zOnGRKkria3agqf
         lgXFkr3NRppAQBliQCj1VmKMSzvXQbeEsxEjUP7aJ1Gh/LRs0OUpadjP0dvVBCqhcEMN
         CKZIEBDVxP5lwgIvTupp8Cl+nIh6EHi0PE+1TsIuOazu+RZF3Xp3kLNMYV4y1gHt0hO8
         bKNviBw2U/yrTgjrfrec1gw+ZiYSYiELKHHz4gBEYWAF8v2Hs4YmB9BMvLqYVEV7xJS2
         eqMASlxs+m2I5e7bgAw+tQduIsJXAZ7U7WQ7aiPUsEfirUXEcFFxKnI0AvF+oK1gIgeg
         S8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783511; x=1716388311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g78boGP61E96y0EUDWF3ntR5jmo7DFLPaV6z3u/9Fck=;
        b=hWjcJ7iR7MzGpeWy+QLphDcdBwGdV7yf0vOp/5aHzyFPEiHCB3tZ2HGObPMWJnDCs0
         stMKcBCEe1y/wGsVD/QGibEMVlsbFLfeOiFnTYqF58RWbcj3pWi0vb0T/ZAvD8ycXYDH
         BmiAImMPunUtnoJ3Xk4mnljeKbuidWqYL52cje2hktbsYAybudfyCOIx3bf13aCm16L+
         0zqcuw9EalMJ49PqV9e9IsgiPM5OgDilK6bkg6qjFHw3US5LqNAMTAwy8uNyZKBYF0tj
         mjEArVlP9ueH3BCGbjsapBVpYMMBQSuFFusOigoIOJFXCu5fORAW9i2wEqb+Wb0I7fZ0
         eM0w==
X-Forwarded-Encrypted: i=1; AJvYcCVL83T9Zf4bfLaButmIXeBHqUWfwoVW3YmwMS4znv9FJ0F5WNzbxkvLD/acyzFE8UG5auUaiDf4oL2Ug0SG2kEcdKO2TCWIOJU4ZQuwDiDnHNzluDLmv0Vlu8SUVvKQDFYouB3EkFwnlUnqMNPWW8qyiTflSRv/zB8LdC+YRHf2ur0RW2g=
X-Gm-Message-State: AOJu0YwHNi5vArbxmkt+jFpfCY3GWBP8PAFGaEk0Cx0ba9M+DJUJ1psQ
	BsNkyBH+p0Eu18xWZT3LTlcoMLfrTuh5J1/f5UJO2C6HMGrny32x
X-Google-Smtp-Source: AGHT+IGM7CELbp7EGO65nWeMmDxJy2AJFF33PnUFX4nMSdSIuaBU6fjYfRKi6Mwuwss7t5cOUik+ng==
X-Received: by 2002:a05:6512:3605:b0:51f:b781:729d with SMTP id 2adb3069b0e04-5220fd7acf5mr8733089e87.38.1715783509967;
        Wed, 15 May 2024 07:31:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b896a06sm16763660f8f.27.2024.05.15.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:31:49 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Wed, 15 May 2024 16:31:27 +0200
Message-ID: <20240515143129.31557-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515143129.31557-1-ansuelsmth@gmail.com>
References: <20240515143129.31557-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ti,lp5569 compatible, this is similar to national,lp5523 with
slight change to reg order and reg type and advanced way for LED fault.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index 77828dedbb9f..fe8aaecf3010 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -28,6 +28,7 @@ properties:
       - national,lp5523
       - ti,lp55231
       - ti,lp5562
+      - ti,lp5569
       - ti,lp8501
 
   reg:
-- 
2.43.0


