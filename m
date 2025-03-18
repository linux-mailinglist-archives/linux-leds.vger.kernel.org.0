Return-Path: <linux-leds+bounces-4300-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D8A66C32
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 08:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8D4178043
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 07:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FEF1F418A;
	Tue, 18 Mar 2025 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="EOvGCx9q"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49991EF387;
	Tue, 18 Mar 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283549; cv=none; b=PHVJglWucEOABSYLr/BWnNWLgTcbf+2BX5I5sYpIwiazzInYT4AuIGIwur+hu38+LJv127dPN1Xgvp5QoChUQ8K/N/o+uoZp+M1cK5JE+x/b06U8Ie+MCpcq7K5faiUBg4Hq8wxsGAm4fOKTEeFuhhEj9Pzp3++0gLoTmO2Atz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283549; c=relaxed/simple;
	bh=5QltsC1ZDmcAOYxh86uQ88RbYXyPlqRYMAHjdVPABNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XWUCxUNJ6WXMkihbi2lRhe+0VXzmSuagcBB+SZZF6KiW/qCFtFVoIuCQA492Bmd6j6R+ZuV+DNbVWHSrhV1Y/VeEyMoL3g8MURhZWmSFJZLLimapAnvFThdadEdaPIpfhx9tovzeFDCdoRH8J+uIPVm808owh+ZlgaEjbcPiElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=EOvGCx9q; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tB1yNqX3wOPa02tnPX59V1Rik1YIlbUhoZ6i2vf5Dl8=; b=EOvGCx9q4r8XQP071IuK2d90Yz
	jTc10J8skTP2v6yOWyAXDJ79z1ddw8Y7sB+0vghbZCdJFWbz4dxV6OBtgV8eoFQJr28lSI+3dad9b
	utwUTSemSfzqmVvFB/HTuErerSo1z08NciG6oMuJjuJ9zDRrr6BBxUezt4JUnghWFzrQ=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:50831 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tuRXL-00G1NU-JR; Tue, 18 Mar 2025 08:38:55 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v2 0/2] Support for Texas Instruments TPS6131X flash LED
 driver
Date: Tue, 18 Mar 2025 08:28:56 +0100
Message-Id: <20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALgg2WcC/13MQQ7CIBCF4as0sxYzQBXqynuYLogMlkRpA4TUN
 NxdbOLG5f+S922QKHpKcOk2iFR88nNoIQ4d3CcTHsS8bQ0CxQmFUOxJNrG8pDOXfGVG9VJpLal
 HhPZZIjm/7t5tbD35lOf43vnCv+tP0n9S4QyZ5ai4HdANZK70chTs0WQYa60fKgTaUaoAAAA=
X-Change-ID: 20250227-leds-tps6131x-a7437883e400
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
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
 drivers/leds/flash/leds-tps6131x.c                 | 794 +++++++++++++++++++++
 5 files changed, 933 insertions(+)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250227-leds-tps6131x-a7437883e400

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


