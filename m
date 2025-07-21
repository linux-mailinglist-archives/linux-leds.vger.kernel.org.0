Return-Path: <linux-leds+bounces-5098-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD3B0C1E8
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 12:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C183AF231
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 10:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61364298CBE;
	Mon, 21 Jul 2025 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="T4xmTlte"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A9293C7E
	for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095341; cv=none; b=I/BPlOiIPkmhczA8SAjY4kSSGO7Lj9Ep77dhLykORIvLnj8Y4Xq0DVnOR/iCNQMDvFi6Zgd8wOIZy/GtRK0xm9I3XnvQXx3zPVlJ15qTfnM32uqYr0oO90Eay1ZWwR9BNETOlBE0Gfbt6Vn5z1sIM/R0//z9BhEt/efwJyerEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095341; c=relaxed/simple;
	bh=HmcsUc2mLbVnkeCJ/4BvetsKmAW914Lfl6jnnsvAPWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DLv87jkvygMi5A78OlbznpglLc6JtbzYVvikg/lzm8irU5Z5zGgIWBbKSenO/QpFqLnunvEZkb8vptiTow1NpdpVpnqV/yJ39mRiQD+eZ94YBz15UmfVRiIjna3hAoTGtRl1bIi9QPVeau+oZ1s1w2wqptslEvXLy9kMRM4dl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=T4xmTlte; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so17526895e9.1
        for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753095337; x=1753700137; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzHECdJWTQqWAbkBdrXAKUXoxi3Toeb13Fsou0Mpd7s=;
        b=T4xmTltefBSg9xxbM45Ns2Dsc0AB9V4cPXUcH5KCN4L0pummy1SkyoQmFOhIpJZJrz
         OmyWd/KrRNmCmnLDPpY6FSdt8+gm8rjzjDQUKLTpPgFPGRzABu6YCcOaJmv0yULoMqra
         s1/XPWaqh/8wGlEyt66ZN13/q38z30Kd/fLXG0Qcx8he78OleIAS7lJfWOWVwrE/IdjZ
         sdHGgcaJnbAnUfrC7pXlDi9QERZzAl3Wl9m3NbgzUXP4RYf+gD8x91HED8QQvc9LUJIZ
         I7/JPyL2ppoKYnv9dE5hws3kUoqGO1T6xgJMwUOnLZD3GVF/JQA0wZl/xSlFv2jmJXa+
         LwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095337; x=1753700137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzHECdJWTQqWAbkBdrXAKUXoxi3Toeb13Fsou0Mpd7s=;
        b=pGB78v8uyGL/bhENTPLWAXd0Pk+4J1lql5zM6s/eufBwiZeAcRJgb9e++oUNRe0a1s
         Me10dAF77FMa43EMBNaDKAC0dwXyoveG/j36tCxHMUGq+9E1zF5KxiExJ9Ustkt68bLA
         77rbU6AiVBeP0UkkoxyLkByMgqeUUhzkQGiDOPGIuKWza1S4OgOs/Js7EFc/nUruD4xq
         tAwsdeSYwHGI6FI0+wGInHUM6mmzfCLgolbHoO97XSIq+caeWUPPJlX5eSNfv/aUGq/X
         QpW6eijiasaL2j4HZ/xWVjZe2MyAlIN3XZW38zZ6oEOcfUPfeDPCEw1xNaC9+SMFBYri
         xXSA==
X-Gm-Message-State: AOJu0YwNiREaVi2PlwoR2e24fr0IHRy3fS40s9lf/fq8pzbcoOu/pkkC
	NCuMM3ndonutkyAO1tRNS1RRvc/UgwCSO3R9B4WjF6zXdRApUVwSuNtlkqpAcOsuoCw=
X-Gm-Gg: ASbGncvyGhqYwDY0I03a8f7wuMBj6sXkryQ5+HBLNZTALdcI4CUygLjCzd7U2qxHAJy
	BKLSzpRKN6AnYNjjhjJMVMDV0elbYhiFGmfZJh9EInHa9C5iqCO6HrQweCP+56mLq90r1KPvxZq
	ElBtNAaItmsD/t6+uNycuV/vUiVq82vTrVk6eFjWUqV5kAbHW00Fc7ZX2L6V8dvpu8MEF+sWjvI
	Ayv3vI1NWxkNUo9rxrAPwgLzwcoVj8WzISKwSTDa7kNc4SpNlbJ6+Z/TtKz5NlINDd4cycX37G/
	aQtykkJQ/Ur/apOjc6vlS9gsbT7SWg4kiwoY4ZpFjgbg6Fu332XdZpxhaw6pRCfPdaMAMcAbMLE
	4kWmceKizFNfYkkSLWhF03zlYrhJ4BH1f+Wyhiu8=
