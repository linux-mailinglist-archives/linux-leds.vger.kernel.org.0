Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFEB326E902
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgIQWg7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgIQWd4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:33:56 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA921C06174A;
        Thu, 17 Sep 2020 15:33:55 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 498E0140A75;
        Fri, 18 Sep 2020 00:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382033; bh=LCbu6+SF9pg2hwGFGY/TLzTM7tBJKXuL6iP8UeZY++4=;
        h=From:To:Date;
        b=YmZAuXUKMg7enG6rXX50aOCM1XrH1jMnzkFvoedfXL+fdcbzAsxTvcrZDahguyEOl
         0RIG1YDSm2WhxYWXS6HbOK+M3Njjad5XOjN1qeKWbZ07EihTYSVs41YK7wmy/dV/di
         Jv/O2SViFPZOWk5vZdTIX8LQLzhLHlkVXRDD0u9M=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Rod Whitby <rod@whitby.id.au>
Subject: [PATCH leds v2 03/50] leds: fsg: compile if COMPILE_TEST=y
Date:   Fri, 18 Sep 2020 00:32:51 +0200
Message-Id: <20200917223338.14164-4-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver can be compiled on other platforms with small change if
COMPILE_TEST=y.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Rod Whitby <rod@whitby.id.au>
---
 drivers/leds/Kconfig    | 2 +-
 drivers/leds/leds-fsg.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a008170e73cd8..7f3d16d4f0652 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -290,7 +290,7 @@ config LEDS_NET48XX
 config LEDS_FSG
 	tristate "LED Support for the Freecom FSG-3"
 	depends on LEDS_CLASS
-	depends on MACH_FSG
+	depends on MACH_FSG || COMPILE_TEST
 	help
 	  This option enables support for the LEDs on the Freecom FSG-3.
 
diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
index bc6b420637d61..1ffb34baee341 100644
--- a/drivers/leds/leds-fsg.c
+++ b/drivers/leds/leds-fsg.c
@@ -16,7 +16,13 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/io.h>
+
+#if IS_ENABLED(MACH_FSG)
 #include <mach/hardware.h>
+#else
+/* for COMPILE_TEST */
+#define IXP4XX_EXP_BUS_BASE(x) (0x12345678 + (x))
+#endif
 
 #define FSG_LED_WLAN_BIT	0
 #define FSG_LED_WAN_BIT		1
-- 
2.26.2

