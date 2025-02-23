Return-Path: <linux-leds+bounces-4062-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80085A40EC5
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2025 13:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6408A16E64F
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2025 12:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF7F201270;
	Sun, 23 Feb 2025 12:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KIlnO9D8"
X-Original-To: linux-leds@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0973A6FC3
	for <linux-leds@vger.kernel.org>; Sun, 23 Feb 2025 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740312951; cv=none; b=Q7vX2+/Dk2FAvcLl2bOPJTXTYnj79VrQUBu8fwDfoO1vPzYJipLhab/dapxI7lKMV/NZ0jRpeGoZGWHD7NPWfbW/m4pHzsR8qzUzqEuEStOH3SKG3OQfM4ZF/bGxEaaHyKXnjLIz8tF/LSWZf3tKkpMgb2K9clfh9rSmw8cPvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740312951; c=relaxed/simple;
	bh=JmGHL0HtrhUwS2TqlnvpTuK3a1KLvGiRHI28miZ6j2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D/kpeFd+TfermXWSBXaPu28sm/4hcUe+Al6GrXoAOKYCA5PEGX1oCc2vFR3U6ZVHeOIjRSWhBrZruB5cFu+FxuLun7A/Wng/3xSau9/lP5ytlzhPIrOVUMCdEJ2s+bbWwepX9fEEa/5RZzCwtM/bznUQm3h/3aQeeWFT8JQXZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KIlnO9D8; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ewG3w
	tXW8kUs9/Y2QSD/o9DN1UuVUsphYUQ/MNLyMmo=; b=KIlnO9D8dY00VTkuB7IZS
	gb9dJQhOZIN0aSiTc7DjpNh5Li73JLV12mga76KzoDj98GRYoCArKW4oMa1bzY1q
	35GcsdR96ctWw9E5fO0u1Eh0aM+mHGbWl9kqR8NZX/T0Fgh7GoRNTDPhVlaOR8km
	uFryghkKro8ZMFhMWyPWFU=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBHZ1xHEbtnyQmcOw--.26339S4;
	Sun, 23 Feb 2025 20:15:32 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jakob Riepler <jakob+lkml@paranoidlabs.org>,
	linux-leds@vger.kernel.org
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] leds: pwm-multicolor: Add check for fwnode_property_read_u32
Date: Sun, 23 Feb 2025 20:14:59 +0800
Message-Id: <20250223121459.2889484-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBHZ1xHEbtnyQmcOw--.26339S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy5tF48WF4rAF17tw4fXwb_yoWfKFX_u3
	yxuF97XrZxWay8trn09anayasa9rZ5WrykWr4Iva4ft347urn0qF40vF9rZw4UW3srKr95
	Wa15AFy3Zr1SgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRWbyAJUUUUU==
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJwn75We6CfHZQgABsP

Add a check to the return value of fwnode_property_read_u32()
in case it fails.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index f80a06cc31f8..1c7705bafdfc 100644
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
2.25.1


