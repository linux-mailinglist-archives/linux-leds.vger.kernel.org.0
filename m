Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A383326E664
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 22:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIQUM7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 16:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgIQUM7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 16:12:59 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E97C061356;
        Thu, 17 Sep 2020 12:33:45 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 38E29140AE4;
        Thu, 17 Sep 2020 21:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600371101; bh=JNJBel4wKH1Ej8C26iz5DB6vJq84QpVnS656iTCudLE=;
        h=From:To:Date;
        b=xL+PObdj8K7gL2ztGwJeLu6BIXTtUEUk6Bq1GbxVhfYyl2571DCah9U+wbNeC134P
         8GBqxqJIqxrwNbWGI5tgakEQbxwJShH8hFWWAa9rvFSom7+x8svs7OrvwhM4SF7tr7
         a0jnqzBi9WvTg+HF6y5/KPwBG35Ezl9QOuTYsqNM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-kernel@vger.kernel.org
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Phil Blundell <pb@handhelds.org>,
        Samuel Ortiz <sameo@openedhand.com>
Subject: [PATCH mfd] mfd: asic3: build if COMPILE_TEST=y
Date:   Thu, 17 Sep 2020 21:31:40 +0200
Message-Id: <20200917193140.5324-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
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

Build this driver on another platforms if COMPILE_TEST=y. Another
drivers may depend on this, for example leds-asic3.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Phil Blundell <pb@handhelds.org>
Cc: Samuel Ortiz <sameo@openedhand.com>
---
 drivers/mfd/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df0837ab415..599a01aee7abe 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -290,7 +290,8 @@ config MFD_CS47L92
 
 config MFD_ASIC3
 	bool "Compaq ASIC3"
-	depends on GPIOLIB && ARM
+	depends on GPIOLIB
+	depends on ARM || COMPILE_TEST
 	select MFD_CORE
 	help
 	  This driver supports the ASIC3 multifunction chip found on many
-- 
2.26.2

