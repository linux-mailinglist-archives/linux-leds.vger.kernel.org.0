Return-Path: <linux-leds+bounces-2414-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16F94A218
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 09:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6992128564B
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 07:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D1B1C57A0;
	Wed,  7 Aug 2024 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k578+Oym"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06231C4610;
	Wed,  7 Aug 2024 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723017381; cv=none; b=p2sy+IAFOKCa6nm/4jZFjUX2pydjwFVxyrtXtuCscu4fNCBC/ofO1b+IZm+pJq/ucWPbv8mkRzjYo7HiKLp0pVsighHuMU0Pl4QBSRDCuSAjpYG2IAvgivHUl2kyhs5utSU6QbExYfjvr6x/3eGg4wOKw8okB6g8QHi6zlGPs8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723017381; c=relaxed/simple;
	bh=t67hliGQP8YAGf3VszVUccQsTNazIlhHFsegoG+PvPU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TNMYvKWCUXalD7al7L0IA9jYHctuSi3/D0+WEg7HBNsOD4yV5L02caKtPw7tIWIimRVdKJThpknfc4MdcgNLOPXhUsDXfByKM++OrP9orlOv8iF3id8mgI+jM6XtE3zKBaloZx/SxKyB6nI/L2MFo3pKAPOW8NijMbsIo9FVJ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k578+Oym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE873C32782;
	Wed,  7 Aug 2024 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723017381;
	bh=t67hliGQP8YAGf3VszVUccQsTNazIlhHFsegoG+PvPU=;
	h=From:To:Cc:Subject:Date:From;
	b=k578+OymDpoN0mQBKCfaQNfXSVOfZzdtDUvjen4aVh0khf2qy7AS+H3clcECSNryR
	 JEcNzYFG054x95pRk4a5T+AFkLRWmojS89ua/TOsP7cPyWvTqNBe/pJNgfsKKokh2r
	 F2OlmsR3HHBUi2BgdzRDmPIYpm7+/dTv8HrJHVNKx1lOiAiLK3rtSZtnp5tRDlLW5d
	 CxBELmLpT+140QsPxiNslW0PMkdAMQeeJiih3ThfErDfoKvGEQVhORKzum8PC7DSTN
	 6643SOUlan7xY4vEiBEjQCiNXJEdEyZqu6RxNh9uZpqWrKaDdqC4iSYgjsweo6VcFg
	 vCA9FKK0kQSeQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Joseph Strauss <jstrauss@mailbox.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	George Stark <gnstark@salutedevices.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: blinkm: fix CONFIG_LEDS_CLASS_MULTICOLOR dependency
Date: Wed,  7 Aug 2024 09:55:53 +0200
Message-Id: <20240807075614.2118068-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

With CONFIG_LEDS_CLASS_MULTICOLOR=m, a builtin leds-blinkm driver causes
a link failure:

arm-linux-gnueabi-ld: drivers/leds/leds-blinkm.o: in function `blinkm_set_mc_brightness':
leds-blinkm.c:(.text.blinkm_set_mc_brightness+0xc): undefined reference to `led_mc_calc_color_components'

Add a more specific dependency that only allows multicoler mode to
be enabled for blinkm if it can build and link.

Fixes: 56e8c56c9af0 ("leds: Add multicolor support to BlinkM LED driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 41214c9b93ba..818c8bdd047e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -838,7 +838,7 @@ config LEDS_BLINKM
 config LEDS_BLINKM_MULTICOLOR
 	bool "Enable multicolor support for BlinkM I2C RGB LED"
 	depends on LEDS_BLINKM
-	depends on LEDS_CLASS_MULTICOLOR
+	depends on LEDS_CLASS_MULTICOLOR=y || LEDS_CLASS_MULTICOLOR=LEDS_BLINKM
 	help
 	  This option enables multicolor sysfs class support for BlinkM LED and
 	  disables the older, separated sysfs interface
-- 
2.39.2


