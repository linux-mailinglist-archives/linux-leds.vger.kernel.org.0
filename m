Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13BC3DC4C6
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 14:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390899AbfJRM0o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 08:26:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48412 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633688AbfJRM0A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 08:26:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPwdS066254;
        Fri, 18 Oct 2019 07:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571401558;
        bh=m9T1bYu9aHERflS70Hj68HTeQDTIQvtJczqXchiB3h4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Zpk4PdwtlthktoVMTFe+ppPtY6wROFEyh6ZnTi7zurbq/2PPzHV8B1Z6St86A5nZq
         4jugyD0dnNsz8ZYoZLOMTqGwaOvGxOHoe+DgnuUgIadUJ3A7VoBCu6uOQp4VP4tDLq
         2+5zrNtMZhv7cVEA1ytOZhpVEGBnl8zoq2GvDKzA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9ICPwaK053648
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 07:25:58 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 07:25:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 07:25:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPvtZ099348;
        Fri, 18 Oct 2019 07:25:57 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v14 16/19] leds: lp55xx: Fix checkpatch file permissions issues
Date:   Fri, 18 Oct 2019 07:25:18 -0500
Message-ID: <20191018122521.6757-17-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191018122521.6757-1-dmurphy@ti.com>
References: <20191018122521.6757-1-dmurphy@ti.com>
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
index 197b87ca5ca2..0764520bc4a8 100644
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
@@ -292,7 +291,7 @@ static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 				GFP_KERNEL, chip, lp55xx_firmware_loaded);
 }
 
-static ssize_t lp55xx_show_engine_select(struct device *dev,
+static ssize_t select_engine_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
 {
@@ -302,7 +301,7 @@ static ssize_t lp55xx_show_engine_select(struct device *dev,
 	return sprintf(buf, "%d\n", chip->engine_idx);
 }
 
-static ssize_t lp55xx_store_engine_select(struct device *dev,
+static ssize_t select_engine_store(struct device *dev,
 			     struct device_attribute *attr,
 			     const char *buf, size_t len)
 {
@@ -344,7 +343,7 @@ static inline void lp55xx_run_engine(struct lp55xx_chip *chip, bool start)
 		chip->cfg->run_engine(chip, start);
 }
 
-static ssize_t lp55xx_store_engine_run(struct device *dev,
+static ssize_t run_engine_store(struct device *dev,
 			     struct device_attribute *attr,
 			     const char *buf, size_t len)
 {
@@ -369,9 +368,8 @@ static ssize_t lp55xx_store_engine_run(struct device *dev,
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

