Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E0EBB224
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 12:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439467AbfIWKVM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 06:21:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50820 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439457AbfIWKVM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 06:21:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL7Uw040462;
        Mon, 23 Sep 2019 05:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569234067;
        bh=1LIb46R+iv+ywgqwnKJpcNZUZ+MdGsvBooOdeuNHDOA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oOn9yQjyMHjxzPpguI7yvS/mzQEnihxeQ62UQ5FOf0UVWlh9k4MvchlSrurMAebBz
         t2T2HYdlGH2nR0TsCfA/oTDfgbIKTsq8wpCHylA49SORMzFzHJ+ePOx7qlLr032Yds
         udFzNq6EcR+lsS40ohYyKx7oZHI8jtZ2tiRFSKAU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NAL76I043979
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 05:21:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 05:21:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 05:21:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL6OM118850;
        Mon, 23 Sep 2019 05:21:06 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 3/3] leds: Add control of the voltage/current regulator to the LED core
Date:   Mon, 23 Sep 2019 12:20:59 +0200
Message-ID: <20190923102059.17818-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923102059.17818-1-jjhiblot@ti.com>
References: <20190923102059.17818-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

A LED is usually powered by a voltage/current regulator. Let the LED core
know about it. This allows the LED core to turn on or off the power supply
as needed.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 17 +++++++++++
 drivers/leds/led-core.c  | 65 ++++++++++++++++++++++++++++++++++++++--
 drivers/leds/leds.h      |  3 ++
 include/linux/leds.h     |  5 ++++
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index e11177d77b4c..d122b6982efd 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -352,6 +352,7 @@ int led_classdev_register_ext(struct device *parent,
 	char final_name[LED_MAX_NAME_SIZE];
 	const char *proposed_name = composed_name;
 	int ret;
+	struct regulator *regulator;
 
 	if (init_data) {
 		if (init_data->devname_mandatory && !init_data->devicename) {
@@ -387,6 +388,22 @@ int led_classdev_register_ext(struct device *parent,
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
+	if (IS_ERR(regulator)) {
+		if (regulator != ERR_PTR(-ENODEV)) {
+			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
+				led_cdev->name);
+			device_unregister(led_cdev->dev);
+			mutex_unlock(&led_cdev->led_access);
+			return PTR_ERR(regulator);
+		}
+		led_cdev->regulator = NULL;
+	} else {
+		led_cdev->regulator = regulator;
+		led_cdev->regulator_state = REG_OFF;
+		atomic_set(&led_cdev->target_regulator_state, REG_UNKNOWN);
+	}
+
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index d318f9b0382d..155a158c7b8d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -37,6 +37,43 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
+static int __led_handle_regulator(struct led_classdev *led_cdev)
+{
+	int rc;
+	int target_state = led_cdev->delayed_set_value ?  REG_ON : REG_OFF;
+
+	if (!led_cdev->regulator)
+		return 0;
+
+	/*
+	 * if the current regulator state is not the target state, we
+	 * need to update it.
+	 * note: No need for spinlock or atomic here because
+	 * led_cdev->regulator_state is modified only in the context of
+	 * the worqueue
+	 */
+	if (led_cdev->regulator_state != target_state) {
+
+		if (target_state == REG_ON)
+			rc = regulator_enable(led_cdev->regulator);
+		else
+			rc = regulator_disable(led_cdev->regulator);
+		if (rc) {
+			/*
+			 * If something went wrong with the regulator update,
+			 * Make sure that led_set_brightness_nosleep() assume
+			 * that the regultor is in the right state.
+			 */
+			atomic_set(&led_cdev->target_regulator_state,
+				   REG_UNKNOWN);
+			return rc;
+		}
+
+		led_cdev->regulator_state = target_state;
+	}
+	return 0;
+}
+
 static int __led_set_brightness(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
@@ -135,6 +172,11 @@ static void set_brightness_delayed(struct work_struct *ws)
 	    (led_cdev->flags & LED_HW_PLUGGABLE)))
 		dev_err(led_cdev->dev,
 			"Setting an LED's brightness failed (%d)\n", ret);
+
+	ret = __led_handle_regulator(led_cdev);
+	if (ret)
+		dev_err(led_cdev->dev,
+			"Updating regulator state failed (%d)\n", ret);
 }
 
 static void led_set_software_blink(struct led_classdev *led_cdev,
@@ -269,8 +311,27 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
-	/* Use brightness_set op if available, it is guaranteed not to sleep */
-	if (!__led_set_brightness(led_cdev, value))
+	bool update_regulator = false;
+	int old, new;
+
+	if (led_cdev->regulator) {
+		/*
+		 * Check if the regulator need to be updated.
+		 * We use an atomic here because multiple threads could
+		 * be calling this function at the same time. Using
+		 * atomic_xchg() ensures the consistency between
+		 * target_regulator_state, value and update_regulator
+		 */
+		new = !!value;
+		old = atomic_xchg(&led_cdev->target_regulator_state, new);
+		update_regulator = (old != new);
+	}
+
+	/*
+	 * If regulator state doesn't need to be changed, use brightness_set
+	 * op if available, it is guaranteed not to sleep
+	 */
+	if (!update_regulator && !__led_set_brightness(led_cdev, value))
 		return;
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 0b577cece8f7..02f261ce77f2 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -11,6 +11,9 @@
 
 #include <linux/rwsem.h>
 #include <linux/leds.h>
+#include <linux/regulator/consumer.h>
+
+enum { REG_OFF = 0, REG_ON, REG_UNKNOWN };
 
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 88bf2ceaabe6..8ce7cf937192 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -149,6 +149,11 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+
+	/* regulator */
+	struct regulator	*regulator;
+	int			regulator_state;
+	atomic_t		target_regulator_state;
 };
 
 /**
-- 
2.17.1

