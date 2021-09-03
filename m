Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E02400706
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351025AbhICUrQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351023AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE58EC0613C1;
        Fri,  3 Sep 2021 13:46:10 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id e206-20020a4a55d7000000b00291379cb2baso55356oob.9;
        Fri, 03 Sep 2021 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7tVbRI5hQo9IfNFJPGEJe7Lec3t9vFzANnU7EaHDqfA=;
        b=FjAkJ1ZoWQ7UkmDl2G7AjtHkNfCCBdj2g2wlHUpnTU003/GMkbE0BMYB3t2jyR1hSa
         sHY9tNl5W5HDmPY9tLeJUYsd8WYmDM6qeayAsT1C3zedU/AtYdUdC9WXPQzoUSlAFTs1
         jQmbJa9t8Oeal3HF6vj7gsZvHJiVwXSXMstZFWMfWRDbqW8kDFnFvQ8YiXQZb77bUzg+
         YfdxTGJCG6v15Vsey2I31ODvwtCltVuucaMsMiZy/g8SMZnRLbIk332/xhPo3GuOI22e
         6bz7r7V/odNTK2bil6YqdG79OAFPnovxm5YTuJXtHsdr5oTSQXTB2u4UdDVZ0Cl8HZJm
         6nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tVbRI5hQo9IfNFJPGEJe7Lec3t9vFzANnU7EaHDqfA=;
        b=lTJOhENeEr3aGfMABAHHEiGlfGdgyOGgt2FMg2FJFmKtjG0kthyAuirFK+MIWmehZz
         fC9NoJAz+/kuvRYwuGbf7jFfJeD6O45fYUwjl+MdWJA8K6xLCdFD3EnPoSxehd7DO8vh
         RQvza/DUin4WN227Dgeu271NsLklT/0x2u73X6YwM6FC3zD1EEva3cqh+079D/Lw6fg1
         tYMQceQLFDfHHJtOJZDjk/1HwpwgKxWjFbyFXpZntF0FIzBgW9jOglej658MDsvx8F+L
         cFzKeC7Tb8/osr40HnmraltN0hKcNds07/C0Tu69jA+31lPaOZOrEWMpukq6blU9CSJV
         tNwg==
X-Gm-Message-State: AOAM5302+BO+RQnyGxyx81osca6z2NwsAfG6lnP+Ij0p2qxarufU/8MN
        33En6UwfTt17hJjFuT2snV8=
X-Google-Smtp-Source: ABdhPJwQ0uEjzN/HiUlFAcHBqvQD+XPAXkOMGPEEOF1aMteoAVf0ypFUZbNnu0v1GYTrRqpRnQ1RwA==
X-Received: by 2002:a4a:ca83:: with SMTP id x3mr4547336ooq.2.1630701970119;
        Fri, 03 Sep 2021 13:46:10 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:09 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 16/18] ledtrig-blkdev: Add blink_time & interval sysfs attributes
Date:   Fri,  3 Sep 2021 15:45:46 -0500
Message-Id: <20210903204548.2745354-17-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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
index db82d37fc721..b23a5c98de98 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -557,3 +557,66 @@ static ssize_t blkdev_add_or_del(struct device *const dev,
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

