Return-Path: <linux-leds+bounces-1780-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5A8D66F7
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 18:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4FA28DC7D
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F7217CA1D;
	Fri, 31 May 2024 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="peunh7G5"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AF017D89E;
	Fri, 31 May 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173224; cv=none; b=pbzDhjzYLs73M9pDd1j+OAAINlc56wMPyendpSBK/oQz9i9xlSUo8H45ZWV892RBVzZmOT1bd/lk5JRMKVggR7oOqGvSOPDMTDvbSCoOJooTlAYCbwhBGJHf4YsU9Gij7z4n3kXc21gkI8tkwx3tCahRLtbBpLkPEAYVNIuZDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173224; c=relaxed/simple;
	bh=jaXh6FVnKJ8THkebhacKfDXHombFjeJ5bXLceH94XZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4dzp6E3P/4sxqbv7h1DJkveUagchSzfqoRAabaZO9psaoZlSXaPrvpy0eNyZyPskbzrclGPw5ClZPGcWu6U2TggjCcKvNaqL5JpmP3/rImNHm3U6aNupDXfU1asCI2BYUtBVxfvUZcqWuqshoNPngAbIO6qVVUIbzRFh/Lu+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=peunh7G5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717173219;
	bh=jaXh6FVnKJ8THkebhacKfDXHombFjeJ5bXLceH94XZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=peunh7G5Uyw+cvUOZ13e6S8vfU7F4Ual54QHxsVlLSNMj4cm8FLckCyGVX2zbft4c
	 D2vSsfEV789RYCVT1IIcPMBPM5ghDsBpvMeqexjMKz1u69ZLWL2o1V47dLnCr08X++
	 ffVbr12EV4EnsnXyBFGqnFhr/QRghVPzSsRCmxfE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 31 May 2024 18:33:31 +0200
Subject: [PATCH v2 1/5] leds: core: Introduce led_get_color_name() function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240531-cros_ec-led-v2-1-6cc34408b40d@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717173219; l=1805;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jaXh6FVnKJ8THkebhacKfDXHombFjeJ5bXLceH94XZ8=;
 b=sw6asO9DbB2NI/kSNYDhSG6SZ2ydPJIKgcDPNFgUM+Enzsq4KXtYtgzA8WNQ+Gyd2y64YfJcD
 0Gh5LNwCTwDAUvSFtXBelRktdOkWqvVcUUkMyoM5rlCtTJHv0dgiCV2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This is similar to the existing led_colors[] array but is safer to use and
usable by everyone.

Getting string representations of color ids is useful for drivers
which are handling color IDs anyways, for example for the multicolor API.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-core.c |  9 +++++++++
 include/linux/leds.h    | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 89c9806cc97f..e0dd2284e84a 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -534,6 +534,15 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 }
 EXPORT_SYMBOL_GPL(led_compose_name);
 
+const char *led_get_color_name(u8 color_id)
+{
+	if (color_id >= ARRAY_SIZE(led_colors))
+		return NULL;
+
+	return led_colors[color_id];
+}
+EXPORT_SYMBOL_GPL(led_get_color_name);
+
 enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)
 {
 	const char *state = NULL;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6300313c46b7..dedea965afbf 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -427,6 +427,16 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
 int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		     char *led_classdev_name);
 
+/**
+ * led_get_color_name - get string representation of color ID
+ * @color_id: The LED_COLOR_ID_* constant
+ *
+ * Get the string name of a LED_COLOR_ID_* constant.
+ *
+ * Returns: A string constant or NULL on an invalid ID.
+ */
+const char *led_get_color_name(u8 color_id);
+
 /**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
  * @led_cdev: the LED to query

-- 
2.45.1


