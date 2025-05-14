Return-Path: <linux-leds+bounces-4626-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC8AB686C
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 12:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0F91B67C6A
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 10:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720C926FDA9;
	Wed, 14 May 2025 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="exE0FeBA"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383A26FD9D;
	Wed, 14 May 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217441; cv=none; b=kWjMQ8aVcss+dzXKeTXP0UGlJfsM7Rhzli+1oiNjqXL1t4pAP44W4qAVtgaKR+OJydC7MtaeUtIaz1JymVwvdjTomWXqZg8ZaRABE/rRhOWiFozccGr+D5oys9xJU2Ja972MB5RcGCtf02gfEnsIujLer2hoU65r87lI079/1Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217441; c=relaxed/simple;
	bh=ACqCtG4WzNlB3BOKU+j/uslBcSJY1nIONS2nzudYcQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eW+/8MlEnA0KTjCXUfy9IyO4HfhxfoB1dwod6lBriCY6fvnpZp06As4hEywh6xyb2IMB7e/L7yU/47gssPDiA9s4gytdBIERugkjFuZ5KwZoj8HsB6yB72KNneMXe24oiyT9uz/dYzi0UBNXy1H4YyuwxPQfrdRlP41kxGJuz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=exE0FeBA; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ty0fNrW4X0KC1Oj7q3eUuAd1SAn7ztwniS+Af/+2WTk=; b=exE0FeBAxE5N8bcCgRz+I/KoaP
	oCo5QRk9Ur+hwMv9U/6f/xA5x5fukhxIyRl8Fbmmhp+oM4Fb/jEIyCqKz2jQiIubpCBinPWGQeu0F
	6tfIr3IolM0vW2pNMX/ttw4vnKhzRRuPWljbspzowDXkWbNrfCvmyktlGSMx+zXzBtJM=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:54044 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uF94H-00ABvu-MP; Wed, 14 May 2025 12:10:30 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v5 0/2] Support for Texas Instruments TPS6131X flash LED
 driver
Date: Wed, 14 May 2025 12:10:06 +0200
Message-Id: <20250514-leds-tps6131x-v5-0-a4fb9e7f2c47@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5rJGgC/2XN3YrCMBCG4VuRHBuZzOSn8cj7kD1Ik6kGtEpTi
 ov03jcKS6UefgPPO09ReMhcxH7zFANPueRbX4fZbkQ8h/7EMqe6BQIaQHTywqnI8V6sIvWQwWl
 yTUOsAUQ194G7/Hj3jj91n3MZb8PvOz+p1/W/1KxKk5IgkwKnkofOczjwteM+7cIoXqUJF03qS
 2PVbQQfXTDQIq81LVojrTVVHYN1ibQN+vu3XrQBv9a6aozeWOpMa1381PM8/wE2ILm8ZAEAAA=
 =
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
to 2 x 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
each sink (LED1, LED2, LED3) supports currents up to 175m

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Changes in v5:
- Removed unicode characters
- Link to v4: https://lore.kernel.org/r/20250509-leds-tps6131x-v4-0-2c9563f5b67c@emfend.at

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


