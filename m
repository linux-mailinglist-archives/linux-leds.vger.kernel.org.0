Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32204194E4
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 15:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhI0NRk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 09:17:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234421AbhI0NRj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Sep 2021 09:17:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69A9560FED;
        Mon, 27 Sep 2021 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632748561;
        bh=5s+nTXZSEtYxqsinkY1DskVGn3eXA7KEnUdpZ1oRVnw=;
        h=From:To:Cc:Subject:Date:From;
        b=IaQDOEbfCJ0gbkEEAYFTSCjwBt00r61zAKlbTqnvjU3uLQFc9QOw5m8EN0SYoe5+0
         qA51HOAArMHxq34BikOhmmo7QH3sf9YHmUdzH13l3udX4JdutnYdHrleWJdFs6Vkgx
         A4hXA5xphX+GNwMWTuEx79AMyRQNJU8QwixdCitecM4YW1dbF5Ux16SS1dFxRgU8gZ
         OqMn65aPiXZicOu9I4R+XXEtgyRbhTVLGYnl/igY7G9Eu/Dz34jWcZ5Bz7I8XWLo60
         G8AxPNOdknm9FuDB10EYp1mFWzJn1sD8Uuv+kEJiYNhRifjM1IUyHkNRD9tybCSFBP
         pT1cZnn7mkXJg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] led-class-flash: fix -Wrestrict warning
Date:   Mon, 27 Sep 2021 15:15:47 +0200
Message-Id: <20210927131557.1587062-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 warns when building with W=1:

drivers/leds/led-class-flash.c: In function 'flash_fault_show':
drivers/leds/led-class-flash.c:210:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
  210 |         return sprintf(buf, "%s\n", buf);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/leds/led-class-flash.c:187:54: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
  187 |                 struct device_attribute *attr, char *buf)
      |                                                ~~~~~~^~~

There is no need for the sprintf() here when a strcat() does
the same thing without invoking undefined behavior.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/led-class-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 185e17055317..6fe9d700dfef 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -207,7 +207,7 @@ static ssize_t flash_fault_show(struct device *dev,
 		mask <<= 1;
 	}
 
-	return sprintf(buf, "%s\n", buf);
+	return strlen(strcat(buf, "\n"));
 }
 static DEVICE_ATTR_RO(flash_fault);
 
-- 
2.29.2

