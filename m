Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2700245EFA9
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 15:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377738AbhKZOQO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 09:16:14 -0500
Received: from thoth.sbs.de ([192.35.17.2]:47654 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349251AbhKZOOL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Nov 2021 09:14:11 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQEAWFi018575
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 15:10:32 +0100
Received: from localhost.localdomain ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQEAUXG030519;
        Fri, 26 Nov 2021 15:10:31 +0100
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
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
Subject: [PATCH v4 1/4] platform/x86: simatic-ipc: add main driver for Siemens devices
Date:   Fri, 26 Nov 2021 15:10:24 +0100
Message-Id: <20211126141027.16161-2-henning.schild@siemens.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211126141027.16161-1-henning.schild@siemens.com>
References: <20211126141027.16161-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This mainly implements detection of these devices and will allow
secondary drivers to work on such machines.

The identification is DMI-based with a vendor specific way to tell them
apart in a reliable way.

Drivers for LEDs and Watchdogs will follow to make use of that platform
detection.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/platform/x86/Kconfig                  |  12 ++
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/simatic-ipc.c            | 168 ++++++++++++++++++
 .../platform_data/x86/simatic-ipc-base.h      |  29 +++
 include/linux/platform_data/x86/simatic-ipc.h |  72 ++++++++
 5 files changed, 284 insertions(+)
 create mode 100644 drivers/platform/x86/simatic-ipc.c
 create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
 create mode 100644 include/linux/platform_data/x86/simatic-ipc.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7400bc5da5be..a59f3bff5ae1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1075,6 +1075,18 @@ config INTEL_SCU_IPC_UTIL
 	  low level access for debug work and updating the firmware. Say
 	  N unless you will be doing this on an Intel MID platform.
 
+config SIEMENS_SIMATIC_IPC
+	tristate "Siemens Simatic IPC Class driver"
+	depends on PCI
+	help
+	  This Simatic IPC class driver is the central of several drivers. It
+	  is mainly used for system identification, after which drivers in other
+	  classes will take care of driving specifics of those machines.
+	  i.e. LEDs and watchdog.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called simatic-ipc.
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 219478061683..310d1d2a0886 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -123,3 +123,6 @@ obj-$(CONFIG_INTEL_SCU_PLATFORM)	+= intel_scu_pltdrv.o
 obj-$(CONFIG_INTEL_SCU_WDT)		+= intel_scu_wdt.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
 obj-$(CONFIG_PMC_ATOM)			+= pmc_atom.o
+
+# Siemens Simatic Industrial PCs
+obj-$(CONFIG_SIEMENS_SIMATIC_IPC)	+= simatic-ipc.o
diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
new file mode 100644
index 000000000000..3f51fb52150c
--- /dev/null
+++ b/drivers/platform/x86/simatic-ipc.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Siemens SIMATIC IPC platform driver
+ *
+ * Copyright (c) Siemens AG, 2018-2021
+ *
+ * Authors:
+ *  Henning Schild <henning.schild@siemens.com>
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/dmi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_data/x86/simatic-ipc.h>
+#include <linux/platform_device.h>
+
+static struct platform_device *ipc_led_platform_device;
+static struct platform_device *ipc_wdt_platform_device;
+
+static const struct dmi_system_id simatic_ipc_whitelist[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
+		},
+	},
+	{}
+};
+
+static struct simatic_ipc_platform platform_data;
+
+static struct {
+	u32 station_id;
+	u8 led_mode;
+	u8 wdt_mode;
+} device_modes[] = {
+	{SIMATIC_IPC_IPC127E, SIMATIC_IPC_DEVICE_127E, SIMATIC_IPC_DEVICE_NONE},
+	{SIMATIC_IPC_IPC227D, SIMATIC_IPC_DEVICE_227D, SIMATIC_IPC_DEVICE_NONE},
+	{SIMATIC_IPC_IPC227E, SIMATIC_IPC_DEVICE_427E, SIMATIC_IPC_DEVICE_227E},
+	{SIMATIC_IPC_IPC277E, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_227E},
+	{SIMATIC_IPC_IPC427D, SIMATIC_IPC_DEVICE_427E, SIMATIC_IPC_DEVICE_NONE},
+	{SIMATIC_IPC_IPC427E, SIMATIC_IPC_DEVICE_427E, SIMATIC_IPC_DEVICE_427E},
+	{SIMATIC_IPC_IPC477E, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_427E},
+};
+
+static int register_platform_devices(u32 station_id)
+{
+	u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
+	u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
+	int i;
+
+	platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
+
+	for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
+		if (device_modes[i].station_id == station_id) {
+			ledmode = device_modes[i].led_mode;
+			wdtmode = device_modes[i].wdt_mode;
+			break;
+		}
+	}
+
+	if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
+		platform_data.devmode = ledmode;
+		ipc_led_platform_device =
+			platform_device_register_data(NULL,
+				KBUILD_MODNAME "_leds", PLATFORM_DEVID_NONE,
+				&platform_data,
+				sizeof(struct simatic_ipc_platform));
+		if (IS_ERR(ipc_led_platform_device))
+			return PTR_ERR(ipc_led_platform_device);
+
+		pr_debug("device=%s created\n",
+			 ipc_led_platform_device->name);
+	}
+
+	if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
+		platform_data.devmode = wdtmode;
+		ipc_wdt_platform_device =
+			platform_device_register_data(NULL,
+				KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
+				&platform_data,
+				sizeof(struct simatic_ipc_platform));
+		if (IS_ERR(ipc_wdt_platform_device))
+			return PTR_ERR(ipc_wdt_platform_device);
+
+		pr_debug("device=%s created\n",
+			 ipc_wdt_platform_device->name);
+	}
+
+	if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
+	    wdtmode == SIMATIC_IPC_DEVICE_NONE) {
+		pr_warn("unsupported IPC detected, station id=%08x\n",
+			station_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* FIXME: this should eventually be done with generic P2SB discovery code */
+/*
+ * Get membase address from PCI, used in leds and wdt module. Here we read
+ * the bar0. The final address calculation is done in the appropriate modules
+ */
+u32 simatic_ipc_get_membase0(unsigned int p2sb)
+{
+	struct pci_bus *bus;
+	u32 bar0 = 0;
+	/*
+	 * The GPIO memory is in bar0 of the hidden P2SB device.
+	 * Unhide the device to have a quick look at it, before we hide it
+	 * again.
+	 * Also grab the pci rescan lock so that device does not get discovered
+	 * and remapped while it is visible.
+	 * This code is inspired by drivers/mfd/lpc_ich.c
+	 */
+	bus = pci_find_bus(0, 0);
+	pci_lock_rescan_remove();
+	pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
+	pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
+
+	bar0 &= ~0xf;
+	pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
+	pci_unlock_rescan_remove();
+
+	return bar0;
+}
+EXPORT_SYMBOL(simatic_ipc_get_membase0);
+
+static int __init simatic_ipc_init_module(void)
+{
+	const struct dmi_system_id *match;
+	u32 station_id;
+	int err;
+
+	match = dmi_first_match(simatic_ipc_whitelist);
+	if (!match)
+		return 0;
+
+	err = dmi_walk(simatic_ipc_find_dmi_entry_helper, &station_id);
+
+	if (err || station_id == SIMATIC_IPC_INVALID_STATION_ID) {
+		pr_warn("DMI entry %d not found\n", SIMATIC_IPC_DMI_ENTRY_OEM);
+		return 0;
+	}
+
+	return register_platform_devices(station_id);
+}
+
+static void __exit simatic_ipc_exit_module(void)
+{
+	platform_device_unregister(ipc_led_platform_device);
+	ipc_led_platform_device = NULL;
+
+	platform_device_unregister(ipc_wdt_platform_device);
+	ipc_wdt_platform_device = NULL;
+}
+
+module_init(simatic_ipc_init_module);
+module_exit(simatic_ipc_exit_module);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
+MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");
diff --git a/include/linux/platform_data/x86/simatic-ipc-base.h b/include/linux/platform_data/x86/simatic-ipc-base.h
new file mode 100644
index 000000000000..62d2bc774067
--- /dev/null
+++ b/include/linux/platform_data/x86/simatic-ipc-base.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Siemens SIMATIC IPC drivers
+ *
+ * Copyright (c) Siemens AG, 2018-2021
+ *
+ * Authors:
+ *  Henning Schild <henning.schild@siemens.com>
+ *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
+ */
+
+#ifndef __PLATFORM_DATA_X86_SIMATIC_IPC_BASE_H
+#define __PLATFORM_DATA_X86_SIMATIC_IPC_BASE_H
+
+#include <linux/types.h>
+
+#define SIMATIC_IPC_DEVICE_NONE 0
+#define SIMATIC_IPC_DEVICE_227D 1
+#define SIMATIC_IPC_DEVICE_427E 2
+#define SIMATIC_IPC_DEVICE_127E 3
+#define SIMATIC_IPC_DEVICE_227E 4
+
+struct simatic_ipc_platform {
+	u8	devmode;
+};
+
+u32 simatic_ipc_get_membase0(unsigned int p2sb);
+
+#endif /* __PLATFORM_DATA_X86_SIMATIC_IPC_BASE_H */
diff --git a/include/linux/platform_data/x86/simatic-ipc.h b/include/linux/platform_data/x86/simatic-ipc.h
new file mode 100644
index 000000000000..f3b76b39776b
--- /dev/null
+++ b/include/linux/platform_data/x86/simatic-ipc.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Siemens SIMATIC IPC drivers
+ *
+ * Copyright (c) Siemens AG, 2018-2021
+ *
+ * Authors:
+ *  Henning Schild <henning.schild@siemens.com>
+ *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
+ */
+
+#ifndef __PLATFORM_DATA_X86_SIMATIC_IPC_H
+#define __PLATFORM_DATA_X86_SIMATIC_IPC_H
+
+#include <linux/dmi.h>
+#include <linux/platform_data/x86/simatic-ipc-base.h>
+
+#define SIMATIC_IPC_DMI_ENTRY_OEM	129
+/* binary type */
+#define SIMATIC_IPC_DMI_TYPE		0xff
+#define SIMATIC_IPC_DMI_GROUP		0x05
+#define SIMATIC_IPC_DMI_ENTRY		0x02
+#define SIMATIC_IPC_DMI_TID		0x02
+
+enum simatic_ipc_station_ids {
+	SIMATIC_IPC_INVALID_STATION_ID = 0,
+	SIMATIC_IPC_IPC227D = 0x00000501,
+	SIMATIC_IPC_IPC427D = 0x00000701,
+	SIMATIC_IPC_IPC227E = 0x00000901,
+	SIMATIC_IPC_IPC277E = 0x00000902,
+	SIMATIC_IPC_IPC427E = 0x00000A01,
+	SIMATIC_IPC_IPC477E = 0x00000A02,
+	SIMATIC_IPC_IPC127E = 0x00000D01,
+};
+
+static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
+{
+	struct {
+		u8	type;		/* type (0xff = binary) */
+		u8	len;		/* len of data entry */
+		u8	group;
+		u8	entry;
+		u8	tid;
+		__le32	station_id;	/* station id (LE) */
+	} __packed * data_entry = (void *)data + sizeof(struct dmi_header);
+
+	while ((u8 *)data_entry < data + max_len) {
+		if (data_entry->type == SIMATIC_IPC_DMI_TYPE &&
+		    data_entry->len == sizeof(*data_entry) &&
+		    data_entry->group == SIMATIC_IPC_DMI_GROUP &&
+		    data_entry->entry == SIMATIC_IPC_DMI_ENTRY &&
+		    data_entry->tid == SIMATIC_IPC_DMI_TID) {
+			return le32_to_cpu(data_entry->station_id);
+		}
+		data_entry = (void *)((u8 *)(data_entry) + data_entry->len);
+	}
+
+	return SIMATIC_IPC_INVALID_STATION_ID;
+}
+
+static inline void
+simatic_ipc_find_dmi_entry_helper(const struct dmi_header *dh, void *_data)
+{
+	u32 *id = _data;
+
+	if (dh->type != SIMATIC_IPC_DMI_ENTRY_OEM)
+		return;
+
+	*id = simatic_ipc_get_station_id((u8 *)dh, dh->length);
+}
+
+#endif /* __PLATFORM_DATA_X86_SIMATIC_IPC_H */
-- 
2.32.0

