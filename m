Return-Path: <linux-leds+bounces-1906-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D79075AA
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EDD028581E
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2DB148300;
	Thu, 13 Jun 2024 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pLd4/VbA"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB51474A0;
	Thu, 13 Jun 2024 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290135; cv=none; b=OJ36w8o7YtsQwNmPh9BYXcWvbDg+Yk5wZ6EqoCClaZ6optdm74IAD2QDtrVgcQe0ucbaGw9hvzbCIuNv1bnFg+IDW2sk0ZDvifdQhyMovqLJ3MUD7QVt97u5eNveDIa74yvtGuqNjsRPC1VIHEy0AzzrKhWlV04mKCAOKQ66hfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290135; c=relaxed/simple;
	bh=yVxyVIwMRddgUEXhVZPY0twYDEXyBd/qRw3RPwi32Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtB1knGqXC2ZE7qWtoV92oin9S6NAYfyhpY2rK9w2rlhaV9xHA02FQUDvEinHEdF+fOlGsPwjUz+UCvwGu2r1xEwQAdkWupDHE3LAmJB4zGX+udHULG+vvlcCTXY9zJibirVRKN75CpSmMFTZc2NgEkecLT3/Dv3I/Ea4BFwJWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pLd4/VbA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290120;
	bh=yVxyVIwMRddgUEXhVZPY0twYDEXyBd/qRw3RPwi32Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pLd4/VbAsVstarpEzFdot13IT4mpN+rMLEk92Hldp/KOBHZrEUNlt7h3LVQZDwrDf
	 STz3oQldRrJGpAL8HXEcJZGklrh3uTqfM1j2QC+f79i1fLLRMoX342pG1Jarg/pcOP
	 UV4n+hl0mWNy5HTJ59M2qCBDqTG3ipn8Tgh13JeI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jun 2024 16:48:40 +0200
Subject: [PATCH v3 5/5] mfd: cros_ec: Register LED subdevice
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240613-cros_ec-led-v3-5-500b50f41e0f@weissschuh.net>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718290119; l=1053;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yVxyVIwMRddgUEXhVZPY0twYDEXyBd/qRw3RPwi32Eg=;
 b=N/ZDeeBVukUv4uGrxzH8013chzUsFpC2ISJK3xoUpLuH+svvdsuJuaVl8u+lAI3vDRmc+p8As
 a/mu6Gz3/4UB/mDhRXTvpg8sW1RvC7GWucN3XzW/7ltiWxe4AGV47YC
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add ChromeOS EC-based LED control as EC subdevice.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a52d59cc2b1e..d8408054ba15 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -99,6 +99,10 @@ static const struct mfd_cell cros_ec_wdt_cells[] = {
 	{ .name = "cros-ec-wdt", }
 };
 
+static const struct mfd_cell cros_ec_led_cells[] = {
+	{ .name = "cros-ec-led", },
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
+		.id		= EC_FEATURE_LED,
+		.mfd_cells	= cros_ec_led_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_led_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {

-- 
2.45.2


