Return-Path: <linux-leds+bounces-3516-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A59E8008
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 14:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7302C28224B
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 13:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A255614D71A;
	Sat,  7 Dec 2024 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6zvbTIs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5914A4F3;
	Sat,  7 Dec 2024 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576694; cv=none; b=sO1tHNWI6vIxaPgqo2ysBlCzmlE1dhA9YlhB8SPeoaRh+bMxUXs9ickMgO4Q1aoTEP9nGjzoRiqx8miV928hT7RgXesKntQKXY5YjMSDY003po754URLwDdeeVVmXQX//dVfQ1v7Or0ttKYsFhFX4pdHou46QB0OBvCKsRnBRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576694; c=relaxed/simple;
	bh=xbMDhkWnVIJmZc2hbDYYC8Fz8jfR0f5DvBXM5oOGGqg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iFY/qIiaFyY7JNj5a932ZrRNPqt0jnhSpRjfc9G+xupozyqGNh6kvY6K45c6yIKq7Ysoz4qPbw45FnqBPx429obDap01nwIDI4itMookUT0t/tnjyF0AhwY0jB7/J6uIMXfkd96c2BSD0RlfFNfCxWxaGolhtWljZ6sFDZxID0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6zvbTIs; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215e194b65aso28676595ad.1;
        Sat, 07 Dec 2024 05:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576692; x=1734181492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
        b=G6zvbTIsprkrfZasHgZn8TSWpkcQYF3duuxIAVYxorthK5+vRZVk6ne9TesqSd5msk
         7iaAnBfpl02zn9AmT44BofRiS7y6CWvEB6F6axYYnjx2hXx+dbrAhqnwTPFAEw48tQ8L
         KsjhGgAggC3CbhJOlDbpsf5RR6fYLCfOuw38Y6bcBOclBNalApetGFfu1yC8MqZwiQ/R
         ECN/y0fh4mEkJpsQLZGeMXHfY/arN6PNIt+qcjetW9UZQLoh5ZhpvLKvxejrnG2qHpYu
         TYZ+WfjTUetwfZUaljtonqrTVfHAoTHovhZbPH6YEJpJYJOSIptBhmAA1ImkjrW+9jGe
         m0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576692; x=1734181492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
        b=repD5++Fp0lkniej+cJtZiX8QdAOAQtxncHlEM0mKnWXg6qwPRaeBimaST9UH1QCZj
         0wM+3XC2HVeh42v4t3emTsls9mR1MfDmoHnEUPx+r79QQGtXIRHz1SbG2cFtgvQ5wd14
         i4nbojTNtxQFcDu1reNEa/HSDWxEkFxf3m1uyu4Ps2cymJYYwmyJrJ6WX+pTBZWgtIbP
         /5VpmUWTthvfbI+UEg19oqLLqYZFnFXLsZuPUNYeVUJYDB7jKh8BKUsjlau8BV/QoC5a
         dHm6WWFQetUL6FGnXjjCcItI8X4LLsGRYNpIDSh8wtHQx2gWG4TEbHhq8rub7dFpgAJ2
         AUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUm3ETEY38saUqyO9sL3saxApIJB/KGWwpgpPWqildgL/ddDhjzX83OaMbjqSn24q3fO/WoQWk1pZv@vger.kernel.org, AJvYcCUvwbpOrnD0d19mZmZ4e9wDBDGRqLs8nJDk6Zlfaj1wOix7/arnp0BCJsnj220rBDbmgGZXYEhoqM3Midk=@vger.kernel.org, AJvYcCXMiCudZe6RjC2fdDm9Uk1QLVpLeboGPDFaGHg264hCROBNiGaOdsJ2CexnIXmN/knH0Wcfte0C6Gmv6uJp@vger.kernel.org, AJvYcCXPOcyFkXPh40tmK4hqaOwlzGzC49XESk57ll5B6NwaRtuYNEKpWcTKn1xXw+YCpZuel25+dLDX9LiGwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tqEu0CjW7qw8MWjeeCVu/QS2aW9vXM6LExsJyYPyoU7OAHel
	gyZMJV/dLNRfG+KrVSXW/p9I/8s8tkRMVGgyTtl9RZUNnLEcFDmnTOjA4g==
X-Gm-Gg: ASbGnctKvhvXUfsQDKW9RTcnaMxIMHiAJDctrcjzfoxT2fg2rKEPIZjoEgahc9Dn0Al
	Pho7WqRTCR2LM6jIyNXcAY45g33+Hkf3lQHNh+E0drA/+5KCBFrWgN3UW3WUkPDaEpre/RgDXEg
	CFH+W3+kOA1w8WwzSsSyopqy2+0PwqDOaO9F0XLtr834Z6rFAM/0a2aPeatq5PAwSRF1lFkEzop
	1+W4F+T0DXs6JkR6vOKFe0pdL1ylEimWJhcfVWNywr/1roARwms2oL0KJdMvxYfjw==
X-Google-Smtp-Source: AGHT+IEXK6h1lriVkUgeA8NkzsgEpDjD4uXCqmEP1oor2nMQ4lKCeHQ2ggi4Xw9LEbdrlC3ZH0E/BA==
X-Received: by 2002:a17:903:124a:b0:215:5ea2:654b with SMTP id d9443c01a7336-21614d5435fmr111914685ad.1.1733576692163;
        Sat, 07 Dec 2024 05:04:52 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:51 -0800 (PST)
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
Subject: [PATCH v2 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 21:03:13 +0800
Message-ID: <20241207130433.30351-1-towinchenmi@gmail.com>
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

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 124 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1


