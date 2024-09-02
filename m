Return-Path: <linux-leds+bounces-2568-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF49687B4
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C8D31C21883
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374D3181B80;
	Mon,  2 Sep 2024 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0GzgIRB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328213DDB9
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280893; cv=none; b=DP3QLPuXQc4LSFdm06luttHLYTDzoNUmU5Iu82YSLq9eYvV+7hdX5mpbXLID8WRmqvgcgWHijJLON0OQ3eagn1oWkvCs+sS1pFO4C6mVie1HJviIAxhgQafaAGQ4MeEesNy4gagZofsHFjbYfWNao7hHrMTZLLa1R5W/H9cNDZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280893; c=relaxed/simple;
	bh=uTYJGwS6gkq0hTSsIoEjD5EwGJH188e8KYtruqHsaHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpGaICwRmWiO0Gl1taaOKExhs4fJbQvooD5TM2XXlnAYaxAc9vAgqvEuypWPEp5i8sxLoBzNZaRwsUwzSHan1yr+79al5zbA9tiowZheBKBSA2mrdFu0ftWSr8YIR1WWOR3W5vHF0WDeKLWctJVJbYWzwQNvRfHnYeEGT486K1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0GzgIRB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C584C4CEC7;
	Mon,  2 Sep 2024 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280892;
	bh=uTYJGwS6gkq0hTSsIoEjD5EwGJH188e8KYtruqHsaHM=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0GzgIRB6w2CvYOraSJszSpQ8kE+I6hMtw30JwD2PvUJ36wED0G34QwhOCGd0dNgV
	 yrHm4y0aL1EZmp6uV3uqWa9h3OwbIlqHQSrNr6ZL6EbFruSTqQ/M94zQnSWoy+3Tx0
	 uqI4quEGzSgJ8/WkBz3K0O/CxeWtadtu1dYfTP5uU2WfyP3Fm0pBq2dvkxa66Jk9Dc
	 EELxhR7CF6swkftC25TybMBlDyhNAfnuZ7ppmI1Q6BuF3o+rvFzZV1DnjbsZR75syE
	 9u7HrDMeLaxXq/ZJHg4BdE4/mzTjbWIx3BrHiRS1wYV4iQGbQYrmZhONWQOR2T4c6M
	 6EF4GfF0L16Pw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 7/8] leds: turris-omnia: Inform about missing LED gamma correction feature in the MCU driver
Date: Mon,  2 Sep 2024 14:41:03 +0200
Message-ID: <20240902124104.14297-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902124104.14297-1-kabel@kernel.org>
References: <20240902124104.14297-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the LED gamma correction feature is missing in the MCU firmware,
inform about this in the MCU firmware probe function instead of LED
driver probe function, so that all the feature checks are in one place.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c               | 9 +--------
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bf8635cec72e..7b5c1484924e 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -465,15 +465,8 @@ static int omnia_leds_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	has_brightness_interrupt = ret & OMNIA_FEAT_BRIGHTNESS_INT;
-
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
-	if (!leds->has_gamma_correction) {
-		dev_info(dev,
-			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
-		dev_info(dev,
-			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
-	}
+	has_brightness_interrupt = ret & OMNIA_FEAT_BRIGHTNESS_INT;
 
 	mutex_init(&leds->lock);
 
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 3bb4a3cfdb29..770e680b96f9 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -259,6 +259,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
 		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
+		_DEF_FEAT(LED_GAMMA_CORRECTION,	"LED gamma correction"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.44.2


