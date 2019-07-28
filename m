Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70277807B
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 18:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfG1Qov (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 12:44:51 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:36242 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfG1Qou (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 12:44:50 -0400
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-02.nifty.com with ESMTP id x6SGenvg015172
        for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2019 01:40:49 +0900
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6SGeKji024520;
        Mon, 29 Jul 2019 01:40:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6SGeKji024520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564332020;
        bh=utzluryZNWCiMcKjtA37Iw3PBQRzyoAFNM/fbkOO86Q=;
        h=From:To:Cc:Subject:Date:From;
        b=bFFofcgElFlMDh4CaXpmYURoXbjYGSbxfvB4lC9UgewikYwVnbaLlcFgAU1H16FVE
         DbLi8mWKXD75MpG/we2NFOWTvPs8ycQ8M+ewxaKq+NVyrx+mlyFMfCk5bAFcTr/zdg
         2aZ1A6kbYYNid0ZSzKXNtYMDnT7Gde4qwruiw7nlgbl0acJOm8CvDE3YWvcSFE/ym6
         0yM78PkS0rtHc5PlkLKakdtb0nyYbqc1D7TeefZCCqSzexydCeXk75qqbJ1OyDoFmB
         j82OMizorGi+jaeYJ5rhd/aOedeZOA2CvtC5TUwe5LjggLaakFVfXjKNCGStrmZ0af
         g7myGCQelVz9A==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] leds: netxbig: remove legacy board-file support
Date:   Mon, 29 Jul 2019 01:40:15 +0900
Message-Id: <20190728164015.15405-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since commit ebc278f15759 ("ARM: mvebu: remove static LED setup for
netxbig boards"), no one in upstream passes in the platform data to
this driver.

Squash leds-kirkwood-netxbig.h into the driver, and remove the legacy
board-file support.

Link: https://lkml.org/lkml/2019/7/20/83
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/leds/Kconfig                          |  1 +
 drivers/leds/leds-netxbig.c                   | 70 +++++++++++++------
 .../platform_data/leds-kirkwood-netxbig.h     | 54 --------------
 3 files changed, 51 insertions(+), 74 deletions(-)
 delete mode 100644 include/linux/platform_data/leds-kirkwood-netxbig.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b0fdeef10bd9..80e0399b7e6d 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -587,6 +587,7 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD
+	depends on OF_GPIO
 	default y
 	help
 	  This option enables support for LEDs found on the LaCie 2Big
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 10497a466775..0944cb111c34 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -15,7 +15,48 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <linux/leds.h>
-#include <linux/platform_data/leds-kirkwood-netxbig.h>
+
+struct netxbig_gpio_ext {
+	unsigned int	*addr;
+	int		num_addr;
+	unsigned int	*data;
+	int		num_data;
+	unsigned int	enable;
+};
+
+enum netxbig_led_mode {
+	NETXBIG_LED_OFF,
+	NETXBIG_LED_ON,
+	NETXBIG_LED_SATA,
+	NETXBIG_LED_TIMER1,
+	NETXBIG_LED_TIMER2,
+	NETXBIG_LED_MODE_NUM,
+};
+
+#define NETXBIG_LED_INVALID_MODE NETXBIG_LED_MODE_NUM
+
+struct netxbig_led_timer {
+	unsigned long		delay_on;
+	unsigned long		delay_off;
+	enum netxbig_led_mode	mode;
+};
+
+struct netxbig_led {
+	const char	*name;
+	const char	*default_trigger;
+	int		mode_addr;
+	int		*mode_val;
+	int		bright_addr;
+	int		bright_max;
+};
+
+struct netxbig_led_platform_data {
+	struct netxbig_gpio_ext	*gpio_ext;
+	struct netxbig_led_timer *timer;
+	int			num_timer;
+	struct netxbig_led	*leds;
+	int			num_leds;
+};
 
 /*
  * GPIO extension bus.
@@ -306,7 +347,6 @@ static int create_netxbig_led(struct platform_device *pdev,
 	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
 }
 
-#ifdef CONFIG_OF_GPIO
 static int gpio_ext_get_of_pdata(struct device *dev, struct device_node *np,
 				 struct netxbig_gpio_ext *gpio_ext)
 {
@@ -522,30 +562,20 @@ static const struct of_device_id of_netxbig_leds_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_netxbig_leds_match);
-#else
-static inline int
-netxbig_leds_get_of_pdata(struct device *dev,
-			  struct netxbig_led_platform_data *pdata)
-{
-	return -ENODEV;
-}
-#endif /* CONFIG_OF_GPIO */
 
 static int netxbig_led_probe(struct platform_device *pdev)
 {
-	struct netxbig_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct netxbig_led_platform_data *pdata;
 	struct netxbig_led_data *leds_data;
 	int i;
 	int ret;
 
-	if (!pdata) {
-		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-		ret = netxbig_leds_get_of_pdata(&pdev->dev, pdata);
-		if (ret)
-			return ret;
-	}
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	ret = netxbig_leds_get_of_pdata(&pdev->dev, pdata);
+	if (ret)
+		return ret;
 
 	leds_data = devm_kcalloc(&pdev->dev,
 				 pdata->num_leds, sizeof(*leds_data),
@@ -571,7 +601,7 @@ static struct platform_driver netxbig_led_driver = {
 	.probe		= netxbig_led_probe,
 	.driver		= {
 		.name		= "leds-netxbig",
-		.of_match_table	= of_match_ptr(of_netxbig_leds_match),
+		.of_match_table	= of_netxbig_leds_match,
 	},
 };
 
diff --git a/include/linux/platform_data/leds-kirkwood-netxbig.h b/include/linux/platform_data/leds-kirkwood-netxbig.h
deleted file mode 100644
index 3c85a735c380..000000000000
--- a/include/linux/platform_data/leds-kirkwood-netxbig.h
+++ /dev/null
@@ -1,54 +0,0 @@
-/*
- * Platform data structure for netxbig LED driver
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#ifndef __LEDS_KIRKWOOD_NETXBIG_H
-#define __LEDS_KIRKWOOD_NETXBIG_H
-
-struct netxbig_gpio_ext {
-	unsigned	*addr;
-	int		num_addr;
-	unsigned	*data;
-	int		num_data;
-	unsigned	enable;
-};
-
-enum netxbig_led_mode {
-	NETXBIG_LED_OFF,
-	NETXBIG_LED_ON,
-	NETXBIG_LED_SATA,
-	NETXBIG_LED_TIMER1,
-	NETXBIG_LED_TIMER2,
-	NETXBIG_LED_MODE_NUM,
-};
-
-#define NETXBIG_LED_INVALID_MODE NETXBIG_LED_MODE_NUM
-
-struct netxbig_led_timer {
-	unsigned long		delay_on;
-	unsigned long		delay_off;
-	enum netxbig_led_mode	mode;
-};
-
-struct netxbig_led {
-	const char	*name;
-	const char	*default_trigger;
-	int		mode_addr;
-	int		*mode_val;
-	int		bright_addr;
-	int		bright_max;
-};
-
-struct netxbig_led_platform_data {
-	struct netxbig_gpio_ext	*gpio_ext;
-	struct netxbig_led_timer *timer;
-	int			num_timer;
-	struct netxbig_led	*leds;
-	int			num_leds;
-};
-
-#endif /* __LEDS_KIRKWOOD_NETXBIG_H */
-- 
2.17.1

