Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EC2E3EDB
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 00:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730264AbfJXWNM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Oct 2019 18:13:12 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36298 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbfJXWNM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Oct 2019 18:13:12 -0400
Received: by mail-il1-f196.google.com with SMTP id s75so86589ilc.3
        for <linux-leds@vger.kernel.org>; Thu, 24 Oct 2019 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XCM3g32MITF4GHb+oh5v+TIhOkEpHsOH3vQSr3W0WRk=;
        b=C6ZiTHOvDC0V4jkrQAsPAEdtBcsu9ZwKqUbLE9FCZVGI5tXXBj0DUt1NGWBLfZhs+8
         u77WWAAaVC9PiH+n4VHAE32ahK7jEIuE5eKOkwS5f01OqEq2hUDrl3zoZSepsv753CWH
         n7ziRz0EYc4k48KacOoTAB0FLqKLIxEIbrCRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCM3g32MITF4GHb+oh5v+TIhOkEpHsOH3vQSr3W0WRk=;
        b=X4hh29H95g3BWtnnr8Q4n+RSWVwamf+WfVMfLCMZiw1SyOBhgGd5lPHQ5tzBkQqxZI
         bXjbZGJ9hfZyXaYAdm0J1GZSVpugahKAuvN2ypMGBDOGYKmSnuB17QmMbq8EmxqM40jl
         2dCTmUNSagYBS7zA7gxt+J6v2eCHiGOASU1kgR2G44+PFCMFz18aNoK+Vj9j5C2l1SK6
         L8KelGqK10ekN37vty/RtPc7RKBovtu0P89I84lqyvFhwFxa7ivoROQdwIjyL6gJDc/u
         Xp/EqUnSUuVuidrVvuanCXnQP2VDnE/qwQcz2meI5MS7juWgvU48r90huIDlCRr/W7Cw
         BF4Q==
X-Gm-Message-State: APjAAAXOLz0bJEnMrdT6/4aGT57i3muBeYiF2fD4mcTxscjx7igqqul5
        Nm2ydQ2eBCzRQ3YRDhfpNIKJrA==
X-Google-Smtp-Source: APXvYqwoPQsWD5fMM+EAzlbBxmUZ72ucCAHQA5P8+gzn+gqW6IqIsE0Vqu15D1uB6FM4EWDjSYHGxw==
X-Received: by 2002:a92:9c94:: with SMTP id x20mr318365ill.149.1571955189638;
        Thu, 24 Oct 2019 15:13:09 -0700 (PDT)
Received: from ncrews2.bld.corp.google.com ([2620:15c:183:200:cb43:2cd4:65f5:5c84])
        by smtp.gmail.com with ESMTPSA id k2sm67563ios.19.2019.10.24.15.13.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 24 Oct 2019 15:13:09 -0700 (PDT)
From:   Nick Crews <ncrews@chromium.org>
To:     enric.balletbo@collabora.com, bleung@chromium.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-kernel@vger.kernel.org, arnd@arndb.de,
        weiyongjun1@huawei.com, dlaurie@chromium.org, djkurtz@chromium.org,
        dtor@google.com, sjg@chromium.org, groeck@chromium.com,
        Nick Crews <ncrews@chromium.org>
Subject: [PATCH 2/2] power_supply: platform/chrome: wilco_ec: Add charging config driver
Date:   Thu, 24 Oct 2019 16:12:34 -0600
Message-Id: <20191024221234.182693-2-ncrews@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024221234.182693-1-ncrews@chromium.org>
References: <20191024221234.182693-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a device to control the charging algorithm used on Wilco devices,
which will be picked up by the drivers/power/supply/wilco-charger.c
driver. See Documentation/ABI/testing/sysfs-class-power-wilco for the
userspace interface and other info.

Signed-off-by: Nick Crews <ncrews@chromium.org>
---
 drivers/platform/chrome/wilco_ec/core.c | 15 ++++++++++++++-
 include/linux/platform_data/wilco-ec.h  |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
index 36c78e52ff3c..5210c357feef 100644
--- a/drivers/platform/chrome/wilco_ec/core.c
+++ b/drivers/platform/chrome/wilco_ec/core.c
@@ -98,6 +98,16 @@ static int wilco_ec_probe(struct platform_device *pdev)
 		goto unregister_rtc;
 	}
 
+	/* Register child device to be found by charger config driver. */
+	ec->charger_pdev = platform_device_register_data(dev, "wilco-charger",
+							 PLATFORM_DEVID_AUTO,
+							 NULL, 0);
+	if (IS_ERR(ec->charger_pdev)) {
+		dev_err(dev, "Failed to create charger platform device\n");
+		ret = PTR_ERR(ec->charger_pdev);
+		goto remove_sysfs;
+	}
+
 	/* Register child device that will be found by the telemetry driver. */
 	ec->telem_pdev = platform_device_register_data(dev, "wilco_telem",
 						       PLATFORM_DEVID_AUTO,
@@ -105,11 +115,13 @@ static int wilco_ec_probe(struct platform_device *pdev)
 	if (IS_ERR(ec->telem_pdev)) {
 		dev_err(dev, "Failed to create telemetry platform device\n");
 		ret = PTR_ERR(ec->telem_pdev);
-		goto remove_sysfs;
+		goto unregister_charge_config;
 	}
 
 	return 0;
 
+unregister_charge_config:
+	platform_device_unregister(ec->charger_pdev);
 remove_sysfs:
 	wilco_ec_remove_sysfs(ec);
 unregister_rtc:
@@ -125,6 +137,7 @@ static int wilco_ec_remove(struct platform_device *pdev)
 {
 	struct wilco_ec_device *ec = platform_get_drvdata(pdev);
 
+	platform_device_unregister(ec->charger_pdev);
 	wilco_ec_remove_sysfs(ec);
 	platform_device_unregister(ec->telem_pdev);
 	platform_device_unregister(ec->rtc_pdev);
diff --git a/include/linux/platform_data/wilco-ec.h b/include/linux/platform_data/wilco-ec.h
index 0f7df3498a24..afede15a95bf 100644
--- a/include/linux/platform_data/wilco-ec.h
+++ b/include/linux/platform_data/wilco-ec.h
@@ -29,6 +29,7 @@
  * @data_size: Size of the data buffer used for EC communication.
  * @debugfs_pdev: The child platform_device used by the debugfs sub-driver.
  * @rtc_pdev: The child platform_device used by the RTC sub-driver.
+ * @charger_pdev: Child platform_device used by the charger config sub-driver.
  * @telem_pdev: The child platform_device used by the telemetry sub-driver.
  */
 struct wilco_ec_device {
@@ -41,6 +42,7 @@ struct wilco_ec_device {
 	size_t data_size;
 	struct platform_device *debugfs_pdev;
 	struct platform_device *rtc_pdev;
+	struct platform_device *charger_pdev;
 	struct platform_device *telem_pdev;
 };
 
-- 
2.21.0

