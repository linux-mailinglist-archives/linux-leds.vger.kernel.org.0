Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6075D33AF60
	for <lists+linux-leds@lfdr.de>; Mon, 15 Mar 2021 10:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhCOJ5z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Mar 2021 05:57:55 -0400
Received: from gecko.sbs.de ([194.138.37.40]:43650 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229623AbhCOJ5n (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 15 Mar 2021 05:57:43 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12F9vJ94021516
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 10:57:19 +0100
Received: from localhost.localdomain ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12F9vFdw002444;
        Mon, 15 Mar 2021 10:57:18 +0100
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
        Michael Haener <michael.haener@siemens.com>
Subject: [PATCH v2 4/4] platform/x86: pmc_atom: improve critclk_systems matching for Siemens PCs
Date:   Mon, 15 Mar 2021 10:57:10 +0100
Message-Id: <20210315095710.7140-5-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315095710.7140-1-henning.schild@siemens.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Siemens industrial PCs unfortunately can not always be properly
identified the way we used to. An earlier commit introduced code that
allows proper identification without looking at DMI strings that could
differ based on product branding.
Switch over to that proper way and revert commits that used to collect
the machines based on unstable strings.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Fixes: e8796c6c69d1 ("platform/x86: pmc_atom: Add Siemens CONNECT ...")
Fixes: f110d252ae79 ("platform/x86: pmc_atom: Add Siemens SIMATIC ...")
Fixes: ad0d315b4d4e ("platform/x86: pmc_atom: Add Siemens SIMATIC ...")
Tested-by: Michael Haener <michael.haener@siemens.com>
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/platform/x86/pmc_atom.c | 47 +++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index ca684ed760d1..38542d547f29 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/platform_data/x86/clk-pmc-atom.h>
 #include <linux/platform_data/x86/pmc_atom.h>
+#include <linux/platform_data/x86/simatic-ipc.h>
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
@@ -362,6 +363,23 @@ static void pmc_dbgfs_register(struct pmc_dev *pmc)
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static bool pmc_clk_is_critical = true;
+
+static int siemens_clk_is_critical(const struct dmi_system_id *d)
+{
+	u32 st_id;
+
+	if (dmi_walk(simatic_ipc_find_dmi_entry_helper, &st_id))
+		goto out;
+
+	if (st_id == SIMATIC_IPC_IPC227E || st_id == SIMATIC_IPC_IPC277E)
+		return 1;
+
+out:
+	pmc_clk_is_critical = false;
+	return 1;
+}
+
 /*
  * Some systems need one or more of their pmc_plt_clks to be
  * marked as critical.
@@ -424,24 +442,10 @@ static const struct dmi_system_id critclk_systems[] = {
 		},
 	},
 	{
-		.ident = "SIMATIC IPC227E",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
-		},
-	},
-	{
-		.ident = "SIMATIC IPC277E",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "6AV7882-0"),
-		},
-	},
-	{
-		.ident = "CONNECT X300",
+		.callback = siemens_clk_is_critical,
+		.ident = "SIEMENS AG",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "A5E45074588"),
 		},
 	},
 
@@ -453,7 +457,7 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 {
 	struct platform_device *clkdev;
 	struct pmc_clk_data *clk_data;
-	const struct dmi_system_id *d = dmi_first_match(critclk_systems);
+	const struct dmi_system_id *d;
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -461,9 +465,12 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 
 	clk_data->base = pmc_regmap; /* offset is added by client */
 	clk_data->clks = pmc_data->clks;
-	if (d) {
-		clk_data->critical = true;
-		pr_info("%s critclks quirk enabled\n", d->ident);
+	if (dmi_check_system(critclk_systems)) {
+		clk_data->critical = pmc_clk_is_critical;
+		if (clk_data->critical) {
+			d = dmi_first_match(critclk_systems);
+			pr_info("%s critclks quirk enabled\n", d->ident);
+		}
 	}
 
 	clkdev = platform_device_register_data(&pdev->dev, "clk-pmc-atom",
-- 
2.26.2

