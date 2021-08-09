Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F43E3E59
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbhHIDdV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbhHIDdO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:14 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81462C061757;
        Sun,  8 Aug 2021 20:32:53 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id z6-20020a0568302906b02904f268d34f86so16182632otu.2;
        Sun, 08 Aug 2021 20:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIAnA5vosh2k60KabPnPPb10AS/W866dQZt7HVdCEmk=;
        b=tXZq1L2UVs+m3REWTqKVAZ3lqTY9tg6dPpuzB8R/WeFbcGsr9bPfyyIY8J2/4zYcyg
         Hyu11aflIYW2zmaxgqQD4KR5LNFV1114sUl/qQIg4xF367jGzQBWZbrG4FLl+C4xMAB5
         S48NRK0IUHza1KxbWpbRyoen58MKtwco6odZ9/5TEzLP8v9iJ3tCLm1c8/Tz7dpMOlln
         syZGJr67PBLWAuJmcGwy0KBLBDSuUFWTogtSSopNtwzdfetnrHfo0yJnE9e/n2Mf+WRv
         nCS4u8yFqm1tAl6rBkO5rvSpEg/zguxXl1TsMNitI57eY5ve+enVNduOzXXdfxlULiN9
         GzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIAnA5vosh2k60KabPnPPb10AS/W866dQZt7HVdCEmk=;
        b=VT8lGtpAYriIG49/XmJcBACJp6/CmHCWLx1HopAuMqrf9KgoMTyJqKFYJZlY/U20M4
         TP9wZNcwCJ2F/Z2ZoeMIGo6t5JAVHNEmn6eLP1ipzVhHRXcQ1JRViLtD0uvWM/3uBan5
         fmxECaih9MRY1Z5VpIzG/q1QQdIi5A5dIiC2RRHZRWM2mUdKCqujnS7j00D6hov5X74d
         /ZvDV24+hXz24gE5f/ZnkfYnrKWcIwAifT5RglfnY5iwffb3AdErj6fKh+HbHPCPAVZA
         3XqFiIpBFK2jfqid71wSemSS5CE8bvVqAdSGiHQKEyJwBbbSdT0u4fKUgCJg8YKVBKdX
         GT0Q==
X-Gm-Message-State: AOAM533C6+N+GRAH4mdgOSr5ppwQ1ctT+7TSVvtiNKa4W0Ii1E6kSWJ4
        29IcO2g0h0/V5SnRsKsCDrNj3UTbpXsTv0yw
X-Google-Smtp-Source: ABdhPJzZ5kn7aTWi1x675wRiIsayhrUWdERSWqZCPUcYy5+LBYxj3/ENLc23Rie9UTG15kigouyauw==
X-Received: by 2002:a05:6830:2377:: with SMTP id r23mr15886288oth.125.1628479972909;
        Sun, 08 Aug 2021 20:32:52 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:52 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 07/10] block: Add sysfs attributes to LEDs associated with blkdev trigger
Date:   Sun,  8 Aug 2021 22:32:14 -0500
Message-Id: <20210809033217.1113444-8-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add blink_on & blink_off attributes to control the duration of each LED blink
(blink_on) and the minimum time between blinks (blink_off) in milliseconds

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index f8cb6de203f8..d02f32205985 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -343,3 +343,66 @@ static void blk_ledtrig_deactivate(struct led_classdev *const led)
 	synchronize_rcu();
 	kfree(bd_led);
 }
+
+
+/*
+ *
+ *	Per-LED blink_on & blink_off device attributes
+ *
+ */
+
+static ssize_t blk_ledtrig_blink_show(struct device *const dev,
+				      struct device_attribute *const attr,
+				      char *const buf);
+
+static ssize_t blk_ledtrig_blink_store(struct device *const dev,
+				       struct device_attribute *const attr,
+				       const char *const buf,
+				       const size_t count);
+
+static struct device_attribute blk_ledtrig_attr_blink_on =
+	__ATTR(blink_on, 0644,
+	       blk_ledtrig_blink_show, blk_ledtrig_blink_store);
+
+static struct device_attribute blk_ledtrig_attr_blink_off =
+	__ATTR(blink_off, 0644,
+	       blk_ledtrig_blink_show, blk_ledtrig_blink_store);
+
+static ssize_t blk_ledtrig_blink_show(struct device *const dev,
+				      struct device_attribute *const attr,
+				      char *const buf)
+{
+	struct blk_ledtrig_led *const bd_led = led_trigger_get_drvdata(dev);
+	unsigned int value;
+
+	if (attr == &blk_ledtrig_attr_blink_on)
+		value = READ_ONCE(bd_led->blink_on);
+	else	// attr == &blk_ledtrig_attr_blink_off
+		value = READ_ONCE(bd_led->blink_off);
+
+	return sprintf(buf, "%u\n", value);
+}
+
+static ssize_t blk_ledtrig_blink_store(struct device *const dev,
+				       struct device_attribute *const attr,
+				       const char *const buf,
+				       const size_t count)
+{
+	struct blk_ledtrig_led *const bd_led = led_trigger_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret != 0)
+		return ret;
+
+	if (value > BLK_LEDTRIG_BLINK_MAX)
+		return -ERANGE;
+
+	if (attr == &blk_ledtrig_attr_blink_on)
+		WRITE_ONCE(bd_led->blink_on, value);
+	else	// attr == &blk_ledtrig_attr_blink_off
+		WRITE_ONCE(bd_led->blink_off, value);
+
+	return count;
+}
-- 
2.31.1

