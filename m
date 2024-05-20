Return-Path: <linux-leds+bounces-1690-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8509A8C9AE8
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 12:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271101F21347
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 10:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1EF535D2;
	Mon, 20 May 2024 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oWp3MdS/"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90DB51C23;
	Mon, 20 May 2024 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716199280; cv=none; b=oTBunlo81fHNda1+PUql+HNZRwiVOWY/gfT+PKXBKwWkdUxDd1lHhMj77CBZPnY+fhXlwN8oXYZrMTzIhMUi6Xhnm+EvyytU2xwGF5v4c8t9Z//N9EiWgTg03aPzBuD2XAPIIYP8qi9/Kgx2Kai0202YKZl7xSthpGlKFvHSgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716199280; c=relaxed/simple;
	bh=jd8wTz6WYVqVeMAVX4s7b1YWkersuhJAO102QlOQKKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+JwnAeh2vMxdtue3JYLfP8OMW8LEAoDbWKsfbymwFnSNh94GE4TSflANky4R+57W67uNtvTrY9fZtaAdwr+WckznULCGFG7FBkftLCOKoBp1gY16XLC0jHsOGhmIsuJ4o7oJvzgpcoVEEbpJLESTm85cfK3TaQKwt7zcX0SqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=oWp3MdS/; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716199266;
	bh=jd8wTz6WYVqVeMAVX4s7b1YWkersuhJAO102QlOQKKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oWp3MdS/k7rIUXvvtZfLF2ynqzdxT6JSPr9znGuUdWuwxcCbe31+kB27sc838tEI8
	 iRwmjVk86hSPVN6edyhFK1IiL5ChjAX9b9LzST0DZzNCHz1ySFiBofSOrNyHtph6AA
	 5f3t6gN4TaK/NhEMwD4NzWr0H1pcDJNERZG9uLZY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 20 May 2024 12:00:33 +0200
Subject: [PATCH 5/5] mfd: cros_ec: Register LED subdevice
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240520-cros_ec-led-v1-5-4068fc5c051a@weissschuh.net>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
In-Reply-To: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716199265; l=1052;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jd8wTz6WYVqVeMAVX4s7b1YWkersuhJAO102QlOQKKE=;
 b=sSk5vFbiWCIsAMYqmI4K1JX8juFRw1qlEtHqUGfNVZYWD57IPFCEYQqO7SZb0AvW6dntOCtiZ
 eN5WvdSlLeJDJ+vdrL9uCIu92ioNXLEvMiNX+ed+e/0h+ClmDuHp091
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add ChromeOS EC-based LED control as EC subdevice.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a52d59cc2b1e..d8cf1c5ce5a1 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -99,6 +99,10 @@ static const struct mfd_cell cros_ec_wdt_cells[] = {
 	{ .name = "cros-ec-wdt", }
 };
 
+static const struct mfd_cell cros_ec_led_cells[] = {
+	{ .name = "cros-ec-led", }
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
2.45.1


