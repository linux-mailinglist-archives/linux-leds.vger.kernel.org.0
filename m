Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C55E4423
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 09:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406560AbfJYHLd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Oct 2019 03:11:33 -0400
Received: from host-88-217-225-28.customer.m-online.net ([88.217.225.28]:41441
        "EHLO mail.dev.tdt.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2406166AbfJYHLd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Oct 2019 03:11:33 -0400
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Oct 2019 03:11:32 EDT
Received: from mschiller01.dev.tdt.de (unknown [10.2.3.20])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 1ED35200C4;
        Fri, 25 Oct 2019 07:01:56 +0000 (UTC)
From:   Martin Schiller <ms@dev.tdt.de>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        rafal@milecki.pl, linux@rasmusvillemoes.dk
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Schiller <ms@dev.tdt.de>
Subject: [PATCH] leds: trigger: netdev: fix handling on interface rename
Date:   Fri, 25 Oct 2019 09:01:42 +0200
Message-Id: <20191025070142.23654-1-ms@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The NETDEV_CHANGENAME code is not "unneeded" like it is stated in commit
4cb6560514fa ("leds: trigger: netdev: fix refcnt leak on interface
rename").

The event was accidentally misinterpreted equivalent to
NETDEV_UNREGISTER, but should be equivalent to NETDEV_REGISTER.

This was the case in the original code from the openwrt project.

Otherwise, you are unable to set netdev led triggers for (non-existent)
netdevices, which has to be renamed. This is the case, for example, for
ppp interfaces in openwrt.

Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
Fixes: 4cb6560514fa ("leds: trigger: netdev: fix refcnt leak on interface rename")
Signed-off-by: Martin Schiller <ms@dev.tdt.de>
---
 drivers/leds/trigger/ledtrig-netdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 136f86a1627d..d5e774d83021 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -302,10 +302,12 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		container_of(nb, struct led_netdev_data, notifier);
 
 	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
-	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER)
+	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
+	    && evt != NETDEV_CHANGENAME)
 		return NOTIFY_DONE;
 
 	if (!(dev == trigger_data->net_dev ||
+	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
 	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
 		return NOTIFY_DONE;
 
@@ -315,6 +317,7 @@ static int netdev_trig_notify(struct notifier_block *nb,
 
 	clear_bit(NETDEV_LED_MODE_LINKUP, &trigger_data->mode);
 	switch (evt) {
+	case NETDEV_CHANGENAME:
 	case NETDEV_REGISTER:
 		if (trigger_data->net_dev)
 			dev_put(trigger_data->net_dev);
-- 
2.20.1

