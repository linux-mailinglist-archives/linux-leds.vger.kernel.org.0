Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3228015F002
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2020 18:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388667AbgBNRwE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Feb 2020 12:52:04 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33236 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388659AbgBNP6m (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Feb 2020 10:58:42 -0500
Received: by mail-pf1-f195.google.com with SMTP id n7so5095631pfn.0
        for <linux-leds@vger.kernel.org>; Fri, 14 Feb 2020 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4CF/Tv/Hi3iB+k57zcQMZqNp1agrajE8CEQtxMkq73M=;
        b=IDH+cD+dcpv1Yv90+7GvfN/5mzXcfkNGC2KvVrLxD7yzFROBWJ2+fIsaE7LSQBdKaY
         Aq09JMLLoN9mnlJTPL+VO0A6thYxPoHxZqVpv9beZ1833RxmiGyXhUZDyyyi/Tqg2+vS
         tTf3gw0IFZnga58cFysKBiPOE/2iH4V6efZPygb9sOWlAt2EaZ0YnT3ma81VPg/MJ1qC
         qOWStvWCVE94Eui80SH63zNMInadnBy/S2neWvM8+vnoQHLFR41JF3Ll9eGWV1UQAnvi
         swh46g9ODDKRVITKKyehsx6NDkuC9+voF31OGcjx4BbAFLrLtUNvpSq+zxn7cAIXoEKc
         LuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4CF/Tv/Hi3iB+k57zcQMZqNp1agrajE8CEQtxMkq73M=;
        b=TUAJnLmutwPT08hgiL6JuhY9d7u7KmhwemA6Y3YOQ4BXxxNFpZAizJHsZijrcnCXF5
         SawsYicy8ztXmjbVZCWIZxaouPkNkmfv2vVLCuDf7SO0uzVb17uktu97uw4LOQBac1hC
         yYmm6pveQTXw03yD+kR1kf8c8rBZ+uSeoj43NyEdo1OAqfG6IDnyHJxkj5auj4zuVr3w
         APAJCCM3iTFIUVjFzXjxemFWHYpQuB2Ln0pdfiAJmcW45KlDqgxxoOpQ0eTpeHrS4M6a
         cm6QJ1Qj4ptpYwyS1m8R8IhX5jbApfTGT/+5Mzix0QcmgN08Fr7qM3pvJufEwsp3TmWR
         lXkw==
X-Gm-Message-State: APjAAAXzlnze4tnwf2fs1YdrhauoVwDeWG87db0aZR0E1sKV+Tcq99or
        HR0OegWCZBuMIULaYLKxluY=
X-Google-Smtp-Source: APXvYqxn7t5kwJeqg3ell5/9PcILPGJ4HT8rOuGdwLOyoX2KGUTeKVRf3e33GeGBGbbhZg2IJwlI5A==
X-Received: by 2002:a63:520a:: with SMTP id g10mr3888104pgb.298.1581695921776;
        Fri, 14 Feb 2020 07:58:41 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 70sm7346028pgd.28.2020.02.14.07.58.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Feb 2020 07:58:41 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] leds: leds-nic78bx: handle error checking and error processing
Date:   Fri, 14 Feb 2020 23:58:36 +0800
Message-Id: <1581695916-16708-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Add error checking and error processing for led probe.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/leds/leds-nic78bx.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index f196f52..cc5adf8 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -129,24 +129,24 @@ static int nic78bx_probe(struct platform_device *pdev)
 	if (!led_data)
 		return -ENOMEM;
 
-	led_data->pdev = pdev;
-	platform_set_drvdata(pdev, led_data);
-
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!io_rc) {
+		ret = -EINVAL;
 		dev_err(dev, "missing IO resources\n");
-		return -EINVAL;
+		goto err_get_res;
 	}
 
 	if (resource_size(io_rc) < NIC78BX_USER_LED_IO_SIZE) {
 		dev_err(dev, "IO region too small\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_res_size;
 	}
 
 	if (!devm_request_region(dev, io_rc->start, resource_size(io_rc),
 				 KBUILD_MODNAME)) {
+		ret = -EBUSY;
 		dev_err(dev, "failed to get IO region\n");
-		return -EBUSY;
+		goto err_request_region;
 	}
 
 	led_data->io_base = io_rc->start;
@@ -157,13 +157,27 @@ static int nic78bx_probe(struct platform_device *pdev)
 
 		ret = devm_led_classdev_register(dev, &nic78bx_leds[i].cdev);
 		if (ret)
-			return ret;
+			goto err_led_classdev_register;
 	}
 
 	/* Unlock LED register */
 	outb(NIC78BX_UNLOCK_VALUE,
 	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
 
+	led_data->pdev = pdev;
+	platform_set_drvdata(pdev, led_data);
+	return 0;
+
+err_led_classdev_register:
+	i -= 1;
+	while (i >= 0)
+		devm_led_classdev_unregister(dev, &nic78bx_leds[i--].cdev);
+	devm_release_region(dev, io_rc->start, resource_size(io_rc));
+err_request_region:
+err_res_size:
+	release_resource(io_rc);
+err_get_res:
+	devm_kfree(dev, led_data);
 	return ret;
 }
 
@@ -171,6 +185,9 @@ static int nic78bx_remove(struct platform_device *pdev)
 {
 	struct nic78bx_led_data *led_data = platform_get_drvdata(pdev);
 
+	if (IS_ERR_OR_NULL(led_data))
+		return PTR_ERR(led_data);
+
 	/* Lock LED register */
 	outb(NIC78BX_LOCK_VALUE,
 	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
-- 
1.9.1

