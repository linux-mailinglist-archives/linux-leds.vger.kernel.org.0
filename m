Return-Path: <linux-leds+bounces-3501-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6799E7737
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8E918808FD
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ED2203D46;
	Fri,  6 Dec 2024 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDHO91Q3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE71FFC73;
	Fri,  6 Dec 2024 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506102; cv=none; b=HMVIdLF++rMrgAAgHXB/X1fhnXBOmtS9I524GKeHKLw5VbCHk3sDQ2irjX1PaBPeXWjLhnTDtljKbnJstzbpwyiQpKZUwgIvo+Pos4ZKavq2ucCVcGbGdDfPvUzNjysif6b0EoY0CvZd/FyK2NNC573GK3YMNLqKJMhacWOYvrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506102; c=relaxed/simple;
	bh=V1gxC+7pFmhwcsVRYLSmWj0bXwQS8MKVVfihUEUE05E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5zWhud+BhRVxX/iLdljX1MDduQ8w8Rbt/+hNyWbVJE9DWBIjRIMfkjkhJQrQJ7TuKWB9zAALYeXmfsW/YMgWlkF4t9J0tH5MmAeeoPYSoXEdWLtenbe8LH0TKHNJmMzdJU+113IvZ3T9/7THZpzWcQVb4g170MIcHeBYUDZrdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDHO91Q3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215666ea06aso28835875ad.0;
        Fri, 06 Dec 2024 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506100; x=1734110900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=fDHO91Q3MC8FlmZ7AFeH2zCTVsV5MoxvQ7iIk0Io/D88jRLOQl7R5bPZectPbmdOfC
         /171er6CMd3IwJVKSHdvJJr3j3ZqAaLhC4q+5FZCpcYFCpmxeJy9rJ0ywmCQuhCDhGqW
         xveNy8IgJO24rYK2k5E5Jlxqhy/nTOskMsh/lcSNl1+0eDyZ1S227j7TkO28cExM3Pg8
         BcpVxFNoZbjxxaaWJJ8NW7KssLVMYyU1JJRVArkmgvQZIhlJbp0xUqJhgjb6Z18lVH+P
         YI6ejNIGltrFTMfX6zIdi04BRgtEZha84vOOffXE4B0xMHCW3G2nogZPnsoWfUF1/hbt
         qlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506100; x=1734110900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=TWMh4ACag7VpaA3UlVU4XZMtnK0RB35tyiCfJelfX+BVEPhZ6LPt7ZFxp1Iiuqnbct
         AEGHjiwLFKpKRTwjOXg3Q4jyFTMGNnHQsijIbokIkNjWmb1ithZ1enjB2gDSOMAIx6zk
         XAfSgx1M0o7bNjFjPfG/lkQdWqL7pnmqXVYlDj7ieHYfCQZHFAkushi2WmnX3ABefJTq
         n2xh2t+fObPwuxOE5nop3oQkCh9pRUFNnp3T8iSCTcNMixvDXMGvIriAvgLw2ejlkoSe
         eu/W5jH8mhSxEDDpsSQ3kBH3/MBpNNjFdONL7FMCWdm8vHpYI5pBtKRKu8jZp36QPTGW
         1BUA==
X-Forwarded-Encrypted: i=1; AJvYcCVMtvxXDqAxpRqCAaZZH2zA6rLBuQUHrB7sAAgP7ZQn7QdGuGkIZuhvNsuVHizvJSghyUBOUHQx2MT4tw==@vger.kernel.org, AJvYcCVug+f51Dj8Ex+T5kkuMPQ+APPyQbnoMEgslrSfOsJIbc2S8MzYNtEr+tW92hfLMuF/H9nx0m4Nm4BRPouF@vger.kernel.org, AJvYcCXFRojS7k7q2SuWMoTnOzMWqchRJW6hrpJa9Df4auzZ9+6lSWdYiPUl4N6tCaL9Fb65z3Q1URFaAkS6lpo=@vger.kernel.org, AJvYcCXY9rgpgVda9RSHSBNz2ngmEm3weVxc5fkZ+8BFZukA/C4zNg/FFPQL9ifHsKEgFik5xHqnrMVeokMJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAuRqHuN+oEHaGZs99cpLEHyBu5RsNWB2T96LwqUnZUeVIP0VH
	sP2Kx0k7oIlBjmb1qlTc04Qbt3qGdSSbUHg+Zt+Wwin96Qr62yrL
X-Gm-Gg: ASbGncthxhmBdZm5QPp/NgpYAEEKn6NK6Qsk9rt/wasxMT4KGEPP7mQyPUrJbuRsRZY
	VUwuRWFH8h4uQ6gr73Rbaf5608QUECDHRjOC18QN3pgMvuItdXcnTMVQIF9HrAEJJlyLW/ADFqZ
	pA5RDhWYODaUzBGttKqLVJ4w/luzFGnETK0I1vnvPhy4p5QzZqBKRXT99lQOuyAse6f8rU8SRR6
	WcxwTBTcU1ujCob+Fwe3uaTWRAYkfreWhyWv2D4PfFTWhZRetUv4WFG3886XbC8
X-Google-Smtp-Source: AGHT+IEVb+55XJwsVSf3sPuxfD1Q4oPqF1cheGO9d/Bp3KK/wuSlgII2poZhwuZv0OaHB03V7/rOhA==
X-Received: by 2002:a17:902:e3cd:b0:216:11cf:7b1 with SMTP id d9443c01a7336-21611cf2958mr46087885ad.15.1733506099695;
        Fri, 06 Dec 2024 09:28:19 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:19 -0800 (PST)
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
Subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sat,  7 Dec 2024 01:24:35 +0800
Message-ID: <20241206172735.4310-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
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
index 1e930c7a58b1..36de76bc6fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2204,6 +2204,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
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


