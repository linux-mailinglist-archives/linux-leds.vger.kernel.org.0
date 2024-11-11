Return-Path: <linux-leds+bounces-3381-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAB9C3BA5
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15AD61F20CEF
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2DA175D34;
	Mon, 11 Nov 2024 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cv4AfH4Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C4149C4D;
	Mon, 11 Nov 2024 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319476; cv=none; b=CLjeWADcqm8D+XgGAGWXDMr28m39OZuRKGF0BRHfKHpdPGod3gsumrJLj3J7nPw3Ktir3OvkqM+XDshR2QwrMKWa2HyNJSJM3eu0cWirEGhWu7wrCMdvQ13gmzi5WI3AFhY7OfxTA7PrgDAliOnRBXPeK5mlWo/uoZa1liUVTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319476; c=relaxed/simple;
	bh=D9VtqYE/cACS2Sn5whXPGMF4jXGgBU1iSggl7IiHGqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tb1L+YjUpHtH7zFpcxjzICRuVadeLnE7dRdhptf0o5oanIyPu/mjmMvjEsrAzOPuqU5leSH6Kmq/nbpmTVAM8OzqRvYiMzm9dVBAddqzvIi99Qy7DSv8dHjvZRSWBl1MVwYomce7e6xBXLAyXuaPxBzAoTU5uPpiXb/dnIe9igM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cv4AfH4Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213EBC4CEDA;
	Mon, 11 Nov 2024 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319476;
	bh=D9VtqYE/cACS2Sn5whXPGMF4jXGgBU1iSggl7IiHGqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cv4AfH4QQGLcttY5znG1LRJEELZ74PkQIIwx8LqLzN/8gHPdJ6xCZrrSVlPNX6EFw
	 P+9XpZYgUU8XXfGFWDXQTA8DVevFOYWJudbUybBzObSBqB+XPjIWRSTXhF5hfPaufo
	 gBv0ZQ7Jo5zPCP3rstAISS1PdZAJEwA4EM/9bvKfVLzQJjycpuowGBtTC4aqxnJNrm
	 EBrHtY6+W0XL8I5SqDGXA3dtqe7VL1AFj2HwY/cZfBUHjxUpCSq9uipxaP1h5eBp6p
	 KblPwKpOmiPE0YzFSYtPX3NHlH7ft6xcgXZHLP1RH3aqMVpPJQdGNuqoCiDdrPraqE
	 u58DViem7eOfw==
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
Subject: [PATCH leds v7 09/11] leds: turris-omnia: Inform about missing LED gamma correction feature in the MCU driver
Date: Mon, 11 Nov 2024 11:03:53 +0100
Message-ID: <20241111100355.6978-10-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>
References: <20241111100355.6978-1-kabel@kernel.org>
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
index 61186c3a6c2f..dc6e076addf0 100644
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


