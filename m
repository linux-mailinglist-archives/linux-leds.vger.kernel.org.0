Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF503F10B9
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbhHSCwS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236250AbhHSCwB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:01 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A40C0613D9;
        Wed, 18 Aug 2021 19:51:14 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so6844628ott.8;
        Wed, 18 Aug 2021 19:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1HN2fz/hl6o2IBWHxShTKoPIjV7uYpHR0/UMxqc+5q4=;
        b=fL4NgS5Shmo0+2ZqQYXfjcMKUtmFnqgekgokuEHiBLQRNPdP0WPjVgVa8Agy3Mwq3b
         lq9OI39oggQIH1oIfp+k4gr72zrVtr1b2fBjTst4NoAMJuewdj6dDC7tnNsJHLSqfsvV
         hU9J0cEeDCU8cV/8Oz+MmCq/T+I4EO5/yG7CIBI7Drgdms819BCbyuX+8MhvgxFmBvCs
         H6+HhNGv1U1Mvb7wJ3NWL20MxhrlLpX64iU3wMN64lH81bLdy+Kgu95pjPEvZUDTCbJH
         Q8eAxyhE7pLti0gkLMUiOwJ7VspGZRcK3i6u9YeRRw9PnhX368CN3J82ODMDKirdMWFA
         vfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1HN2fz/hl6o2IBWHxShTKoPIjV7uYpHR0/UMxqc+5q4=;
        b=uYDsgi04D8/6fCKeMH3Hhnzh9X7JobTLWjc0jvJHzGg6c5tB94uGKBQj+snRq6gHZ6
         7AomcCzpALEIw2odPU5L7Uihkdl2E1lkFTWl605DCnsMXleMiim7/H6rTkL1UWuzM296
         Ur4PKcQ1OEwTnkqMlUeHC/p0YLsBI8uDxFAf2gP5f5QLK3ZsoZghWBjZK9hWQnQdfL6K
         w/meFhyhZWsbXaM0uHQhKx8JvEyoEDX3WOph233ZfIPsvAGEoKcf3J5OQ5I1AWndu7/N
         jCnJ6wmhIf4tPPvsKp331QptUdweUFXDKiTV60R78uQDoDwELI4Q+6yZY8rMduKAuXPk
         4Ilg==
X-Gm-Message-State: AOAM532s5v2bPMvulMt9/ogVIpHlt4viy/x7zJRf0WVoIDehWrz+Ttoq
        rd0XEIdMK5tJRZi3dbxon4uU802/4XmwfJMn
X-Google-Smtp-Source: ABdhPJxlr17Uf/8YuP9vAZoS2kOLGIeaDcFO5/DaXhnwSLeMr9ioHwmpBQsJP3O2Y+0A887WKZG81Q==
X-Received: by 2002:a9d:7653:: with SMTP id o19mr9992677otl.236.1629341473842;
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 13/18] ledtrig-blkdev: Add blink_time & interval sysfs attributes
Date:   Wed, 18 Aug 2021 21:50:48 -0500
Message-Id: <20210819025053.222710-14-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

/sys/class/leds/<led>/blink_time controls - per-LED blink duration

/sys/class/leds/<led>/interval - global frequency with which devices
are checked for activity and LEDs are blinked

Enforce 25 millisecond minimum for both attributes

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 15b15aefdfd8..481b2d142db2 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -528,3 +528,66 @@ static ssize_t blkdev_add_or_del(struct device *const dev,
 	 */
 	return blkdev_skip_space(endp) - buf;
 }
+
+
+/*
+ *
+ *	blink_time & interval device attributes
+ *
+ */
+
+static ssize_t blkdev_time_show(struct device *const dev,
+				      struct device_attribute *const attr,
+				      char *const buf);
+
+static ssize_t blkdev_time_store(struct device *const dev,
+				 struct device_attribute *const attr,
+				 const char *const buf, const size_t count);
+
+static struct device_attribute ledtrig_blkdev_attr_blink_time =
+	__ATTR(blink_time, 0644, blkdev_time_show, blkdev_time_store);
+
+static struct device_attribute ledtrig_blkdev_attr_interval =
+	__ATTR(interval, 0644, blkdev_time_show, blkdev_time_store);
+
+static ssize_t blkdev_time_show(struct device *const dev,
+				struct device_attribute *const attr,
+				char *const buf)
+{
+	const struct ledtrig_blkdev_led *const led =
+						led_trigger_get_drvdata(dev);
+	unsigned int value;
+
+	if (attr == &ledtrig_blkdev_attr_blink_time)
+		value = READ_ONCE(led->blink_msec);
+	else	// attr == &ledtrig_blkdev_attr_interval
+		value = jiffies_to_msecs(READ_ONCE(ledtrig_blkdev_interval));
+
+	return sprintf(buf, "%u\n", value);
+}
+
+static ssize_t blkdev_time_store(struct device *const dev,
+				 struct device_attribute *const attr,
+				 const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret != 0)
+		return ret;
+
+	if (value < LEDTRIG_BLKDEV_MIN_TIME) {
+		pr_info("blkdev LED: attempt to set time < %s milliseconds\n",
+			__stringify(LEDTRIG_BLKDEV_MIN_TIME));
+		return -ERANGE;
+	}
+
+	if (attr == &ledtrig_blkdev_attr_blink_time)
+		WRITE_ONCE(led->blink_msec, value);
+	else	// attr == &ledtrig_blkdev_attr_interval
+		WRITE_ONCE(ledtrig_blkdev_interval, msecs_to_jiffies(value));
+
+	return count;
+}
-- 
2.31.1

