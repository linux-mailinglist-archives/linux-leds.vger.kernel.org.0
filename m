Return-Path: <linux-leds+bounces-1704-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E28D00E3
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 15:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6CE1C2406F
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 13:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C9215ECC2;
	Mon, 27 May 2024 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ViNIMX+2"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57415E5CF;
	Mon, 27 May 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814786; cv=none; b=n/r7lePqQGCWoOyhHlkhUyeE3RGPU9AWItE7/NmrPl8nZfpC4rUVHQexl5jEuWz3x3Ov5tgM4Dln5M2t70TpsiJMPuJn1lRhXlTkgGGUAaVCSjzLfoQBYDohsY2hIi88L8INC8EuBPyZu+5z74BV0rYOZIZiTIBnSxAXRNxlIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814786; c=relaxed/simple;
	bh=17Bodxl1+c9cjS7A10UizQdqZ2GkEeHiKunej54JcGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LU5aRPs8NVqyuSeD241kwSZ87BXYGZZJbxbQxEuvmLWMIRJrGKGSRoelQ9/Nitj7Wcgwq2m/dxgRy7ODHT7R5xwiZc+JbpJEbZQV3s95ZIF+lm0dUuinCR0mJ4436nvCvee6Few/8qOMOIAYtZsKfSYPugGWQkBTsE+9kvYvDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ViNIMX+2; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 669D41C0009;
	Mon, 27 May 2024 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716814783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vMkXAi7jLsL+T5OLHtStfm8lysOchXaAXldUsAmtpFg=;
	b=ViNIMX+2BbhnsvfXM0HH8pnYiEwF2bzDPUTf5S/mCxxcZrjlEL9oCy62H/3qHWrkJ4haeW
	yUk7TapsuJUmQp2Pa558mVe0QgPFjlLUUhzTqK1MFIa4ofPw8RkoUq2Z7bGZQ/2Z1lDC7g
	f2dNLk7i6IFaMfRC30W2zLZjnrBHQnfygj3SwVHZvXIyDqHMuEijBw3rx9QynMoUEByjck
	53BF7LgJdt9EIqXhoZII6t4+85moDFaqLvNWf+RcOkoPji4zP1PGxASrt6gT9rR29InORA
	dRGU5Kc2gIXdWbxYKbaxODrX7Neci06TafHOxyHTN90Ncn81yUHF6CD8ca7s4Q==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 0/3] leds: pca9532: Use hardware for blinking leds
Date: Mon, 27 May 2024 14:59:37 +0200
Message-ID: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi all,

This series aims to use hardware more often to blink leds.

The pca9532_set_blink() rejects asymmetric delays. So the core's software
fallback is almost always used when we want to blink a led. Removing
this restriction revealed some conflicts between setting brightness and
blinking as the same PWM (PWM0) configuration is used by all leds for
both brightness and blinking.

Make use of the second available PWM (PWM1) to blink leds. This PWM1 was
reserved for beepers so hardware blinking is explicitly disabled if at
least one led is used to drive a beeper to avoid conflicts.

Tested with PCA9532

Bastien Curutchet (3):
  leds: pca9532: Use PWM1 for hardware blinking
  leds: pca9532: Explicitly disable hardware blink when PWM1 is
    unavailable
  leds: pca9532: Change default blinking frequency to 1Hz

 drivers/leds/leds-pca9532.c | 60 ++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 11 deletions(-)

-- 
2.44.0


