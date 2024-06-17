Return-Path: <linux-leds+bounces-1985-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEF90B3CC
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 17:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E632A281CF9
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 15:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1244915AD9A;
	Mon, 17 Jun 2024 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WxA0Ku+f"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4822083;
	Mon, 17 Jun 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635157; cv=none; b=McQNdgWTkT5XA9ZTBLwpIf+7qYHiIH5wEk/2bpFcRM1gt8YGTAxoTzjO9+/rcUjofUCRS3E23PQsUoAXaKo7K++MugnEmiFtoPMRfpdmrx3THtyrYWpMi4XP9JDnoVsasPkKzKUhabXqkXRzBA5XQLH8u9mXHBPK45+In/vsPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635157; c=relaxed/simple;
	bh=EieJm2yt7danO0RkBdh1VTDxUnZegBMk6xl0asETTlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V69SQ8zLi5ElvYuYdCjsV2s3FtjVdRjQm4PgPj7q/uADiwT/yf/Lo533jPKZKyaOnyCcEqjcEDNZmTHM7Cvd/pRgUPtsj7CHGVmkmuxW52+1jUvkL5rRpM2YbIiVWkUlDUbfdgIiix7Zhd7GMIHhvx2cFQDbkFa4N21ZbmL1vS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WxA0Ku+f; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 224731BF20A;
	Mon, 17 Jun 2024 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718635152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LPYs4kewnoH1dGD80r4YRam/bkERX4wxAte4xGAkuvU=;
	b=WxA0Ku+fndMu579OW1wtY+23pt833wg4x2Zu0VDLF/1Pz2UMmXq//TwWeqPqVmoesMsHM3
	/6ApAphn+emurZc/vCoLoQUdD+6d3FM6Ou1LL33+QSB/cttrPQvykqjl6QzTqOLBJGNAnl
	whKnibkhv19lbgL5rIf983sp5J/yS96aHNiyGyq1s+QaLafgu8U7to61twOPxlFzv0EIEN
	580Cp69qqaCY2e7KCk+yNZixn//mYsLveSrW++YU0HFV7cDmvEILB7qpXc6cicsE/9Y264
	fFv+6Kc3K7feUuJQm5bd313agpSZzpTxzRbThdipNwyA8lFAD7Io5uZpTYLuYg==
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
Subject: [PATCH v2 0/4] leds: pca9532: Use hardware for blinking LEDs
Date: Mon, 17 Jun 2024 16:39:06 +0200
Message-ID: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
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

[v1] : https://lore.kernel.org/all/20240527125940.155260-1-bastien.curutchet@bootlin.com/

Bastien Curutchet (4):
  leds: pca9532: Use defines to select PWM instance
  leds: pca9532: Use PWM1 for hardware blinking
  leds: pca9532: Explicitly disable hardware blink when PWM1 is
    unavailable
  leds: pca9532: Change default blinking frequency to 1Hz

 drivers/leds/leds-pca9532.c | 81 ++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 18 deletions(-)

-- 
2.45.0


