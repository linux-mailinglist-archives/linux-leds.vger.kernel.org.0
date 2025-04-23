Return-Path: <linux-leds+bounces-4526-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5656A9818A
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 09:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E049F1894A09
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 07:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569EC26B0AD;
	Wed, 23 Apr 2025 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="mmk4QKMI"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13E26B2A1;
	Wed, 23 Apr 2025 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394535; cv=none; b=NhMbbkpIDA6oys7eZbEEV/DklhNmFiJfbC7H9G55II72ovm7rndjbS0SJe7ttAjjvsky2fGVqRhFY85V3iTVRREc33/3J0zm+dpJQr0H/ik9/WsMwr25gL0IJCU9Z9HrXP4kEUe7us+fLVv7wm4Bu3WSnm+D6ZHanmi7PlDvUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394535; c=relaxed/simple;
	bh=/Wub9CFRtt0AtAxGPFB10GQcM5GZazbfFhA0jn7wydg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KGg9cXzfsU+rDTQsTBUvbzUMJS7Bjk/fuuf/TUJxuHrzoHfh3Fke2wGVnxI3omm4o+dC+4L6XbYyitYVzm3Zk7JffPd4uxuRthBGaVsNCM2q8aC1yf9GCQRHLN+RjNeKs3hg+emQQg7yBo811Bg1uqe00meVrPB37aXfcNzBMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=mmk4QKMI; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2nkAQ7fLyP2LfmpJZMBXSQZ/uaucc6/NS2Ynh8Ha9jc=; b=mmk4QKMIi/tOv5r14sFA2O/Bl/
	aF6p3CEoOGGbIBKOBeiL9+HMFtS4JfU1JiWS9qNBXJw1q9HxupoLxZwNaQTe9lUc5mXwmPXTtxltu
	fKLG0C7bRe5uoRMKnvuLyLRyDLP431foY+yE61+2bVMup2lzm6xDU9ZTFID3pxP/jcVE=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55820 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1u7UHr-0063ZQ-2L; Wed, 23 Apr 2025 09:12:51 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v3 0/2] Support for Texas Instruments TPS6131X flash LED
 driver
Date: Wed, 23 Apr 2025 09:12:48 +0200
Message-Id: <20250423-leds-tps6131x-v3-0-ca67d346a4ea@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPCSCGgC/2XM0QqCMBTG8VeJXbc450ybdtV7RBfTHXNQKpsMQ
 3z3phBFXX4f/H+zCOwdB3HazcJzdMH1XRpqvxN1a7obS2fTFgSUA5GWd7ZBjkM4osJJGp0pXRS
 KMwCRmsFz46bNu1zTbl0Ye//c+Ijr+5aKHymiBGkRNNoSmpLNmR8Nd/ZgRrFKkT61wr+aUl3VU
 Nba5FARf9fLsrwAZPl90ugAAAA=
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

 .../devicetree/bindings/leds/ti,tps61310.yaml      | 120 ++++
 MAINTAINERS                                        |   7 +
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-tps6131x.c                 | 798 +++++++++++++++++++++
 5 files changed, 937 insertions(+)
---
base-commit: bc3372351d0c8b2726b7d4229b878342e3e6b0e8
change-id: 20250227-leds-tps6131x-a7437883e400

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


