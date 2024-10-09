Return-Path: <linux-leds+bounces-3007-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922899648B
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 11:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 959FBB2531E
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44840189520;
	Wed,  9 Oct 2024 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="Yu3iN1fz"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A56188906;
	Wed,  9 Oct 2024 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465116; cv=none; b=r3P9Ut7+GcIFdxrjIZZfCWo5Z7dbc2EWQnh6t9dK7gvNvUhxvULKtPo7OxwVWaFOVHB+Rv+q9ltRW51mpne7T/WEIH7L7fwRpffyz3pXKYEJPAEvz3hWjXfzJP75kGUG0HasVGALz7yqW/sQbYr57rPR/1qJ3hlkEQ3uVQblOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465116; c=relaxed/simple;
	bh=wWQelVvFwrq55g2Or93+1l444WuEU6hc6+Y+e/XJ64w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SkDsK+6f0i3vI8wA/YCHweOcY0bsCrleNRKu4w6bMh8Nv6NAMjjLaXZ5yenvSKxww9Q1Az991LqrCQu9IyS/cVuBHIZW7KnaeXFNM+lF3xOq2xI6YFs/iHLp+8NzY0KohYdd/sa9BcLK2lm4zRQfgIqqJa/rdRSpE8G4qJgy7U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=Yu3iN1fz; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1728464549;
	bh=pjNJkO8qWtwEscxJ/5F/8RHn5xwm1gsGFRaGNj+qPn0=;
	h=From:To:Cc:Subject:Date:From;
	b=Yu3iN1fzu67b7MF4JnYvYJSNu0EcBLQ352nLdbR8r30HUwoOwAr/NklGAuTckPuL5
	 Oh32pJPZHMEpSzioDxCFTsjpY5CcqVcwoZR5Ro/wd0dSfhxXtYJLmTP2shLbz+uMCG
	 C6I8fV0kgZFibXsm2/IT5jXRjOBhe8LDrqcYgm5U=
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
	by uho.ysoft.cz (Postfix) with ESMTP id 4C8A2A021E;
	Wed,  9 Oct 2024 11:02:29 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] leds: lp55xx: Fix check for invalid channel number
Date: Wed,  9 Oct 2024 11:02:27 +0200
Message-Id: <1728464547-31722-1-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prior to commit 92a81562e695 ("leds: lp55xx: Add multicolor framework
support to lp55xx") the reg property (chan_nr) was parsed and stored
as it was. Then, in lp55xx_init_led() function, it was checked if it
is within valid range. In case it was not, an error message was
printed and the driver probe failed.

With the mentioned commit the reg property is checked right after it
is read from the device tree. Comparison to the upper range is not
correct though. Valid reg values are 0 to (max_channel - 1). So in
case the parsed value is out of this (wrong) range the probe just
fails and no error message is shown.

Fix it by using proper comparison and print a message in case of
an error. The check that is done in lp55xx_init_led() function is now
redundant and can be removed.

Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to lp55xx")
Cc: <stable@vger.kernel.org>
Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 drivers/leds/leds-lp55xx-common.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 5a2e259679cf..055ee77455f9 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -512,12 +512,6 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	led->max_current = pdata->led_config[chan].max_current;
 	led->chan_nr = pdata->led_config[chan].chan_nr;
 
-	if (led->chan_nr >= max_channel) {
-		dev_err(dev, "Use channel numbers between 0 and %d\n",
-			max_channel - 1);
-		return -EINVAL;
-	}
-
 	if (pdata->led_config[chan].num_colors > 1)
 		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
 	else
@@ -1132,8 +1126,11 @@ static int lp55xx_parse_common_child(struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (*chan_nr < 0 || *chan_nr > cfg->max_channel)
+	if (*chan_nr < 0 || *chan_nr >= cfg->max_channel) {
+		dev_err(dev, "Use channel numbers between 0 and %d\n",
+			cfg->max_channel - 1);
 		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.1.4


