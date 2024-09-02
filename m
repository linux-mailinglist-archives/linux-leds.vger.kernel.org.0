Return-Path: <linux-leds+bounces-2567-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4539687B3
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCFC71C20805
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5314119E99E;
	Mon,  2 Sep 2024 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMYd37xb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48219E991
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280890; cv=none; b=csao5wqy0xcAFrwX3h6fsyzIiEIZajCp+FsMOtmgi4Ug5X+SFPiGfT8h21NLroQDh16BQeBmaSQwBwlIj16yKv08UWL8BfZ7HyUAXvKoYtxdovctQilSnNrnqwoh52R0Ot/NO9mTyQzAhJCMZQMcCUt/TJsYQzE68ZsqmfR+HwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280890; c=relaxed/simple;
	bh=FxPKGWWRKbnhjKzH3b2LpLpPDFpRJp5XiJc4PKVXMLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhSqRY/pbkp7xzITZnpg+uIktN8ub1dRVX0IFPfK8Yj/BMee9WhKHlcOb5t2tdJTHEZ67H6FnHxU5bX1goPrC/Q+Tbsy4zb8vruC2qGi9BzePdttx4Nm4E6ZwOQ7KmWqAR7hajhlpTS+kgmUXe8lJzQ8g+7p9i8THFbWJAp8GYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMYd37xb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A1CC4CECB;
	Mon,  2 Sep 2024 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280889;
	bh=FxPKGWWRKbnhjKzH3b2LpLpPDFpRJp5XiJc4PKVXMLI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMYd37xbwdXjQmo5aXiTwUllE1/0slL2Q3a/d13ZYiGqG7ZwwUjOHZFnuPkFvepmK
	 vYABZAGxVUcZzxqIvPd155wNqxvXj2dog/Kjzy2MwOsJtrvZYma+MxKkS5Si/KWedt
	 97vhc0IHo7CfKw6WFEQe1d8OX62yq+L1wk2vhNMjd3Ep7Hll4YMUmb01q0HbcG5vls
	 iAftGjuwrYEzkMVgfZxtR0k2LQzQ+cTel4mOOxQidGRSb+D7RA83v3G9NrmGu+gAf/
	 Ht3qQcMRthwzYU7f1/5GXXbfY9KKDZJnrB4lxb5yXT6GKvtwPCnwDKfnVFC1hmF6Nr
	 B+avQQnT8eR7Q==
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
Subject: [PATCH leds 6/8] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Mon,  2 Sep 2024 14:41:02 +0200
Message-ID: <20240902124104.14297-7-kabel@kernel.org>
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
2.44.2


