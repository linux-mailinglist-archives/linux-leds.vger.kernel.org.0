Return-Path: <linux-leds+bounces-2602-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F096B8EC
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 12:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20C16B223ED
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE165635;
	Wed,  4 Sep 2024 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLqUjR2B"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2551CF29F;
	Wed,  4 Sep 2024 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725446857; cv=none; b=SfxlYjNHiPtRbRbt2Y4FokgYvsWOdMUiPvHzsALxNFQUGTc6eAmOUPGPqGjx9HvVtTdOZjpJtvpnyrn4+RRvFrG40n7QPgcLyUOsVmm8L5WVmfn8SfdKTV6816km3x9+pvqm4kRLQfBsdJGH4GBLOVlTT2dcPD+h6zlJ5BrKaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725446857; c=relaxed/simple;
	bh=Mfl7zs7DwIYM2ePqU32hivqn7SfVB0MWIV3u2/6WprU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVo13kTD3FLyusVj9DWY8WJs5GLosXDhtSb8gNbkbjfYjmb+vFsgXXkhToPNI4ri9we8FTIPLDgBUK2+cSelHBnCbhgcIbkYIIjF0P7YQSHgwvtamo4RkBtgTs4o05FkFwGMDXLbjwcP8QFhanr12rS2e3CVp1VRi/O6yYafGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLqUjR2B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725446856; x=1756982856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mfl7zs7DwIYM2ePqU32hivqn7SfVB0MWIV3u2/6WprU=;
  b=FLqUjR2BAs21bNiVDOJu6yPwkOtUqmwaxSZUqRhIhHq+8jmH2kH5IbQO
   F/wq634krbQRZigWxZuDF8cdgtjR4m3vgs03qZT0N2xi3BI9kDhFL1W4H
   e+oNLeJMbsMvNRYkvoGKKqGtm6KrO+62XsyZy1H0nVeErItd179DGp09l
   k//zEMIGwe4WjyQzHFI4fN86UVcAxfN0hpXxpxwawBdzrvz2aoirG6ZR+
   BKVRPdrvOISVcb7+EEXXL9/BSb4U11+VwHwcvCmgIbWlPUqk8YdHNzBcB
   0iOJcdOXH+oYczx0viKoGaMeL3Q2zyUcoR3LitGC2BvaPBvqqFNjHOBjE
   w==;
