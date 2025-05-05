Return-Path: <linux-leds+bounces-4583-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE17AAAF93
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 05:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C253B4748
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 03:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF09F3BE0A4;
	Mon,  5 May 2025 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgnsHDDk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1CD388C20;
	Mon,  5 May 2025 23:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486612; cv=none; b=G9Bd9EXqGin0wzJTc6rWzpGzDfEt5roMcNc1uk3jDt3xz5jTpxaFCakPOshWeJ7G628/NtPc2VCCmJwd0pONiVFFB9Zay4s/BcOt49X1guHmSLA8v6sxM9HrK7n/Pml4BtGCCuIQiYJ/NYC4X6rZa2X/CoBOl+GnAMdqE4bJN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486612; c=relaxed/simple;
	bh=phkeeO30HHKusTKd6SbxssgcErvrNyortPVsfg/RYQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q+Bti7vxhtsT2Q36tcO3iY3mHE+KmbVg91st8AQXwEwf8ZTVqQjTyS9Ijk1eING1I9WrMlv9XwQ3sef2/Y7BGOdiaUqaeqtjyNbAS4RDkl5ZMPQ7yTu6RCcoWjfJDNr8/7FIg1IF3c7j5R8VtP9PbmrkIg0uURiN3K4xOO2Cf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgnsHDDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A80C4CEE4;
	Mon,  5 May 2025 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486611;
	bh=phkeeO30HHKusTKd6SbxssgcErvrNyortPVsfg/RYQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EgnsHDDk/ufj20MonrBfsjLABbLLQXe0Jjatz2yfuzywd9L4WgGKKAw2/XGmHlTsl
	 SFVKK9kEOXmZ9ycFyiD797xAZxYP2+ZoQnxcPEWyAWzkD9EokGBboW+SwecOu8V4/y
	 pA46n79wA569KSogBTHFiXrah+MiUujZiVdTWW3F6/NOT5yZnYTsokMfp+kYEBH+gD
	 jQvpb+S7BqGqCnHeLqnLiRbTC0w3JUuoav6Do44loivCdmjKEvx6pLsky8wa25B9W5
	 ksKpbP+cZjz/ETX750H8vEPbCrNDV06CoOVwGOuqtl9lPMpWVQRgXsUeDaTc3JoP0k
	 8AuV5MxIK0BkA==
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
Subject: [PATCH AUTOSEL 6.1 117/212] leds: pwm-multicolor: Add check for fwnode_property_read_u32
Date: Mon,  5 May 2025 19:04:49 -0400
Message-Id: <20250505230624.2692522-117-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index da9d2218ae184..97aa06e2ff603 100644
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


