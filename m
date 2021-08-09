Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95F33E3E58
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbhHIDdV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbhHIDdO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:14 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A98DC061760;
        Sun,  8 Aug 2021 20:32:53 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id x15so21690669oic.9;
        Sun, 08 Aug 2021 20:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zh5iqmi8rXG0JubuHldvmAB6oQlwzvKCz/SepLGCqCY=;
        b=MWP4T7dvrNbWzrDu4gDcDA+OElHp70VV+FLDPlBN0W02PhOVW5mmEpRlTuysz8buwR
         GwrUXd8+M+VNjs8sZW7xetR/Byrvxc5UCulyyE6NwJCVBvK+91RmqiWkGIBdgLjCEBow
         O/hk/HB6JfJDrwaWEDiK6wfOOF5T3kBD7ZMGt6oiq2BZMK/yhqgYOZiV3CO3J+LZX2S1
         dAH03iYeYj/9K3pLn2u2Gw4p8EScWcbuueuy5XRZiXa5/Lv9dBWBIZghBnYoJSZ85Xyv
         /LNVdz9hqiIOHjThlrYrmPwl4ic/abelIkUjgJvVqNkOhQ6hqhphGEuq8TPj0IkpyTRZ
         wInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zh5iqmi8rXG0JubuHldvmAB6oQlwzvKCz/SepLGCqCY=;
        b=TUAYlVxf6I38Dd60EoWRfaW9Hrfmm2dzEEhmjbq/2n99nnyZq8LlNHMYVLPBbq5ACe
         B0yX1UGsK1uwYtJDeaQRGrT9+/ISi8Av+PMIhh6tXy/1ea1BXE5QzWvPw8SfDk4fnX3P
         qMlLP2/EqpT8cL9M96Qqh8e/CGlFbEF1pdoN0+XYt/0T9/T7Nn7tRl7uqSU8of1wh0Wu
         yRnyRBtY52+vHeKj9AMeMJ8xIpB8M1jbE68Tc2RWW1dEE+0j+wPkg0qDusO1Tm7Rwutg
         W7PdEN5TJ6f3sGdGjBmgLrcCPtgJd52pWIRpjojtEA40nvzE+9z3Ny3Bz7OPn0w+BcYD
         mgCA==
X-Gm-Message-State: AOAM533yfegthzDO19v47CEod5ruyYE1YWA48cI1JZBJfNZ6wHfGTk+2
        k+sqZb/FxphlpGDJL51S2wWQRDg26Tgi49Nu
X-Google-Smtp-Source: ABdhPJzcy2hUnuR1AeGcvvqNHAkGkL2djYqnSo5AfgjJ1obRFD6jvrsxDLVAycTewHNHcuRTchzN2g==
X-Received: by 2002:a05:6808:1d7:: with SMTP id x23mr8317031oic.126.1628479971524;
        Sun, 08 Aug 2021 20:32:51 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:51 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 05/10] block: Add block device sysfs attribute to set/clear/show LED
Date:   Sun,  8 Aug 2021 22:32:12 -0500
Message-Id: <20210809033217.1113444-6-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add show & store functions in blk-ledtrig.c (attributes defined in genhd.c)

Show function shows all available LEDs (LEDs associated with blkdev trigger);
currently associated LED is shown in square brackets ([])

Store function accepts either all whitespace or "none" to clear LED

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 109 ++++++++++++++++++++++++++++++++++++++++++++
 block/blk-ledtrig.h |   8 ++++
 block/genhd.c       |   8 ++++
 3 files changed, 125 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 280fa9edc2dd..1af94dc7ea51 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -6,6 +6,7 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/ctype.h>
 #include <linux/genhd.h>
 #include <linux/leds.h>
 #include <linux/mutex.h>
@@ -139,3 +140,111 @@ static int blk_ledtrig_dev_set(struct gendisk *const disk,
 led_set_exit_return:
 	return ret;
 }
