Return-Path: <linux-leds+bounces-3356-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CB9C1E0B
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B758B1C20FDC
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6A01EF082;
	Fri,  8 Nov 2024 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXUieb0P"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A21EBFEB;
	Fri,  8 Nov 2024 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072570; cv=none; b=luc/SSFuzfOxGE6nWPiuqEpCtIqd93y1qcF5anZi6xojKB8NyGgDWNwUSMI1jO1rqPsQrIUhKVyRPov10TWtW0G2RcC2+hhi1vISeijVq6PX1moafl43NPN9FGMVHNTcT4m1I9bDuCKhkh8KKlVXTr0E3wjrEioS7btYxKgXuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072570; c=relaxed/simple;
	bh=XMihtXGh+r/Y6SPiDk/zLGKcvwWE2VoZ+TFI2wM1zmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhFVzU6KAQzs56STXNd0j9eRSZmqaq9VMRhiRxxnkB4PUKSkM/+9L6AU/C+vlI7YhG/g0Q2uDPuDT1uKJbIMdRVvEvp+lEktDlgAOn8ipajn83z2hyfTOYkceZt1VHFCWjNONBv8APsestSdcFiQvGz7gtwQ5Yb0FL3Q3hnfGyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXUieb0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86776C4CED8;
	Fri,  8 Nov 2024 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072569;
	bh=XMihtXGh+r/Y6SPiDk/zLGKcvwWE2VoZ+TFI2wM1zmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CXUieb0P8ovRukBpbXanwz4yPHz0zGaPaEnksPKeqPsIjvWOUNBuKlYtbj3HhltHR
	 sP2Mx+w+go9G18FC8GGXSOizsYbnAFPnSdkzxCqF1nL5ADc0692triNGEwcQLef9tV
	 uOde30+t/IsIcqHMmMMf0jJ9sAXcDAtS3LY+Snj+AYmIKU4/K4mUvTJ/09w9HQvOph
	 olPlpMAuVmTXFxp1Q5N7DrjNZFQpaAtCqW7mwRMRkZzsDRZ1QihIezI4DS76ugNDwS
	 0bXlca8Y8t/g5lfGg8vNknh4USg5pA/2kcpeLtTnvB7uYeDavMBAxC0dz9VJwSL9mC
	 MqIk7VhVV/wNg==
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
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v6 09/12] leds: turris-omnia: Inform about missing LED gamma correction feature in the MCU driver
Date: Fri,  8 Nov 2024 14:28:42 +0100
Message-ID: <20241108132845.31005-10-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
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
 drivers/leds/leds-turris-omnia.c               | 6 ------
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index b2c37dd2e1cc..503e6e476c45 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -508,12 +508,6 @@ static int omnia_leds_probe(struct i2c_client *client)
 	}
 
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
-	if (!leds->has_gamma_correction) {
-		dev_info(dev,
-			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
-		dev_info(dev,
-			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
-	}
 
 	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
 		ret = omnia_request_brightness_irq(leds);
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
2.45.2