X-CSE-ConnectionGUID: +/W9bBWIQOCTdOJsiHpWIg==
X-CSE-MsgGUID: swlQKq/kQ1C1KrM7X4TK5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24261261"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24261261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 03:47:35 -0700
X-CSE-ConnectionGUID: 1n53pTYCTsebzGwCAZY/gA==
X-CSE-MsgGUID: JH7Ccg25QP2VP0zUTGvYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="102636647"
Received: from mtkaczyk-dev.igk.intel.com ([10.102.108.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 03:47:31 -0700
From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
To: linux-pci@vger.kernel.org
Cc: linux-leds@vger.kernel.org,
	Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Christoph Hellwig <hch@lst.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Marek Behun <marek.behun@nic.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v7 2/3] PCI/NPEM: Add Native PCIe Enclosure Management support
Date: Wed,  4 Sep 2024 12:48:47 +0200
Message-Id: <20240904104848.23480-3-mariusz.tkaczyk@linux.intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240904104848.23480-1-mariusz.tkaczyk@linux.intel.com>
References: <20240904104848.23480-1-mariusz.tkaczyk@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Native PCIe Enclosure Management (NPEM, PCIe r6.1 sec 6.28) allows
managing LED in storage enclosures. NPEM is indication oriented
and it does not give direct access to LED. Although each of
the indications *could* represent an individual LED, multiple
indications could also be represented as a single,
multi-color LED or a single LED blinking in a specific interval.
The specification leaves that open.

Each enabled indication (capability register bit on) is represented as a
ledclass_dev which can be controlled through sysfs. For every ledclass
device only 2 brightness states are allowed: LED_ON (1) or LED_OFF (0).
It is corresponding to NPEM control register (Indication bit on/off).

Ledclass devices appear in sysfs as child devices (subdirectory) of PCI
device which has an NPEM Extended Capability and indication is enabled
in NPEM capability register. For example, these are leds created for
pcieport "10000:02:05.0" on my setup:

leds/
├── 10000:02:05.0:enclosure:fail
├── 10000:02:05.0:enclosure:locate
├── 10000:02:05.0:enclosure:ok
└── 10000:02:05.0:enclosure:rebuild

They can be also found in "/sys/class/leds" directory. Parent PCIe device
bdf is used to guarantee uniqueness across leds subsystem.

To enable/disable fail indication "brightness" file can be edited:
echo 1 > ./leds/10000:02:05.0:enclosure:fail/brightness
echo 0 > ./leds/10000:02:05.0:enclosure:fail/brightness

PCIe r6.1, sec 7.9.19.2 defines the possible indications.

Multiple indications for same parent PCIe device can conflict and
hardware may update them when processing new request. To avoid issues,
driver refresh all indications by reading back control register.

Driver is projected to be exclusive NPEM extended capability manager.
It waits up to 1 second after imposing new request, it doesn't verify if
controller is busy before write, assuming that mutex lock gives protection
from concurrent updates.

Driver is not registered if _DSM LED management is available
respectfully to PCI Firmware Spec r3.3 sec 4.7. In next patch
DSM support is added, therefore info message is added to log
backend chosen.

NPEM is a PCIe extended capability so it should be registered in
pcie_init_capabilities() but it is not possible due to LED dependency.
Parent pci_device must be added earlier for led_classdev_register()
to be successful. NPEM does not require configuration on kernel side, it
is safe to register LED devices later.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-bus-pci |  63 ++++
 drivers/pci/Kconfig                     |   9 +
 drivers/pci/Makefile                    |   1 +
 drivers/pci/npem.c                      | 425 ++++++++++++++++++++++++
 drivers/pci/pci.h                       |   8 +
 drivers/pci/probe.c                     |   2 +
 drivers/pci/remove.c                    |   2 +
 include/linux/pci.h                     |   3 +
 include/uapi/linux/pci_regs.h           |  35 ++
 9 files changed, 548 insertions(+)
 create mode 100644 drivers/pci/npem.c

diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
index ecf47559f495..9ddbb1364698 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci
+++ b/Documentation/ABI/testing/sysfs-bus-pci
@@ -500,3 +500,66 @@ Description:
 		console drivers from the device.  Raw users of pci-sysfs
 		resourceN attributes must be terminated prior to resizing.
 		Success of the resizing operation is not guaranteed.
+
+What:		/sys/bus/pci/devices/.../leds/*:enclosure:*/brightness
+What:		/sys/class/leds/*:enclosure:*/brightness
+Date:		August 2024
+KernelVersion:	6.12
+Description:
+		LED indications on PCIe storage enclosures which are controlled
+		through the NPEM interface (Native PCIe Enclosure Management,
+		PCIe r6.1 sec 6.28) are accessible as led class devices, both
+		below /sys/class/leds and below NPEM-capable PCI devices.
+
+		Although these led class devices could be manipulated manually,
+		in practice they are typically manipulated automatically by an
+		application such as ledmon(8).
+
+		The name of a led class device is as follows:
+		<bdf>:enclosure:<indication>
+		where:
+
+		- <bdf> is the domain, bus, device and function number
+		  (e.g. 10000:02:05.0)
+		- <indication> is a short description of the LED indication
+
+		Valid indications per PCIe r6.1 table 6-27 are:
+
+		- ok (drive is functioning normally)
+		- locate (drive is being identified by an admin)
+		- fail (drive is not functioning properly)
+		- rebuild (drive is part of an array that is rebuilding)
+		- pfa (drive is predicted to fail soon)
+		- hotspare (drive is marked to be used as a replacement)
+		- ica (drive is part of an array that is degraded)
+		- ifa (drive is part of an array that is failed)
+		- idt (drive is not the right type for the connector)
+		- disabled (drive is disabled, removal is safe)
+		- specific0 to specific7 (enclosure-specific indications)
+
+		Broadly, the indications fall into one of these categories:
+
+		- to signify drive state (ok, locate, fail, idt, disabled)
+		- to signify drive role or state in a software RAID array
+		  (rebuild, pfa, hotspare, ica, ifa)
+		- to signify any other role or state (specific0 to specific7)
+
+		Mandatory indications per PCIe r6.1 sec 7.9.19.2 comprise:
+		ok, locate, fail, rebuild. All others are optional.
+		A led class device is only visible if the corresponding
+		indication is supported by the device.
+
+		To manipulate the indications, write 0 (LED_OFF) or 1 (LED_ON)
+		to the "brightness" file. Note that manipulating an indication
+		may implicitly manipulate other indications at the vendor's
+		discretion. E.g. when the user lights up the "ok" indication,
+		the vendor may choose to automatically turn off the "fail"
+		indication. The current state of an indication can be
+		retrieved by reading its "brightness" file.
+
+		The PCIe Base Specification allows vendors leeway to choose
+		different colors or blinking patterns for the indications,
+		but they typically follow the IBPI standard. E.g. the "locate"
+		indication is usually presented as one or two LEDs blinking at
+		4 Hz frequency:
+		https://en.wikipedia.org/wiki/International_Blinking_Pattern_Interpretation
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index aa4d1833f442..0d94e4a967d8 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -143,6 +143,15 @@ config PCI_IOV
 
 	  If unsure, say N.
 
+config PCI_NPEM
+	bool "Native PCIe Enclosure Management"
+	depends on LEDS_CLASS=y
+	help
+	  Support for Native PCIe Enclosure Management. It allows managing LED
+	  indications in storage enclosures. Enclosure must support following
+	  indications: OK, Locate, Fail, Rebuild, other indications are
+	  optional.
+
 config PCI_PRI
 	bool "PCI PRI support"
 	select PCI_ATS
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 8ddad57934a6..374c5c06d92f 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
 obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
 obj-$(CONFIG_PCI_DOE)		+= doe.o
 obj-$(CONFIG_PCI_DYNAMIC_OF_NODES) += of_property.o
+obj-$(CONFIG_PCI_NPEM)		+= npem.o
 
 # Endpoint library must be initialized before its users
 obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
diff --git a/drivers/pci/npem.c b/drivers/pci/npem.c
new file mode 100644
index 000000000000..b2beb809bc58
--- /dev/null
+++ b/drivers/pci/npem.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCIe Enclosure management driver created for LED interfaces based on
+ * indications. It says *what indications* blink but does not specify *how*
+ * they blink - it is hardware defined.
+ *
+ * The driver name refers to Native PCIe Enclosure Management. It is
+ * first indication oriented standard with specification.
+ *
+ * Native PCIe Enclosure Management (NPEM)
+ *	PCIe Base Specification r6.1 sec 6.28
+ *	PCIe Base Specification r6.1 sec 7.9.19
+ *
+ * Copyright (c) 2023-2024 Intel Corporation
+ *	Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/errno.h>
+#include <linux/iopoll.h>
+#include <linux/leds.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pci_regs.h>
+#include <linux/types.h>
+#include <linux/uleds.h>
+
+#include "pci.h"
+
+struct indication {
+	u32 bit;
+	const char *name;
+};
+
+static const struct indication npem_indications[] = {
+	{PCI_NPEM_IND_OK,	"enclosure:ok"},
+	{PCI_NPEM_IND_LOCATE,	"enclosure:locate"},
+	{PCI_NPEM_IND_FAIL,	"enclosure:fail"},
+	{PCI_NPEM_IND_REBUILD,	"enclosure:rebuild"},
+	{PCI_NPEM_IND_PFA,	"enclosure:pfa"},
+	{PCI_NPEM_IND_HOTSPARE,	"enclosure:hotspare"},
+	{PCI_NPEM_IND_ICA,	"enclosure:ica"},
+	{PCI_NPEM_IND_IFA,	"enclosure:ifa"},
+	{PCI_NPEM_IND_IDT,	"enclosure:idt"},
+	{PCI_NPEM_IND_DISABLED,	"enclosure:disabled"},
+	{PCI_NPEM_IND_SPEC_0,	"enclosure:specific_0"},
+	{PCI_NPEM_IND_SPEC_1,	"enclosure:specific_1"},
+	{PCI_NPEM_IND_SPEC_2,	"enclosure:specific_2"},
+	{PCI_NPEM_IND_SPEC_3,	"enclosure:specific_3"},
+	{PCI_NPEM_IND_SPEC_4,	"enclosure:specific_4"},
+	{PCI_NPEM_IND_SPEC_5,	"enclosure:specific_5"},
+	{PCI_NPEM_IND_SPEC_6,	"enclosure:specific_6"},
+	{PCI_NPEM_IND_SPEC_7,	"enclosure:specific_7"},
+	{0,			NULL}
+};
+
+#define for_each_indication(ind, inds) \
+	for (ind = inds; ind->bit; ind++)
+
+/*
+ * The driver has internal list of supported indications. Ideally, the driver
+ * should not touch bits that are not defined and for which LED devices are
+ * not exposed but in reality, it needs to turn them off.
+ *
+ * Otherwise, there will be no possibility to turn off indications turned on by
+ * other utilities or turned on by default and it leads to bad user experience.
+ *
+ * Additionally, it excludes NPEM commands like RESET or ENABLE.
+ */
+static u32 reg_to_indications(u32 caps, const struct indication *inds)
+{
+	const struct indication *ind;
+	u32 supported_indications = 0;
+
+	for_each_indication(ind, inds)
+		supported_indications |= ind->bit;
+
+	return caps & supported_indications;
+}
+
+/**
+ * struct npem_led - LED details
+ * @indication: indication details
+ * @npem: npem device
+ * @name: LED name
+ * @led: LED device
+ */
+struct npem_led {
+	const struct indication *indication;
+	struct npem *npem;
+	char name[LED_MAX_NAME_SIZE];
+	struct led_classdev led;
+};
+
+/**
+ * struct npem_ops - backend specific callbacks
+ * @get_active_indications: get active indications
+ *	npem: npem device
+ *	inds: response buffer
+ * @set_active_indications: set new indications
+ *	npem: npem device
+ *	inds: bit mask to set
+ * @inds: supported indications array, set of indications is backend specific
+ * @name: backend name
+ */
+struct npem_ops {
+	int (*get_active_indications)(struct npem *npem, u32 *inds);
+	int (*set_active_indications)(struct npem *npem, u32 inds);
+	const struct indication *inds;
+	const char *name;
+};
+
+/**
+ * struct npem - NPEM device properties
+ * @dev: PCIe device this driver is attached to
+ * @ops: backend specific callbacks
+ * @lock: serializes concurrent access to NPEM device by multiple LED devices
+ * @pos: cached offset of NPEM Capability Register in Configuration Space;
+ *	only used if NPEM registers are accessed directly and not through _DSM
+ * @supported_indications: cached bit mask of supported indications;
+ *	non-indication and reserved bits in the NPEM Capability Register are
+ *	cleared in this bit mask
+ * @active_indications: cached bit mask of active indications;
+ *	non-indication and reserved bits in the NPEM Control Register are
+ *	cleared in this bit mask
+ * @led_cnt: size of @leds array
+ * @leds: array containing LED class devices of all supported LEDs
+ */
+struct npem {
+	struct pci_dev *dev;
+	const struct npem_ops *ops;
+	struct mutex lock;
+	u16 pos;
+	u32 supported_indications;
+	u32 active_indications;
+	int led_cnt;
+	struct npem_led leds[];
+};
+
+static int npem_read_reg(struct npem *npem, u16 reg, u32 *val)
+{
+	int ret = pci_read_config_dword(npem->dev, npem->pos + reg, val);
+
+	return pcibios_err_to_errno(ret);
+}
+
+static int npem_write_ctrl(struct npem *npem, u32 reg)
+{
+	int pos = npem->pos + PCI_NPEM_CTRL;
+	int ret = pci_write_config_dword(npem->dev, pos, reg);
+
+	return pcibios_err_to_errno(ret);
+}
+
+static int npem_get_active_indications(struct npem *npem, u32 *inds)
+{
+	u32 ctrl;
+	int ret;
+
+	ret = npem_read_reg(npem, PCI_NPEM_CTRL, &ctrl);
+	if (ret)
+		return ret;
+
+	/* If PCI_NPEM_CTRL_ENABLE is not set then no indication should blink */
+	if (!(ctrl & PCI_NPEM_CTRL_ENABLE)) {
+		*inds = 0;
+		return 0;
+	}
+
+	*inds = ctrl & npem->supported_indications;
+
+	return 0;
+}
+
+static int npem_set_active_indications(struct npem *npem, u32 inds)
+{
+	int ctrl, ret, ret_val;
+	u32 cc_status;
+
+	lockdep_assert_held(&npem->lock);
+
+	/* This bit is always required */
+	ctrl = inds | PCI_NPEM_CTRL_ENABLE;
+
+	ret = npem_write_ctrl(npem, ctrl);
+	if (ret)
+		return ret;
+
+	/*
+	 * For the case where a NPEM command has not completed immediately,
+	 * it is recommended that software not continuously “spin” on polling
+	 * the status register, but rather poll under interrupt at a reduced
+	 * rate; for example at 10 ms intervals.
+	 *
+	 * PCIe r6.1 sec 6.28 "Implementation Note: Software Polling of NPEM
+	 * Command Completed"
+	 */
+	ret = read_poll_timeout(npem_read_reg, ret_val,
+				ret_val || (cc_status & PCI_NPEM_STATUS_CC),
+				10 * USEC_PER_MSEC, USEC_PER_SEC, false, npem,
+				PCI_NPEM_STATUS, &cc_status);
+	if (ret)
+		return ret;
+	if (ret_val)
+		return ret_val;
+
+	/*
+	 * All writes to control register, including writes that do not change
+	 * the register value, are NPEM commands and should eventually result
+	 * in a command completion indication in the NPEM Status Register.
+	 *
+	 * PCIe Base Specification r6.1 sec 7.9.19.3
+	 *
+	 * Register may not be updated, or other conflicting bits may be
+	 * cleared. Spec is not strict here. Read NPEM Control register after
+	 * write to keep cache in-sync.
+	 */
+	return npem_get_active_indications(npem, &npem->active_indications);
+}
+
+static const struct npem_ops npem_ops = {
+	.get_active_indications = npem_get_active_indications,
+	.set_active_indications = npem_set_active_indications,
+	.name = "Native PCIe Enclosure Management",
+	.inds = npem_indications,
+};
+
+#define DSM_GUID GUID_INIT(0x5d524d9d, 0xfff9, 0x4d4b, 0x8c, 0xb7, 0x74, 0x7e,\
+			   0xd5, 0x1e, 0x19, 0x4d)
+#define GET_SUPPORTED_STATES_DSM	1
+#define GET_STATE_DSM			2
+#define SET_STATE_DSM			3
+
+static const guid_t dsm_guid = DSM_GUID;
+
+static bool npem_has_dsm(struct pci_dev *pdev)
+{
+	acpi_handle handle;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return false;
+
+	return acpi_check_dsm(handle, &dsm_guid, 0x1,
+			      BIT(GET_SUPPORTED_STATES_DSM) |
+			      BIT(GET_STATE_DSM) | BIT(SET_STATE_DSM));
+}
+
+/*
+ * The status of each indicator is cached on first brightness_ get/set time and
+ * updated at write time.
+ * brightness_get() is only responsible for reflecting the last written/cached
+ * value.
+ */
+static enum led_brightness brightness_get(struct led_classdev *led)
+{
+	struct npem_led *nled = container_of(led, struct npem_led, led);
+	struct npem *npem = nled->npem;
+	int ret, val = 0;
+
+	ret = mutex_lock_interruptible(&npem->lock);
+	if (ret)
+		return ret;
+
+	if (npem->active_indications & nled->indication->bit)
+		val = 1;
+
+	mutex_unlock(&npem->lock);
+	return val;
+}
+
+static int brightness_set(struct led_classdev *led,
+			  enum led_brightness brightness)
+{
+	struct npem_led *nled = container_of(led, struct npem_led, led);
+	struct npem *npem = nled->npem;
+	u32 indications;
+	int ret;
+
+	ret = mutex_lock_interruptible(&npem->lock);
+	if (ret)
+		return ret;
+
+	if (brightness == 0)
+		indications = npem->active_indications & ~(nled->indication->bit);
+	else
+		indications = npem->active_indications | nled->indication->bit;
+
+	ret = npem->ops->set_active_indications(npem, indications);
+
+	mutex_unlock(&npem->lock);
+	return ret;
+}
+
+static void npem_free(struct npem *npem)
+{
+	struct npem_led *nled;
+	int cnt;
+
+	if (!npem)
+		return;
+
+	for (cnt = 0; cnt < npem->led_cnt; cnt++) {
+		nled = &npem->leds[cnt];
+
+		if (nled->name[0])
+			led_classdev_unregister(&nled->led);
+	}
+
+	mutex_destroy(&npem->lock);
+	kfree(npem);
+}
+
+static int pci_npem_set_led_classdev(struct npem *npem, struct npem_led *nled)
+{
+	struct led_classdev *led = &nled->led;
+	struct led_init_data init_data = {};
+	char *name = nled->name;
+	int ret;
+
+	init_data.devicename = pci_name(npem->dev);
+	init_data.default_label = nled->indication->name;
+
+	ret = led_compose_name(&npem->dev->dev, &init_data, name);
+	if (ret)
+		return ret;
+
+	led->name = name;
+	led->brightness_set_blocking = brightness_set;
+	led->brightness_get = brightness_get;
+	led->max_brightness = 1;
+	led->default_trigger = "none";
+	led->flags = 0;
+
+	ret = led_classdev_register(&npem->dev->dev, led);
+	if (ret)
+		/* Clear the name to indicate that it is not registered. */
+		name[0] = 0;
+	return ret;
+}
+
+static int pci_npem_init(struct pci_dev *dev, const struct npem_ops *ops,
+			 int pos, u32 caps)
+{
+	u32 supported = reg_to_indications(caps, ops->inds);
+	int supported_cnt = hweight32(supported);
+	const struct indication *indication;
+	struct npem_led *nled;
+	struct npem *npem;
+	int led_idx = 0;
+	int ret;
+
+	npem = kzalloc(struct_size(npem, leds, supported_cnt), GFP_KERNEL);
+	if (!npem)
+		return -ENOMEM;
+
+	npem->supported_indications = supported;
+	npem->led_cnt = supported_cnt;
+	npem->pos = pos;
+	npem->dev = dev;
+	npem->ops = ops;
+
+	ret = npem->ops->get_active_indications(npem,
+						&npem->active_indications);
+	if (ret)
+		return ret;
+
+	mutex_init(&npem->lock);
+
+	for_each_indication(indication, npem_indications) {
+		if (!(npem->supported_indications & indication->bit))
+			continue;
+
+		nled = &npem->leds[led_idx++];
+		nled->indication = indication;
+		nled->npem = npem;
+
+		ret = pci_npem_set_led_classdev(npem, nled);
+		if (ret) {
+			npem_free(npem);
+			return ret;
+		}
+	}
+
+	dev->npem = npem;
+	return 0;
+}
+
+void pci_npem_remove(struct pci_dev *dev)
+{
+	npem_free(dev->npem);
+}
+
+void pci_npem_create(struct pci_dev *dev)
+{
+	const struct npem_ops *ops = &npem_ops;
+	int pos = 0, ret;
+	u32 cap;
+
+	if (!npem_has_dsm(dev)) {
+		pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_NPEM);
+		if (pos == 0)
+			return;
+
+		if (pci_read_config_dword(dev, pos + PCI_NPEM_CAP, &cap) != 0 ||
+		    (cap & PCI_NPEM_CAP_CAPABLE) == 0)
+			return;
+	} else {
+		/*
+		 * OS should use the DSM for LED control if it is available
+		 * PCI Firmware Spec r3.3 sec 4.7.
+		 */
+		pci_info(dev, "Not configuring %s because _DSM is present\n",
+			 ops->name);
+		return;
+	}
+
+	pci_info(dev, "Configuring %s\n", ops->name);
+
+	ret = pci_npem_init(dev, ops, pos, cap);
+	if (ret)
+		pci_err(dev, "Failed to register %s, err: %d\n", ops->name,
+			ret);
+}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 79c8398f3938..554fd9dfe25c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -398,6 +398,14 @@ static inline void pci_doe_destroy(struct pci_dev *pdev) { }
 static inline void pci_doe_disconnected(struct pci_dev *pdev) { }
 #endif
 
