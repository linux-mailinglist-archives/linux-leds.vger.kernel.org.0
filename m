Return-Path: <linux-leds+bounces-3749-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11091A08E8D
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 11:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB09C188C0B0
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 10:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670B5205AB9;
	Fri, 10 Jan 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfQFW7H6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B6205AB7;
	Fri, 10 Jan 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506410; cv=none; b=RWfWdvyR8jH37LBsRYSOYZU9LVsSAw3qksQ1GvZl34jrA1yr/pQJneoIeWX2XlYj6n2vIfFRFsUGsQ2tPZHNDNLhs9kyh8DitSXVRiA5j9IQu7nD4oO/CKjD4G7KfOF8e2B9yQ5/HLDUHlbfLVg7GZG9PguzQdzSlFGg9soorOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506410; c=relaxed/simple;
	bh=rGCRcTAbx7ek3q8ROZaVpZu6/rFfbfIJ7cbQRKFy7kU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=m7DAFfnrr+z2mgTGTQ01pE3cEU3eOx34zzW0REFmbBPTzOYliGKtGIqICGIigxOzVstvGNwR+5vz2jq/ycjkMBxhg24nMdYA2TYO/fCQCxrJIDv1mf31cdIuNEtcJcud3jzuR/t994yuPuH6b7ZLG9Kxt0Rppol0R4uIM1Ha0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfQFW7H6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21a7ed0155cso31902595ad.3;
        Fri, 10 Jan 2025 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506408; x=1737111208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
        b=nfQFW7H6uMOA+nOsxGAwpJi+3eX6TEiDtGGK6YrojEEBlpfYVV+UfiSPah3EjiUTjg
         vSi8sNz5KTE/8ZAGG0bcaJrYG2462zZj4usAM8scgIXX/vMRCXfJ8JqgAOMa/FYHGsFB
         GrTox4UPiTNeS/7co7IlcyiClcvuJZesDTVw/6Ys8jHtt6mR9Eq3dzAceZCuSfKIXHnZ
         xRS6vcEXxpxWRnfrNzhJFxsaqTpUnO6k6ZuLL7OBDO4q4xSHEzedOv7uY59celt9ztW/
         CmTWEKwoHHZSWebDRrPEdItDQxqmeWvs4E2psBforuue0T067emoPhWQ1VCl07r5FRUL
         HqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506408; x=1737111208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
        b=iiIY8+Ez89LQDvG3vELE3SYvavzGJi53j3eTJmCX+7QVVLqgweRcwB4g7gsIyx4LlH
         U1nY8Acr977vbPTDVXnllHVW9M5vo/liB1CBixbGlyJ3ki0ukDEFQ1wR82ldJIWLknWi
         GVgCPsHIm7BQPIDHU5DPiOkKHrn9uftcZIDuoYs9wcOWe+XJhXELy0SK2EKy8SlJzL0t
         PIaFWMrSOVimjDzie2aaLj9SDzyCbePNi6nCWswl+lHLMlo1dQIPNyP5+Fsk/6cLZU5h
         saBIdFGnGF3jzy0kI7+fYxv/93wczjq/AvJVXahMfxP7EwuNaSlQDIaUSfuOR4x+2yly
         AZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ew4AQImWQHJZcKo+/w8jIqYU8y/L5RbUodZAdklw3zqNqSdIOH3SN2C1yy2nK+mColZt6ycrXiqc@vger.kernel.org, AJvYcCUVwRzZnuvAX5QOHx6CpyLNwRMRJ2yRur9NrzgStk+IFp3+QA/xd+Z4MrJQIR1GVosB+cmJRpjvb1/tCw==@vger.kernel.org, AJvYcCVWKXkU1imvhhy/4/aBG21F3Bg1yWyFW4U3AJjJeReTuIM7T3k+eXgd6lNB0zGiCjakmFdM9y8G+0z/VIIt@vger.kernel.org, AJvYcCVZBqdTeH0/lqrg51Fb4NkfQ/vwIiyFdd/k9u4c0JPG1cfl7cUKQ/IKwhfAHwx43PEELfxmoLXDtr1XGbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHpb9T6nlYA8Kq29poN/sSRUE9hyrsQoTDrBuEsOYA0z5cu5E
	ScF/y3H3z820EDDgg55yp5LLmkYTnXlrPkJ92M6FE5zODEoORCY3
X-Gm-Gg: ASbGnctaB0cfDkjbThUtKsbNZwipoe6e87t545xgI9+tOCeafDkWwTwkfBsxIT12TrX
	SYmayMY9vdnh+GdME813BIzGzdhbi6xEEwLgoZNpGAqbp2cl7iU3SAbs9EzMRZnRa1tjJxSKPT0
	7HHhVQVt7upg+R21Pk8+bPM4ZBZPZzubJV1xN/Pee098Na9ZPEUhduvZUyzRAMZJBoRIbEj13x1
	8JPS3GtfGEm2stf5sGXBatTFcXPigUvMWjJsoAD8Lo2yfBc8hnEWlWgfQ==
X-Google-Smtp-Source: AGHT+IEbb2zrjQUcRpFceG3h0m+QmzccmW9rBwdvM+e9BHDcwkzyX5aRGRbjkKUMhgcXHh+nuBGACw==
X-Received: by 2002:a05:6a00:1255:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72d21f4b05emr16485016b3a.8.1736506408063;
        Fri, 10 Jan 2025 02:53:28 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:27 -0800 (PST)
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
Subject: [PATCH v5 0/3] Apple DWI backlight driver
Date: Fri, 10 Jan 2025 18:52:03 +0800
Message-ID: <20250110105304.71142-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
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
nick@nick-mbp:~/Documents/m1n1$ cat e.txt
Apple DWI backlight driver

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


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1


