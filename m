Return-Path: <linux-leds+bounces-1443-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E18A0594
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 03:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B631F20F89
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 01:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8900F61664;
	Thu, 11 Apr 2024 01:32:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25C262144
	for <linux-leds@vger.kernel.org>; Thu, 11 Apr 2024 01:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712799141; cv=none; b=lh7ph3KwWmcGCTFFXBwZnI/uJmIxYRIEZcHs8tdHhPgf6Vov7tOVO2oty+SyPaxlOaQDIsdtjtRxCYrI30jctivfOC3yGJzeWMnRLBrbbMPooc0fmGgpdJ6UTofzo77g09TKXoSner9xD38j6qV/y9+8XIPt54VwSoY/SxbPLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712799141; c=relaxed/simple;
	bh=jXkinlrC/O0981KfQ2xDFNxGIg5ef9XA4gIIMPm+uOg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mrgqiwgA93Q0jQrXHWufJa5te1ASH8GA2c15mBtfTK0iYXnhAynKAE98ocsI/xUcpIEqczGjeo7QUs/LKUY2a8o4/nLZlQ7+bb/GVUpTkY4OW1mmMTaUX8fJh4M7rYslK1gnslCGg2zqAfb2f/sDjZBw/AqsScpckNU7YTJSHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Received: By OpenMail Mailer;Thu, 11 Apr 2024 09:32:08 +0800 (CST)
X-MGFlag: HAM
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(744429:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Tue, 09 Apr 2024 18:21:58 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Apr 2024
 18:21:58 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 9 Apr 2024 18:21:58 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<peterwu.pub@gmail.com>, <cy_huang@richtek.com>, ChiaEn Wu
	<chiaen_wu@richtek.com>
Subject: [PATCH] leds: mt6360: Fix the second LED can not enable torch mode by V4L2
Date: Tue, 9 Apr 2024 18:21:54 +0800
Message-ID: <28FE6F1712799128000.chiaen_wu@richtek.com>
X-MG-ORIG-MSGID: <d1d1419bb322e2b0f40d34edd3a66979015b668c.1712657386.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

V4L2 will disable strobe mode of the LED device when enable torch mode,
but this logic will conflict with the "priv->fled_torch_used"
in "mt6360_strobe_set()". So after enabling torch mode of the first
LED, the second LED will not be able to enable torch mode correctly.

Therefore, at the beginning of "mt6360_strobe_set()", check whether the
state of the upcoming change and the current LED device state are the
same, so as to avoid the above problem.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 drivers/leds/flash/leds-mt6360.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index a90de82f4568..1b75b4d36834 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -241,10 +241,20 @@ static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
 	u32 enable_mask = MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
 	u32 val = state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
 	u32 prev = priv->fled_strobe_used, curr;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&priv->lock);
 
+	/*
+	 * If the state of the upcoming change is the same as the current LED
+	 * device state, then skip the subsequent code to avoid conflict
+	 * with the flow of turning on LED torch mode in V4L2.
+	 */
+	if (state == !!(BIT(led->led_no) & prev)) {
+		dev_info(lcdev->dev, "No change in strobe state [0x%x]\n", prev);
+		goto unlock;
+	}
+
 	/*
 	 * Only one set of flash control logic, use the flag to avoid torch is
 	 * currently used
-- 
2.42.0