X-Google-Smtp-Source: AGHT+IFNPLTkejDZ8LrHgeFc0yIvvIywen972HO2LqymJvVWwHlf3dMeClqns17yswZZnYq2wd3lBA==
X-Received: by 2002:a05:600c:256:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4563a5416ddmr91892725e9.10.1753095337350;
        Mon, 21 Jul 2025 03:55:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:f373:f0d1:903c:a9bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4566dd6b8bfsm18141065e9.35.2025.07.21.03.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:55:36 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v5 0/3] Add support for is31fl3236a LED controller
Date: Mon, 21 Jul 2025 11:55:33 +0100
Message-Id: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUcfmgC/3XNTQ6CMBCG4auQri2B/lpX3sO4gDKFRtOSFhoN4
 e4WEuNCXb5fMs8sKEKwENGpWFCAZKP1Lgc/FEgPjesB2y43IhXhlSAc36GL2EZamzslVDSYKm0
 4MUooLVE+GwMY+9jJyzX3YOPkw3P/kMi2vjH5jSWCK2wEGMkU1yD4eRqg974bwfWzdaX25XxDm
 5vYx5L1L4tlSxIwionWtPr4x1rX9QVf9sXtBwEAAA==
X-Change-ID: 20250625-leds-is31fl3236a-39cf52f969c7
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753095336; l=2667;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=HmcsUc2mLbVnkeCJ/4BvetsKmAW914Lfl6jnnsvAPWA=;
 b=g221d6/IcdzDTaMt06Oe7t6LBjaVqrhO955i825p4pYZOQG+Q4uAHPWOk8agzIM23yBo5RD1G
 So1bk/7Azg3A982L6XwzKzwJ90iw52W7zz4+VgZyPipBZ/O6ub0yJ86
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

This series of patches adds support for the is31fl3236a led
controller. The main difference between this IC and the
is31fl3236 is that there is a new parameter/register that
moves the operating frequency of the PWM outputs out of 
the audible range.

To support the new register a property was added in the dt-bindings,
as this property is at the board layout level ie. not all
boards will have analog audio and have to worry about it.

To add the new property the old .txt binding documentation was
ported to .yaml format. There was a previous attempt to do this
in 2024 but the original author has never acted on the feedback
given [1]. So I have implemented changes requested in that 
review and added his Signed-off-by.

The new functionality was tested by scoping the PWM signal. Out of
reset the IC is in 3kHz mode, thus action is taken only if the new
boolean value is set to true in the device tree.

[1] https://lore.kernel.org/linux-leds/20240701-overview-video-34f025ede104@spud/

Changes in v2:
- Added cover letter
- Ported dt-binding to yaml
- Refactored driver module
- Link to v1: https://lore.kernel.org/linux-leds/CAA6zWZ+TbcHrZaZ0ottm0s1mhCLa8TXASii47WKSLn2_zV95bw@mail.gmail.com/T/#t

Changes in v3:
- Aligned/refactored code properly in C module
- Refactored dt-bindings yml file
- Link to v2: https://lore.kernel.org/r/20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk

Changes in v4:
- Aligned compatible strings array in the C module
- Addressed Krzysztof's feedback regarding dt-bindings
- Link to v3: https://lore.kernel.org/r/20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk

Changes in v5:
- dt-bindings: fixed typo in the regex expression
- dt-bindings: rebased patches to follow common sense
- Link to v4: https://lore.kernel.org/r/20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Lucca Fachinetti (1):
      dt-bindings: leds: is31fl32xx: convert the binding to yaml

Pawel Zalewski (2):
      dt-bindings: leds: issi,is31fl3236: add support for is31fl3236a
      leds/leds-is31fl32xx: add support for is31fl3236a

 .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 120 +++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 ---------
 drivers/leds/leds-is31fl32xx.c                     |  47 ++++++--
 3 files changed, 161 insertions(+), 58 deletions(-)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250625-leds-is31fl3236a-39cf52f969c7

Best regards,
-- 
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


