Return-Path: <linux-leds+bounces-1151-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD13872D1D
	for <lists+linux-leds@lfdr.de>; Wed,  6 Mar 2024 03:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9041F288D9
	for <lists+linux-leds@lfdr.de>; Wed,  6 Mar 2024 02:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD86EDDAB;
	Wed,  6 Mar 2024 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+A3VgdB"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39051DF51
	for <linux-leds@vger.kernel.org>; Wed,  6 Mar 2024 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709693923; cv=none; b=uPnQXKBmjy/tgBQ+Z+RtySbHdlkUnLFkRHO5RtCDVMrOvUQClInJ9gJcKaop0oY6oYtNqxbAD2wC5ysxhoG4WjTnNyI68EwiWfpJyUd2pXYT8W5OKU5dGE08RoN0T7DP9iZRPnZpJnB8mm57AawBj2Mg1rg7m82yXmA/OA1VgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709693923; c=relaxed/simple;
	bh=823dxRCJS9CmK5EOGvPzhDZMSs+Sqs0VrmSiBQlfjMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJTOz3Xdr+zeu75otGa/3Ejf9ZpZNNdflI4Lc7kfBNhmfO9YJKYgoaxv+ygA6CL4MgnMgUKaO+H5gIbpEXHKJQ1QSmv8D3eRYRHpchVaREVoOzGlauDsx2Rjn7zpSu49g8AQgvr8wEX95DwWWwo1I9GnjFyJ93Lub4dnWLJZLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+A3VgdB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709693921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bb5KF9un2sik2EZ0XFA2eWLCsmLPgVdLDv6phx+5dsc=;
	b=B+A3VgdBCcFsUfzZiryYyGfFOSG7jvKiXPjhERHlvW3CmtdkBRT8jJ90H6h7E+XPS89LW7
	sKeAWjb8ZuOZ/tSQVkdslA6X6A83wS5HAW7OdA5wy5NcRrP7EFEAnzzOu7TK8Q7gwyzMZ8
	rX07jWpnCO2CypLhx0QT78j3tIqV5Bw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-JatqkVo-Nr2-JMreZBEQqw-1; Tue, 05 Mar 2024 21:58:27 -0500
X-MC-Unique: JatqkVo-Nr2-JMreZBEQqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E53008007AF;
	Wed,  6 Mar 2024 02:58:26 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C9421121306;
	Wed,  6 Mar 2024 02:58:21 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-kernel@vger.kernel.org
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v4 1/2] platform: x86-android-tablets: other: Add swnode for Xiaomi pad2 indicator LED
Date: Wed,  6 Mar 2024 10:58:00 +0800
Message-ID: <20240306025801.8814-2-hpa@redhat.com>
In-Reply-To: <20240306025801.8814-1-hpa@redhat.com>
References: <20240306025801.8814-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

There is a KTD2026 LED controller to manage the indicator LED for Xiaomi
pad2. The ACPI for it is not properly made so the kernel can't get
a correct description of it.

This work add a description for this RGB LED controller and also set a
trigger to indicate the chaging event (bq27520-0-charging). When it is
charging, the indicator LED will be turn on.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  2 +
 2 files changed, 87 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index bc6bbf7ec6ea..542ef6667b7b 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
+#include <dt-bindings/leds/common.h>
 
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
@@ -593,6 +594,87 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
 };
 
+/*
+ * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
+ * with three subnodes for each color (B/G/R). The RGB LED node is named
+ * "multi-led" to align with the name in the device tree.
+ */
+
+/* main fwnode for ktd2026 */
+static const struct software_node ktd2026_node = {
+};
+
+static const struct property_entry ktd2026_rgb_led_props[] = {
+	PROPERTY_ENTRY_U32("reg", 0),
+	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
+	PROPERTY_ENTRY_STRING("function", "indicator"),
+	PROPERTY_ENTRY_STRING("linux,default-trigger",
+			      "bq27520-0-charging"),
+
+	{ }
+};
+
+static const struct software_node ktd2026_rgb_led_node = {
+	.name = "multi-led",
+	.properties = ktd2026_rgb_led_props,
+	.parent = &ktd2026_node,
+};
+
+/* B */
+static const struct property_entry ktd2026_red_led_props[] = {
+	PROPERTY_ENTRY_U32("reg", 0),
+	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
+	{ }
+};
+
+static const struct software_node ktd2026_red_led_node = {
+	.properties = ktd2026_red_led_props,
+	.parent = &ktd2026_rgb_led_node,
+};
+
+/* G */
+static const struct property_entry ktd2026_green_led_props[] = {
+	PROPERTY_ENTRY_U32("reg", 1),
+	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_GREEN),
+	{ }
+};
+
+static const struct software_node ktd2026_green_led_node = {
+	.properties = ktd2026_green_led_props,
+	.parent = &ktd2026_rgb_led_node,
+};
+
+/* R */
+static const struct property_entry ktd2026_blue_led_props[] = {
+	PROPERTY_ENTRY_U32("reg", 2),
+	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
+	{ }
+};
+
+static const struct software_node ktd2026_blue_led_node = {
+	.properties = ktd2026_blue_led_props,
+	.parent = &ktd2026_rgb_led_node,
+};
+
+static const struct software_node *ktd2026_node_group[] = {
+	&ktd2026_node,
+	&ktd2026_rgb_led_node,
+	&ktd2026_red_led_node,
+	&ktd2026_green_led_node,
+	&ktd2026_blue_led_node,
+	NULL
+};
+
+static int __init xiaomi_mipad2_init(void)
+{
+	return software_node_register_node_group(ktd2026_node_group);
+}
+
+static void xiaomi_mipad2_exit(void)
+{
+	software_node_unregister_node_group(ktd2026_node_group);
+}
+
 /*
  * If the EFI bootloader is not Xiaomi's own signed Android loader, then the
  * Xiaomi Mi Pad 2 X86 tablet sets OSID in the DSDT to 1 (Windows), causing
@@ -616,6 +698,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
 			.type = "ktd2026",
 			.addr = 0x30,
 			.dev_name = "ktd2026",
+			.swnode = &ktd2026_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C3",
 	},
@@ -624,4 +707,6 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
 const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 	.i2c_client_info = xiaomi_mipad2_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
+	.init = xiaomi_mipad2_init,
+	.exit = xiaomi_mipad2_exit,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
index c2d2968cddc2..8c33ec47ee12 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
@@ -29,4 +29,6 @@ extern const char * const bq24190_modules[];
 extern const struct platform_device_info int3496_pdevs[];
 extern struct gpiod_lookup_table int3496_reference_gpios;
 
+extern const struct software_node ktd2026_leds_node;
+
 #endif
-- 
2.43.2


