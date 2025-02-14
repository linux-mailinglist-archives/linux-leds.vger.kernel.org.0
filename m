Return-Path: <linux-leds+bounces-3980-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178EA3557A
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 05:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DE0188FED4
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 04:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870E514F9FD;
	Fri, 14 Feb 2025 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCLaMLMc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76E62753EA;
	Fri, 14 Feb 2025 04:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505842; cv=none; b=gB76O6i712oYe54hNbNfHCY0O8UaZrpROtVdRNf6KYs0xO66/YaBtG74I4xJYjN8uCC/0IR9094v3zaUErrg1QxOdEw9JguEig4ri7pB1b2WfDNNriazu9LtrD+EyFnuTyu6I14JA9F8uLdSEnZBUPlYQTG5Fzzc9O0ZerDoGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505842; c=relaxed/simple;
	bh=egiR+CXl8AF1IHhs1BWoZ6rt762jDgubeayg59ockyY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u+pUby8bPefSUjGpw28J2gULVtn1f14dwIPeRhjy2uWIxeA2jPjkRydoB23rU9tgunIeulhsX0KF+DbJ31lO5R0ynlGl33lI2mhjucGslmwQI8DKH53wIoZXvbHFaIH4FOQ/nXOZZ17N3167An+Xm49GzQYzAEbFcgy2+AukWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCLaMLMc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220c665ef4cso22711085ad.3;
        Thu, 13 Feb 2025 20:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505840; x=1740110640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
        b=YCLaMLMcPBxvqBAjreZLrYe1pEMqA2mhXDsTQ+uxhk4QcFkvEyLAlPxiV9s9uT8Qrq
         fkAAuUwpJEgMLZXUh+xVC8CB2Xhw19PQs+pud4pqBD/Xx316F2f1rsH5nVXPt+o7G98a
         07di60tpbjXeXkQZ5I71gdSYKh+IOye2LNfRnaQ2BB0L6Do9dORn5XkrqTle736v1PvV
         p+4Uvzij0/lm1vEUxB4bOs5HRvnSiG3r9FTVG0I5ZfUZLcqQJNyTv8S2+Q0lSrAglSeU
         TBDfkihnnLMVOlKJPViIYtv+qj8tw/t+1WjFyre4d60wiY6Nx8YrOBzQgZ4KwoIcLjW8
         SKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505840; x=1740110640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
        b=uC1bjXHs2UN4Fugp4NKmEN6wcY++I6KxaoghqxBfBC4xexg3DZBMFp88KXG7lPtDgm
         ClBqBbZ71UDHIdohKPkKUJQeOOn1Zx6gvUIlhQGWaco5yLAVSGCI5FVrW3aChbVe7izO
         zSC/uzVr9qv8F2SDEIrmDWWZYphKC2tjlJ4Or/xZnp7vZnj5IzLh8x8J1ht+FZ07MLPH
         7S3i5EPt6g7yI29gGbJHzZ8jnE2vuoyoGvBYNqQbAF4QjoVtn2N0Ahfl7gRefTLQ7bKn
         1ibv+09l7Ay1il1YJAJ7uDQKhRLZX/vwgf2kOQ64+WbbduqvQsRzkQvfOv+UPzudrMdt
         HcBg==
X-Forwarded-Encrypted: i=1; AJvYcCU+VK2X2h6ut7Ar47u6CDdWmakK3SzGbXvGOaljT8riQtOBAiHUDBU7IoZYhdRYnR3XhMu+Z1BfpsHYHWjC@vger.kernel.org, AJvYcCUabKRHrpToq9mrfKDUF+XcVsEdQBis6a8rW7fTDogbLp6bUDWBp+5b+Ljf5y45J2CHNOHjOii+wX+0@vger.kernel.org, AJvYcCX87vaJVetF5EhfCNdlVANrdMHodJKkktymA/9EiYKUqYiQ5OHsJjJloHOhbqdZ10KhzWJgH4jm/E0Sd4g=@vger.kernel.org, AJvYcCXow1GUswMcu/RDY1IGT4DReWnwyB8gJQZkUk5B71us0gWcyhSPcExyQbdpNmJkFeLYmssrctd5tgt1hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUkrNn2hsi8IVQLwLWNRKXTda58/X2OUhyV7bmduk9e9ZLcxG
	Ookmn/hu7o6oDfvohGlWsFn3ROphujmTCxpxmUIO5TYtLOtu/7ke
X-Gm-Gg: ASbGncuFCPFhikSQ/o058yTygiY8+ZmnWMDDXyojXKVtqzeluVvgELOTO2MIXk4ZPr4
	d3jD/c+enaO2vY1GLnmjkDagA7RmNMiFR8F+WiT3MgwJOW+RufnaljrQef4ksAzs+TT1G3RkgOM
	jjQAlgrmrBaeiVbVwPeCpMVPBWkDpOzw3zzj8RflhnNrEfRrjVSF+Cmbwevi0wutvSG2tbBS0nn
	e/j9+dmqTTUKaH6H8TjORZ5i2UFZ3f4PvCTZd60SS1s6141dARekBlkorY1lbYGnYPW7E/e/yoy
	LsqPFTpkSgBwAeQ=
X-Google-Smtp-Source: AGHT+IG/lvp3REMuEs1TqSkR5QKUuTnGFxemCOEmduTyXWx0aA8kwUQQ7GuOdHz5MXhdcM3OB4TycQ==
X-Received: by 2002:a05:6a20:c998:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ee5e666792mr17049651637.30.1739505840029;
        Thu, 13 Feb 2025 20:04:00 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:03:59 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
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
Subject: [PATCH v6 0/3] Apple DWI backlight driver
Date: Fri, 14 Feb 2025 12:02:11 +0800
Message-ID: <20250214040306.16312-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v5:
- Remove default y from drivers/video/backlight/Kconfig

v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmail.com/T

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option
- Indicate that the backlight scales linearly

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan

---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: apple_dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  11 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1


