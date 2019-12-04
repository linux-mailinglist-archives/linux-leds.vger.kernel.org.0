Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9760B1123ED
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 08:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfLDH41 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 02:56:27 -0500
Received: from retiisi.org.uk ([95.216.213.190]:54764 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725839AbfLDH41 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 02:56:27 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id B44FE634C87;
        Wed,  4 Dec 2019 09:55:33 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-leds@vger.kernel.org
Cc:     andriy.shevchenko@intel.com
Subject: [PATCH 1/1] leds-as3645a: Drop fwnode reference on ignored node
Date:   Wed,  4 Dec 2019 09:56:42 +0200
Message-Id: <20191204075642.22070-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If a node is ignored, do not get a reference to it. Fix the bug by moving
fwnode_handle_get() where a reference to an fwnode is saved for clarity.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-as3645a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index b7e0ae1af8fa5..e8922fa033796 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -493,16 +493,17 @@ static int as3645a_parse_node(struct as3645a *flash,
 		switch (id) {
 		case AS_LED_FLASH:
 			flash->flash_node = child;
+			fwnode_handle_get(child);
 			break;
 		case AS_LED_INDICATOR:
 			flash->indicator_node = child;
+			fwnode_handle_get(child);
 			break;
 		default:
 			dev_warn(&flash->client->dev,
 				 "unknown LED %u encountered, ignoring\n", id);
 			break;
 		}
-		fwnode_handle_get(child);
 	}
 
 	if (!flash->flash_node) {
-- 
2.20.1

