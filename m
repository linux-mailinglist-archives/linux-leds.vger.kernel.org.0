Return-Path: <linux-leds+bounces-7655-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDKyFkv71Wn4/gcAu9opvQ
	(envelope-from <linux-leds+bounces-7655-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Apr 2026 08:52:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F067E3B7C1F
	for <lists+linux-leds@lfdr.de>; Wed, 08 Apr 2026 08:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C986301062D
	for <lists+linux-leds@lfdr.de>; Wed,  8 Apr 2026 06:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA6534DB6C;
	Wed,  8 Apr 2026 06:52:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E236215A
	for <linux-leds@vger.kernel.org>; Wed,  8 Apr 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631176; cv=none; b=ig5e9icaTpDkvuvqhPTLSrYz5UOPs/225L7vl4dMbe4Ybx1gFrFh0hs4JJeBFcMxDxi1BQq/cT99ir0vo5HTcZ92d2cwM0C41gDs5MumoquGm++Jh3duTxRs28Pt24mdm02GnK6phS/FIqt68GKN3z+ilt2GyPiRSNX7gVNxMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631176; c=relaxed/simple;
	bh=HeuEeKb5UwovZWdE55gQ2L8XYl59tVQHoJ0inZe0Jn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VGbKe05wrznHqcS7nbbPxCzYPkcxLPzDeHWcvcuRV5BM6MCYQc0Nh6CAZAgZaYNWnl3JCHm9jSAEHO4x4ouiNaHzUN2lsyUOS7PxKd7qroTpXmUlW1VBPAdZevCyVefczOwg//y+MKP7sy5StstGw3sBXz3zoDuCNqVFKk+nnU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wAMmR-0005la-9Q; Wed, 08 Apr 2026 08:52:51 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 08 Apr 2026 08:51:10 +0200
Subject: [PATCH v3] leds: rgb: lp5860: add enable-gpio
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-v6-19-topic-ti-lp5860-enable-gpio-v3-1-da59a9005386@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAN761WkC/5XPTW7DIBCG4atYrDsRP7ahVlX1HlUXGMYOUgwuE
 JQq8t3rkEWlZtMuv1m8j+ZKEkaHiQzNlUQsLrng9yGeGmKO2s8Izu6bcMp7ypmE0gN7hhxWZyA
 7OK2d6img1+MJYV5dACUM7TtuRast2TtrxMldqvH+cd8RP887le9HsmBKulJD81KllooqtQ9SU
 cAAGZeoKCrZ6bcV/XzOMXh3OVh8vZGjTggmLIvLQ1PkgUI0jNzwo0s5xK/6b2FV/8drhQGFqUO
 FFsfOyvYXXonCf7KC0b9k+Z4VkzE9kxNSoR+y27Z9A/6ukayrAQAA
X-Change-ID: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.1
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.974];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7655-lists,linux-leds=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F067E3B7C1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VIO_EN pin can either be connected with VIO power supply or GPIO.
Get the GPIO from DT if provided and set it on chip enable and disable.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v3:
- remove unnecessary validation checks
- update dep to newer lp5860 series
- Link to v2: https://lore.kernel.org/r/20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-0-3fcc617fe03a@pengutronix.de

Changes in v2:
- add acked-by
- updated deps to newer lp5860 series
- rebased to v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de
---
 drivers/leds/rgb/leds-lp5860-core.c | 9 +++++++++
 drivers/leds/rgb/leds-lp5860.h      | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index 31eebaf0269ab..5bccca47b20a1 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -5,6 +5,7 @@
  * Author: Steffen Trumtrar <kernel@pengutronix.de>
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -59,6 +60,8 @@ static int lp5860_set_mc_brightness(struct led_classdev *cdev,
 
 static int lp5860_chip_enable(struct lp5860 *lp, bool enable)
 {
+	gpiod_direction_output(lp->enable_gpiod, enable);
+
 	return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);
 }
 
@@ -189,6 +192,12 @@ int lp5860_device_init(struct device *dev)
 	struct lp5860 *lp = dev_get_drvdata(dev);
 	int ret;
 
+	lp->enable_gpiod = devm_gpiod_get_optional(lp->dev, "enable", GPIOD_ASIS);
+	if (IS_ERR(lp->enable_gpiod))
+		return PTR_ERR(lp->enable_gpiod);
+
+	gpiod_set_consumer_name(lp->enable_gpiod, "LP5860 VIO enable");
+
 	ret = lp5860_chip_enable(lp, LP5860_CHIP_ENABLE);
 	if (ret)
 		return ret;
diff --git a/drivers/leds/rgb/leds-lp5860.h b/drivers/leds/rgb/leds-lp5860.h
index b3ad8c46720cd..48a6afc4227d6 100644
--- a/drivers/leds/rgb/leds-lp5860.h
+++ b/drivers/leds/rgb/leds-lp5860.h
@@ -257,6 +257,7 @@ struct lp5860_led {
 struct lp5860 {
 	struct device *dev;
 	struct regmap *regmap;
+	struct gpio_desc *enable_gpiod;
 	unsigned int leds_count;
 
 	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);

---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
prerequisite-message-id: <20260403-v6-14-topic-ti-lp5860-v8-1-e127e80e875a@pengutronix.de>
prerequisite-patch-id: 2fc7123c98bf6c53d946af75269ecb1a7b421f14

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


