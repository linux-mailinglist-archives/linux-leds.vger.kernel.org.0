Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210CA400708
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351038AbhICUrQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351033AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC78C06129E;
        Fri,  3 Sep 2021 13:46:11 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id m14-20020a4ad50e000000b002912a944a47so53560oos.12;
        Fri, 03 Sep 2021 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uE+OoM267dFPh/kKA/VGTkuQVxZM2722ivJ6mdLlhA0=;
        b=Weo3JI/uObhJNd0BU5gCrAEnyYCkGdwpndCtmmqpOE2Po43fuU7yHbO4+WkTLeX397
         F0LdVDGZu/e1GsqSb6UVEJ9JWOrelRxEXQGiP9sKd7euKz41x7lbiod+ngwBOR/8xxaU
         /d3wijX0eWH6HlrB2RzLD3QxtJIpJAQx8wdFezq38IbQ2myTl9fBcYHPzjH4ybU56S86
         1/M4GX26Hkhql1+CG/MStOBb7DvL91T7HeaoAa1h1kkNQL/T3Wl7EPVhP31uao/VxUrX
         P8wIKa/NgKSMn6GtNmA1snNHuq/EGXyHCZM41a0FybbeqFVs5vNs4M6HXzNePEpnWl/u
         02cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uE+OoM267dFPh/kKA/VGTkuQVxZM2722ivJ6mdLlhA0=;
        b=Z3js19uxUPhk+TqmBJLlWg8USuWfDeotvMssyRL6ZtcM2LZHTfWChdo3cPjRBC7PmR
         i4Mh8gZ1x6BW/T4p6sBiS9hOyRl0Zwnm6mOc6cKNYu9muotypLjpLLCdOfZ4gGYyTYQn
         RYsTObgZk1YjP0Q+IgbIANBj0pUc+OYRWZZWm9GtBQ4hon2LBHSgeRPuQbsmBIclsO6U
         mKtBT+X5NsPvISmSbRiA0JsOO86Wg8DT8hoV4ZWw/d5qeIUT6NqVaMiVrs8ElNklFsH/
         8rFlrqg0TzwwSjyvZoVlJaABPREx9gghpO3L5Gz00byJbYpAHdiqGP7+AshagEIjqWH8
         s++A==
X-Gm-Message-State: AOAM530ocioAPM+r4FT8Vf3C7rTwt6Ld/zwT6ihoxy3SzjgIW3U2GB6e
        P54jRUCjmNSMbm3FpkEwDWk=
X-Google-Smtp-Source: ABdhPJzbX6P/qtWzYtqTYF/9QJ5d1VZCn3vDqoTEcCyU2jaoLAyBFHtjlQ+RtdPuMCFgsFGQixh6Tw==
X-Received: by 2002:a4a:c119:: with SMTP id s25mr4645248oop.22.1630701969395;
        Fri, 03 Sep 2021 13:46:09 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:09 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link LEDs & devices
Date:   Fri,  3 Sep 2021 15:45:45 -0500
Message-Id: <20210903204548.2745354-16-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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
index b2ec85b805d0..db82d37fc721 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -509,3 +509,51 @@ static void blkdev_deactivate(struct led_classdev *const led_dev)
 
 	module_put(THIS_MODULE);
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
+	 * whitespace (such as a newline) after the last token.
+	 */
+	return blkdev_skip_space(endp) - buf;
+}
-- 
2.31.1

