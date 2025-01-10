Return-Path: <linux-leds+bounces-3752-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9368A08E99
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 11:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3EE4166684
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 10:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E86C20C00C;
	Fri, 10 Jan 2025 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GquOOkKH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B6A20B81E;
	Fri, 10 Jan 2025 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506425; cv=none; b=gHWoyoPPg094L4qBTaT28CmWMOcZxy0dd4CV7CU5YMdQJab92E4mrPmDdB/ohzJfVn2RMF9KNQOrTAQc9kuKkNSzClCbQEZPl45AzXxD+tMqG/xjGjRq+oIPo2f+ZDwaN0TQnNYDfQzD14HqrZWW3dAnsbw3M8Jqw3NsEZ2n+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506425; c=relaxed/simple;
	bh=K8dfshyj3v7VHM8Mlq3EcNpIciIC+CxZDJ9dS3SUv6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0nzY0SQXbvT3YUPvOWklJr4WDFEVLfsOoui3YUEJ/f/K+qaRDP4WpD9+fNQiwoE/Kqv4VnqjF0pn42gyOwfdz34+cddjhtiMfP3KYRhi45eEM10nXJx2fxi5aku95T1SZ51ER1VY1xWpQsNAmNEb8OrYL5iGoHnV1UbGwOhUrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GquOOkKH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21661be2c2dso29361545ad.1;
        Fri, 10 Jan 2025 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506423; x=1737111223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
        b=GquOOkKHjLNriWTXOTyBDBq4WT9GBDHRjlTuhw64bbDtLSKcC8ouWmy0RkgyaJyaRf
         wNj8HJ+a+ot5Bi9haHPXqvqA3allD5ouKquIEqLaRurku/syfv2qcqVI0FSU3d2SHFje
         lWa0DUojWP1FATdeeEBma64o4bg10XHaSXw6tlYhd+fqivjZ9Up/KwynuLi3FNFrZjrk
         KWv069iITAleTwo3ko/kXLpLlfoHZA72xnu/pAZxbUAbfnLUmFqY2YR0YQ5LEAT2fpbl
         rIEPGkIW1DC7/CRIPoZp4NOKGd8gJNGayu6f3myLL9z4vafSXRnFoChiC+QEDmnyLLj2
         Xscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506423; x=1737111223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
        b=qdSrWgfieMjsGDgwiZL/YeW7889ScgopfMiycJ9EkwVlrRpauv3x1/Vepj2d8xFB3A
         40BDzJpdzNXkAnofoLaCEc58NZwLaKR8J+LPJB2vsmw0wm37hLCPcQsflmDFk7KfeCE4
         boxJyefIL47AINAOT5TKxZy/24kS7binczOX1ie1KoaJA7A+3H1Urob5Y+cQoC5NNy99
         wQwJ0OAjCL6mXuU2Qd3jLH7TvgTsA7pWvZ+XVnZsyTiXhiOEx4KqmLuO+3VL/LZhNvXo
         qYf0bRraLgHHPY135a26KdEykJHBURTYjQXTQZ/5ZKMDGr/Mvp+3/Cq1U/y6lp511T1M
         QZEg==
X-Forwarded-Encrypted: i=1; AJvYcCVWOgA/lw3hmyAb+QoFAdsbk86Zih/uloa2qob1reQj2olJ1N4trejsXRQqB1MFqcARGq0XjEwX1Xp/@vger.kernel.org, AJvYcCVw0WmGBWnm0KVhErJ3cc4JfguH40giR9c4zu9rOa4EBTsW1iMhqo24aO8j4pgdTfqmWIu0eZQBGV4XzRQ=@vger.kernel.org, AJvYcCWaergHLCso6WdYrEe9GswH36MW8P9uIRaVLIztsBe8klxrZU17OCH2+uGTjEZIb2pPTbwU0fNtGWYZPw==@vger.kernel.org, AJvYcCWrFQMCMtTC+wtp4YkyZYew3UaUPU54vfEBSh0n+3MjgF7twGlbDDqVmk+QIulSjHmBlKXz9l/wIBTXGKZT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIklHYiwk0l8gKG4FZ8TdTikhOuNwl0oo9Scp4fQwi6KmVKRi
	3E0UFNzVJF/w9ScluSp4+NS2COCvkabOG4yKg24MY52rys7IUQ/w
X-Gm-Gg: ASbGncs0AfUT5w3th62Y8lgBJMA7UKsx8WCnt/aI9T4K0AZV26LimKSbiGyewd+Sw1o
	nMd7/7PIwcyPfnMQvUY5fOULaTHDuLuvdSDfu4zCbfORRMT/nRWt/FE4dzFB1b6izNuqv0HcqXM
	vWRYmHnEyhGvokmnOvsLFwzykZ7/aa2S/MI0X9ysKCAtWHH2aWFO7NHbKV0KOSZwus1/reK3qwf
	+AbmlPYxxdhFrPTQU9/Znfx28YAceU4kbZhH7JXR4yCorUTQjMGfKBSlg==
X-Google-Smtp-Source: AGHT+IEXc3zedWc5CeLrQUkadcVEzJk8eqcEuyttO1WR8DTZLahGcQx2U529vW48eyEGuwRsZNX9tw==
X-Received: by 2002:a05:6a00:2c86:b0:71e:e4f:3e58 with SMTP id d2e1a72fcca58-72d21fbcf06mr14713527b3a.17.1736506423154;
        Fri, 10 Jan 2025 02:53:43 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:42 -0800 (PST)
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
Subject: [PATCH v5 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Fri, 10 Jan 2025 18:52:06 +0800
Message-ID: <20250110105304.71142-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..67ad74f987c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


