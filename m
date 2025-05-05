Return-Path: <linux-leds+bounces-4580-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33996AAAA26
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 03:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C859188BDDB
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 01:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E223754DE;
	Mon,  5 May 2025 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pM58Rv2G"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FF8375334;
	Mon,  5 May 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485268; cv=none; b=Kcjj0s+GZmDhOF89dcqQ2evANi2LcujURt8ijDbzRhLG1lij291zjctUhyhtignwAwcfxBUnLvUUUV9bYekN4q7WxZUkmVjKk3/1U9erPD8il3uCl2oSQxSMXgmSoAY5ekC3AIXSh/ond/1orI1AAkgSuevF7U2mpMtOMsWP/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485268; c=relaxed/simple;
	bh=jY2bLFrM4OmbAvQoCMBjY6y3zOJ5tAN7yOeLduNkcfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dUyc+gEN5C8Gw/oe1fUVilNMNWOIL+go2Wpi7OzTPv7JLWq1G4VjWvMpWNAiyO/iNQP96qRYgrFNVs0/o5H+KcGcZ+r/4aEaBEInd30SZratPoHNtDZE4L/wHsEMS8qIBl8xhQ23IY5qzW7BdXYHgZbLapo4FGkFst0Y9vceS7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pM58Rv2G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A374C4CEEF;
	Mon,  5 May 2025 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485267;
	bh=jY2bLFrM4OmbAvQoCMBjY6y3zOJ5tAN7yOeLduNkcfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pM58Rv2Ghm95XC7FRQ13z0rIn2QQ6fqF6M5C/6XwXSiUMbhdCIs3IXxbzeVfuLMl2
	 12gX4E/rFjxdkdfUK1REl7kcACmWOpsf9qyq2tg2S9UnAzj5NY3mf4xlOBQddb3KR1
	 L8aY/SfSAthlxx1dpJjjOj94Mu389L9spsZJ548ac5kV9A8IcNaYkV3hKRfBzXLw6g
	 y08Umt/B0Hotic6iq/W0MmqbThcjT19RtIHdiwaa3ALGM2KtdaEjyhLupZY+tqIiWl
	 iDLNMWGoD2cwbVnt3G+1P0dlLFw2R8zNud/CnRSzZDqixdMWzi2uVmiJtob4dqk30P
	 MKgzRt3V/BXlQ==
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
Subject: [PATCH AUTOSEL 6.12 243/486] leds: pwm-multicolor: Add check for fwnode_property_read_u32
Date: Mon,  5 May 2025 18:35:19 -0400
Message-Id: <20250505223922.2682012-243-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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


