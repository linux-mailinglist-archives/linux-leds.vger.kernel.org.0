Return-Path: <linux-leds+bounces-1700-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD758CF559
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 20:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503421F211A5
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 18:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D30512BEB7;
	Sun, 26 May 2024 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KL1kKobG"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B6312BF20;
	Sun, 26 May 2024 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747515; cv=none; b=bgItauGA5m50jNTEDf94wHo4+G2OfxQZvvUXLtEJAJUlyOWc/hqDl8KpS3S8CnaID6RiJNzDcmntmR1D51JuT2+666e6/rmwXXNsUn1pTiChWRErHeU9MSiV54nnuDl6Lou3BDE8No2hnx4hidnQUfemWw7dE3PmrzJrKYbzliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747515; c=relaxed/simple;
	bh=5whg+Ib6ob2V3Udbi5NwANP2fRI1+wV3sVY7NRxurO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EHUZ/2yaV85cR3WJP/bqyTmKkRHrlW10sWrFI0AwyxMFbc0VGfRBPTg+rew53frBxv7Cw26jBRrujjvdnHXzcIx0UZ/ZAAvK4ocsM5zxl/bBI+7LRcMLsUcSYnbSqaUnYaf9s28ioLhePirs5aSEbXs4/T4RbD02uaylJatLXoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KL1kKobG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716747502;
	bh=5whg+Ib6ob2V3Udbi5NwANP2fRI1+wV3sVY7NRxurO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KL1kKobG/hIYRlUHO/aN9r5j6u5ar31U6e6NwIAWUTis6Mu23S2xAYV7d0FutK1Ap
	 wcWViMqCzNb6VITpUxLnQ7EkAN02woSxH5x0invTB9EPZ2FVscFInw+VUWXu+Hsp0z
	 5wITDrLolfQK3eXLS8+Bwv4mcHDqbYKW/E2wZk2c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 26 May 2024 20:17:18 +0200
Subject: [PATCH v3 4/4] mfd: cros_ec: Register keyboard backlight subdevice
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240526-cros_ec-kbd-led-framework-v3-4-ee577415a521@weissschuh.net>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
 Rajas Paranjpe <paranjperajas@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716747501; l=1230;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5whg+Ib6ob2V3Udbi5NwANP2fRI1+wV3sVY7NRxurO4=;
 b=GzSekRHu7tiKgLifZlJdqItMDKzgvxrVirOKDe4ub8Gvkg5zgOqeYeH6/rcwblmhcT0tnPzbI
 0k8y9tjv79JCca4RPruCGc6G/qbD+ycMqjJmERAxFeVKLLDbBdFtKZw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Load cros_kbd_led_backlight when the EC reports EC_FEATURE_PWM_KEYB.
This makes cros_kbd_led_backlight work on machines without specific
ACPI or OF support for the keyboard backlight.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a52d59cc2b1e..4444b361aeae 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -99,6 +99,10 @@ static const struct mfd_cell cros_ec_wdt_cells[] = {
 	{ .name = "cros-ec-wdt", }
 };
 
+static const struct mfd_cell cros_ec_keyboard_leds_cells[] = {
+	{ .name = "cros-keyboard-leds", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -125,6 +129,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_wdt_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
 	},
+	{
+		.id		= EC_FEATURE_PWM_KEYB,
+		.mfd_cells	= cros_ec_keyboard_leds_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_keyboard_leds_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {

-- 
2.45.1


