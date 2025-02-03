Return-Path: <linux-leds+bounces-3869-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B343AA2588D
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 12:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4A81885DD2
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD7920371B;
	Mon,  3 Feb 2025 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlaAjSIL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7F120370C;
	Mon,  3 Feb 2025 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583547; cv=none; b=QZbKRgu8wOiY25z9X6L/H17Rioj2lis1Yftn7nElriSsYnJVHA76O42GDFAWD6kUUQTDfApHen6CAcF4D+WIOWHH/AYoOeFHRfy5uRH+ilCZ1I1uZPpiKiNKB7ixj4lbs6ITRkor8IhG3yZAvRNGUqeijA08RsrebWcJMPxVrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583547; c=relaxed/simple;
	bh=pg37Hkuxy/mp07RBnXKjy3rnbdPYcoYwLXNI75XiooI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DO501DDKodQ/iN6ICCWAreHU23i/TmaBnMl5VYyr1GVxZiGklcRaVO7JqyN7+zDRjFmDFpyNb+dsKhyLXeRFwQB0+ZtdBKzwYad9FSczlTkaqLwOSbJEJq8SyEitF2eQMEARga4TBWn7WdKIA7sP7PzeksBguGV4Hg/BLK69StA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlaAjSIL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so59965805ad.2;
        Mon, 03 Feb 2025 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583545; x=1739188345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
        b=FlaAjSILrshPKUanDNf3IpPDubZiWW3RLwixf4dPQgZmlpuf/dRC3rVmymhuKYbYgs
         r9SohiTd9jTvTqL7fznTsxiTOv+Ya8Kpn3vvEbcfhMqHzQRxcATHz04oIgpbApV6MQKG
         02a82co2hJfTLe800S2DS/V3RPrmpUHAqqrUCwEeSj0+KJxRjKvwI9e+jHtY1lNtMSlA
         q2IImx6pjxcubmwyngXzI/5qRRQB8y1ZIfmze3QCHxG4hhLK7RenVLrSN5OPfg4VkXFD
         frfzNnakvUcTQE6BMHh7xhflbD97YpZ4t8hSXzhzSqVKlSFS6sFDeJpqTD4rwEtZZAlU
         7uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583545; x=1739188345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
        b=lqWLwGcHrCNxTd0yTDqGPWYIxkItEifUjw/ZxghKUTXR4403F7Xow30YLslWJVTlA7
         eZK5MRQjSWM6hT2f6QLmnod7X1nQvzuWJNWyUfqOc8eW5k+a7FUNl7QG4aELgqZNMw1H
         hTHsllekR4tDiwVdYEeVNPzen/uWuD7sWApbkMEx3cleGA41HDsJoVDzhOe1feKhzED0
         67G/CXCVfyiyhJ+7wv/RRF+PXI4vnDiGEeMCpFpkz4GiV6Gi8WvJT7Ac0p8/iYGpLE7I
         NGEEqOJpthafZDnMNQHkT9kmtucUZ52yFRFU0410fGq16LsPq1YuSB20YQedYOU5FPoh
         JloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbcaUH5IUqMVWjvJ9V3nJffzmvyb6o6ke6CDReLJ1nuycnR1MX/g7/A8KzstMkbhiXScySGDX8Tywf@vger.kernel.org, AJvYcCVwpUnclGq1Hd8yXptRGdGOQc6jvQCueIt/OQ2d+L0gt3aVGubf3ny4fDkcAqi4Y4Pu10SlTw/tn9GgKw==@vger.kernel.org, AJvYcCX8iFM0HizGm9Mr+S/vgPyH4NPdNdPZoEHwa4LUdWijdpEUglSronLzPSpPdHycjE7+U8gmOHjW/HeJXgjI@vger.kernel.org, AJvYcCXIzduwE1PzQ6kVKtzzGlErMk3TlPHVOE/YdyX3H0eo3k6ZKEoBfke/tVSfPStM6ulyOuGGlcgoOiI8M1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cEoGmth/zpEh7XcXY7+8ftHORKF1gpV+Sm3p/eHuSyFjqwEA
	g6TEQQXo6qhWU7Sc1/cmVuTJF7W4eukv37I8s08iSASr9DiOlLaI
X-Gm-Gg: ASbGnctBtv+fdMyFVRXvCNKwqIIKbYaj6g3XkT1KLx0FLAWgCyh/6i1vRWOXa5/vUO4
	i+PkFhOsJb2w3vruYNCpjjpI1ueDhsCQ0WdawaRVyMcEoALGa9Uo3lgW2nF+LC65+YsL2Pro3mh
	Uh/QJvL2mgDMP9EFOKLUjrbm4hMCigNDnv6btBTL8CQhQ4P4oCmZb7OVH9+qR7youD3La1wuGru
	9e3OurphWIIjD0zRw2ue6577IkOYXLZBbZw2QgG9R+vD6zW9j8Y3hJTdjbcT53ZohERNByPA7w6
	FxOuSkAawDawHiqb
X-Google-Smtp-Source: AGHT+IEdhLM08AT2wmM/NO7irAEic85WuehISVFGzdIXsWFirVgVJJVcaDE2suDIVnMIJ/r8VGZqsw==
X-Received: by 2002:a05:6a21:998a:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1ed7a5c22a1mr33704475637.1.1738583545121;
        Mon, 03 Feb 2025 03:52:25 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:24 -0800 (PST)
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
Subject: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
Date: Mon,  3 Feb 2025 19:50:31 +0800
Message-ID: <20250203115156.28174-1-towinchenmi@gmail.com>
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
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1


