Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3849E419211
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 12:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhI0KRw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 06:17:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233703AbhI0KRw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Sep 2021 06:17:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64CF360F6C;
        Mon, 27 Sep 2021 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632737774;
        bh=Bq2dWaShr/xZPho3pKYv2iZApCmL3XL12AcCSUUBVkY=;
        h=From:To:Cc:Subject:Date:From;
        b=cl0DVcvh4emKAb8+mahJbuYxhI4Rb7V+XxsONvq/AvxjqtcBilVRrR/xosMqJExhY
         LIlMRciNqoSCWEU+w+MDU4FV9b4HCZhpdPhGHWnQlppUg2OSFa7t3Wl4O3HAkBKeDu
         cI5jkP/8kfkQosTKXHuM6yfOmEtTKDLZyq7gt53SIEoovLzPyce0obcNrDGFPtxp8X
         GRHp4d06isHvj6Sm3NwQjuB/H0kZyzAH7oFOPyzcoPD0HO/rXuzfX2ZHg7hT4XZHSP
         w8o3XDkODo0v8/K7JuVghu25BqYBa/tEVzk+P/nvDS4YIMfH2BtF3rUC6S8tpZVmLh
         SpXo9ROnuJ2HA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] led-class-flash: fix -Wrestrict warning
Date:   Mon, 27 Sep 2021 12:15:59 +0200
Message-Id: <20210927101610.1669830-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

drivers/leds/led-class-flash.c: In function 'flash_fault_show':
drivers/leds/led-class-flash.c:210:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
  210 |         return sprintf(buf, "%s\n", buf);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/leds/led-class-flash.c:187:54: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
  187 |                 struct device_attribute *attr, char *buf)
      |                                                ~~~~~~^~~
cc1: all warnings being treated as errors
make[5]: *** [scripts/Makefile.build:277: drivers/leds/led-class-flash.o] Error 1
make[5]: Target '__build' not remade because of errors.
make[4]: *** [scripts/Makefile.build:540: drivers/leds] Error 2
drivers/thunderbolt/xdomain.c: In function 'modalias_show':
drivers/thunderbolt/xdomain.c:733:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
  733 |         return sprintf(buf, "%s\n", buf);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/xdomain.c:727:36: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
  727 |                              char *buf)
      |                              ~~~~~~^~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/led-class-flash.c | 2 +-
 drivers/thunderbolt/xdomain.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
 
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index d66ea4d616fd..eff32499610f 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -730,7 +730,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 
 	/* Full buffer size except new line and null termination */
 	get_modalias(svc, buf, PAGE_SIZE - 2);
-	return sprintf(buf, "%s\n", buf);
+	return strlen(strcat(buf, "\n"));
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.29.2

