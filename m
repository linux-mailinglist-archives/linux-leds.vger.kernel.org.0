Return-Path: <linux-leds+bounces-4611-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59932AB1030
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 12:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846D51C263DB
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 10:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03BF28F505;
	Fri,  9 May 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Yk8uJ4NM"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF543274674;
	Fri,  9 May 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785639; cv=none; b=vGpZDpAIS+1mTMT20NycMOHFB1HSDxs17+AJvsgHJt0X/aF+r2Mjlr+UR/nIVam+o+DIaTfhNarb2tOoVwqQdStN37r8wOF/U/MxGLqNUtZoDyFf4j67QPDhiG/CYQZPazbUQFr/8T4VXnJq8oBCCMMBDGCN89EOZz162FVWRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785639; c=relaxed/simple;
	bh=AU/evyLY36h6heLli8/0jOoKd69aELP0vtO9uBIR2Lg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=swBxGvvuOU/VhLkCgFvNOxB3Rx2tm6y5ODXG5Ly5ElYWwwIzzrNzNruhLcjoQ7kp2p8F5C/TBDriPfMeqk22uBH76FOBvMle/5VrP4jX5rwnxyseZ/hOxaR0kIPq3Bz+3zcXkxq6gGgcQBLirpP9KU2y71YtcUEyi5iZih8V9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Yk8uJ4NM; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nAfoWVNuZUaaIrzJ/KTAH5X5jAijWISwnD0nCOplMzE=; b=Yk8uJ4NMd3wjcpnvWtoeavtXMC
	NQZkPY7+0+V8Vip0kgom6HDMFU1+vKqHoVMghH4oHNDSmSeP4WSyj5/92H0+XysIUrB2KQaWhI97L
	ArnKc3Kzn7FqiB40YMPniLv7l83EarqNf+47u9hB0i4qi/tIEet0QKweu6BO0fKvp0nY=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56672 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uDKjp-001ghk-L1; Fri, 09 May 2025 12:13:54 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v4 0/2] Support for Texas Instruments TPS6131X flash LED
 driver
Date: Fri, 09 May 2025 12:13:41 +0200
Message-Id: <20250509-leds-tps6131x-v4-0-2c9563f5b67c@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFfVHWgC/2XNTQqDMBCG4atI1k2Z/Gi0q96jdBGTsQZalUSCR
 bx7o1CkdvkNPO/MJKB3GMglm4nH6ILruzTkKSOm1d0DqbNpEw48B84VfaINdBxCwQSbqFZSqLI
 UKAFIMoPHxk1b73ZPu3Vh7P17y0e2Xr+l8lCKjAK1DBSzFTQV6iu+GuzsWY9kLUW+a8H+NE+6N
 lAZpXOoOR612LXk4qhF0kYXygpZaPn7e1mWDxp7Sp0mAQAA
X-Change-ID: 20250227-leds-tps6131x-a7437883e400
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
stage is capable of supplying a maximum total current of roughly 1500mA.
The TPS6131x provides three constant-current sinks, capable of sinking up
to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
each sink (LED1, LED2, LED3) supports currents up to 175m

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Changes in v4:
- Added/removed/adjusted comments
- Use defines for register defaults
- Updated source format
- Check for error in torch refresh timer
- Return error from tps6131x_parse_node()
- Link to v3: https://lore.kernel.org/r/20250423-leds-tps6131x-v3-0-ca67d346a4ea@emfend.at

Changes in v3:
- Add comment for locking
- Drop handling based on CONFIG_V4L2_FLASH_LED_CLASS
- Stop if getting reset GPIO fails
- Optimize locks
- Fix type of num_channels (u32 -> int)
- Convert a remaining return sequence to dev_err_probe
- Link to v2: https://lore.kernel.org/r/20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at

Changes in v2:
- Bindings: Extend device description
- Bindings: Drop unused address/size cells
- Bindings: Use fallback compatible 
- Bindings: Corrected minimum current for 50mA steps
- Bindings: Drop node label
- Fix name of REGISTER4 INDC shift define
- Save device instead i2c_client in private data
- Add comment for mutex
- Use macro to convert from uA to mA
- Use defines to describe initial register values
- Add safety delay during reset sequence
- Use fixed value enum to set the mode
- Renamed some local variables
- Re-sorted local variables
- Replaced ifdefs for V4L2_FLASH_LED_CLASS
- Improved some error messages
- Link to v1: https://lore.kernel.org/r/20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at

---
Matthias Fend (2):
      dt-bindings: leds: add Texas Instruments TPS6131x flash LED driver
      leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver

 .../devicetree/bindings/leds/ti,tps61310.yaml      | 120 +++
 MAINTAINERS                                        |   7 +
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-tps6131x.c                 | 815 +++++++++++++++++++++
 5 files changed, 954 insertions(+)
---
base-commit: 9c69f88849045499e8ad114e5e13dbb3c85f4443
change-id: 20250227-leds-tps6131x-a7437883e400

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


