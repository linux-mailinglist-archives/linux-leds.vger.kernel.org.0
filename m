Return-Path: <linux-leds+bounces-1721-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AE8D3EB2
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 20:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305D9286F9D
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 18:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26E21C231D;
	Wed, 29 May 2024 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAUmBWFq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE51C2302;
	Wed, 29 May 2024 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717009158; cv=none; b=ANrJewcg8y/iej7JR654Pd8GZ6jJRLnjODLWfjybTPR7xyQy6q8F82KXH0aSKxErzqfH3h8o8ESFHmrzRuvRq2ITKxRY9FtmZNrxQ9dLr6shxgu7zgsOkBKkjoV+j/qC3k1aawg/+trWrFQpEk5ZJa5+DM5nZ+7DIG3iDUGeVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717009158; c=relaxed/simple;
	bh=q+6Nqyo4BNt15ebT1gR2MZoORrJ4UpH7ffdU5R37H8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8mTgDMdS5OcXVkpWgf4oDqtXg4oHWrH+B911hkzKgotrUkfhj69+7tlMxWUS4/BWuTPB8RVgYxgFpCuAjgWZsgUutcyJ5UvvapwMR4OTrf8kFI/A7B15GEky8kZlYTG4GucVodnLD6LtxzI8Z3knncTkHg4GyHcEdEMTDhzeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAUmBWFq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-354de97586cso37945f8f.0;
        Wed, 29 May 2024 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717009155; x=1717613955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVCRrFEDlt5D5IQATQSVdDEgZ6yqgS1rgEvfjd1m+xg=;
        b=GAUmBWFqyMvCvkX5rmLVvq9XOi+VupheNl6WNXaJIMOMkf2rahjpSkAb8QKPbR7x4v
         PthlrOUS1C6TlcpZ5AwO0PP6SrC/njJUM7FucO3kjNcOyiH1n+woidEcTcV9oBwcBRhb
         5+wQ4pcLnp1Re8kGObx7CoZHneOpYPKsl+0ojOxPtxWnXevV11TMPdoTApxB6b/kZENw
         rYU/BEjrAunzEmGUGNsLUQP42vTEqinkYTJFkqELfg7G1i0hVy61zadrtTMmHMQZnKI8
         oL7S/f3YBMXkJhLV8CRPxZXbeRnd9DLOQH/L1+yxH69GkfeI3Y+BRZM3Cgss8f9R5GZt
         RMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717009155; x=1717613955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVCRrFEDlt5D5IQATQSVdDEgZ6yqgS1rgEvfjd1m+xg=;
        b=KdDMKu89MD7cd07sK5k237qVTPmaJYPTi0ugssVRXVlSLn7FYFri0EkROFHv9tfMr9
         /TjfgGyNjEh6YRY6ASPL85n4BzwVJmifQ5+S3zBKMvMXDe41p1cFoOkN3Sbe/5RrwWiL
         e5cEG4KZpmVsZ5gBLc8SQiAGQCz1WPpv15FCm0u6IOqM2w4b0ZZGRgvTyvSJ9gvNkHuK
         wOQGWgvcdu5sV7F4Aj/fkas2lbBsao71PnEeXAp24OWaEX/HVqE0XS92Y70ztbcv9ZNu
         L7U5NpDtPxVmuBwjow/lZGS5utsmh5UyOsChyhjDyEroxhiyYI/O9n+3/Xoi39yLcRTu
         KHdw==
X-Forwarded-Encrypted: i=1; AJvYcCUI7/5T9+wV0CVtKrsLxhN8envvXAYPROChk5GT4/o0sh1SalHssJbRQT3WoUHWUJMTKbJtx8CmlF56wPf64xqIfnvZtpcE6FdNCrKRDV2qeo4Bd2W1y6/KYBqGvxwWI1DyN99P1ZUZ4FYQ24nhXnS+IqbTPMRcNJGFCt/neYXwk+9usFI=
X-Gm-Message-State: AOJu0YzcXKcLNYtt5PF+JLc94Cgqs2YPt3n8pX5w7g3yAS6ZjqhqMpOe
	BVZ4lUHVsrnVMBNNpPDzTJSaWDrDtEtoxuW2zZF9Jkd1pFz9zqeV
X-Google-Smtp-Source: AGHT+IGS5K8unKMvyjMx2A+xlZKYpgip9Xfo5ngndnbcsp1vK+eGs7GY0YMgZDW9FJCA2ubKyWiHrg==
X-Received: by 2002:a5d:544b:0:b0:355:2212:45fd with SMTP id ffacd0b85a97d-35dc00c6fbcmr53910f8f.46.1717009155377;
        Wed, 29 May 2024 11:59:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3557a0931c9sm15442206f8f.65.2024.05.29.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:59:15 -0700 (PDT)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/3] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Wed, 29 May 2024 20:59:01 +0200
Message-ID: <20240529185904.1448-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529185904.1448-1-ansuelsmth@gmail.com>
References: <20240529185904.1448-1-ansuelsmth@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
- Add ACK tag

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


