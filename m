Return-Path: <linux-leds+bounces-4498-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A9A915A3
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 09:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C24919E14CB
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 07:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C292222C3;
	Thu, 17 Apr 2025 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcgnfpm9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1714A21D3C7
	for <linux-leds@vger.kernel.org>; Thu, 17 Apr 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876023; cv=none; b=Z3Hg15VqQU85Lg/ekDRDYI8pj2rxwY+ucRxNx/NRuCCi6tOGj8PiIiSN/LByE+bMoFG/n/uCWlt0FzxUsvpV9inhBSu7DP4hIHp0XM9SC39vMfiViP8cGdgGfOc/5A4+ZD97Zup/ZtM1R+u21uh1nbEOoHLBeGAVE1YclbN6gjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876023; c=relaxed/simple;
	bh=VfUJWNXRAdPQmpRhxM5fhbACYIFrjEZEGf0083dQb08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JA88g73wbNFF2tG4gXvbEKs/UIHNXwWVanr+PfaByVsNSgsb9/rsQhOPR6gW+rTDnOJcaJBg3gVe46CusUTZGw2aR91ceA/4FNWUOC9jvdgB/7nq5rQ2HzjaUkAvYUacrmd+7FFem6YwDV8q+zlS/RZSu9MgFe3qLQhT7Xit4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcgnfpm9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39d73b97500so58110f8f.3
        for <linux-leds@vger.kernel.org>; Thu, 17 Apr 2025 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876018; x=1745480818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQygXXjOvP6zFryL01i6DHpfHx1syZgEKrRCnclIt18=;
        b=gcgnfpm9KRnjSz4t3LxSGJ2aeZL6c+p1rdBPGhlFBaeZ63MXWxuna7mKT6N8GYGzJP
         8JvsGSy6fr/dMAF18ibVJcHZX8IO6eYTnR2OFo2bDoQEB3vAVysrHaj9a2TioNJLsQmY
         KtBrwqqx7Eu2/ePASOatNF9xi7ENaRX8DwEKUnF8hReWC9CXO36Lf4A48JNt8jx7SW29
         b89qXVV7q8ruZuNy48SS11URJEOwyleiwTOk4OeubrjjabY61zCMqgcZ9ZUJ3/DDILC4
         yiyRpQUUS/WCule2PGlTM2DJHu8HxQq9Oye+YnCoYMfok/GAmrZ+AgUrmik9gW5uY5Sa
         2Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876018; x=1745480818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQygXXjOvP6zFryL01i6DHpfHx1syZgEKrRCnclIt18=;
        b=YoXI+DC9fR4Pz2yoW289JWWv1K09tjSWZOoXjaGi62rgcFIfFdlloMyxsHTK0lyKws
         Mq6+tRUvMJDbdjW7Qp+1ab7AXcru/QHIZgUI5oFxE6jOL13topp05vLvHihhRGHB9sQx
         lYWfGyLW72gWLU02gWBljl3POJ1DTJdvUXKag+dTFvLcO+8sJX+Oou7B3N8yDhKqY5iL
         WX47SuPkXcKlhsOeeWwFt8ONeI2fd2rIAItAD7mB+CJDJ7S4I2dC68l/nb/7m1c0y8we
         f2rGjfZHP2f14WUt2aD9TV1b2cue/mBoZOYrGJzOBwy9oWHG0v3TaMDQr/4uyRiWqDgQ
         AwIw==
X-Forwarded-Encrypted: i=1; AJvYcCXyYG112Lz0v+9jHBITcTK6ynqun5cObQAq7UYfHjzQ2Snmi0uOkvuSHM2ztMul2CR4z24J+2ghh5cx@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuuXzFSG+M81ufoYuc1+kXUxWSKeVwQoE+BMPHYsaDkqryYIN
	6thDfkg2WrnYL/ROXcG8+mZqYNnbTDf090njICkNzGBy+S9Y8+U7TAny4Cm2Hqwza0bV654iMv8
	a
X-Gm-Gg: ASbGnctWF1SV3Y3mq9IsKVepuLu8N/FXhxvyrKzJvajS/MO46nM82VmsftEOfqmfzrK
	CIiRf7qjcjJUEr7wsun/VdqoWhHLK87VQ7BwwPH5W9c2qXoK2khiBfYQqNsXvnVDTnZctZK5/7j
	7BjvVDz6tTmt+8ny8TBPzX832dFZL5I76Em2o/9vUARkZhDIKzh58IW3afZcDQ6Nhy5W80eZtZD
	QEksWJgkwW8IKrgCL7Wx9nnyhy8zS4F4DUEWja0vyr9/f5qwaVbnZWfR/NAh+oJ1XOvE/ADlkaW
	V/oRN2ns85RQIdisKauxpe+TwjxmQuSQ0b4P1acCnuFHwGghWydWqKUnybmMHPEEaCeCdMWvJKM
	NhaYQiw==
X-Google-Smtp-Source: AGHT+IG/Ti5uRMFgrnm9lDxH8A1EGSvNAdEZO1mK0GxpdKH8aALTdnnu3mTzhGSyWkdAN7OmEx7OMA==
X-Received: by 2002:a5d:584d:0:b0:39c:1258:2c31 with SMTP id ffacd0b85a97d-39ee5bafe20mr1509665f8f.15.1744876018396;
        Thu, 17 Apr 2025 00:46:58 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445270sm18949243f8f.81.2025.04.17.00.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] leds: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:56 +0200
Message-ID: <20250417074656.81626-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/leds/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a104cbb0a001..b107dbe1fa90 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -735,7 +735,7 @@ config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || MACH_ARMADA_370 || COMPILE_TEST
-	default y
+	default y if MACH_KIRKWOOD || MACH_ARMADA_370
 	help
 	  This option enables support for the dual-GPIO LEDs found on the
 	  following LaCie/Seagate boards:
@@ -750,7 +750,7 @@ config LEDS_NETXBIG
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
 	depends on OF_GPIO
-	default y
+	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big
 	  and 5Big Network v2 boards. The LEDs are wired to a CPLD and are
-- 
2.45.2


