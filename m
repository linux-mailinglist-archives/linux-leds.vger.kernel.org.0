Return-Path: <linux-leds+bounces-3519-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656809E8014
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 14:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65ED5166ACB
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 13:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9307615530B;
	Sat,  7 Dec 2024 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6la+J2W"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A8153BFC;
	Sat,  7 Dec 2024 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576705; cv=none; b=joPqQA/RJqyU+YrEmJKUTfK9erAsfnBHV9el3iGIpIoSkR/5HL3oMOwiDRdsYyRypV6Mwy5jVvzY74mYKzr/ZRv8yVVcChWHxOR/MLWZtBg6FHtfnQJ5+bC28S5Qm8sJmgOg39YoXt2FNVvEakaNfSQ7hScQyBR1AP9LRzUSy8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576705; c=relaxed/simple;
	bh=V1gxC+7pFmhwcsVRYLSmWj0bXwQS8MKVVfihUEUE05E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtPhNxhM/nK+0AeO+0MPJuFmVtQ6runG/5WwESL0gPO1BY52Zd/Lqh17kx1Be5Yy+S2KNgvDFNJcKlaIA9blvIKDuM16raEFfWObewyKBIXqBvc+/8klza3RgrQvKOzVEfoQ9WShw/UaDUIwOvne7JmPbTlW9tFj8GVfYRTfoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6la+J2W; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215b45a40d8so25116565ad.1;
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576703; x=1734181503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=L6la+J2W4S9j0Zx0YaouSsTbvOUO6/4QDmiRfRgH0/q5V2rjSByJUCtqwSeP01pikZ
         loxvR1bTyvdCIu2SSr1HRaU+p2uw1owMnbxFWE7wB+6xANkUS+KqomGStSShwVZHpMH6
         vWvAdHJ36t21ttIWM7ieG21tIU34Myt3zFCBtyG+ihHZDRA/2Q35Yl29DVwUNwx9thn3
         rzErGRLmLZjcqNyZhb5FDFRp+j26IHDoPVus1ZHyaxYtIf1gOpoyPtMKAGgE49IverDF
         L9HZeRoX/Pf2MhxbHlmzTqXMmTAjxiSAe6316JSwIoUPndz7PWZJAagYK2Jg+IzqmV1K
         9rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576703; x=1734181503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=AxNFyJ4/tfiC1q5W7Izgw/pPJ2ikt4bgdXVlfofaQgJ8NpzS58ENvoXkXUt5zariaJ
         SGNhYF+cR50B0DPSZkK4fJH81xU8ZcktRyE25VTWPMkxb4hKXuUVLTR4dyS/CY4aWCs2
         vOFAZiGzgMJfvtwexYaollEhQ6pA9YoBUZmtSt07KuNHaYCmAFwId+ATGW0XQixhJto3
         bnE2k/7PFpmizmuOX/G3Rixg2zRwn4E4Laom0WgDHzFgjLv9hpbpRn1koUSlxgFlxH3W
         9QR/Flkde3fs31TXecbKtH3XOsO8eEOfZZH3IuP37jW5u++o3iuTpG67/rRF9VDi9dgn
         fg/w==
X-Forwarded-Encrypted: i=1; AJvYcCUcLplGEN3rdbpwj6ClK68ukkidGUHHRSQGJoAvqNjp2AVR46NNXPxu0dhlgc3EgYoYC4lHOimcf4CF@vger.kernel.org, AJvYcCWewyS7bAMaFg1iNTc089SudDHEyffIMM3oTPmMJAW48gFDe0QOGq2irBRNNIQ3rQEn34UY7wiFOe5AaQ==@vger.kernel.org, AJvYcCXG8ACxwv0cRqshHMHyZK0VELCIHAdSltnrzTFPvtDPRgOdXeEmryLmCRQZ5ob21PB4uPWg1FDP8JIGgj5O@vger.kernel.org, AJvYcCXGoK11NnC8QG1BkQwUoY9WGeMiv069GiAqd/bAEbOcHVmbdyll/C1X0lBRoh8kCeiZg+Sbdo43tocoBvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdN6MXGiNqmZ0ouJl9HNQMTHFOPpsFtPF6okAfomakyrNbb/7/
	LopmS99bMIKwddPuujdh11mz8317Vyau3O39hTbEK15cG7mPUYv5
X-Gm-Gg: ASbGnctYFLTGZNYTBb9fLOZfcWU+sIcrluqkZEqn5provGQhZWXFjg44EXdMPcd6sr1
	GwzmYUNJpYQbU7MA3e1LED/WJOnxYBAFMuh8a+rHeqUf3kwN6RndEHRyc0OvEhWfKVw5d2/Ygkn
	NUUEW91LctXCRrN6qMD+VT6cAew27gjzNFTS/tg14aE0DQTnP7DG+/Ay0vC34uGg860OE2deoFS
	jGUFve/l0zJAbZ2uBXwGMUMCDtZlWb0sld6hsMS3szLV3w3Y2szEJthj8H8A38gYg==
X-Google-Smtp-Source: AGHT+IH0D/Yd8zXEABvPSshTZ5GdofWvmFimE7bz/L0Dg8+hzOe7KfKe6Ge/tMmMUKD8ETbyZzILpQ==
X-Received: by 2002:a17:902:e80b:b0:215:97c5:52b0 with SMTP id d9443c01a7336-21614dac17dmr93533435ad.38.1733576703350;
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
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
Subject: [PATCH v2 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sat,  7 Dec 2024 21:03:16 +0800
Message-ID: <20241207130433.30351-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
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