+#ifdef CONFIG_PCI_NPEM
+void pci_npem_create(struct pci_dev *dev);
+void pci_npem_remove(struct pci_dev *dev);
+#else
+static inline void pci_npem_create(struct pci_dev *dev) { }
+static inline void pci_npem_remove(struct pci_dev *dev) { }
+#endif
+
 /**
  * pci_dev_set_io_state - Set the new error state if possible.
  *
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b14b9876c030..17ee559c31a4 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2593,6 +2593,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	dev->match_driver = false;
 	ret = device_add(&dev->dev);
 	WARN_ON(ret < 0);
+
+	pci_npem_create(dev);
 }
 
 struct pci_dev *pci_scan_single_device(struct pci_bus *bus, int devfn)
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index 910387e5bdbf..da9629c3a688 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -34,6 +34,8 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	if (!dev->dev.kobj.parent)
 		return;
 
+	pci_npem_remove(dev);
+
 	device_del(&dev->dev);
 
 	down_write(&pci_bus_sem);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4cf89a4b4cbc..c9db853e269f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,6 +516,9 @@ struct pci_dev {
 #endif
 #ifdef CONFIG_PCI_DOE
 	struct xarray	doe_mbs;	/* Data Object Exchange mailboxes */
+#endif
+#ifdef CONFIG_PCI_NPEM
+	struct npem	*npem;		/* Native PCIe Enclosure Management */
 #endif
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 94c00996e633..42f922c67139 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -740,6 +740,7 @@
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
+#define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
 #define PCI_EXT_CAP_ID_PL_32GT  0x2A    /* Physical Layer 32.0 GT/s */
 #define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
 #define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
