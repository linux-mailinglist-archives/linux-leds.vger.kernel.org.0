Return-Path: <linux-leds+bounces-4578-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CFAAA487
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 01:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55B315A0880
	for <lists+linux-leds@lfdr.de>; Mon,  5 May 2025 23:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D459F2FFC47;
	Mon,  5 May 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TesEAKkX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB82FFC42;
	Mon,  5 May 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483987; cv=none; b=VXVCADqkoZMO0+77eCRTCSkWg8zgmER2j4B82oB+OOz6cVJW110nPIIgnxLjuV504e0R1VULdX4whWNq9rul3lhd3J/ZueWbMDufceY5r7TFiwJS89vl1sxgK8vxvQ5cVEkq71V0auJlFYWFTfZSKdep0AMuIRiQxVmkEQrnL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483987; c=relaxed/simple;
	bh=3zXGYEdV+mRAyu0qkdiukwREudrv1kFnLBrKs9zoNLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OxGYLoOhgc8+2/R9SKNpLrHbffMmvsE5GxZx/+ByOyEoFP8gmQJBUmrzDeDMkzKCVjp/zdTPgjdhhsgRfL7Yxz+Ll7YIb9szDtDnmTzTv2yNL9uds8mhPITp88/Qd+DvvaaGpM0pdUbS1+izbnS0TFtFKnVqxrMrEBOjz4DvnxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TesEAKkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809BEC4CEE4;
	Mon,  5 May 2025 22:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483987;
	bh=3zXGYEdV+mRAyu0qkdiukwREudrv1kFnLBrKs9zoNLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TesEAKkXtMQ2g3KefLUbt8+xxjF/H+LblDxhKl18DcX7Q6AV+IXz9IULQSXyC/tnt
	 KrCjNqHp0G8p0NNBBVVfqhlHCyD9YzYENwK5bB9VaqYFOyS6TneLaHsslo4WucswJX
	 byWpaxNHwVlSaygjNCF54lnDebJzdblofXm/At3NZaulfQlfYU5Dq8tXa2QjiFozok
	 dA6O8RuW8KGU5Wqwo1I0399+Erh9YX7JBC70fTW2XkB0FMSgbaG/W80O1mjXSCw7V3
	 SrkhR1KlIaHIgyci+9+bLKPT4Z0ewwIYakslAxaSOzIgsRIK4ROcU2J4WOrjN2FqOQ
	 eai3PS850W8Ew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@kernel.org,
	jakob+lkml@paranoidlabs.org,
	u.kleine-koenig@baylibre.com,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 306/642] leds: pwm-multicolor: Add check for fwnode_property_read_u32
Date: Mon,  5 May 2025 18:08:42 -0400
Message-Id: <20250505221419.2672473-306-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Yuanjun Gong <ruc_gongyuanjun@163.com>

[ Upstream commit 6d91124e7edc109f114b1afe6d00d85d0d0ac174 ]

Add a check to the return value of fwnode_property_read_u32()
in case it fails.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
Link: https://lore.kernel.org/r/20250223121459.2889484-1-ruc_gongyuanjun@163.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index f80a06cc31f8a..1c7705bafdfc7 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -141,8 +141,11 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 
 	/* init the multicolor's LED class device */
 	cdev = &priv->mc_cdev.led_cdev;
-	fwnode_property_read_u32(mcnode, "max-brightness",
+	ret = fwnode_property_read_u32(mcnode, "max-brightness",
 				 &cdev->max_brightness);
+	if (ret)
+		goto release_mcnode;
+
 	cdev->flags = LED_CORE_SUSPENDRESUME;
 	cdev->brightness_set_blocking = led_pwm_mc_set;
 
-- 
2.39.5