+
+
+/*
+ *
+ *	sysfs attribute store function to set or clear device LED
+ *
+ */
+
+// Returns a pointer to the first non-whitespace character in s (or a pointer
+// to the terminating null).
+static const char *blk_ledtrig_skip_whitespace(const char *s)
+{
+	while (*s != 0 && isspace(*s))
+		++s;
+
+	return s;
+}
+
+// Returns a pointer to the first whitespace character in s (or a pointer to
+// the terminating null), which is effectively a pointer to the position *after*
+// the last character in the non-whitespace token at the beginning of s.  (s is
+// expected to be the result of a previous call to blk_ledtrig_skip_whitespace.)
+static const char *blk_ledtrig_find_whitespace(const char *s)
+{
+	while (*s != 0 && !isspace(*s))
+		++s;
+
+	return s;
+}
+
+static bool blk_ledtrig_name_is_none(const char *const name, const size_t len)
+{
+	static const char none[4] = "none";	// no terminating null
+
+	return len == sizeof(none) && memcmp(name, none, sizeof(none)) == 0;
+}
+
+ssize_t blk_ledtrig_dev_led_store(struct device *const dev,
+				  struct device_attribute *const attr,
+				  const char *const buf, const size_t count)
+{
+	struct gendisk *const disk = dev_to_disk(dev);
+	const char *const led_name = blk_ledtrig_skip_whitespace(buf);
+	const char *const endp = blk_ledtrig_find_whitespace(led_name);
+	const ptrdiff_t name_len = endp - led_name;	// always >= 0
+	int ret;
+
+	if (name_len == 0 || blk_ledtrig_name_is_none(led_name, name_len)) {
+		blk_ledtrig_dev_clear(disk);
+		ret = 0;
+	} else {
+		ret = blk_ledtrig_dev_set(disk, led_name, name_len);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+
+/*
+ *
+ *	sysfs attribute show function for device LED
+ *
+ */
+
+ssize_t blk_ledtrig_dev_led_show(struct device *const dev,
+				 struct device_attribute *const attr,
+				 char *const buf)
+{
+	struct gendisk *const disk = dev_to_disk(dev);
+	struct blk_ledtrig_led *bd_led, *disk_led;
+	int ret, c = 0;
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_mutex);
+	if (ret != 0)
+		goto led_show_exit_return;
+
+	disk_led = rcu_dereference_protected(disk->led,
+					lockdep_is_held(&blk_ledtrig_mutex));
+
+	if (disk_led == NULL)
+		c += sprintf(buf, "[none]");
+	else
+		c += sprintf(buf, "none");
+
+	list_for_each_entry(bd_led, &blk_ledtrig_leds, leds_list_node) {
+
+		ret = snprintf(buf + c, PAGE_SIZE - c - 1,
+			       bd_led == disk_led ? " [%s]" : " %s",
+			       bd_led->led->name);
+		if (ret >= PAGE_SIZE - c - 1) {
+			ret = -EOVERFLOW;
+			goto led_show_exit_unlock;
+		}
+
+		c += ret;
+	}
+
+	buf[c] = '\n';
+	ret = c + 1;
+
+led_show_exit_unlock:
+	mutex_unlock(&blk_ledtrig_mutex);
+led_show_exit_return:
+	return ret;
+}
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 66a1302a4174..771000d43647 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -18,6 +18,14 @@ static inline void blk_ledtrig_disk_init(struct gendisk *const disk)
 
 void blk_ledtrig_dev_clear(struct gendisk *const disk);
 
+ssize_t blk_ledtrig_dev_led_store(struct device *const dev,
+				  struct device_attribute *const attr,
+				  const char *const buf, const size_t count);
+
+ssize_t blk_ledtrig_dev_led_show(struct device *const dev,
+				 struct device_attribute *const attr,
+				 char *const buf);
+
 #else	// CONFIG_BLK_LED_TRIGGERS
 
 static inline void blk_ledtrig_disk_init(const struct gendisk *disk) {}
diff --git a/block/genhd.c b/block/genhd.c
index 9fa734aeab0f..d5413a633410 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1012,6 +1012,11 @@ static struct device_attribute dev_attr_fail_timeout =
 	__ATTR(io-timeout-fail, 0644, part_timeout_show, part_timeout_store);
 #endif
 
+#ifdef CONFIG_BLK_LED_TRIGGERS
+static struct device_attribute dev_attr_led =
+	__ATTR(led, 0644, blk_ledtrig_dev_led_show, blk_ledtrig_dev_led_store);
+#endif
+
 static struct attribute *disk_attrs[] = {
 	&dev_attr_range.attr,
 	&dev_attr_ext_range.attr,
@@ -1033,6 +1038,9 @@ static struct attribute *disk_attrs[] = {
 #endif
 #ifdef CONFIG_FAIL_IO_TIMEOUT
 	&dev_attr_fail_timeout.attr,
+#endif
+#ifdef CONFIG_BLK_LED_TRIGGERS
+	&dev_attr_led.attr,
 #endif
 	NULL
 };
-- 
2.31.1

