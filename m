Return-Path: <linux-leds+bounces-2168-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1791B754
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jun 2024 08:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425E91C22A4A
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jun 2024 06:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FD213A89A;
	Fri, 28 Jun 2024 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="OEX5NlER"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A513A25F;
	Fri, 28 Jun 2024 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719557475; cv=none; b=Z/xMEZ3rnAOfWc+ICot32ukGngI5sO/cay7lH5FD+25sLDa66QJTy3JBOictTFVwywMImZrL+In+gceGtM6rIDqdyJcL7kI4Rp9fpES6xc1hLyuWx/W+OkGAs4Y+ItAu+NFh57aMBBikCUcPmBRTrcroAMrCYXuAtqJYn7BsVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719557475; c=relaxed/simple;
	bh=u414rfeE3/PGEAbO8mrduL6b05JdCIfBfS0EOPuhan8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SmYIU+CRPyqnYEon47Ejxs5jg0U13K4Qhj7ISrAFiHIQ1yKXttIYNJS52rtV/xB/B6Q3aZW4Zg9xO0MmML/z1892gR0z//4YenPKJcpfEwO3dIopmrZRfKzlbmK/jCTAUXqTXRSzAbXfe5esujmDRE5ZCKexw8Ik9SXw3lx5DWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=OEX5NlER; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1719557137;
	bh=q7o52HcaL89kemR/r0QVrL2VxpnFBrZ85Vrac4b+Eus=;
	h=From:To:Cc:Subject:Date:From;
	b=OEX5NlER23vpvmuJDwIBUNbDqLlyEUfeNrqOJfUK6s7LHGZNz7yqeZN1M+4skL/OP
	 xv6HidXA0j+Zu55jDMjpdw/eLfflqqod2PNCShbBPnwmZx6HQRK0WC416knhNsOX88
	 fRcmSk9EGJcv8EcIP4b+pCmUz8lWOCw4d/k+Q0Gk=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 3C533A0522;
	Fri, 28 Jun 2024 08:45:37 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH] leds: lp5562: Add multicolor brightness control
Date: Fri, 28 Jun 2024 08:45:15 +0200
Message-ID: <20240628064515.3765371-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The framework for multicolor brightness control is already in place
in the lp55xx-common code but the function to control the multicolor
brightness for this particular chip is still missing.

Implement the multicolor_brightness_fn function to allow multicolor
brightness control of LEDs connected to the LP5562 LED driver.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
This was tested on the imx6dl-yapp43-pegasus board (in tree) that uses
this LED driver. There is only an RGB LED on the board so I could not
test the white channel.

 drivers/leds/leds-lp5562.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 39db9aeb67c5..903b3f749fbe 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -312,6 +312,30 @@ static int lp5562_post_init_device(struct lp55xx_chip *chip)
 	return 0;
 }
 
+static int lp5562_multicolor_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	static const u8 addr[] = {
+		LP5562_REG_R_PWM,
+		LP5562_REG_G_PWM,
+		LP5562_REG_B_PWM,
+		LP5562_REG_W_PWM,
+	};
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp55xx_write(chip,
+				   addr[led->mc_cdev.subled_info[i].channel],
+				   led->mc_cdev.subled_info[i].brightness);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
 static int lp5562_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
@@ -506,6 +530,7 @@ static struct lp55xx_device_config lp5562_cfg = {
 	.post_init_device   = lp5562_post_init_device,
 	.set_led_current    = lp5562_set_led_current,
 	.brightness_fn      = lp5562_led_brightness,
+	.multicolor_brightness_fn = lp5562_multicolor_brightness,
 	.run_engine         = lp5562_run_engine,
 	.firmware_cb        = lp5562_firmware_loaded,
 	.dev_attr_group     = &lp5562_group,
-- 
2.43.0


