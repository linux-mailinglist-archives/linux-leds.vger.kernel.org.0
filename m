Return-Path: <linux-leds+bounces-3872-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9BA2589B
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 12:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426EA1643FA
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 11:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F722045B5;
	Mon,  3 Feb 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr6GL1mC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E472045A2;
	Mon,  3 Feb 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583559; cv=none; b=SNKhZEwzkcI8nJ4zRm1XIQRI0ZyUCtvNxa8Ow3RDOw4r7H+qjUN2LfefVeTW1bSGUlEJ4HwpnGZ4k8922p4GA812RXGQAw0k1TPaKiyCadZbaLOmUX8SfCpKHFWf4xASWBmdJtbt2EIhbrR9C1jFkcj0lcARKQTxJPCxZksanvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583559; c=relaxed/simple;
	bh=mtPz4s+4egQ0jOh3GQAGAPwNPBPu0BZnd8qj+UMcZso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8xj1O1d5JkEzlDoiDvM2uFDLCTydrGcwYwmcktf/5g3BoYYo/fXog1QwaFUHpdqVsumcPdaC9zrRoWwIpSbtn+jVEe35M3WHg9xQso5vylX7tXGxhdLhiptrBVI4pEv6gmRM36j0fmRkGOy2ryZIpagH3he3Vv8V/UIjuRMEQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr6GL1mC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb94cceso49914835ad.2;
        Mon, 03 Feb 2025 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583557; x=1739188357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=Zr6GL1mCVD35zEQCcBoyuLXtiuDYsnmfSGU/iwcnbuWjCS0ZDe7P8EAIJIq/mKXjrL
         E/lmKMRZKClU/YGa5ukT0H5QM24PI65D/TXT2mtjLt3WJkY1UusXTzOcWRWc/tethChZ
         JTrDGI/iOay6k74seXvzboEG74idEwEzTc9OjJbJekzK0cNCsJMHA5xMkmJA5CfI+QH+
         t7dbk/hHX4DHxpX93dzNQq5If1fiDOSfmIRxXaV6L0QPX2WPF/hrCV583wGVez3+1VqH
         sf9rNdkfPCNazRfge9HLIfThioxN3gcUIiWd085hdeYy0yJavBoTaZ2q+RpG4nq5yrgD
         OjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583557; x=1739188357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=gDETCQgnAFpAyz+SBawRoz0p4paZOTcQWYG4H9M/JSHHnVYVjSZaq6oR41hfUUWiG5
         yLVZNQNkuZWnFhSUg8bE1ztAznAhXKv6nzIsR+LYeRVWWk1s5yTPwDnGoej1XDFO/XHE
         hRJW/vRyO4pv4O8n5HKF1YB5DcDV5j26c3hbbnYzy1I+SuBWBAjoc3RqSY5PcNWM9Qdd
         XCLAr69W8QeNIhVLJg61HvHczKzvwuF/irOCI8mhjjikNX/7499ysOVlpC45cxzhQmZM
         ahLV4Y0W/XJTlQ/yuo4u0FIiK7cE1CR7oT7BbPYhwS1PkkkI788XMxuvtJXBvQ5xq3pc
         KuiA==
X-Forwarded-Encrypted: i=1; AJvYcCUSSYrxSIeR1oG4RbpcRJPl0ub/9f4owINj7EDixv88rEbqoSJtHytZJWsUgmm8pZWkA/GxmwVkvoVZSw==@vger.kernel.org, AJvYcCUvnomiKUBzg9d2E19hYBvmV0U0lutsQr33oMKoYtIMclXKV04D/w25QeQmKxdGWYTn5CgUbCLgIS1EPTEH@vger.kernel.org, AJvYcCVILihiV700WSJbUrE5Lx9GS+I4VY2BNZScGMRdzzch62onZSU9b8YRRGP/wuXp89CV7am5Tea+RCEQ@vger.kernel.org, AJvYcCVzhcbHHzwdLDRybGeWgGf/xikHPAt2NW+F5qiQ4nYoYCxF2O6otNwMq0amFjqXHVlDiV6wroswilHrzZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEGQwG9t7SVxkimi+pq3ZzYua7qKjtWpsNwMft88A9RAj35gl
	Vq9+E+WHi2Usm1fG9UjyJiyc0SMP8oRW9IPTidScFHcihyts7BGO
X-Gm-Gg: ASbGncuyDBCpUB5DV9JPqCsqr7Hn2/mmg6I/TTW9HPlUmlzCL17NPBADShwaUxaA7L/
	5COEcEh7hHo0PEmcqZ549jVYplgqUjC3mJJPpBAE6saRs8hUtwHr4bHKmoRvQBX64WaxhcAV8rB
	9yLzQ8nyyWe7TOHJwpSTl6sgeE7RcONtvIy2RA1XMjINzJOrtEd4QCvFnwIeC/d9D8AdSh9EtN5
	V2CGWJs/MbvOYSeKngxenVT7UxrJRRE3Qu+7wgWSgdWYKpNogRf+g4NR6C4FYfoY4RDVXddBPz2
	0wSo9eK1eFHF+50K
X-Google-Smtp-Source: AGHT+IG9OzjbgkvCS8tq7nwliRQ7D0GE7eIK1YFb7OgjbU/H0UhSsEr4jVXSBegVQdOpNlym0wtPBw==
X-Received: by 2002:a05:6a00:4642:b0:725:f1b1:cbc5 with SMTP id d2e1a72fcca58-72fd0bc26c1mr38178820b3a.3.1738583557299;
        Mon, 03 Feb 2025 03:52:37 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:36 -0800 (PST)
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
Subject: [PATCH v5 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Mon,  3 Feb 2025 19:50:34 +0800
Message-ID: <20250203115156.28174-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1


