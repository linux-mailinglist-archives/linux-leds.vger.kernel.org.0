Return-Path: <linux-leds+bounces-1891-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D431A9065FC
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 09:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0BBE1C20B81
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140DE13CF84;
	Thu, 13 Jun 2024 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9vskcV0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1C13D285;
	Thu, 13 Jun 2024 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265442; cv=none; b=LtTT/9UvVYnG4nobAUxFUKZlJqZHY0Ti9Eoqw2DGsLNqlpc3ADAFOMsIoh2imvndNm8KG5Dh+4N+N7uxzvoUGXh+XNuVch5sK8oUgI5D+/1J/gVUqrUgiWJL851n14v8l1eAsqxWHILkkGSudCw9rad0TOAagP1S1ktdV7wYofY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265442; c=relaxed/simple;
	bh=OCtOhYu837Sd/8HvLhR6dWGgEllOhuY4C03+r2+NBgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLUm89tVXpOB5kpMmlDLSIST751zvBK+3dItNMSkIVFHGOVk+pkQtVOnK5F6MOqg/q/mxII/baobuvj3wgeWDpO8v9XXm1GIUdjBTQg1fLu/dmF3DfdUs9onQP4X1Kv/znKoUZhq37Oo3Gl5EUlnM8YTRS8oBY6/kVQDSNuPd5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9vskcV0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868EBC3277B;
	Thu, 13 Jun 2024 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718265441;
	bh=OCtOhYu837Sd/8HvLhR6dWGgEllOhuY4C03+r2+NBgA=;
	h=From:To:Cc:Subject:Date:From;
	b=p9vskcV0vyail7cHf+/fmUO0erG6vuNWyLfmjRjk4LM6OIoPAiynBFddj5BStR2xm
	 BdB6vizMAMHuus1sAZGaq0bb39PRkVdFTfkUZ5I6x2v5p6RbAjngD717JNNZRuof4n
	 Sh0I7qKvRM7onR1M6FUTMmqlbY76frVWWtPTIBZbSKrYo13wJ/WmjCphcJ5Qmeu0tC
	 Lfx4Tc90QDDnmqwfA5J29XUbQUX6mfeurq7jMFFiAHh0b/52jSelp75R3jkbhDAufi
	 5umZcQ/LhIKFvRsn34zphv6l4fkgIafiEbiAIrMiPol8giwCr0N/mE87wUjWihRpNl
	 uE2nv2myztqXA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/1] leds: core: Omit set_brightness error message for a LED supporting hw trigger only
Date: Thu, 13 Jun 2024 08:57:12 +0100
Message-ID: <20240613075712.2479669-1-lee@kernel.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If both set_brightness functions return -ENOTSUPP, then the LED doesn't
support setting a fixed brightness value, and the error message isn't
helpful. This can be the case e.g. for LEDs supporting a specific hw
trigger only.

Pinched the subject line and commit message from Heiner:
Link: https://lore.kernel.org/all/44177e37-9512-4044-8991-bb23b184bf37@gmail.com/

Reworked the function to provide Heiner's required semantics whilst
simultaneously increasing readability and flow.

Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-core.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ef7d1c6767ca..3b4db39f2326 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -123,15 +123,22 @@ static void led_timer_function(struct timer_list *t)
 static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
 						  unsigned int value)
 {
-	int ret = 0;
+	int ret;
 
 	ret = __led_set_brightness(led_cdev, value);
-	if (ret == -ENOTSUPP)
+	if (ret == -ENOTSUPP) {
 		ret = __led_set_brightness_blocking(led_cdev, value);
-	if (ret < 0 &&
-	    /* LED HW might have been unplugged, therefore don't warn */
-	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
-	    (led_cdev->flags & LED_HW_PLUGGABLE)))
+		if (ret == -ENOTSUPP)
+			/* No back-end support to set a fixed brightness value */
+			return;
+	}
+
+	/* LED HW might have been unplugged, therefore don't warn */
+	if (ret == -ENODEV && led_cdev->flags & LED_UNREGISTERING &&
+	    led_cdev->flags & LED_HW_PLUGGABLE)
+		return;
+
+	if (ret < 0)
 		dev_err(led_cdev->dev,
 			"Setting an LED's brightness failed (%d)\n", ret);
 }
-- 
2.45.2.505.gda0bf45e8d-goog


