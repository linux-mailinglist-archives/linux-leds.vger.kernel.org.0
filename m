Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116C026E86F
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgIQWeA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIQWd4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:33:56 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7531C061756;
        Thu, 17 Sep 2020 15:33:55 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 19B61140A6A;
        Fri, 18 Sep 2020 00:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382033; bh=8jzTITXd7x2Sd5OBvkTpSef6/2RxqojFIwmDtosZiDw=;
        h=From:To:Date;
        b=f+6aOZ3B+Lwgo3K9VLOuo31I4Pbpd9VPyCdHSvJarDuoy/ImVZ4jAjoy3WJTiBjNR
         OVsInGKnyD3jI1FLC1KSfcAOGMe2UKYa8CBjzfOLYked2EFBlbx/YEVAFFn1j2OyHh
         ZmTPmQinsxWFvSXFY+PKzdjx5A2YHpEYwwZjJtjA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
Subject: [PATCH leds v2 02/50] leds: ip30: compile if COMPILE_TEST=y
Date:   Fri, 18 Sep 2020 00:32:50 +0200
Message-Id: <20200917223338.14164-3-marek.behun@nic.cz>
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
Cc: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 drivers/leds/Kconfig     | 2 +-
 drivers/leds/leds-ip30.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 96d54e36e3b55..a008170e73cd8 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -905,7 +905,7 @@ config LEDS_TPS6105X
 config LEDS_IP30
 	tristate "LED support for SGI Octane machines"
 	depends on LEDS_CLASS
-	depends on SGI_MFD_IOC3
+	depends on SGI_MFD_IOC3 || COMPILE_TEST
 	help
 	  This option enables support for the Red and White LEDs of
 	  SGI Octane machines.
diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
index d4ec7361c616f..1f952bad0fe86 100644
--- a/drivers/leds/leds-ip30.c
+++ b/drivers/leds/leds-ip30.c
@@ -3,6 +3,7 @@
  * LED Driver for SGI Octane machines
  */
 
+#include <asm/io.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
-- 
2.26.2

