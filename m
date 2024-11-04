Return-Path: <linux-leds+bounces-3264-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D64439BB782
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82D111F23277
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 14:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3107413C9DE;
	Mon,  4 Nov 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WInPpBmD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806F7083E;
	Mon,  4 Nov 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730005; cv=none; b=GY8Y33KJOPs5rtuMWtp6o979oGta1wbrHo4vvwnv1rRpjmYVHCbiBCMS94EtubJzpg7NL665nK9HEN7EcC9Z4kPuMTWaGz1XYFpwbca4Pu71D2eukR/staqVrgOBObSHXDqLnW8kLv2snx/47Ltc3e+AiSDxklj3Sj8wUzLK4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730005; c=relaxed/simple;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwleba7VRIfbO5IYxB9BQsr4s0Sc/JePI4C3ySX5cghxYdzqucwlIqUeil492GvI74YR5NTCNZCJ/90rtV+tkScQt9fUDiyCBU2yhVsPoEngJn8RzClqfB8/RB1kMxGuqL0qh4uLYIPkoUizqVNiBIW44WKgyz6hdKpJD1x62jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WInPpBmD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4502FC4CEDD;
	Mon,  4 Nov 2024 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730730004;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WInPpBmD6JDX1KIblM+gi9jXX6DShPYToEZYpuJRQOFLNXlVlbwZMOb8izWA2pbYt
	 0OEfZet6Wr9pZ2XSE9tesJzDX6qjE/ApM1h7F/N7mlLEPXDfFQso0/qmHj6B0KuvWt
	 LlneDCgdzrJNRiQaHw+BTYVsW5O3zYP+CJKNWSPLcbU6JULSZArzgJQ2i2SnxPbTCt
	 zflnHbgbSPNOFn6a4k60eMKHSsRVOd1QD1sXwnlMzZHVkuEHPcpBWXt9yv9byDtcXp
	 F4gb3hgvsuklweXEqWPmRe25l47DAxQ8nmuFuEXtmBtI6CyYeEHkF/n+VSx4Oanf5S
	 S+8zqhg8EagNA==
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
Subject: [PATCH leds v5 08/12] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Mon,  4 Nov 2024 15:19:20 +0100
Message-ID: <20241104141924.18816-9-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
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


