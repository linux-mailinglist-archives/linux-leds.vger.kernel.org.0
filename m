Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8903C14A6D3
	for <lists+linux-leds@lfdr.de>; Mon, 27 Jan 2020 16:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbgA0PE0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Jan 2020 10:04:26 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47738 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729269AbgA0PDw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jan 2020 10:03:52 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RF3nYR105959;
        Mon, 27 Jan 2020 09:03:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580137430;
        bh=Sz8dCCJoKkmWN2rMkQrgG//MunvxjxSe/RnpaMrwmPc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yUK8njWBIwqey3SV01VjzcqjFK9QokCB0AOkcxhtlyaXHe8nX0w3AH3ANSBWN+7Gk
         T6Qq0wHEIgxou9SvICs3xFbG6jY3uT59fqkvvHpXFp/KJOnASs5JsgjiH4sJhg9Dk5
         rJt9U0Zb3m0vwwrMvd3thX35s4769sszBHaFv+YE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RF3nJX020492
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jan 2020 09:03:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 09:03:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 09:03:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RF3nAZ090994;
        Mon, 27 Jan 2020 09:03:49 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [RESEND PATCH v17 15/17] leds: lp55xx: Fix checkpatch file permissions issues
Date:   Mon, 27 Jan 2020 09:00:30 -0600
Message-ID: <20200127150032.31350-16-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200127150032.31350-1-dmurphy@ti.com>
References: <20200127150032.31350-1-dmurphy@ti.com>
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
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lp55xx-common.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index c2087a654ea8..41d8c5e41306 100644
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
2.25.0

