Return-Path: <linux-leds+bounces-2256-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D215292E7D8
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE951F21631
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302C615B0F0;
	Thu, 11 Jul 2024 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CIOFdd0u"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871561459E3;
	Thu, 11 Jul 2024 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699303; cv=none; b=KFQNAcYHotdAAlAoVruVdPtgzIYwLMd0cREHnb1ythkJTIM/1Qttqqzvo9DZM4jjIxlUzyh4BzhmHkgHRfmoJhlcw+dRTEV7AoP8iBoOzfvpbiJ3+LWfYO30ogTUIgvADDRXpdlF+bYfe8ITl/Rl+LFJEzCSd3wL50DQvhiha6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699303; c=relaxed/simple;
	bh=WuVND/BDHPDs8gG5gKbEqtgY6sJmyF3wZFI1d6YTNSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6bRIhVLcVjsicQuOD0XDVhiHn82OO9RdOMsmuVEu1HoRrY6pfBWwe5PuLsVpJdgcG5rck/oTV2fYbTk857VTotwieLFE74C0r3lyH9GsuVbUdsWU/n1YHeYq0UkLkPcuTRXz2HVvGH13wZkRAFbbTwpuKucogwwA2t7m/f5Vcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CIOFdd0u; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id F04EE1BF20D;
	Thu, 11 Jul 2024 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720699292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NJ/L8L7uVdhtBuiKH/ZGxWRX+or+RkLjY/G9rb3I/D8=;
	b=CIOFdd0uICHQrmw+K0R2vftbLHyNIso3dwnhAk54puXadQmjr/nEA74IYtZC188r6agurH
	RqftisLcSCHZREAFo37zWiFXc+y4SDknVhQTA29K37reVurdM/jaMqMCiXHUL7jzNdZoFG
	O0lVmYyai9Pd7C9YTh29B5Lew5HdkyAC0kL3QtT289d20cUGmyaz9YitfpZ+JAfvu7HM3F
	Pwhdve6mx0IIypCSGhji+T42OXPA9n/4QvArcyR5DGGVj8tZTK/6NUbqiZdZrTHWX4dd/X
	XCqTtjNLXgEGLLk94xSYKwn1uViobTwVdYtElnXU+0ZvM06nhAI+/KvwJIIk3g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v3 0/4] leds: pca9532: Use hardware for blinking LEDs
Date: Thu, 11 Jul 2024 14:01:25 +0200
Message-ID: <20240711120129.100248-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi all,

This series aims to use hardware more often to blink LEDs.

The pca9532_set_blink() rejects asymmetric delays. So the core's software
fallback is almost always used when we want to blink a LED. Removing
this restriction revealed some conflicts between setting brightness and
blinking as the same PWM (PWM0) configuration is used by all LEDs for
both brightness and blinking.

Make use of the second available PWM (PWM1) to blink LEDs. This PWM1 was
reserved for beepers so hardware blinking is explicitly disabled if at
least one LED is used to drive a beeper to avoid conflicts.

Tested with PCA9532

Changes in v2:
 * Add defines to get rid of magic numbers
 * Replace every 'led' by 'LED'
 * Use dev_err() when returning errors
 * Remove unused struct pca9532_data from patch 2 to add it on patch 3
   where it's actually used

Changes in v3 (in PATCH 2/4):
 * Drop dev_err() messages for comments
 * Replace a -EINVAL with a -EBUSY

[v1] : https://lore.kernel.org/all/20240527125940.155260-1-bastien.curutchet@bootlin.com/
[v2] : https://lore.kernel.org/all/20240617143910.154546-1-bastien.curutchet@bootlin.com/

Bastien Curutchet (4):
  leds: pca9532: Use defines to select PWM instance
  leds: pca9532: Use PWM1 for hardware blinking
  leds: pca9532: Explicitly disable hardware blink when PWM1 is
    unavailable
  leds: pca9532: Change default blinking frequency to 1Hz

 drivers/leds/leds-pca9532.c | 80 ++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 18 deletions(-)

-- 
2.45.0


