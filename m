Return-Path: <linux-leds+bounces-3147-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B87419AC9B6
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2024 14:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8D51F2221B
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2024 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C451AB6F7;
	Wed, 23 Oct 2024 12:11:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D7F130E58
	for <linux-leds@vger.kernel.org>; Wed, 23 Oct 2024 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729685483; cv=none; b=QYhHtfPV3gUkwZI5KIxct3UM3PVjeoKeJ3gHuKUWWVElU3kv0HTdzwclrAzokKngdo7JR0ke60XL6VCSR3MiAMVjMeVndJTnl/up7QOv1QlyJe3tXgc0/ppYzvxY6FqhuBiX1o6AycXmFzcG95UCQCTgSTbHqwDQ8+udXX5vs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729685483; c=relaxed/simple;
	bh=HAFCZ/9SDl2Sw2JRR7krPQyX52HpPEe0bTLhsJd/FYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nZG29lpkEyYhxrRzddZ7ri1DpcC1R0omWoVJlRXyAqbadzzI1nPk7F3HrwZbPPpct/ebPMiHZjUZW6+J7waCxVVjOWSknLT4uM2S88V6xlRmpf78caJYGt6yApUqpXvXLzdEBAJUFPflZNYQeGtYNtent3ZusIWmAsXCr1Kmq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XYSXb6Z9Bz1jvmK;
	Wed, 23 Oct 2024 20:09:51 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id F2ACC140392;
	Wed, 23 Oct 2024 20:11:14 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 23 Oct
 2024 20:11:14 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <matthias.bgg@gmail.com>,
	<linux-leds@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] leds: mt6360: Fix error path in device_for_each_child_node()
Date: Wed, 23 Oct 2024 20:06:28 +0800
Message-ID: <20241023120628.15944-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

When break out from device_for_each_child_node(), the child node
is refcount added, and requires calls to fwnode_handle_put().
Use scoped fwnode_handle_put() to put child node automatically in
error path.

Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/leds/flash/leds-mt6360.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 4c74f1cf01f0..676236c19ec4 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -784,7 +784,6 @@ static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
 static int mt6360_led_probe(struct platform_device *pdev)
 {
 	struct mt6360_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	int i = 0, ret;
 
@@ -811,7 +810,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	device_for_each_child_node(&pdev->dev, child) {
+	device_for_each_child_node_scoped(&pdev->dev, child) {
 		struct mt6360_led *led = priv->leds + i;
 		struct led_init_data init_data = { .fwnode = child, };
 		u32 reg, led_color;
-- 
2.17.1


