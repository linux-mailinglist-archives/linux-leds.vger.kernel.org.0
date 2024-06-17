Return-Path: <linux-leds+bounces-1989-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A570890B456
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 17:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37ED5B42DBC
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F2A15B11D;
	Mon, 17 Jun 2024 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b37tzJGP"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B159C15ADB2;
	Mon, 17 Jun 2024 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635160; cv=none; b=UzOHngPWQX0eWYWZByX3TBUzGfvlI+XWjP/l//HABNE1b/LKUUUQGCTwgKtJMmYPKL+KwboExaN3b8UsM//scTqkSihztQPkG+vZmqhWiHA94p5skRstq6IGt5vvobu7pT7EXq2ShDyDOZX4qyEX//PJ9gG531uc6zWs7j9XY7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635160; c=relaxed/simple;
	bh=LPG4MiMDAkQ0MMZeULt23aL6A8Mgcu+KD40iGiJT7kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VE3nW244hmbmwlQElCrIBUquIDYDnvCNxuncF20QO4S6v1tuC+3i/Zyi+fljQt7IvTVCa/QTm3gM7kkqmmBglVOU4EsIW9e4wz8oFfSL8VfHUm9L8uNrQgrlgbWjQpzIfwpigan8w8+aZbdARRR51oufcd0FyfVkthYN+VMw7yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b37tzJGP; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id AB23B1BF20F;
	Mon, 17 Jun 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718635157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gaG5bleDwToDs0cUeSJi4WXAYLyvsArl/AdUBHxQ+Pg=;
	b=b37tzJGPULA5jRCxKQfSlXRTXLeHZoShQGGhw/DgnsLtMKZqRBifR1lfxRS40zqjPrcTFJ
	YxxkLRg3zGL7muzXWnRc/nn/SpiPhcuAGEcXkxu04nOKOdzXBcQSlfiGjMeHP0aAPzOvGS
	6UvYLL1/z3BYGMDuEOubkyeNbWE9966lCt4UjUxbXJjA9EvShFtn7BiHZY2I1SJlKKOCx1
	SFUmP3X7ytgVL0OJbg5828yY8sucBb8D7MFQPK5PCWsWYiGV0kH3/e4GSNln71bh8XNtBd
	2Omz5XI6OvQP9pFdqEnQEUOoaMsoRVVGhZUlW40bKW06mqOXzHPenORmIsC/nQ==
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
Subject: [PATCH v2 4/4] leds: pca9532: Change default blinking frequency to 1Hz
Date: Mon, 17 Jun 2024 16:39:10 +0200
Message-ID: <20240617143910.154546-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
References: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Default blinking period is set to 2s. This is too long to be handled by
the hardware (maximum is 1.69s).

Set the default blinking period to 1s to match what is done in the
other LED drivers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c7a4f677ed4d..9f3fac66a11c 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -248,8 +248,8 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
-		*delay_on = 1000;
-		*delay_off = 1000;
+		*delay_on = 500;
+		*delay_off = 500;
 	}
 
 	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
-- 
2.45.0


