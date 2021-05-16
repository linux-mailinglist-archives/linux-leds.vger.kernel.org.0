Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B30A381E2A
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhEPKzK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:47698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhEPKzH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C498061183;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=W9Q0II8E1tQWmZf1EbKmOxyviDDnDvlIZCkYcXDLhpg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UydJGp/W7OgF5JRWp82GqIyuEb2nOlcYZx2FsxsEZ/sOZ+ETi50a8FuE4JhzSk23k
         KH5KLy3jWeB4/5/KVykMCdDvQkbRi0oYBQ/dFKF7FvI/DO4Zv83ghzdvXIN1hQ7iQm
         VFf0bb9s3cBL9fwwiVu4DLHEYQiDnkE4BPaMKbmgBeinQrjHnubMwHKWRfGTJERaSv
         K8wXKBJ8q0EJ6Eo8ADZdezt6NBSGZ5ROQmWB+R/DPtTGeyuQWw9XnGbb7/iO2kcKfb
         sGUTvj4qSsQCfOJNNyzjL28HFUWkghFvlA/tXEOpQa1uQyuiY5/tENQDkrtnwoWsbG
         AXIr+Z7UQN9lA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s8O-Ud; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 07/17] staging: nuc-wmi: add basic support for NUC6 WMI
Date:   Sun, 16 May 2021 12:53:35 +0200
Message-Id: <ad868addca76f436d32cfbb3d8516d7d0dab83a2.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The NUC6 and NUCi7 supports an earlier version of the LEDs
WMI, as specified at:

	https://www.intel.com/content/www/us/en/support/articles/000023426/intel-nuc/intel-nuc-kits.html

Implement the query part of the LED detection for those devices.

Weird enough, at least with Skull Canyon (NUC6i7KYB) using
the latest firmware release (KYSKLi70 0071), the WMI call
return all zeros. It could well be due to a regression at
the Intel's firmware, although this model was not announced
as supporting this WMI. At the manufacturer's site, only
NUC Kits NUC7i[x]BN and NUC6CAY are mentioned.

Yet, it sounds to me that this is due to a firmware bug:

	$ sudo fwts wmi -
...
	Test 1 of 1: Windows Management Instrumentation test.
...

	\_SB_.WMTF._WDG (1 of 1)
	  GUID: 86CCFD48-205E-4A77-9C48-2021CBEDE341
	  WMI Method:
	    Flags          : 0x02 (Method)
	    Object ID      : TF
	    Instance       : 0x01
	    Driver         : intel-wmi-thunderbolt (Intel)
	FAILED [LOW] WMIMultipleMethod: Test 1, GUID 86CCFD48-205E-4A77-9C48-2021CBEDE341 has multiple associated methods WMTF defined, this is a firmware bug that leads to ambiguous behaviour.
...
	\AMW0._WDG (1 of 2)
	  GUID: 8C5DA44C-CDC3-46B3-8619-4E26D34390B7
	  WMI Method:
	    Flags          : 0x02 (Method)
	    Object ID      : AA
	    Instance       : 0x01
	PASSED: Test 1, 8C5DA44C-CDC3-46B3-8619-4E26D34390B7 has associated method \AMW0.WMAA
...
	Low failures: 1
	 wmi: GUID 86CCFD48-205E-4A77-9C48-2021CBEDE341 has multiple associated methods WMTF defined, this is a firmware bug that leads to ambiguous behaviour.

Anyway, this was good enough to test that this patch will be
producing exactly the WMI query as the NUC6 OOT driver at:

	https://github.com/milesp20/intel_nuc_led/

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 134 +++++++++++++++++++++++-------
 1 file changed, 106 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index e9c59f656283..db38c40c223a 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -8,12 +8,15 @@
  *
  * Inspired on WMI from https://github.com/nomego/intel_nuc_led
  *
- * It follows this spec:
- *	https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf
+ * It follows those specs:
+ *   https://www.intel.com/content/www/us/en/support/articles/000023426/intel-nuc/intel-nuc-kits.html
+ *   https://raw.githubusercontent.com/nomego/intel_nuc_led/master/specs/INTEL_WMI_LED_0.64.pdf
+ *   https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf
  */
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -34,12 +37,21 @@ enum led_api_rev {
 };
 
 enum led_cmds {
+	/* NUC6-specific cmds */
+	LED_OLD_GET_STATUS              = 0x01,
+	LED_OLD_SET_LED                 = 0x02,
+
+	/* Rev 0.64 and 1.0 cmds */
+
 	LED_QUERY			= 0x03,
 	LED_NEW_GET_STATUS		= 0x04,
 	LED_SET_INDICATOR		= 0x05,
 	LED_SET_VALUE			= 0x06,
 	LED_NOTIFICATION		= 0x07,
 	LED_SWITCH_TYPE			= 0x08,
+
+	/* Rev 1.0 cmds */
+
 	LED_VERSION_CONTROL             = 0x09,
 };
 
@@ -55,6 +67,11 @@ enum led_new_get_subcmd {
 	LED_NEW_GET_CONTROL_ITEM	= 0x01,
 };
 
