Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EC540070B
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351049AbhICUrR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351036AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9509CC0612A4;
        Fri,  3 Sep 2021 13:46:11 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so57843ooh.7;
        Fri, 03 Sep 2021 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5mTctvAaHxbdM02zl0VqaWHQiOVodrcZQi3t2zf4Y8=;
        b=FmiVmMRWMlGyrDFBSvi0IEW2we6uTdpDIZ7jqELZ9axnTlwpDY6dAIE5SIWHX68ZM7
         uzLM8Yo0Am0HGCd8hmMb+E/w9zLXPtbc4rVP0GDETnporsfmTFjOCaSkdqPRC7nur6qz
         4c53/bNROTn3WZguDe1/zQMFaSGMejQuMCK91MGd9m4ljIvXY86YM6CfmOwjp1aG37lV
         zzXSu5PAuPZhjpviE7vGgEc9RfiwZ5Hm1e1dQbKNMtTwdFEKK6iwE+cfDZ0A94Tu2TtG
         RuGDypcdbzzSJWcWJ6c+t2pSTtY3kdOGnY63IgVvRY8Y4/pG1slIl5iaA4DcWrzXu3yg
         uSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5mTctvAaHxbdM02zl0VqaWHQiOVodrcZQi3t2zf4Y8=;
        b=D/Z7ilkeDFk09JQTLIrZo696HIiKasWi7ucbBZF2XbPMHXzFfatbqA94vuoLQnKbDF
         uaCYyrBMNTGQy+wTv34dNouBg9EAUuQfBSRQBYmoyPFcXANwL2xzY2++TlAqFpr4am98
         YyCBGOyy2UxxoGP6ljfB+jw6cwDDiFqT8RPRLCrlFNJY1UsBmVlE3T3OTaSzW85cAeYr
         E4GMdb4/U0bgCgD/AQYC+jc1SJpSV/uGWh4S1wxY1vyGSrln+RwkQh87hQehvJ6/qLST
         Dga31RfVeZdR27ZFN+TJZFNnhQu3gJcFC+8lTpLAI3MyP3GfglqR2gwk/iIrlxeVF4WN
         5rAw==
X-Gm-Message-State: AOAM531QnnwQFGPzcFSn/e0MHyFgMi7EZo1nBsgPfP+xLdqLjsoIrVOB
        F618LmZecNj89C7e4VMjl9Q=
X-Google-Smtp-Source: ABdhPJyI18JIHGoRZ8qFNC/9Mxd9Kv3bk3ZrTwbSFkLgy7EoKwkQM2BKqFS7g+ytKW8bbYaytPlqbA==
X-Received: by 2002:a05:6820:235:: with SMTP id j21mr4490189oob.75.1630701970882;
        Fri, 03 Sep 2021 13:46:10 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:10 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 17/18] ledtrig-blkdev: Add mode (read/write/rw) sysfs attributue
Date:   Fri,  3 Sep 2021 15:45:47 -0500
Message-Id: <20210903204548.2745354-18-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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
index b23a5c98de98..ec167633e329 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -620,3 +620,70 @@ static ssize_t blkdev_time_store(struct device *const dev,
 
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
+		if (ledtrig_blkdev_streq(blkdev_modes[mode].name,
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

