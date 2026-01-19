Return-Path: <linux-leds+bounces-6672-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A783D3A949
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 13:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC85A30C5E73
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 12:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCD635CBAE;
	Mon, 19 Jan 2026 12:43:20 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC535CBD6
	for <linux-leds@vger.kernel.org>; Mon, 19 Jan 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826600; cv=none; b=VVtxNmBOCFVjgQQk03pw9ZqWiub7xcXYePGWk4fzHtF6OBRqE9OmujEKD96ZgEco34F0/disxjw2TKbfBGP11HxvBySdPqeW3I+UjQi9X2iE+MKGB/4XZps/gLUx2k9Q0y0JRQVR4OJokEsHtLbHSglLXnM0ryG4Miul/sGkcsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826600; c=relaxed/simple;
	bh=DpJmvwERwhGrDRVUr2xx7Qvu2FUpHtn2QEk/xWeE4Ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CTxX2YCKFapFemxzHPyPw8gmrsk6mv1/xHnqSjjMmh5js4UVhuApdE2rH288BNMEuEW+qWGSPSg7cO3QDNKqAiAbsCijDJur4yeaMzXaJyIuKdceDz2mTlCk8jVN7xSg33uCDOOEIdskdFDsz5F09vtc69OV5zlE1tP+FiYNzdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vhob7-0001cU-Ef; Mon, 19 Jan 2026 13:43:09 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 19 Jan 2026 13:43:03 +0100
Subject: [PATCH] leds: lp5860: Fix unused-but-set-variable warning
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-v6-19-topic-ti-lp5860-fixes-v1-1-3b297fbc0c4d@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIANYmbmkC/x2MSQqAMAwAvyI5G0hcivoV8SAaNSBaWimC+HeDl
 4FhYB6IElQidNkDQZJGPQ8TzjOYtvFYBXU2h4IKR8wtJofG6/Q64aW4+7pxhIveElFKprIVIq4
 c2MEH+YMN+uF9P5f0+2htAAAA
X-Change-ID: 20260119-v6-19-topic-ti-lp5860-fixes-e31039e00146
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

In lp5860_led_init the ret variable is set to the return value of
regmap_read. The ret is never returned or used which leads to a
-Wunused-but-set-variable warning.

Propagate the return value from the regmap_read and get rid of the warning.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/leds/rgb/leds-lp5860-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index 3f41a42bb9abf..977741a070d19 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -72,6 +72,8 @@ static int lp5860_led_init(struct lp5860_led *led, struct fwnode_handle *fwnode,
 	int ret;
 
 	ret = regmap_read(led->chip->regmap, LP5860_REG_PWM_BRI_START + channel, &brightness);
+	if (ret)
+		return ret;
 
 	default_state = led_init_default_state_get(fwnode);
 

---
base-commit: 33e822f6f4eba2cfbd09ffd080af221cf8c542b2
change-id: 20260119-v6-19-topic-ti-lp5860-fixes-e31039e00146

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


