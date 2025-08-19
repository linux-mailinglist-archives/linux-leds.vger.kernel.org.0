Return-Path: <linux-leds+bounces-5239-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01658B2BF9D
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 13:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BBC25A29B3
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 10:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984AB322DB9;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds8mIUsC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A425A2A2;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601144; cv=none; b=L6OOSMOHmOWxTpvj5ntEa/7R5tYNUJlfkRtdpKk89cytoGvQVaH4NHRAYBYDIROgPev+tViQCq1PDejtfbMKOi+Hr15BTrF/oPyv+F5xwIgorhSapjVdwD5ysBOv/NScezSsc3aP6+Ry7jMZWai9anUICF0qYFbq1gYTQVE3j1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601144; c=relaxed/simple;
	bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pl1xcIjEMuno5AXWEtqPkM+YeBVFOgZL3to4gQIz3q5OqSHRQDJHRehF6+VCPsNLOGsyNP5R9duJ0bHJNeXLDSlN40nwre/8I2LVH+oNfWXAHIMQoZ0dX8u/PEtbqwyR6W/j2k5Bc5C5trjC2z3jJHFqLz/49wgIo7l7zHV/YEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds8mIUsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF08C4CEF1;
	Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601144;
	bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ds8mIUsCQgGlE0xRvlVe6y6bgAdwSbA7Zno8tIxEpv50dUGNL5DE+V/7PsXPnCih3
	 FnMJY8Q6bsZ7H/j5mNqMLtWgELkoslnXhQIvlZOyzJ9pWez8R6KG4h4TKQcazzsyXI
	 EbDubeXebPPEca2HZk5D1pbQaCiUVU2xmK4AAeO8aNxO4xiDyfXNdEpw7g3PBqj711
	 Q2dxfUIq70GD2oV2E3744NsWcJphF6/qC+y0xpp5Rloc7Lf7rEkjbBhSpw8YC1JHes
	 3G4pPvazugxRY14+wOR6bbgR7Boa2Dxc0PPi8fKfcQ/4jUb0IaY0TVVIx0TR+qMwdR
	 zE1oAOpo2lppw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE59FCA0EE6;
	Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 0/4] backlight: add new max25014 backlight driver
Date: Tue, 19 Aug 2025 12:58:58 +0200
Message-Id: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJYpGgC/0XMTQrDIBCG4auEWdeiQ8xPV71HyULsJBESp2iQl
 ODda9NFd/MOH88BkYKjCLfqgEDJRce+BF4qsLPxEwn3LA0oUcsGG7GavVyqFjXKVveKlBk1lPk
 r0Oj2k3oMpWcXNw7vU07q+/0hLeo/kpSQQlJnLfXF6+g+sWW/BV6Wq+UVhpzzB8licAOlAAAA
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 "Maud Spierings maudspierings"@gocontroll.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755601142; l=1984;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
 b=tg5vLaPXsGCQxjf7wI8AaH2Njrai8idSmUxnlS+4gXs03tlqp5zKmNQ244mZ5Q/rRknUynI+6
 VBoeyS3B4V8BW7W09dDMRELXD/LJyG0isydsmFlzv4EHKl325Mc8Pl9
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

The Maxim MAX25014 is an automotive grade backlight driver IC. Its
datasheet can be found at [1].

With its integrated boost controller, it can power 4 channels (led
strings) and has a number of different modes using pwm and or i2c.
Currently implemented is only i2c control.

link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX25014.pdf [1]

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v2:
- Remove leftover unused property from the bindings example
- Complete the bindings example with all properties
- Remove some double info from the maxim,iset property
- Remove platform_data header, fold its data into the max25014 struct
- Don't force defines to be unsigned
- Remove stray struct max25014 declaration
- Remove chipname and device from the max25014 struct
- Inline the max25014_backlight_register() and strings_mask() functions
- Remove CONFIG_OF ifdef
- Link to v1: https://lore.kernel.org/r/20250725-max25014-v1-0-0e8cce92078e@gocontroll.com

---
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 bindings
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    |  79 +++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 395 +++++++++++++++++++++
 7 files changed, 527 insertions(+), 1 deletion(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



