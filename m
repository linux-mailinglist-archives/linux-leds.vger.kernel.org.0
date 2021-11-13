Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42CD44F56B
	for <lists+linux-leds@lfdr.de>; Sat, 13 Nov 2021 22:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236006AbhKMVTu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 13 Nov 2021 16:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhKMVTu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 13 Nov 2021 16:19:50 -0500
X-Greylist: delayed 334 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 13 Nov 2021 13:16:57 PST
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C51C061766
        for <linux-leds@vger.kernel.org>; Sat, 13 Nov 2021 13:16:57 -0800 (PST)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:832c:ae4a:977:a26b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 613562710DC;
        Sat, 13 Nov 2021 22:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1636837880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=le08IpFd3ZglkCjIGDjfGar6L4YTnP3KvBK1MnKIUgA=;
        b=RCGcTDYQuR01VQF59SS+F335EPPw2EqmfdTX7WckYdqp6GqHmuC4Ay49tXxQ+Bqj7yYxjJ
        tSAFxdTWB9i6/q57dSEL95d3k9Df4XQoplWSrmZTWWu7fALVW4g5mDVGJfpO30yXtV7gGe
        uTS8V1Nq1gsQCZwwyltbKegAlnXPdHWlD8DNsNAhvhHuIDPlLKSuUS+EbDbh5wD/NQ9SOM
        nmDpIthI9nrPvkujZyqhS1MbfLVa2XONS6nu/fOXqh9oLGeHYx1Cyq4X7YRPp+1K4TJjF3
        R6gKXAtxrB6B2Kz0A3Isz6UYltTYaqHbTaDh5n/xfA/+f2hdbe79xxVf7s8hDw==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH] leds: led-core: Update fwnode with device_set_node
Date:   Sat, 13 Nov 2021 22:11:13 +0100
Message-Id: <20211113211113.573881-1-sander@svanheule.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update a newly created device's fwnode and of_node pointers using the
recently added device_set_node helper. This keeps some firmware node
specifics out of led-class and should help tracking future changes
regarding device firmware node updates.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/leds/led-class.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f4bb02f6e042..6a8ea94834fa 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -375,10 +375,8 @@ int led_classdev_register_ext(struct device *parent,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
-	if (init_data && init_data->fwnode) {
-		led_cdev->dev->fwnode = init_data->fwnode;
-		led_cdev->dev->of_node = to_of_node(init_data->fwnode);
-	}
+	if (init_data && init_data->fwnode)
+		device_set_node(led_cdev->dev, init_data->fwnode);
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
-- 
2.33.1

