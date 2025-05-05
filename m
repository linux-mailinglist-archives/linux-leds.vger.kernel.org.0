Return-Path: <linux-leds+bounces-4581-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B63AAAAE9
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 03:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3320F1883EC3
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 01:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC9A38AC5C;
	Mon,  5 May 2025 23:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPhY3NYc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF893379413;
	Mon,  5 May 2025 23:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486086; cv=none; b=fOfWPu5GmdJJXL/DFr7WKd6CA7xNtuWM895cJvFmHA57cU6byO5hKwz5U9ulgdY3SNaoKbqKFyRMf3HFVUSwT5I8a+9PNZdbdD56R0wJwOdzrByGz9n5IuZsqwRAoyMiwDVxIAV3fv5YPNMmLEHuncFKliMunu7kLvc8jielXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486086; c=relaxed/simple;
	bh=jY2bLFrM4OmbAvQoCMBjY6y3zOJ5tAN7yOeLduNkcfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uk0hf7kRdafD4BuTxcZbCAyKBA07fv5JVUlxDQgJP6CJaJKsadSExQtqpaEOLrrLGprsA3uc2lRtZtWY+jEVKvnGikhVMEcQB6opKw2KumJu3JRYCHa8D5dVQIBhf8y6lvdQ5/6YCPdMsEc4nHLZCQ4AHddfU+NdPXAe6Vx0XUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPhY3NYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB63C4CEEF;
	Mon,  5 May 2025 23:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486084;
	bh=jY2bLFrM4OmbAvQoCMBjY6y3zOJ5tAN7yOeLduNkcfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XPhY3NYcR8xIsUbBJec5NnmJSCv9bsQ9102qmyB/86lOU/w8l527YFOImpbKbriIM
	 igp7rznqv+/iXA1Qx2Xjj6RpDwo5kelIJUnMUIwSUz8w9mLqN9L0CUpmaLqhYTN3kn
	 lCy3fNo0ZTeOYtloeJLBN5CKyIF9S4mMDkTlcAqvoLCEk7OMcSkAI69iygZlmNC+1y
	 PSoFQL0B7zaWYxiHjY+zkGIloCLlxr0CBgQk6Zdg1JQ4lmEjluXscqpgfqYmSMdJO7
	 qlrvJyzLXRzNYftAGEMUEgwNzsMeLn+NThz3hkA+3qhVLSB/UkaM3HxDoXy7ExW/hQ
	 xzM0x38z5XM9Q==
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
Subject: [PATCH AUTOSEL 6.6 147/294] leds: pwm-multicolor: Add check for fwnode_property_read_u32
Date: Mon,  5 May 2025 18:54:07 -0400
Message-Id: <20250505225634.2688578-147-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index e1a81e0109e8a..c0aa34b1d0e2d 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -135,8 +135,11 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 
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


