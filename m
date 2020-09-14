Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E642699DA
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 01:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgINXmC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 19:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgINXl4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 19:41:56 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2292C061788;
        Mon, 14 Sep 2020 16:41:55 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 45B08140AAD;
        Tue, 15 Sep 2020 01:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600126909; bh=UA7SchNmxYSVilBmnx5V2M0Y/Eos2Hxg36/KANP2s8A=;
        h=From:To:Date;
        b=rt/sdJS0qtNmLV8m4crJ9lzUnaA1JOqYsLSKUca0TrrWRJwxJ3ZEM2Z60TKb0xUeD
         QXvQvxr7+yepHpmAMjDqykvj1SBxUU8939GCm5x8WxilBKQw0LzPhBcFQs1LYpivke
         HL3IFyrvqkpfqfHkW6/vQDSDJe6Ldf4xc1E2s7J8=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH leds + devicetree v1 2/2] leds: trigger: netdev: allow parsing `trigger-sources` from device tree
Date:   Tue, 15 Sep 2020 01:41:48 +0200
Message-Id: <20200914234148.19837-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914234148.19837-1-marek.behun@nic.cz>
References: <20200914234148.19837-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allow setting netdev LED trigger as default when given LED DT node has
the `trigger-sources` property pointing to a node corresponding to a
network device.

The specific netdev trigger mode is determined from the `function` LED
property.

Example:
  eth0: ethernet@30000 {
    compatible = "xyz";
    #trigger-source-cells = <0>;
  };

  led {
    color = <LED_COLOR_ID_GREEN>;
    function = LED_FUNCTION_LINK;
    trigger-sources = <&eth0>;
  };

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 drivers/leds/trigger/ledtrig-netdev.c | 91 ++++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h     |  1 +
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index d5e774d830215..c6dce28dc52ed 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -20,6 +20,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of_net.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
 #include "../leds.h"
@@ -389,6 +390,81 @@ static void netdev_trig_work(struct work_struct *work)
 			(atomic_read(&trigger_data->interval)*2));
 }
 
+static bool netdev_trig_of_parse(struct led_classdev *led_cdev,
+				 struct led_netdev_data *trigger_data)
+{
+	struct of_phandle_args args;
+	struct net_device *netdev;
+	struct device_node *np;
+	const char *function;
+	unsigned long mode;
+	int count, err;
+
+	np = dev_of_node(led_cdev->dev);
+	if (!np)
+		return -EOPNOTSUPP;
+
+	count = of_count_phandle_with_args(np, "trigger-sources",
+					   "#trigger-source-cells");
+	if (count == -ENOENT) {
+		return false;
+	} else if (count < 0) {
+		dev_warn(led_cdev->dev,
+			 "Failed parsing trigger sources for %pOF!\n", np);
+		return false;
+	}
+
+	/* netdev trigger can have only one source */
+	if (count != 1)
+		return false;
+
+	err = of_parse_phandle_with_args(np, "trigger-sources",
+					 "#trigger-source-cells", 0, &args);
+	if (err)
+		return false;
+
+	netdev = of_find_net_device_by_node(args.np);
+	if (!netdev)
+		return false;
+
+	err = of_property_read_string(np, "function", &function);
+	if (err && err != -ENOENT) {
+		dev_warn(led_cdev->dev, "Failed parsing function for %pOF!\n",
+			 np);
+		return false;
+	} else if (err == -ENOENT) {
+		/* default function is link */
+		function = LED_FUNCTION_LINK;
+	}
+
+	mode = 0;
+	if (!strcmp(function, LED_FUNCTION_LINK)) {
+		set_bit(NETDEV_LED_LINK, &mode);
+	} else if (!strcmp(function, LED_FUNCTION_ACTIVITY)) {
+		set_bit(NETDEV_LED_TX, &mode);
+		set_bit(NETDEV_LED_RX, &mode);
+	} else if (!strcmp(function, LED_FUNCTION_RX)) {
+		set_bit(NETDEV_LED_RX, &mode);
+	} else if (!strcmp(function, LED_FUNCTION_TX)) {
+		set_bit(NETDEV_LED_TX, &mode);
+	} else {
+		dev_dbg(led_cdev->dev,
+			"Unsupported netdev trigger function for %pOF!\n", np);
+		return false;
+	}
+
+	if (trigger_data) {
+		dev_hold(netdev);
+		trigger_data->net_dev = netdev;
+		memcpy(trigger_data->device_name, netdev->name, IFNAMSIZ);
+		trigger_data->mode = mode;
+		if (netif_carrier_ok(netdev))
+			set_bit(NETDEV_LED_MODE_LINKUP, &trigger_data->mode);
+	}
+
+	return true;
+}
+
 static int netdev_trig_activate(struct led_classdev *led_cdev)
 {
 	struct led_netdev_data *trigger_data;
@@ -414,10 +490,17 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 	trigger_data->last_activity = 0;
 
 	led_set_trigger_data(led_cdev, trigger_data);
+	netdev_trig_of_parse(led_cdev, trigger_data);
 
 	rc = register_netdevice_notifier(&trigger_data->notifier);
-	if (rc)
+	if (rc) {
+		if (trigger_data->net_dev)
+			dev_put(trigger_data->net_dev);
 		kfree(trigger_data);
+	} else {
+		if (trigger_data->net_dev)
+			set_baseline_state(trigger_data);
+	}
 
 	return rc;
 }
@@ -436,10 +519,16 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 	kfree(trigger_data);
 }
 
+static bool netdev_trig_has_valid_source(struct led_classdev *led_cdev)
+{
+	return netdev_trig_of_parse(led_cdev, NULL);
+}
+
 static struct led_trigger netdev_led_trigger = {
 	.name = "netdev",
 	.activate = netdev_trig_activate,
 	.deactivate = netdev_trig_deactivate,
+	.has_valid_source = netdev_trig_has_valid_source,
 	.groups = netdev_trig_groups,
 };
 
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d44ba25..c7f9d34d60206 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -77,6 +77,7 @@
 #define LED_FUNCTION_HEARTBEAT "heartbeat"
 #define LED_FUNCTION_INDICATOR "indicator"
 #define LED_FUNCTION_LAN "lan"
+#define LED_FUNCTION_LINK "link"
 #define LED_FUNCTION_MAIL "mail"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
-- 
2.26.2

