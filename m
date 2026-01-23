Return-Path: <linux-leds+bounces-6713-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGA4K1Jcc2l3vAAAu9opvQ
	(envelope-from <linux-leds+bounces-6713-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 12:32:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5475114
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 12:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0DE6301151E
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 11:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D213D34B40E;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqyGyXMG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A16342177;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167892; cv=none; b=RsFFPZ2GONldh7Au6Jkln17y+TfiLBu4rhCW+gH0IZTPd65Tix3eSxTPpwHRSLb9r32BeFUAQA9g1EH6mLRitEq/iZ/qYdn+y/jU9gPZIsko+ElVENK8nSPWP9GrsspmkaL39qfEQ9+4Qlh7hQYQNO6CMxyj2o0Cu5hXqMw+A+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167892; c=relaxed/simple;
	bh=vEkFV07PEpR5KX9dNGTST448CA5dKUUwl6Jer72c3uY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OjAeLhIdvaxAP2c3INPPpPWbXyu5FS1V0yav8NZZ6sGKKUY6H+PHRzdJRtZJ4bF2cQG+Rqh2xJkr0LtT1HSJPPILRU0SwqvT5qY77G9tG4c3voDzQlylEsQ5W/Qv8n/ZtJ5Vltr3g3tYDPgYnEU8ChNsQkuYEd2dCYh1EcYZZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqyGyXMG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 448FEC116D0;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769167892;
	bh=vEkFV07PEpR5KX9dNGTST448CA5dKUUwl6Jer72c3uY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gqyGyXMGtjyFok1bHfL6F2eThk/Son5WCT0vXEJxdWzjAhxbArhade74N0WX2nuTp
	 uRjFMIlyPj988VlmAZ++WP+/1L+HAqKsisuVW0UvniHTupKaO8igcw+8C59Jeb2O1f
	 FIVBdMFYb6b1t6Oodo4FOZM/+9HTOfgic4PznyLcc9vecFu1BeckpWrfo5Lhfxtdlh
	 QqqrWw6wyvhu/RcXVmQjOnTWlNpgzaxowq8fRTD5bCRw6Kop42E1oTOOlVmqykt3sC
	 46bl18Os40hjHSItfYDR0ByujTpUVbewOXUijER3eDteavLZ4+mcyX0fA2fsbGhdpk
	 YfC/8a65rK4cg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A81D7236C;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v7 0/4] backlight: add new max25014 backlight driver
Date: Fri, 23 Jan 2026 12:31:29 +0100
Message-Id: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OzWrDMAzA8VcpPi9D8nd22nuMHRRHbg1tPJISO
 krefWoHS2C5Wca/v3xXE4+FJ/V2uKuR5zKVOsgQXg4qnWg4clN6mZUG7cBr31zoJie0jdUQXIu
 MlJ2S518j53J7pj4+ZT6V6VrH72d5xsftbyRot0ZmbKABjilxK73I78ea6nAd6/n8mupFPUqzX
 nXEdqO1aJf7QNyhRaZdbVbdIm60Ed2DyZY7MsHt77Z/GgG2u61oT32nCYiMy7varRohbLQT3ZI
 ncsGA7/a1X7WG7c+96BjZUIqIOv/Xy7L8ALXG0rjbAQAA
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769167891; l=5004;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=vEkFV07PEpR5KX9dNGTST448CA5dKUUwl6Jer72c3uY=;
 b=s+cmlb1pCiN/IakKQKsOgUXRHfTMAtp7ny2CeiPz3mwdj6Dg/YieSrnYRGPVgMk2wS6zYOTRZ
 QxSvxYuCQ1HDtSpzxfJ5+37bCHYLcMUhIn+22/PZekKIrv1Xb8bHEEy
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6713-lists,linux-leds=lfdr.de,maudspierings.gocontroll.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[maudspierings@gocontroll.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,analog.com:url,gocontroll.com:replyto,gocontroll.com:email,gocontroll.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1A5475114
X-Rspamd-Action: no action

The Maxim MAX25014 is an automotive grade backlight driver IC. Its
datasheet can be found at [1].

With its integrated boost controller, it can power 4 channels (led
strings) and has a number of different modes using pwm and or i2c.
Currently implemented is only i2c control.

link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX25014.pdf [1]

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v7:
- remove the led subnodes
- always enable the regulator by using devm_regulator_get_enable()
- remove the no longer required gotos and simplify early returns
- fix the name of the SHORTED_LED error field
- fix the name of the SHORTGND error field
- use the proper backlight helper functions for setting/getting
  brightness
- Link to v6: https://lore.kernel.org/r/20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com

Changes in v6:
- fixup changes in v4 where default brightness handling was changed but
  not noted
- remove leftover comment about initializing brightness
- use BIT definitions for fields in the DIAG register
- apply reverse christmas tree initialization of local variables
- remove !=0 from checks, just check if (ret)
- remove > 0 from checks, just check if (val)
- use dev_err_probe() more
- set enable gpio high in the get() instead of seperately calling set()
- change usleep_range() to fsleep()
- remove null checks when setting gpio value
- get regular regulator, not optional to avoid further NULL checks in
  case none is provided
- introduce max25014_initial_power_state() to check if the bootloader
  has already initialized the backlight and to correctly set props.power
- squash max25014_register_control() into max25014_update_status()
- in max25014_configure() perform extra checking on the DISABLE register
  now that the state from the bootloader is taken into account
- Link to v5: https://lore.kernel.org/r/20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com

Changes in v5:
- moved comment about current functions of the driver to the actual
  comment section of the commit
- fixed the led@0 property, regex patternProperty is not needed as of
  now
- added extra clarification about the ISET field/register
- moved #address-cells and #size-cells to the correct location
- remove leftover default-brightness in backlight nodes
- Link to v4: https://lore.kernel.org/r/20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com

Changes in v4:
- remove setting default brightness, let backlight core take care of it
- use a led node to describe the backlight
- use led-sources to enable specific channels
- also wait 2ms when there is a supply but no enable
- change dev_warn() to dev_err() in error path in max25014_check_errors()
- set backlight_properties.scale to BACKLIGHT_SCALE_LINEAR
- rebase latest next
- add address-cells and size-cells to i2c4 in av101hdt-a10.dtso
- Link to v3: https://lore.kernel.org/r/20250911-max25014-v3-0-d03f4eba375e@gocontroll.com

Changes in v3:
- fixed commit message type intgrated -> integrated
- added maximum and description to maxim,iset-property
- dropped unused labels and pinctrl in bindings example
- put the compatible first in the bindings example and dts
- removed brackets around defines
- removed the leftover pdata struct field
- removed the initial_brightness struct field
- Link to v2: https://lore.kernel.org/r/20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com

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
      dt-bindings: backlight: Add max25014 support
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    |  91 +++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  26 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  21 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 377 +++++++++++++++++++++
 7 files changed, 528 insertions(+), 1 deletion(-)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



