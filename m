Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF3232B23A
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhCCCkl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:40:41 -0500
Received: from gecko.sbs.de ([194.138.37.40]:59937 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238754AbhCBRNj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 2 Mar 2021 12:13:39 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 122GhEw0015430
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 2 Mar 2021 17:43:14 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.44.113])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 122GXBHQ025192;
        Tue, 2 Mar 2021 17:33:13 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Henning Schild <henning.schild@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH 3/4] watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
Date:   Tue,  2 Mar 2021 17:33:08 +0100
Message-Id: <20210302163309.25528-4-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302163309.25528-1-henning.schild@siemens.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Henning Schild <henning.schild@siemens.com>

This driver adds initial support for several devices from Siemens. It is
based on a platform driver introduced in an earlier commit.

Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/watchdog/Kconfig           |  11 ++
 drivers/watchdog/Makefile          |   1 +
 drivers/watchdog/simatic-ipc-wdt.c | 305 +++++++++++++++++++++++++++++
 3 files changed, 317 insertions(+)
 create mode 100644 drivers/watchdog/simatic-ipc-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 1fe0042a48d2..948497eb4bef 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1575,6 +1575,17 @@ config NIC7018_WDT
 	  To compile this driver as a module, choose M here: the module will be
 	  called nic7018_wdt.
 
+config SIEMENS_SIMATIC_IPC_WDT
+	tristate "Siemens Simatic IPC Watchdog"
+	depends on SIEMENS_SIMATIC_IPC
+	select WATCHDOG_CORE
+	help
+	  This driver adds support for several watchdogs found in Industrial
+	  PCs from Siemens.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called simatic-ipc-wdt.
+
 # M68K Architecture
 
 config M54xx_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f3a6540e725e..7f5c73ec058c 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
 obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
+obj-$(CONFIG_SIEMENS_SIMATIC_IPC_WDT) += simatic-ipc-wdt.o
 
 # M68K Architecture
 obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
