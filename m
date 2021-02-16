Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395E231CB20
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 14:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhBPNeB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 08:34:01 -0500
Received: from vm146.dmsolutionsonline.de ([84.19.161.165]:44514 "EHLO
        vm146.dmsolutionsonline.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229713AbhBPNeA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 08:34:00 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm146.dmsolutionsonline.de (Postfix) with ESMTP id 364CC1C0761;
        Tue, 16 Feb 2021 14:33:16 +0100 (CET)
Received: from vm146.dmsolutionsonline.de ([127.0.0.1])
        by localhost (vm146.dmsolutionsonline.de [127.0.0.1]) (amavisd-new, port 10025)
        with ESMTP id zMAp12TnuMdH; Tue, 16 Feb 2021 14:31:27 +0100 (CET)
Received: from lubuntu.aeberlein.local (p5b2a2dd1.dip0.t-ipconnect.de [91.42.45.209])
        (Authenticated sender: andreas@eberlein.it)
        by vm146.dmsolutionsonline.de (Postfix) with ESMTPSA;
        Tue, 16 Feb 2021 14:31:04 +0100 (CET)
From:   Andreas Eberlein <foodeas@aeberlein.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andreas Eberlein <foodeas@aeberlein.de>
Subject: [PATCH v2] leds: apu: extend support for PC Engines APU1 with newer firmware
Date:   Tue, 16 Feb 2021 14:30:28 +0100
Message-Id: <20210216133028.4025-1-foodeas@aeberlein.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The DMI_PRODUCT_NAME entry on current firmware of PC Engines APU1 changed
from "APU" to "apu1"

This modification adds the missing DMI data and thereby the LED support for
the PC Engines APU1 with firmware versions >= 4.6.8.

Signed-off-by: Andreas Eberlein <foodeas@aeberlein.de>
---
Changes in v2:
  - Add missing brace
---
 drivers/leds/leds-apu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 7fd557ace..c409b80c2 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -83,6 +83,7 @@ static const struct apu_led_profile apu1_led_profile[] = {
 };
 
 static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
+	/* PC Engines APU with factory bios "SageBios_PCEngines_APU-45" */
 	{
 		.ident = "apu",
 		.matches = {
@@ -90,6 +91,14 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
 		}
 	},
+	/* PC Engines APU with "Mainline" bios >= 4.6.8 */
+	{
+		.ident = "apu",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "apu1")
+		}
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
@@ -173,7 +182,7 @@ static int __init apu_led_init(void)
 	int err;
 
 	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
-	      dmi_match(DMI_PRODUCT_NAME, "APU"))) {
+	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "apu1")))) {
 		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
 		return -ENODEV;
 	}
-- 
2.25.1

