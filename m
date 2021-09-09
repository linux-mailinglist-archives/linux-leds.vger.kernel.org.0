Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0370405F80
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346567AbhIIW1A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346813AbhIIW0p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:45 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0418AC061762;
        Thu,  9 Sep 2021 15:25:33 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso4585941ots.5;
        Thu, 09 Sep 2021 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wROv0gkSVLlQgiV3dTqte44uo2NP+QxD284SroRgYCM=;
        b=lJ0YGiCrc0oMVBjDFQYj5HE7PJl758CvCYWTbTtN+6SmQmjWvwv+9rtyB3YbBwv3qx
         QahoM9PE4zAJUv3G3yZKq1t1zVbPJOb7HCUZT1opoyp/FbxPrgVHa6ds5uNXRg5ry9gM
         ZYvTSDvnuXaeOz9XL/5XWA+XzsG48jFBCiI3R96Gh9m2mUu0ZickGROEjmHb9dF6tUc/
         IoBa4Sw2k8dHKo/kopA7vmPVAefeHXNriKABkgs6/Q0923MDzK5aG3PY+QfRerB9K8xR
         sVfs5PToSyYaEW14FUGwfUjHLK+Bg6HcF/9nj1JsuwTOhxDCOKSJT8XKg/iWV88FQNc0
         RDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wROv0gkSVLlQgiV3dTqte44uo2NP+QxD284SroRgYCM=;
        b=M8vvzsOWSX5qsmIOUqWM2lKZcG2RgDAZkJQ77IRdDzXJ0V7SjQ7TsTOLu/ErP6R0KX
         zhMBVoQBiuJXCKGCYjI6TB3CILW7H37OOCdoTDwK++1kqqT8HiQaivVprn8PCxxkL235
         hy4RtNrKomjlO5e5WeliPUdSbEMnhnY8Xa9bvT5ecdP0+fkFbslxD1q1RNlMpQnOpky3
         WY1w8p72yxEoX9FnTNbjWZZvQq6hudO75pJA2nB+8Z+86Mk8VEgY/WAD85y+pUiSp2th
         QzlD0sp70i2V+hl21XEc1UyyqUWqwckoUXbncJfFFneEQY/eAOXsNEPAmyYaJ7/hOb6t
         hiUA==
X-Gm-Message-State: AOAM5325cIU3hb9ZjpVSWrJ8hftsm2gRlBaldoFghZ6GTy+yyQephu/i
        2efy57M6IdzGHCGsHY9/CdQ=
X-Google-Smtp-Source: ABdhPJykiJQ83ETtg4IQyPTdQ7ozvxzPSy+bNmovIJd5VatyuNQ52rtT2cNMwUKzGuFUUDTMKtbq0A==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr1997929otj.96.1631226329405;
        Thu, 09 Sep 2021 15:25:29 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:29 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 14/15] leds: trigger: blkdev: Add remaining sysfs attributes
Date:   Thu,  9 Sep 2021 17:25:12 -0500
Message-Id: <20210909222513.2184795-15-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

/sys/class/leds/<led>/blink_time controls - per-LED blink duration

/sys/class/leds/<led>/interval - global frequency with which devices
are checked for activity and LEDs are blinked

/sys/class/leds/<led>/mode - blink LED for reads, writes, or both

When showing mode, show all modes with current value in square brackets

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 132 ++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index c7e101935bf6..4b88f877ee81 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -462,6 +462,135 @@ static void blkdev_deactivate(struct led_classdev *const led_dev)
 }
 
 
+/*
+ *
+ *	blink_time sysfs attribute
+ *
+ */
+
+static ssize_t blink_time_show(struct device *const dev,
+			       struct device_attribute *const attr,
+			       char *const buf)
+{
+	const struct ledtrig_blkdev_led *const led =
+					led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", READ_ONCE(led->blink_msec));
+}
+
+static ssize_t blink_time_store(struct device *const dev,
+				struct device_attribute *const attr,
+				const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret != 0)
+		return ret;
+
+	if (value < LEDTRIG_BLKDEV_MIN_BLINK)
+		return -ERANGE;
+
+	WRITE_ONCE(led->blink_msec, value);
+	return count;
+}
+
+static DEVICE_ATTR_RW(blink_time);
+
+
+/*
+ *
+ *	interval sysfs attribute - affects all LEDS
+ *
+ */
+
+static ssize_t interval_show(struct device *const dev,
+			     struct device_attribute *const attr,
+			     char *const buf)
+{
+	return sprintf(buf, "%u\n",
+		       jiffies_to_msecs(READ_ONCE(ledtrig_blkdev_interval)));
+}
+
+static ssize_t interval_store(struct device *const dev,
+			      struct device_attribute *const attr,
+			      const char *const buf, const size_t count)
+{
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret != 0)
+		return ret;
+
+	if (value < LEDTRIG_BLKDEV_MIN_INT)
+		return -ERANGE;
+
+	WRITE_ONCE(ledtrig_blkdev_interval, msecs_to_jiffies(value));
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(interval);
+
+
+/*
+ *
+ *	mode sysfs attribute - blink for reads, writes, or both
+ *
+ */
+
+static const struct {
+	const char	*name;
+	const char	*show;
+} blkdev_modes[] = {
+	[LEDTRIG_BLKDEV_MODE_RO] = {
+		.name	= "read",
+		.show	= "[read] write rw\n",
+	},
+	[LEDTRIG_BLKDEV_MODE_WO] = {
+		.name	= "write",
+		.show	= "read [write] rw\n",
+	},
+	[LEDTRIG_BLKDEV_MODE_RW] = {
+		.name	= "rw",
+		.show	= "read write [rw]\n",
+	},
+};
+
+static ssize_t mode_show(struct device *const dev,
+			 struct device_attribute *const attr, char *const buf)
+{
+	const struct ledtrig_blkdev_led *const led =
+					led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, blkdev_modes[READ_ONCE(led->mode)].show);
+}
+
+static ssize_t mode_store(struct device *const dev,
+			  struct device_attribute *const attr,
+			  const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	enum ledtrig_blkdev_mode mode;
+
+	for (mode = LEDTRIG_BLKDEV_MODE_RO;
+				mode <= LEDTRIG_BLKDEV_MODE_RW; ++mode) {
+
+		if (sysfs_streq(blkdev_modes[mode].name, buf)) {
+			WRITE_ONCE(led->mode, mode);
+			return count;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static DEVICE_ATTR_RW(mode);
+
+
 /*
  *
  *	Initialization - register the trigger
@@ -471,6 +600,9 @@ static void blkdev_deactivate(struct led_classdev *const led_dev)
 static struct attribute *ledtrig_blkdev_attrs[] = {
 	&dev_attr_link_device.attr,
 	&dev_attr_unlink_device.attr,
+	&dev_attr_blink_time.attr,
+	&dev_attr_interval.attr,
+	&dev_attr_mode.attr,
 	NULL
 };
 
-- 
2.31.1