new file mode 100644
index 000000000000..b5c8b7ceb404
--- /dev/null
+++ b/drivers/watchdog/simatic-ipc-wdt.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Siemens SIMATIC IPC driver for Watchdogs
+ *
+ * Copyright (c) Siemens AG, 2020-2021
+ *
+ * Authors:
+ *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/errno.h>
+#include <linux/watchdog.h>
+#include <linux/ioport.h>
+#include <linux/sizes.h>
+#include <linux/io.h>
+#include <linux/platform_data/x86/simatic-ipc-base.h>
+
+#define WD_ENABLE_IOADR		0x62
+#define WD_TRIGGER_IOADR	0x66
+#define GPIO_COMMUNITY0_PORT_ID 0xaf
+#define PAD_CFG_DW0_GPP_A_23	0x4b8
+#define SAFE_EN_N_427E		0x01
+#define SAFE_EN_N_227E		0x04
+#define WD_ENABLED		0x01
+
+#define TIMEOUT_MIN	2
+#define TIMEOUT_DEF	64
+#define TIMEOUT_MAX	64
+
+#define GP_STATUS_REG_227E	0x404D	/* IO PORT for SAFE_EN_N on 227E */
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0000);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static DEFINE_SPINLOCK(io_lock);	/* the lock for io operations */
+static struct watchdog_device wdd;
+
+static struct resource gp_status_reg_227e_res =
+	DEFINE_RES_IO_NAMED(GP_STATUS_REG_227E, SZ_1, KBUILD_MODNAME);
+
+static struct resource io_resource =
+	DEFINE_RES_IO_NAMED(WD_ENABLE_IOADR, SZ_1,
+			    KBUILD_MODNAME " WD_ENABLE_IOADR");
+
+/* the actual start will be discovered with pci, 0 is a placeholder */
+static struct resource mem_resource =
+	DEFINE_RES_MEM_NAMED(0, SZ_4, "WD_RESET_BASE_ADR");
+
+static u32 wd_timeout_table[] = {2, 4, 6, 8, 16, 32, 48, 64 };
+static void __iomem *wd_reset_base_addr;
+
+static int get_timeout_idx(u32 timeout)
+{
+	int i;
+
+	i = ARRAY_SIZE(wd_timeout_table) - 1;
+	for (; i >= 0; i--) {
+		if (timeout >= wd_timeout_table[i])
+			break;
+	}
+
+	return i;
+}
+
+static int wd_start(struct watchdog_device *wdd)
+{
+	u8 regval;
+
+	spin_lock(&io_lock);
+
+	regval = inb(WD_ENABLE_IOADR);
+	regval |= WD_ENABLED;
+	outb(regval, WD_ENABLE_IOADR);
+
+	spin_unlock(&io_lock);
+
+	return 0;
+}
+
+static int wd_stop(struct watchdog_device *wdd)
+{
+	u8 regval;
+
+	spin_lock(&io_lock);
+
+	regval = inb(WD_ENABLE_IOADR);
+	regval &= ~WD_ENABLED;
+	outb(regval, WD_ENABLE_IOADR);
+
+	spin_unlock(&io_lock);
+
+	return 0;
+}
+
+static int wd_ping(struct watchdog_device *wdd)
+{
+	inb(WD_TRIGGER_IOADR);
+	return 0;
+}
+
+static int wd_set_timeout(struct watchdog_device *wdd, unsigned int t)
+{
+	u8 regval;
+	int timeout_idx = get_timeout_idx(t);
+
+	spin_lock(&io_lock);
+
+	regval = inb(WD_ENABLE_IOADR) & 0xc7;
+	regval |= timeout_idx << 3;
+	outb(regval, WD_ENABLE_IOADR);
+
+	spin_unlock(&io_lock);
+	wdd->timeout = wd_timeout_table[timeout_idx];
+
+	return 0;
+}
+
+static const struct watchdog_info wdt_ident = {
+	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
+			  WDIOF_SETTIMEOUT,
+	.identity	= KBUILD_MODNAME,
+};
+
+static const struct watchdog_ops wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= wd_start,
+	.stop		= wd_stop,
+	.ping		= wd_ping,
+	.set_timeout	= wd_set_timeout,
+};
+
+static void wd_set_safe_en_n(u32 wdtmode, bool safe_en_n)
+{
+	u16 resetbit;
+
+	if (wdtmode == SIMATIC_IPC_DEVICE_227E) {
+		/* enable SAFE_EN_N on GP_STATUS_REG_227E */
+		resetbit = inw(GP_STATUS_REG_227E);
+		if (safe_en_n)
+			resetbit &= ~SAFE_EN_N_227E;
+		else
+			resetbit |= SAFE_EN_N_227E;
+
+		outw(resetbit, GP_STATUS_REG_227E);
+	} else {
+		/* enable SAFE_EN_N on PCH D1600 */
+		resetbit = ioread16(wd_reset_base_addr);
+
+		if (safe_en_n)
+			resetbit &= ~SAFE_EN_N_427E;
+		else
+			resetbit |= SAFE_EN_N_427E;
+
+		iowrite16(resetbit, wd_reset_base_addr);
+	}
+}
+
+static int wd_setup(u32 wdtmode, bool safe_en_n)
+{
+	u8 regval;
+	int timeout_idx = 0;
+	bool alarm_active;
+
+	timeout_idx = get_timeout_idx(TIMEOUT_DEF);
+
+	wd_set_safe_en_n(wdtmode, safe_en_n);
+
+	/* read wd register to determine alarm state */
+	regval = inb(WD_ENABLE_IOADR);
+	if (regval & 0x80) {
+		pr_warn("Watchdog alarm active.\n");
+		regval = 0x82;	/* use only macro mode, reset alarm bit */
+		alarm_active = true;
+	} else {
+		regval = 0x02;	/* use only macro mode */
+		alarm_active = false;
+	}
+
+	regval |= timeout_idx << 3;
+	if (nowayout)
+		regval |= WD_ENABLED;
+
+	outb(regval, WD_ENABLE_IOADR);
+
+	return alarm_active;
+}
+
+static int simatic_ipc_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc = 0;
+	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
+	struct resource *res;
+
+	pr_debug(KBUILD_MODNAME ":%s(#%d) WDT mode: %d\n",
+		 __func__, __LINE__, plat->devmode);
+
+	switch (plat->devmode) {
+	case SIMATIC_IPC_DEVICE_227E:
+		if (!devm_request_region(dev, gp_status_reg_227e_res.start,
+					 resource_size(&gp_status_reg_227e_res),
+					 KBUILD_MODNAME)) {
+			dev_err(dev,
+				"Unable to register IO resource at %pR\n",
+				&gp_status_reg_227e_res);
+			return -EBUSY;
+		}
+		fallthrough;
+	case SIMATIC_IPC_DEVICE_427E:
+		wdd.info = &wdt_ident;
+		wdd.ops = &wdt_ops;
+		wdd.min_timeout = TIMEOUT_MIN;
+		wdd.max_timeout = TIMEOUT_MAX;
+		wdd.parent = NULL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!devm_request_region(dev, io_resource.start,
+				 resource_size(&io_resource),
+				 io_resource.name)) {
+		dev_err(dev,
+			"Unable to register IO resource at %#x\n",
+			WD_ENABLE_IOADR);
+		return -EBUSY;
+	}
+
+	if (plat->devmode == SIMATIC_IPC_DEVICE_427E) {
+		res = &mem_resource;
+
+		/* get GPIO base from PCI */
+		res->start = simatic_ipc_get_membase0(PCI_DEVFN(0x1f, 1));
+		if (res->start == 0)
+			return -ENODEV;
+
+		/* do the final address calculation */
+		res->start = res->start + (GPIO_COMMUNITY0_PORT_ID << 16) +
+			     PAD_CFG_DW0_GPP_A_23;
+		res->end += res->start;
+
+		wd_reset_base_addr = devm_ioremap_resource(dev, res);
+		if (IS_ERR(wd_reset_base_addr))
+			return -ENOMEM;
+	}
+
+	wdd.bootstatus = wd_setup(plat->devmode, true);
+	if (wdd.bootstatus)
+		pr_warn(KBUILD_MODNAME ": last reboot caused by watchdog reset\n");
+
+	watchdog_set_nowayout(&wdd, nowayout);
+	watchdog_stop_on_reboot(&wdd);
+
+	rc = devm_watchdog_register_device(dev, &wdd);
+
+	if (rc == 0)
+		pr_debug("initialized. nowayout=%d\n",
+			 nowayout);
+
+	return rc;
+}
+
+static int simatic_ipc_wdt_remove(struct platform_device *pdev)
+{
+	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
+
+	wd_setup(plat->devmode, false);
+	return 0;
+}
+
+static struct platform_driver wdt_driver = {
+	.probe = simatic_ipc_wdt_probe,
+	.remove = simatic_ipc_wdt_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	},
+};
+
+static int __init simatic_ipc_wdt_init(void)
+{
+	return platform_driver_register(&wdt_driver);
+}
+
+static void __exit simatic_ipc_wdt_exit(void)
+{
+	platform_driver_unregister(&wdt_driver);
+}
+
+module_init(simatic_ipc_wdt_init);
+module_exit(simatic_ipc_wdt_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
-- 
2.26.2

