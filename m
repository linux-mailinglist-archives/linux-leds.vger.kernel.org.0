Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD6EB333F1
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2019 17:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbfFCPvp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Jun 2019 11:51:45 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:53836 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729369AbfFCPvp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 Jun 2019 11:51:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 352DC1A25;
        Mon,  3 Jun 2019 08:51:45 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6C423F246;
        Mon,  3 Jun 2019 08:51:43 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: [RFC PATCH 30/57] drivers: leds: Use class_find_device_by_name() helper
Date:   Mon,  3 Jun 2019 16:49:56 +0100
Message-Id: <1559577023-558-31-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the new class_find_device_by_name() helper.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/leds/led-class.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 85848c5..ee052aa 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -216,13 +216,6 @@ static int led_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
 
-static int match_name(struct device *dev, const void *data)
-{
-	if (!dev_name(dev))
-		return 0;
-	return !strcmp(dev_name(dev), (char *)data);
-}
-
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
@@ -233,7 +226,7 @@ static int led_classdev_next_name(const char *init_name, char *name,
 	strlcpy(name, init_name, len);
 
 	while ((ret < len) &&
-	       (dev = class_find_device(leds_class, NULL, name, match_name))) {
+	       (dev = class_find_device_by_name(leds_class, NULL, name))) {
 		put_device(dev);
 		ret = snprintf(name, len, "%s_%u", init_name, ++i);
 	}
-- 
2.7.4

