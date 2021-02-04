Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAC130F692
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 16:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237476AbhBDPlK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 10:41:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237484AbhBDPkg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Feb 2021 10:40:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE22464F44;
        Thu,  4 Feb 2021 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612453195;
        bh=0rVADc8DYJLXUAngr6xcgCUGDPQO+hMeabdF0zLfXo4=;
        h=From:To:Cc:Subject:Date:From;
        b=H5sF/SYuycmnMlgZhrvfUXPg0873Tnnv2nfG/NCRpXpfiu9mWOaW/GS88wyeziszZ
         bR3UkQ4kP0jbD7zfhCcpdJ02L+koBL5rhv7B7+89pZy7s5EDedVpgmRKSl5Oxy2OOU
         q8xvGCzmp4oU9ODpI23hN5y3YNM9WxwMDeUxlTtb4ECVfjXenMvV3ARd0LihO8buNY
         VZXazqBb8lXAWQC0cjmsg+w9Mjz0eDHO1kZfuO0PSAhHGkp4/HHlvyORqEwdCYG5Vx
         V6PR+Cj6EdAuEj3ONWO65KUFOYhogMthXXtm5jb3QIKegtsziVuK6REM3bE9IEarBh
         jdqgjSp1uicbQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: rt8515: add V4L2_FLASH_LED_CLASS dependency
Date:   Thu,  4 Feb 2021 16:39:44 +0100
Message-Id: <20210204153951.1551156-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The leds-rt8515 driver can optionall use the v4l2 flash led class,
but it causes a link error when that class is in a loadable module
and the rt8515 driver itself is built-in:

ld.lld: error: undefined symbol: v4l2_flash_init
>>> referenced by leds-rt8515.c
>>>               leds/flash/leds-rt8515.o:(rt8515_probe) in archive
drivers/built-in.a

Adding 'depends on V4L2_FLASH_LED_CLASS' in Kconfig would avoid that,
but it would make it impossible to use the driver without the
v4l2 support.

Add the same dependency that the other users of this class have
instead, which just prevents the broken configuration.

Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/flash/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index d21d273ef3da..b580b416b9a4 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -5,6 +5,7 @@ if LEDS_CLASS_FLASH
 config LEDS_RT8515
 	tristate "LED support for Richtek RT8515 flash/torch LED"
 	depends on GPIOLIB
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	help
 	  This option enables support for the Richtek RT8515 flash
 	  and torch LEDs found on some mobile phones.
-- 
2.29.2

