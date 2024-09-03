Return-Path: <linux-leds+bounces-2581-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A8969A01
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2680DB221B3
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B001B9843;
	Tue,  3 Sep 2024 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9h5Mjvv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33821AD254
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358795; cv=none; b=B5fqCsXQgYkGFNiPUBSQb92QD5VaxTpu7TDTa9Thn5Osbkjodwb9GNN4fWQaUSvo6cV0ocnfThs/fWELahI6EBmLOaDvG/DkybxlJPnIUhkmKm3iOqHYhTztTh2LXbfzEI/tbwHP8GAvsA+PywBED/4iAWx80RnSOz7+FowiHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358795; c=relaxed/simple;
	bh=FxPKGWWRKbnhjKzH3b2LpLpPDFpRJp5XiJc4PKVXMLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpQv7KKZTVMaiSZ19zaFoo6oKVfhzLVeegK8+yB9E2T9YfwSJs8cKkwMQJRAVt7zTTV3lKKPa0xJrsXn9WaBlfhJyT85cbYI1J8092Wgir2QqJwQbwxfHobQr6AiaHBv0yNPIw1RDITbIKaGayVKEsrQlegxv985acJd3PY7toU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9h5Mjvv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896D6C4CEC5;
	Tue,  3 Sep 2024 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358795;
	bh=FxPKGWWRKbnhjKzH3b2LpLpPDFpRJp5XiJc4PKVXMLI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9h5MjvvKcR3OiV9LIUg/LrLhC1Efo24XO3rdporcUB5IrYdi2n+6JsFPYaWEt1C4
	 JET0MmjoPSosm6n+fvYZJhlerTTwN/tekJXjkKuq1qUNBmmPVGBfo2U8Qfp94Db7iJ
	 lg7ur4DqNF2HIqLlvSup66gd91tL6FPZyhIv0Xag0fd55u0gOqGtzylI9gODHw8t7K
	 WBBDWORUnzZJdHHciKIyEou4eJSvOOEhxhUjlm8Es5q1spQ8l9PkZ5osM7BFNJTWkD
	 mEYqXDhBZrqRpanyVca6fhtQhCBD82lY+2ZBjBW+GQAFvF8eOO/G6PLa1ZzBuR75Gp
	 sD5SQBh8Iz6JA==
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
Subject: [PATCH leds v2 06/11] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Tue,  3 Sep 2024 12:19:25 +0200
Message-ID: <20240903101930.16251-7-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
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


