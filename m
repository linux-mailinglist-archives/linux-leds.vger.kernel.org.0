Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319DC3F10B8
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhHSCwS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235985AbhHSCwB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:01 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99CBC061764;
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id x10-20020a056830408a00b004f26cead745so6843461ott.10;
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IJR4ds+4+CeZ2VdvpA3rZh2hvpwHhN5sNDRM77ik75U=;
        b=SCTmfsSZXysNoVTmaqAaFscvgDU8pv6pdPdLRa1C1TcmqL5ah4cnY5ATsXtLecNeUo
         V/bM2E2jPLwBAtezc22JOg9o0sMDAVLqw1kkUw6WZxKnPHl5WXp1KXSdR8fWDwLUtV61
         ClElyUvIWS3uyHNX8nK9j2bQSw0rxM0XuPS7lf8vWl9aPTzN6v5RXL5G7ulgoQeLWEte
         NthgHKrdFNdVKV9aAsOrfInsDhYRZWmGALekD695eJ0CCa34T4jFhzP86cmVMWrHyaHP
         nqqWEqmV2K4G8qIBW/LHti+sAPp+4LZzeDydwVFpz3t10EN6QAdcT83waSDLUrc0UaSS
         RYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJR4ds+4+CeZ2VdvpA3rZh2hvpwHhN5sNDRM77ik75U=;
        b=FNxGPbUjkY4oUsPm5Kx/Mbkc/Yo40/GAAvtYcGhrd9rgxZ9ErHQ6iZF4Bvn2zQRc6v
         AyoGWzobcy8gt93SNZvLBANM+Gv4XWn5QHCUuHOIoEQTv+VG7dcLy60i3rQ1KRm4+aPH
         UqEXxgeVnov3H7K2S7W7zH3YL8XAqyCvaR1j6/I1doo2VWlxZgznAP5o/gytU4CzAZh0
         yQ+XN2krxG4fx9936AlDm+vBLqvCqxV4UJwJufr08szgJoyyUA4NzTKRAPSTDkI4yozI
         5H7RzrOV7rlHH5n5/pt/3vjzHH/bNWbPs8kDn351yZd1z3GKx9EAqxO2555bgC9dXRO7
         QF3w==
X-Gm-Message-State: AOAM5303/uPxXpLn6onsbB9gdl5VZnODYgQLidNS/ZDe7EKluo1G22SQ
        2cAiaFIluJ0hs/lITtDfhLXKAbTz7BzYe909
X-Google-Smtp-Source: ABdhPJzJzDp/zt8Lm9O57CeptXC+XBKQvnaQoxwF6kT5SljYeFYLRDQSPcZwZNJg9whgu9k3FuN++Q==
X-Received: by 2002:a05:6830:411a:: with SMTP id w26mr9765377ott.127.1629341473048;
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:12 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 12/18] ledtrig-blkdev: Add sysfs attributes to [dis]associate LEDs & devices
Date:   Wed, 18 Aug 2021 21:50:47 -0500
Message-Id: <20210819025053.222710-13-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

/sys/class/leds/<led>/add_blkdev - to create device/LED associations

/sys/class/leds/<led>/delete_blkdev to remove device/LED associations

For both attributes, accept multiple device names separated by whitespace

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index a1646752b9a0..15b15aefdfd8 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -480,3 +480,51 @@ static int blkdev_disk_add(struct ledtrig_blkdev_led *const led,
 exit_return:
 	return ret;
 }
+
+
+/*
+ *
+ *	sysfs attributes to add & delete devices from LEDs
+ *
+ */
+
+static ssize_t blkdev_add_or_del(struct device *const dev,
+				 struct device_attribute *const attr,
+				 const char *const buf, const size_t count);
+
+static struct device_attribute ledtrig_blkdev_attr_add =
+	__ATTR(add_blkdev, 0200, NULL, blkdev_add_or_del);
+
+static struct device_attribute ledtrig_blkdev_attr_del =
+	__ATTR(delete_blkdev, 0200, NULL, blkdev_add_or_del);
+
+static ssize_t blkdev_add_or_del(struct device *const dev,
+				 struct device_attribute *const attr,
+				 const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	const char *const disk_name = blkdev_skip_space(buf);
+	const char *const endp = blkdev_find_space(disk_name);
+	const ptrdiff_t name_len = endp - disk_name;	/* always >= 0 */
+	int ret;
+
+	if (name_len == 0) {
+		pr_info("blkdev LED: empty block device name\n");
+		return -EINVAL;
+	}
+
+	if (attr == &ledtrig_blkdev_attr_del) {
+		blkdev_disk_delete(led, disk_name, name_len);
+	} else {	/* attr == &ledtrig_blkdev_attr_add */
+		ret = blkdev_disk_add(led, disk_name, name_len);
+		if (ret != 0)
+			return ret;
+	}
+
+	/*
+	 * Consume everything up to the next non-whitespace token (or the end
+	 * of the input).  Avoids "empty block device name" error if there is
+	 * whitespace after the last token (e.g. a newline).
+	 */
+	return blkdev_skip_space(endp) - buf;
+}
-- 
2.31.1

