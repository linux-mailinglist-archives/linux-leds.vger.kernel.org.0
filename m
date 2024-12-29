Return-Path: <linux-leds+bounces-3708-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB999FDEB5
	for <lists+linux-leds@lfdr.de>; Sun, 29 Dec 2024 12:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919503A17DC
	for <lists+linux-leds@lfdr.de>; Sun, 29 Dec 2024 11:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6083146D59;
	Sun, 29 Dec 2024 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0U2IDAS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297AE4D8A3;
	Sun, 29 Dec 2024 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470847; cv=none; b=VfH9P7MNOqmaLsMGWGFI210u+R+Cyka2g4c+cqmQocrh6UJECEKxCgL6lIFEVVI/nJ5iWIeCf+DWdAF8xmFOWxR6bSe5EMQu88Yz87P7nxubq39afsFR/cJscxH3UwuzSsnJRGp1nuMBhud7fZLoRkAl3KCuPOeDG9cn2DHq29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470847; c=relaxed/simple;
	bh=WimL86Ee7sTDRb3waoeawAMTramntwTiB7N8weugKA4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=aOwnfj7RWftGqUyI2VZoIaAHVRNSAh5tz644lHl4bNWZzWiqCvF9TayClRGfTilP46N7eXYGy6jiRrmIcsXh0DfEoB5UYm1xFujo6bY3DZpcEFoN0/YMAcSjseNZEU31iU0vxoHL3u6F0AQLgvkFcgyN+JJCx1LS9dv7wQUYHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0U2IDAS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21619108a6bso98680285ad.3;
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470845; x=1736075645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
        b=U0U2IDASr7KCnKWjeXLa4+LL24ZB+45aHO6lKXFXyxX5qSg1NkaZbKIFBsNqjEqRsw
         OjIdoCq+jOmQzq/fWs5ZhBjU8fmTq6RmcpLdUHNzX0Vbj+EUn3hl9v1kFEhrjh9X6jhc
         VfENE0TUR4+KKh6uJvkf5s2j+KSPyanUzrtpUJI1Y/9Oj9kRLot7EET+rl0kjOYygMAX
         DwY599PMKDEM1qrSILQjrlEB+N6fUWpUDKtUzz9h0WS31gzSL+gT6FYXynTn9tiAD/RL
         d9qn30XZoX1hbgyUY0h33Zw60MHEUTow79cUyXWUgEFLmaKlwpQDFqlvHznqR1GZCnqG
         0Qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470845; x=1736075645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
        b=dL6l3EB5L8Qo1h8QBVJqlFukaHicAs08ZR6XDTYkLLszSfdRK9UHY7gZURbij37F1x
         PJRwZBTgqGnd/ALbye0HZvO9YhcmUsFxjknVDvy1gxuJYw40W881fdKYSBoX1R8x6BuO
         UAxE2wnDaruJ/CMeEwjYkY5j5fxkd59NXhPNxbu+dDtWYpPjxEA2cJYPLt8nUBzCloDa
         bTr0U5S9SlrNl4Y6JUqYvIS77SAqrkH5UX2pzSgUsREkf/Zmif3fSwmIydqCes1qDpJF
         Bq9AogBJ5rILCaUC7hsUdpn4IfS1YImpFlDREnMQwhTi/xZtVyoLDE7ybM0pMIc/4bXz
         jbgg==
X-Forwarded-Encrypted: i=1; AJvYcCU0GHcLVUt1jwd109Ce84GrmcNrnH/EDAFmf+aW4pOfB1a0ESFcS5yceO84/6ZQLea/6mM+i3ABuVhp@vger.kernel.org, AJvYcCU1nijXfpl3+Y1vidb5ca2t3s+T6bza1e8I4o8L0K8fByzRBdta9wLtI5SHALL1auOyMUMO24pHjvSd2w==@vger.kernel.org, AJvYcCWrAu3uXNf9vkU63QMvmIYFrF2B/muacmpe6W8T9Dgz7KnP9LfPCibfOnaPxNN2neHvdkoenvw7XlPgMJzH@vger.kernel.org, AJvYcCXwgqbCIlXVq6GeuQ6/0RzQ+8pyElAWWjIHcPYrFWoNV+wToVER4Cm0jpGFvrwi7pUlsrpZw3X5TXuMck4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwQfYE9Kr0gQmTmt4rLN1/DBAEWUyBGJ228gWhYOyEWXnm6GM
	lX2k/1Rs3MyL7qtH7k9Ll0zH71zVUZsPleMkSxXX8fjDRbZBWYqV
X-Gm-Gg: ASbGncvEvpIlHYohVFE73z4RT3WzilRdMj3xGelpb1pVsRUomLJfLkjYj39Q0qdiot5
	tA3/DSD1Jyz4RCVEehWjOjgD53w231OEJ6y/iKxRQduKSvfbExe2IOf5m6+0ngFOSNs3uRKr/Uq
	KOWLd6Qj/70ME9cytQjrnCyuL2XzT6OyqfQgQ/x5lSZMRK8dJEOX2ZXCXoYPDJDw+R98k2em1YU
	rNe7h5e0liQ2pmdw0y3DG7s6YvSC50dJNUQGdUy4obL8eI2p5NlzMIoZQ==
X-Google-Smtp-Source: AGHT+IFC1QZJfqXlyjwwxcIAnkfum3t6MQ+L3yuYAABJDnspWgtVfFsqagRUXkgAgDc1Jy7GWtwr8g==
X-Received: by 2002:a17:902:d48f:b0:212:4aec:f646 with SMTP id d9443c01a7336-219e6ec1340mr390222995ad.33.1735470845437;
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
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
Subject: [PATCH v4 RESEND 0/3] Apple DWI backlight driver
Date: Sun, 29 Dec 2024 19:11:16 +0800
Message-ID: <20241229111322.4139-1-towinchenmi@gmail.com>
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
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 122 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1