+enum led_old_get_subcmd {
+	LED_OLD_GET_S0_POWER		= 0x01,
+	LED_OLD_GET_S0_RING		= 0x02,
+};
+
 enum led_function {
 	LED_FUNC_BRIGHTNESS,
 	LED_FUNC_COLOR1,
@@ -146,14 +163,19 @@ static const u8 led_func_rev_1_0_singlecolor[MAX_IND][MAX_LED_FUNC] = {
 #define LED_RGB			BIT(2)
 #define	LED_SINGLE_COLOR	BIT(3)
 
+#define POWER_LED		0
+#define RING_LED		(MAX_LEDS + 1)
+
 static const char * const led_names[] = {
-	"nuc::power",
+	[POWER_LED] = "nuc::power",
 	"nuc::hdd",
 	"nuc::skull",
 	"nuc::eyes",
 	"nuc::front1",
 	"nuc::front2",
 	"nuc::front3",
+
+	[RING_LED] = "nuc::ring",		// NUC6 models
 };
 
 struct nuc_nmi_led {
@@ -276,48 +298,98 @@ static int nuc_nmi_cmd(struct device *dev,
 	return ret;
 }
 
+static int nuc_wmi_query_leds_nuc6(struct device *dev)
+{
+	// FIXME: add a check for the specific models that are known to work
+	struct nuc_wmi *priv = dev_get_drvdata(dev);
+	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	struct nuc_nmi_led *led;
+	int ret;
+
+	cmd = LED_OLD_GET_STATUS;
+	input[0] = LED_OLD_GET_S0_POWER;
+	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	if (ret) {
+		dev_warn(dev, "Get S0 Power: error %d\n", ret);
+		return ret;
+	}
+
+	led = &priv->led[priv->num_leds];
+	led->id = POWER_LED;
+	led->color_type = LED_BLUE_AMBER;
+	led->avail_indicators = LED_IND_POWER_STATE;
+	led->indicator = fls(led->avail_indicators);
+	priv->num_leds++;
+
+	cmd = LED_OLD_GET_STATUS;
+	input[0] = LED_OLD_GET_S0_RING;
+	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	if (ret) {
+		dev_warn(dev, "Get S0 Ring: error %d\n", ret);
+		return ret;
+	}
+	led = &priv->led[priv->num_leds];
+	led->id = RING_LED;
+	led->color_type = LED_BLUE_AMBER;
+	led->avail_indicators = LED_IND_SOFTWARE;
+	led->indicator = fls(led->avail_indicators);
+	priv->num_leds++;
+
+	return ret;
+}
+
 static int nuc_wmi_query_leds(struct device *dev, enum led_api_rev *api_rev)
 {
 	struct nuc_wmi *priv = dev_get_drvdata(dev);
 	u8 input[NUM_INPUT_ARGS] = { 0 };
 	u8 output[NUM_OUTPUT_ARGS];
-	int id, ret, ver = LED_API_UNKNOWN;
+	int id, ret, ver = LED_API_UNKNOWN, nuc_ver = 0;
 	u8 leds;
+	const char *dmi_name;
+
+	dmi_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (!dmi_name || !*dmi_name)
+		dmi_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (strncmp(dmi_name, "NUC", 3))
+		return -ENODEV;
+
+	dmi_name +=3;
+	while (*dmi_name) {
+		if (*dmi_name < '0' || *dmi_name > '9')
+			break;
+		nuc_ver = (*dmi_name - '0') + nuc_ver * 10;
+		dmi_name++;
+	}
+
+	if (nuc_ver < 6)
+		return -ENODEV;
+
+	if (nuc_ver < 8) {
+		*api_rev = LED_API_NUC6;
+		return nuc_wmi_query_leds_nuc6(dev);
+	}
 
-	/*
-	 * List all LED types support in the platform
-	 *
-	 * Should work with both NUC8iXXX and NUC10iXXX
-	 *
-	 * FIXME: Should add a fallback code for it to work with older NUCs,
-	 * as LED_QUERY returns an error on older devices like Skull Canyon.
-	 */
 	input[0] = LED_QUERY_LIST_ALL;
 	ret = nuc_nmi_cmd(dev, LED_QUERY, input, output);
-	if (ret == -ENOENT) {
-		ver = LED_API_NUC6;
-	} else if (ret) {
+	if (ret) {
 		dev_warn(dev, "error %d while listing all LEDs\n", ret);
 		return ret;
 	} else {
 		leds = output[0];
 	}
 
-	if (ver != LED_API_NUC6) {
-		ret = nuc_nmi_cmd(dev, LED_VERSION_CONTROL, input, output);
-		ver = output[0] | output[1] << 16;
-		if (!ver)
-			ver = LED_API_REV_0_64;
-		else if (ver == 0x0126)
-			ver = LED_API_REV_1_0;
-	}
+	ret = nuc_nmi_cmd(dev, LED_VERSION_CONTROL, input, output);
+	ver = output[0] | output[1] << 16;
+	if (!ver)
+		*api_rev = LED_API_REV_0_64;
+	else if (ver == 0x0126)
+		*api_rev = LED_API_REV_1_0;
 
-	/* Currently, only API Revision 0.64 is supported */
-	if (ver != LED_API_REV_0_64 && ver != LED_API_REV_1_0)
+	if (*api_rev == LED_API_UNKNOWN)
 		return -ENODEV;
 
-	*api_rev = ver;
-
 	if (!leds) {
 		dev_warn(dev, "No LEDs found\n");
 		return -ENODEV;
@@ -913,10 +985,16 @@ static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led,
 
 	led->cdev.name = led_names[led->id];
 	led->dev = dev;
+	led->api_rev = api_rev;
+
+	if (led->api_rev == LED_API_NUC6) {
+		// FIXME: add NUC6-specific API bits here
+		return devm_led_classdev_register(dev, &led->cdev);
+	}
+
 	led->cdev.groups = nuc_wmi_led_attribute_groups;
 	led->cdev.brightness_get = nuc_wmi_get_brightness;
 	led->cdev.brightness_set_blocking = nuc_wmi_set_brightness;
-	led->api_rev = api_rev;
 
 	if (led->color_type & LED_SINGLE_COLOR) {
 		if (led->api_rev == LED_API_REV_1_0)
-- 
2.31.1

