Return-Path: <linux-leds+bounces-5827-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769F7BF222E
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 17:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA6444273F7
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 15:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C576626D4DE;
	Mon, 20 Oct 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nAjWvSLL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F9264A97
	for <linux-leds@vger.kernel.org>; Mon, 20 Oct 2025 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974601; cv=none; b=bsCwy3owQwx/XwZn9FJ3A8/+p5aCTfc8CQ3sm3L/noJ51MdgoSESbBtjJ8cu/IdtqfQFNUokwn5EjsXwNMU4N2UlfkK4X/dse2NF0W6dLhr00U5MGAuQlrSeL+ZnCDnHb1exC5hRMPotNSilkMr+94lruW0H3c3kaVIa8jcEi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974601; c=relaxed/simple;
	bh=q0l8FMV3yHRblEqttYClg2yHvbtiCqW4OLZlw6MUL8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RU7jE1ATGmh1+lW9QHOVTr2T8Iws/7DToTZVLPUUyc3x1nSPZPj4T94ocY3erhCEfrvKx1pW9kjK0IIUzG3corM9hHFPK3B191BCZPdOFOdxAprppgviyfWjXDXLOnRFyz/e5kt7AJyNqqS2W9Gh2QhQw1ef1+BS4/Na4lXTB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nAjWvSLL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7296C0AFDC;
	Mon, 20 Oct 2025 15:36:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3343C606D5;
	Mon, 20 Oct 2025 15:36:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71170102F23CC;
	Mon, 20 Oct 2025 17:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760974594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=H9TQlGr15WosUCH7JUUA0NvOnJ7vpWN/w5BNTsNS/RY=;
	b=nAjWvSLLovujjVcGqB3cS6UsjyPmJMt53gImw2O5oXo96PGiDnqiwP8WBCHeSfSF7F8p6c
	c1d76NedsHPQXowws58Sl71AQdrE6ymh9UUBaWOsfF+5sxxElaVOlIotCTCjkIqJbkmon6
	vA4Dgear7b16odOpOsbm0s38zPAIuIgL/SqJuATm8AhbNYT8+SMxnyhx2KpvbZhVrQYr4I
	KNBQaPmqptJyIUsjtEaubP9eReGD0ys31ncQAL4P6bRjFrzvyFF2oKNDmpkzcCyZ1XLCJQ
	TwomVjOrSK26OWTsiOSZAnkJ/7ZxvqTRc5w7Y22fS+vTVagYZltIBnc23tzINw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 20 Oct 2025 17:36:25 +0200
Subject: [PATCH v2] leds: upboard: fix module alias
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-leds-upboard-fix-module-alias-v2-1-84ac5c3a1a81@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPhW9mgC/42NQQ6CMBBFr0K6dkynCFFX3sOwaOlUJimUtNBoC
 He3cgKX7+Xn/U0kikxJ3KtNRMqcOEwF1KkS/aCnFwHbwkJJ1aDEFjzZBOtsgo4WHL9hDHb1BNq
 zToC3SyOv2tWIKEpjjlQ2R//ZFR44LSF+jruMP/tvOSMgGGpro13vVCMfJoTF83Tuwyi6fd+/c
 15LWswAAAA=
X-Change-ID: 20251016-leds-upboard-fix-module-alias-194508af3111
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

The module alias does not match the cell name defined in the MFD driver,
preventing automatic loading when the driver is built as a module. So fix
the module alias to ensure proper module auto-loading.

Fixes: 0ef2929a0181 ("leds: Add AAEON UP board LED driver")
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v2:
- Improve commit message.
- Link to v1: https://lore.kernel.org/r/20251016-leds-upboard-fix-module-alias-v1-1-be63bafcf250@bootlin.com
---
 drivers/leds/leds-upboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
index b350eb294280fd68535c47843417f4282f97b423..12989b2f195309cc930095ecc5f855065e88d9aa 100644
--- a/drivers/leds/leds-upboard.c
+++ b/drivers/leds/leds-upboard.c
@@ -123,4 +123,4 @@ MODULE_AUTHOR("Gary Wang <garywang@aaeon.com.tw>");
 MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
 MODULE_DESCRIPTION("UP Board LED driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:upboard-led");
+MODULE_ALIAS("platform:upboard-leds");

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251016-leds-upboard-fix-module-alias-194508af3111

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


