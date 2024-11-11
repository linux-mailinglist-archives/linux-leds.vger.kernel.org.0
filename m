Return-Path: <linux-leds+bounces-3366-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E049C38C2
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 07:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B637F1F20C2A
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 06:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CC31514EE;
	Mon, 11 Nov 2024 06:58:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218541487F4;
	Mon, 11 Nov 2024 06:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731308303; cv=none; b=a3eBaTukY+4Om2y6p1Ei8oERPnaxv4KL9fT2et6jy9UonCXd3ofGurO1gzHi0RloIZZEnUPVnmtctGNMnxuCfaofvX9R+3c7kpxV1BFjCYsRcP2wIHDyLm5YC5xBYgDk6hU8uYS1qgKHQ2j20g3paTBz8rCUhILLKrB5cr+ofls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731308303; c=relaxed/simple;
	bh=RRfA/3dJQQAyx8yE8jLrEZTN7L+GQSAafq7NHGwZh3Y=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Gpwx2ZMOVDXUi5dDlnmigNJxXHLQjOHgUTf7IM3y/RhyNVTO0IfB8OsY9/kq0Gpu8Uz0FQT3vV0fgbvdeZh5+BKn61O0R2OjwWZ9sVsBty6u3iZFg/MHWEZVW1QfmVBIbEH1aiJs6LTuRYCexCMf811tmwy5KK6JDIfLdSnnUfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86731ab0408b-3e0d4;
	Mon, 11 Nov 2024 14:58:13 +0800 (CST)
X-RM-TRANSID:2ee86731ab0408b-3e0d4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86731ab04f4b-173d5;
	Mon, 11 Nov 2024 14:58:12 +0800 (CST)
X-RM-TRANSID:2ee86731ab04f4b-173d5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] leds: ss4200: Fix the wrong format specifier
Date: Sun, 10 Nov 2024 22:58:09 -0800
Message-Id: <20241111065809.3814-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

The format specifier of "signed int" in sprintf() should be "%d", not
"%u".

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/leds/leds-ss4200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 2ef9fc7371bd..f24ca75c7cb1 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -451,7 +451,7 @@ static ssize_t blink_show(struct device *dev,
 	int blinking = 0;
 	if (nasgpio_led_get_attr(led, GPO_BLINK))
 		blinking = 1;
-	return sprintf(buf, "%u\n", blinking);
+	return sprintf(buf, "%d\n", blinking);
 }
 
 static ssize_t blink_store(struct device *dev,
-- 
2.17.1