@@ -1121,6 +1122,40 @@
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
 
+/* Native PCIe Enclosure Management */
+#define PCI_NPEM_CAP     0x04 /* NPEM capability register */
+#define  PCI_NPEM_CAP_CAPABLE     0x00000001 /* NPEM Capable */
+
+#define PCI_NPEM_CTRL    0x08 /* NPEM control register */
+#define	 PCI_NPEM_CTRL_ENABLE     0x00000001 /* NPEM Enable */
+
+/*
+ * Native PCIe Enclosure Management indication bits and Reset command bit
+ * are corresponding for capability and control registers.
+ */
+#define  PCI_NPEM_CMD_RESET       0x00000002 /* NPEM Reset Command */
+#define  PCI_NPEM_IND_OK          0x00000004 /* NPEM indication OK */
+#define  PCI_NPEM_IND_LOCATE      0x00000008 /* NPEM indication Locate */
+#define  PCI_NPEM_IND_FAIL        0x00000010 /* NPEM indication Fail */
+#define  PCI_NPEM_IND_REBUILD     0x00000020 /* NPEM indication Rebuild */
+#define  PCI_NPEM_IND_PFA         0x00000040 /* NPEM indication Predicted Failure Analysis */
+#define  PCI_NPEM_IND_HOTSPARE    0x00000080 /* NPEM indication Hot Spare */
+#define  PCI_NPEM_IND_ICA         0x00000100 /* NPEM indication In Critical Array */
+#define  PCI_NPEM_IND_IFA         0x00000200 /* NPEM indication In Failed Array */
+#define  PCI_NPEM_IND_IDT         0x00000400 /* NPEM indication Invalid Device Type */
+#define  PCI_NPEM_IND_DISABLED    0x00000800 /* NPEM indication Disabled */
+#define  PCI_NPEM_IND_SPEC_0      0x01000000
+#define  PCI_NPEM_IND_SPEC_1      0x02000000
+#define  PCI_NPEM_IND_SPEC_2      0x04000000
+#define  PCI_NPEM_IND_SPEC_3      0x08000000
+#define  PCI_NPEM_IND_SPEC_4      0x10000000
+#define  PCI_NPEM_IND_SPEC_5      0x20000000
+#define  PCI_NPEM_IND_SPEC_6      0x40000000
+#define  PCI_NPEM_IND_SPEC_7      0x80000000
+
+#define PCI_NPEM_STATUS  0x0c /* NPEM status register */
+#define	 PCI_NPEM_STATUS_CC       0x00000001 /* NPEM Command completed */
+
 /* Data Object Exchange */
 #define PCI_DOE_CAP		0x04    /* DOE Capabilities Register */
 #define  PCI_DOE_CAP_INT_SUP			0x00000001  /* Interrupt Support */
-- 
2.35.3


