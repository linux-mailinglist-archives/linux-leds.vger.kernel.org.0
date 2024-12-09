Return-Path: <linux-leds+bounces-3526-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138879E8CCE
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 09:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C2C281C45
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 08:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D662156FD;
	Mon,  9 Dec 2024 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxcsPB6k"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708321516C;
	Mon,  9 Dec 2024 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731184; cv=none; b=cy5Qrq4yzK4Dn4wDfJlXASowJ3625OvyU12TniQw/4ReKODI919NQP3UvN8+wFubC3CVCYUs/V/3ZKah5fjgmAfrUxbW2xjXcldi+M/0Wiw+hlAWiINiowvxd0fPLKIqwSC7Ynjgy1sALzHqvx06pZlggUp2/LcKJ5zq0pHQNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731184; c=relaxed/simple;
	bh=pK3f5fCpUmizu3Cy6++UnM5omz/TBo2leaTtg+du6wI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKKdFbvmZv5WuLQ0RV8faF2ZS/jn1aAQKjuCuiqo99mXj+A4pFepOD5HSBHmubmTzUBd1ckPWnY/z4aZlpDy0DnBAw1S6ijJ99JYvkqGraXUfnAKoDd/pMsyw0yb7dvm0rCrZw9ERPHghaLFqf3Hu9ugbhjCgEPVH7fxcrsPtIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxcsPB6k; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21145812538so34152745ad.0;
        Sun, 08 Dec 2024 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731182; x=1734335982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=mxcsPB6kpDPlgRyIXExgoHYN0kLpwziGR9sNbN+S2P8ElgkGawla4nGu8VKquWO086
         RFC47+QiWZYtlh9VoL07IMnwS9ZFTI+NpNZN/eAcaSWavrPKQziD443dwGQqtIlEqq4M
         jqZ6wET8L0EG//hH3aN9G+L10vv7MDGnID6/zv04KNcSGS88sf5lYYVR0iq/qT6ZPijW
         TjxQyvqHXd3Z6kaBt3kCsO0OMTG9iqdQ7bSgiUgoVTuDWODquitJDNfZSX6AkYDclwYk
         KbYrBY++IWgzGnzUMH2If8KYWfzXNEqBpPLk/mgQDXWWwnxtdJbBDDj8/EopB5P7n3NM
         hfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731182; x=1734335982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=sKKHCsPCn86TpQDErz6EcYF4P7PP3zgAUoBYQMWOUr7oP71ztOpkos1RpYdOPgjY3i
         bJEDxH5IX0ZHnuI2+YmPH5upw7Xq883QY2hmGCqBm580fqDpyHEVT5MucS+MvIdpP0DM
         HLhHUbbLoZwV19B9umTbo1eFzHFpU6dTR4YrsxTuvU0ZZAF4QqR2r2rwglYaPH2vTVeI
         xltvdccXhRLEen6YP5K3GpmbLmSKevmVsIcnEklxKwJL3ve/9TpyJEh9/8LU6iXiVh10
         9wWhnILH2GAekMvg6QCoGraoUzYlsbksn25p8WHifLeBsG8azll42y4m5V3LMSuNxw+j
         pTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIDXzMV5fCee573hAqwuke3QnFmNSUkKNhc4+4ke4rotpMO34Fa9crpTD+TA/mgch35veg3PgQ+QpYnmQ=@vger.kernel.org, AJvYcCX7uy/IMr8DYHTHe3TKqFBfLOrdtp8dNroNXcayNdlcWfhObSV/gv5oIk4L+D3HjC37q+kQzf+XT4WDdQ==@vger.kernel.org, AJvYcCXIn5WWID78NNmHzp0kYWVq8UeCmGF8bzEaYVp+NgZxkhM10bNkvQMJuzmM9EemifAL0xE68xvHc+t1Ndyj@vger.kernel.org, AJvYcCXtaThWYCGwRRcFEUBQlLpmex3L/oNS5TioyDZQobhOtORqSlkmjWSw5xV92F/AufwVbHEe24Zt+ABX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NhgVA+jksOCvLjCb4f6bf0pnQtMJCgso2EpcUR2C8xdfxweQ
	y+bhwKtQmsSj/3ThoH5dkTHaHJJ4aVVFGTqrZmknHOqXGX3xvMkG
X-Gm-Gg: ASbGncuhWD+zyUdhZC1B7QtbhFRhlo891k4fDB1oo2RPAuwFKpVo+8Hww5g0nhZ8/fP
	XYjCfQOomScYgf1oYZNVtqdezW84P8NMTR5vCQWwPUs6SD+G6snDXo0kqvSPL/NvBXtlmqnKBlK
	Td4H8h7TacwnOtKAwCNJDuOlZ9KELBh8bPEnV/KPWxmrzXp4i/09au9ApsAxmpfwREKnGENeMFK
	KVxc1VE1RSjPPaV6BlnTTEz2LFR0ERkFjdppLJsM9pDYLaYnaxJRbOt2CFUSBFtdA==
X-Google-Smtp-Source: AGHT+IFLVJdXcJEMtQbEGzS9QEogjBccTI97+be9Pi/cjDczopusFs1mLg5QF1GGPSTJZ9o91Yk57Q==
X-Received: by 2002:a17:902:d4ca:b0:215:3fb9:5201 with SMTP id d9443c01a7336-21614dd1b11mr167697985ad.44.1733731181698;
        Sun, 08 Dec 2024 23:59:41 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Mon,  9 Dec 2024 15:58:35 +0800
Message-ID: <20241209075908.140014-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..3a7dec3f9a5a 100644
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
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


