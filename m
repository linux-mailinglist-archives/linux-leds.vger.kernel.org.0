Return-Path: <linux-leds+bounces-1783-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41628D66FD
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 18:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10CF21C22704
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0173C17F515;
	Fri, 31 May 2024 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="edq95LqL"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEEF16FF26;
	Fri, 31 May 2024 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173226; cv=none; b=FdnKwI5aAjkKZVPc7y3wUmNY3dgxT+N6MatVmSPE9O0tSTXsbkdYlhGkI8KAmB13OVOIuvqJX0YDxIsnTi8iFgbdOKBp8n4aDUa8EZ2gQ2M+T18ngm0QiDnViYnxNomjil2b9RWxJWPE3kJz+mNi+U4XZVy5lz0gEeTZR0pqaQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173226; c=relaxed/simple;
	bh=n2u4OD+7kEm8RZjvbkONoagB9zqSR2+KV+RE7i+Xr9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+N27n3p42w1GmptDxLlplTZlOt4gGJGy84d8enKyYBKlQhwTX1CPuvgHWcotgYd6QJxedqc9cWTvyRzXvAiWQsmoiZQdQSVmRqsEkBjpHbScJpZzp6qiAjwvnhsy/Yf8mkyRVHr43aj5bmuEb0DcXcGiGX1OY9OFNGOw5mpPQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=edq95LqL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717173220;
	bh=n2u4OD+7kEm8RZjvbkONoagB9zqSR2+KV+RE7i+Xr9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=edq95LqLrPPm2YXFqMAs0HpHQgNVFSonfwL9wXPPbVQ074XCiuGUa0NiSDDslO0GH
	 0rCyOsnLt8samykQCfP7MgQBRzcZWl9vnZ621bZuH6H5g/cPQlEztRf5KXQGQoFFnk
	 yQIiuLP8B3pi2UK/Saojsmp9/j3ZBy0fvqT+jFJo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 31 May 2024 18:33:35 +0200
Subject: [PATCH v2 5/5] mfd: cros_ec: Register LED subdevice
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240531-cros_ec-led-v2-5-6cc34408b40d@weissschuh.net>
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
In-Reply-To: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717173219; l=1053;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=n2u4OD+7kEm8RZjvbkONoagB9zqSR2+KV+RE7i+Xr9s=;
 b=aJcIWhKSLFoYPkxa+/8iXSsj6IdWqycbussAt1FOAY7KA6y7tuFQkETdYl+xMXuWXzskLpUpb
 EEcOxT3ntu2AbSQOerKUA83fH4xvFy0BiwwrZ7wPR67AmumBGeRoKyd
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
2.45.1


