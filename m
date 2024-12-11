Return-Path: <linux-leds+bounces-3561-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E43709ECB5B
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 12:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA41188A0B3
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 11:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E007211261;
	Wed, 11 Dec 2024 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwnZQ7de"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EED238E3F;
	Wed, 11 Dec 2024 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916934; cv=none; b=sQ5YrLvCsKwiGoz0S+76Z+WZViGIqI7o2/s8cZl33rz7Dypt/IAW13k+7lBD6hbE8CfXyklc+pf3CU1epOfd2+iDaXD0VARW9oBZs3rj9w406WwlDrPmluFpmTRjuC7kej0DRNyCRPK1T9YDQPvXrOredB6EwIr4QNQROk+9TNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916934; c=relaxed/simple;
	bh=YyxaXuufcIt0GgfSjrhWJiVObWb/Mkn9OBVuggRuJN0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=J/njlM+TWR+UynUqXGJ7MstNJDtV26tUaGoOAH6efLBV58ln94D7pHQrQTmICNXOu3q1YZnT10B505ithtQoX6CS4ARd3SV3asGP1Qxc3S11RqHd6fJO9FPP8qxI7m8YCVV2U4sOJ7rC8EFY5LcUdOvSbWgUgi84C68pq8GToO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwnZQ7de; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216634dd574so19707075ad.2;
        Wed, 11 Dec 2024 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916931; x=1734521731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
        b=CwnZQ7de57L56q6tvO8fRy+ZwrRxrPyfD+f+9AegE83lIFIU+G/umK4Zrmd4E5GpRu
         4svZtSn4tJpH6ppTlyQb4VUO/B/eVX9aQxdFCseFSj/sxQi3L83QkWeDfJBE6yYxug2x
         2u6nX672sPf1FVmFiCFkNKcd+ftDQUCglEMGH2fbDS8U80OP7yTdek6dkZCREDOLGKVD
         tAl8vnJuugXjubpR42P5r6P19rTfd7g5ezEasjKQ7VfSkdWw7yKt4jDiezCTjAJIf547
         rG6jIebroCJbnOgA7HJP7SJLapZvj9mU/g59RLMGFVtY1vuHDKQ1UUyQ68x+qZzFmHj8
         yIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916931; x=1734521731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
        b=jOLpcMGMTIx3shr+ejqj7SPIxr+zRceVNDKWvvOjMEV6l/QJGoVFAcCGNLzpftXvEB
         VTsliEnYFCN3X3v4U67h0GG9SrqPDBhG8+doJdfs3tSBTBt0UdGfwts5aJrdKYJ7DgfA
         Q4SZZRVSKcSBgK3NQ/LdSBwk1FFyCXQLbq5fot5rklZLukjx0sN9TReETJWylEBzA9M1
         r4XF89IGs3OETdQn9+ufEkI9koKLyrd9Xu8s9tBoVilHMyrWNDHrJ+QDa0oFqbg4zupZ
         9HtsQitFzlQgOOFC+7bYy1DiKXpphMI4JLAfEUXFbfKFtMKyvI7ZSQZiwTzWaK2oHMAV
         refA==
X-Forwarded-Encrypted: i=1; AJvYcCV+8poDQCSUPPxmfU/di8V7P/6mA/jx360HJSEQO3YL0qN1KfQpgfySsBf8936d4SPN7mszi7Y4fW7r@vger.kernel.org, AJvYcCWk4apUPLxbg63YYx4uhMni+11HgiOjWqvoywEYnZbrjtIZBwG1YKnMtUPblxOczPuUbHaX7qhlAAJZYaE1@vger.kernel.org, AJvYcCX15K68yTtzLO9+i5V56ACCZ2uUpJK9Sa1HS3JxzLn+SmS7Kj0v5yn6QUCrIWIfJ6SBzI7hiXj3LHGzt2s=@vger.kernel.org, AJvYcCXWgZj5is2ww0cEwgpBjssavXxq1gzi7sej/77vdjUR+FiCd0lmxBBp+3KSHh2dl336fDuUdBM1x4oGIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4olLA7bMVCEl0DOUU70HFXGosaMgplu1FOwJBOLHsic3oxh0
	UcceMba2R9ykCkP4LcPEgB8uTF571i9eoglq3FsncJF8c6zOlRIG
X-Gm-Gg: ASbGncv7B3VLnzmhd98xP8ujNM2JannMQG/gaTBELOi37BdvIayIYa5KCe7O0GLqFR6
	FzRyEMeZe0PyzMneLSfxC854/J0NWu3M/oPfHpCFHDnwwYEsh/CTfLq3BTRATaKY/+ZoZsc6F5k
	BSbL9gmZJz2oj/RTB+Za4BlnQI5snJURoM7S+ZImRQuO8lHXENEtHYy9xhl9sUovX/zEksDqsc1
	+pLq84YWkmRknwG/mQQk12GrGrmZCOVTh2YcqgFlSitiOOo8Ip3MintpUDhTzb/DYHG4A==
X-Google-Smtp-Source: AGHT+IFh+SOIc2pSK+oc73lJ9XAuJ74bWyxa1vkuaFSPTypJbOqSoOBkbcihWmoq5jPUmTdegrgTaA==
X-Received: by 2002:a17:902:dacc:b0:215:b75f:a18d with SMTP id d9443c01a7336-2177839599cmr40156315ad.11.1733916931480;
        Wed, 11 Dec 2024 03:35:31 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:30 -0800 (PST)
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
Subject: [PATCH v4 0/3] Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:36 +0800
Message-ID: <20241211113512.19009-1-towinchenmi@gmail.com>
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


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1


