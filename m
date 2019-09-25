Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDA9BE38C
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 19:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbfIYRlV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 13:41:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50758 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440145AbfIYRlV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 13:41:21 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfIJO029470;
        Wed, 25 Sep 2019 12:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569433278;
        bh=4LhcgeUfJAn2h75rby25zkuWdixhqLyxVWqBzwl6Yac=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Cr143WuaWrc2kNw6OxBGZvxVrI/z+rwptCvn6snPHcOXU8RQox5mYpi5WI4SPZxof
         hQEXXMRm79ffjhXoo3oV9maxKDqTZcPV9YkVtulaP9qXOM2p2XkNFbY+QFRV3JsKzM
         60QEh3Z1X3ffi3voROajlUoDD0qn9lysHLj23y/w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PHfIr6013961
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Sep 2019 12:41:18 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 12:41:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 12:41:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfH1F129637;
        Wed, 25 Sep 2019 12:41:17 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v9 14/15] leds: lp55xx: Fix checkpatch file permissions issues
Date:   Wed, 25 Sep 2019 12:46:15 -0500
Message-ID: <20190925174616.3714-15-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190925174616.3714-1-dmurphy@ti.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the checkpatch warnings for the use of the file permission macros.
In converting the file permissions to the DEVICE_ATTR_XX macros the
call back function names needed to be updated within the code.

This means that the lp55xx_ needed to be dropped in the name to keep in
harmony with the ABI documentation.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp55xx-common.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 0e4b3a9d3047..6f220050fa9d 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -78,7 +78,7 @@ static int lp55xx_post_init_device(struct lp55xx_chip *chip)
 	return cfg->post_init_device(chip);
 }
 
-static ssize_t lp55xx_show_current(struct device *dev,
+static ssize_t led_current_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
 {
@@ -87,7 +87,7 @@ static ssize_t lp55xx_show_current(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", led->led_current);
 }
 
-static ssize_t lp55xx_store_current(struct device *dev,
+static ssize_t led_current_store(struct device *dev,
 			     struct device_attribute *attr,
 			     const char *buf, size_t len)
 {
@@ -111,7 +111,7 @@ static ssize_t lp55xx_store_current(struct device *dev,
 	return len;
 }
 
-static ssize_t lp55xx_show_max_current(struct device *dev,
+static ssize_t max_current_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
 {
@@ -120,9 +120,8 @@ static ssize_t lp55xx_show_max_current(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", led->max_current);
 }
 
-static DEVICE_ATTR(led_current, S_IRUGO | S_IWUSR, lp55xx_show_current,
-		lp55xx_store_current);
-static DEVICE_ATTR(max_current, S_IRUGO , lp55xx_show_max_current, NULL);
+static DEVICE_ATTR_RW(led_current);
+static DEVICE_ATTR_RO(max_current);
 
 static struct attribute *lp55xx_led_attrs[] = {
 	&dev_attr_led_current.attr,
@@ -262,7 +261,7 @@ static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 				GFP_KERNEL, chip, lp55xx_firmware_loaded);
 }
 
-static ssize_t lp55xx_show_engine_select(struct device *dev,
+static ssize_t select_engine_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
 {
@@ -272,7 +271,7 @@ static ssize_t lp55xx_show_engine_select(struct device *dev,
 	return sprintf(buf, "%d\n", chip->engine_idx);
 }
 
-static ssize_t lp55xx_store_engine_select(struct device *dev,
+static ssize_t select_engine_store(struct device *dev,
 			     struct device_attribute *attr,
 			     const char *buf, size_t len)
 {
@@ -314,7 +313,7 @@ static inline void lp55xx_run_engine(struct lp55xx_chip *chip, bool start)
 		chip->cfg->run_engine(chip, start);
 }
 
-static ssize_t lp55xx_store_engine_run(struct device *dev,
+static ssize_t run_engine_store(struct device *dev,
 			     struct device_attribute *attr,
 			     const char *buf, size_t len)
 {
@@ -339,9 +338,8 @@ static ssize_t lp55xx_store_engine_run(struct device *dev,
 	return len;
 }
 
-static DEVICE_ATTR(select_engine, S_IRUGO | S_IWUSR,
-		   lp55xx_show_engine_select, lp55xx_store_engine_select);
-static DEVICE_ATTR(run_engine, S_IWUSR, NULL, lp55xx_store_engine_run);
+static DEVICE_ATTR_RW(select_engine);
+static DEVICE_ATTR_WO(run_engine);
 
 static struct attribute *lp55xx_engine_attributes[] = {
 	&dev_attr_select_engine.attr,
-- 
2.22.0.214.g8dca754b1e

