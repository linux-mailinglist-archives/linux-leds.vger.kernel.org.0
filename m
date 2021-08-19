Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1573F10C7
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236077AbhHSCw0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbhHSCwB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:01 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89380C0612A3;
        Wed, 18 Aug 2021 19:51:15 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso6795660oth.12;
        Wed, 18 Aug 2021 19:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXEks3JI+ONhTh8Qk52K9Fzoc117gt7kl+QmqDHFZ5c=;
        b=Xt4zZ+NS/ome28aS6rZPPnoQIgvLjCXE1je8BOkKS+mzqJeVv5MJlcZ3ppWG4G3dZJ
         I75AU1qbeRx1zb0TaOOyeCAas3nY7xnvszopf1FXTqfOgxk9G/JRhYS2xjHUVy1YfW9J
         uVYwzyIs2ourcYJyOk5LrMTMqd+nKkxm4zfPAYPUL2Ct+BwSSYT10mJbFumr3St8xQ2l
         c8DwKpIZBNY+Jhm4Ij9iJjD/Zh2r33hTfHsAe0KQkXEqX5fPcVi6UA4m6QZj8fpgGq41
         R2vCnSN3m90BXH+SLHdcayd/CbG5Yf1q+OBJ7ZXtvLeSuBeWgGSLICG7TFA85BMECJ+T
         esFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXEks3JI+ONhTh8Qk52K9Fzoc117gt7kl+QmqDHFZ5c=;
        b=SraNRyFjCGROOBeJtgyaOeesrz6gQRzYvPPXX45gnv2NNYUzCsebDILluJAx861Fxu
         pjHOdOiCoOgdk2sn85caW05N1yRXpoM5wntpK4YoOCy+eZ7YSE8bpeQvwsP0toIMQfou
         6+dCrc6VnEra1bzIRIXee2EEG4tet+1MXknSobJhDRb4C2GFlTWvqQOG0fvW3Uj1gHMJ
         HYwpytG8NWTiqKnicMQ1HbH4saTNhPCExGvwgubb6+5J8MSTgg+ZfVFuvkqyF+0w+VIh
         vim45oYiwP+kN1upJGIIS3P7o65FDOL2yGAOgEEBKIi6/hgN6KvkrnxUtbEYDW0HtWpC
         hyqA==
X-Gm-Message-State: AOAM530I2cntuiBkD3TIJot/xeAJllmC2HaPCtZC3JBZyhqd8Xp2bLe6
        n+JMI2JPYi+vWdMQGiyj8mQYo4ghOmpMyMLz
X-Google-Smtp-Source: ABdhPJz0J6AMMiJdieUg0LdlebyEWi5moitw0Ifbz/1N1W5wSKMYt8S+kjeiV2iLpIhAj/lcOfhbCA==
X-Received: by 2002:a9d:6003:: with SMTP id h3mr9887837otj.42.1629341474721;
        Wed, 18 Aug 2021 19:51:14 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:14 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 14/18] ledtrig-blkdev: Add mode (read/write/rw) sysfs attributue
Date:   Wed, 18 Aug 2021 21:50:49 -0500
Message-Id: <20210819025053.222710-15-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Show all modes, with current mode in square brackets, in show function

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 481b2d142db2..88e2a11af1a9 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -591,3 +591,70 @@ static ssize_t blkdev_time_store(struct device *const dev,
 
 	return count;
 }
+
+
+/*
+ *
+ *	LED mode device attribute
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
+static ssize_t blkdev_mode_show(struct device *const dev,
+				struct device_attribute *const attr,
+				char *const buf)
+{
+	const struct ledtrig_blkdev_led *const led =
+					led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, blkdev_modes[READ_ONCE(led->mode)].show);
+}
+
+static ssize_t blkdev_mode_store(struct device *const dev,
+				 struct device_attribute *const attr,
+				 const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	const char *const mode_name = blkdev_skip_space(buf);
+	const char *const endp = blkdev_find_space(mode_name);
+	const ptrdiff_t name_len = endp - mode_name;	/* always >= 0 */
+	enum ledtrig_blkdev_mode mode;
+
+	if (name_len == 0) {
+		pr_info("blkdev LED: empty mode\n");
+		return -EINVAL;
+	}
+
+	for (mode = LEDTRIG_BLKDEV_MODE_RO;
+				mode <= LEDTRIG_BLKDEV_MODE_RW; ++mode) {
+
+		if (blkdev_streq(blkdev_modes[mode].name,
+						mode_name, name_len)) {
+			WRITE_ONCE(led->mode, mode);
+			return count;
+		}
+	}
+
+	pr_info("blkdev LED: invalid mode (%.*s)\n", (int)name_len, mode_name);
+	return -EINVAL;
+}
+
+static struct device_attribute ledtrig_blkdev_attr_mode =
+	__ATTR(mode, 0644, blkdev_mode_show, blkdev_mode_store);
-- 
2.31.1

