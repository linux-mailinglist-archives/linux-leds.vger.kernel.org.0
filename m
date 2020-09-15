Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD71026A8EB
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgIOP15 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 11:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727405AbgIOP1W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 11:27:22 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D3DC06174A;
        Tue, 15 Sep 2020 08:26:27 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 6DE76140A5E;
        Tue, 15 Sep 2020 17:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600183583; bh=TAQFroqD15GzajgK4PXx1VB35Pw0xMcmdE2KPLPIZGw=;
        h=From:To:Date;
        b=b4k7qsoFgI7upbuLvppGqqfjkwc967ve/FXJ7vPa3CxOfRH0vh5zbRkLfRybYxsPE
         iaRyoeF8T6Kx67ITueynxv1gllo+8YkC2UzkfQcPMnwwsoaiZDE/pBJ0kPpOAkVL1L
         tG8ICPLj36YU/kDcNjLb23uc2cjyv8PL7O9pZZ7U=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds + devicetree v2 2/2] leds: trigger: netdev: parse `trigger-sources` from device tree
Date:   Tue, 15 Sep 2020 17:26:16 +0200
Message-Id: <20200915152616.20591-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200915152616.20591-1-marek.behun@nic.cz>
References: <20200915152616.20591-1-marek.behun@nic.cz>
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
 drivers/leds/trigger/ledtrig-netdev.c | 80 ++++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h     |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index d5e774d830215..99fc2f0c68e12 100644
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
@@ -389,6 +390,70 @@ static void netdev_trig_work(struct work_struct *work)
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
+	int err;
+
+	/* netdev trigger can have only one source */
+	if (of_led_count_trigger_sources(led_cdev) != 1)
+		return false;
+
+	err = of_led_get_trigger_source(led_cdev, 0, &args);
+	if (err)
+		return false;
+
+	netdev = of_find_net_device_by_node(args.np);
+	if (!netdev)
+		return false;
+
+	np = dev_of_node(led_cdev->dev);
+	if (!np)
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
@@ -414,10 +479,17 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
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
@@ -436,10 +508,16 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
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

