Return-Path: <linux-leds+bounces-3380-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E669C3BA2
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0291F20F49
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB09175562;
	Mon, 11 Nov 2024 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2r6wF/R"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4579149C4D;
	Mon, 11 Nov 2024 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319472; cv=none; b=JicQQwDWa5ZzNBle4PoWGzpD6s17IvSpGfHXt0z9fKxB6BJsbdSNwI+aWaax2z6h2dZe7uAd8dcwzetpH3vTZBXXymfkR7F8KPjX6u0C+vVknZJFczLq+ytJhmToah9ChJy7RjBeoCbdY4pfYvAV4AZPi4YZpTqYlVLN7AlSe4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319472; c=relaxed/simple;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S88J/aDIjYzFJAaK/wTWUwx1f8uzkRVFfSe29oY3GLRY/duGCLsk+Q9S+QBWEDB7PPtUA0zxJJ5X72JF6SbtwN0Pa8ZymOQujZlHpsgL+wyhIXPZ9Vudw9G+vveeGRIJeyGAi7hq1jmpmoblmY/8p27V+dqYWEALNSDfoZSHJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2r6wF/R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5292EC4CED6;
	Mon, 11 Nov 2024 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319472;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2r6wF/RhlAH7GT2Q1vAfKTeze/jZmbUAbMN+mNSJyZ2LN6lnZo80JCnmhywsE8mr
	 zfFdfpTGyaH0DdvHQcUbpP2bMfr5cCvhOqOWIvZerFXgxn+G1tXAIeXQmaOX83gjkC
	 a7Q7+EEQQCLVoyDyXH77qsVREisU7ZieRZKtOTGDAE00Qkglaibt4ehojIaAN6kM7S
	 p2ttNUTPYSJnowZaqALBkKeP5x1/82XUNJ0idKCGbExQ1RP9OeM8Pv0Z8pddYKMj8B
	 eP3TvKUwcLMjBEtM9qVpELJiM2xHAZ3I9XAZ6wvghdNd3e2Mreo7CdMMr9oKz6TPXz
	 twPMYg571iAvw==
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
Subject: [PATCH leds v7 08/11] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Mon, 11 Nov 2024 11:03:52 +0100
Message-ID: <20241111100355.6978-9-kabel@kernel.org>
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

When reading MCU firmware features, check also for the LED panel
brightness change interrupt feature, and suggest upgrading the firmware
if it is missing.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index bb871226e357..3bb4a3cfdb29 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -258,6 +258,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(NEW_INT_API,		"new interrupt API"),
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
+		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.45.2


