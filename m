Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BF64006F4
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351017AbhICUrE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235953AbhICUrD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:03 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5EDC061575;
        Fri,  3 Sep 2021 13:46:02 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id g4-20020a4ab044000000b002900bf3b03fso63076oon.1;
        Fri, 03 Sep 2021 13:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kS1HWDTxQaaD17dKdhb3nU8krX8n75We9gBrrNQ1qbE=;
        b=oioz021xv2ej7NcA2SOVVwCjRuLLSQVyectt4KHmHW/nuu7y1WCA3RLVJ4qykyP6a4
         jAIMmt4UC+DDOpFA8u4OpbEF8SKo7/keaC8a4pL++d0O6zBigoSV4vWrxwv+nL4iziK0
         jLtrsGhKM8EPxQECl0wR1Qg0ZNonBDSvz2kJ1JWW2dA9RWNCgN8UfMg8JIJ9XrPqIVR9
         yLdlwrVNI+V/tmsYAayAVZGZDQAPneCwdYJ70lUINxl1W5m6bMP63ep5WJeXAJUfvbSG
         I7Pydt53kFazIG+RcLk1jWZn+xsZh5RfEJyYT1fkpJyHuGl4BuVpfF3Td/xaSp2Nk1PC
         9VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kS1HWDTxQaaD17dKdhb3nU8krX8n75We9gBrrNQ1qbE=;
        b=rDa45KmHm2dDRT4usxpIzD5L6G9zK5HLfnyjchTK0zPG6fmLqNyb6baFuUsKVVcc0S
         pbTg+zyetgz4O7dMQrWwUA1ZdYKV5KK6yjrUpEO9ClVM6im0CM3SyyOpUD2aJXoL38Pq
         MWN1MXDEM4yUaWv/cFAJvFBw+fdABtL06OCYscNosqF3kV9gkHnLN7A6bkV7pcosQuYP
         4sZ/YERDi58RJyQ3OoOavwECb1rgrtsMdFtM26Y8TXKG+d9U/4Sk1ratwNg1La8vzl32
         nym5E7lrkThvIoHxQy56ifPu39c7TOHBhRJ+WisSCSiZNftTwj24Zp0UUOKfRqav1/sY
         ilkg==
X-Gm-Message-State: AOAM531HIJFO23sHJAKTx150X8R35bTOBItdawd6YDJQBEuDXuf9Vtt0
        gDOmloP8po8W86X9SBhPHZI=
X-Google-Smtp-Source: ABdhPJxJ2w7ihwZfZKubkK4VZF57fshAKP3cb239ZeVxjjjFBqyydT7e7ThwgGHec0XZRsq45Em1hA==
X-Received: by 2002:a4a:c88e:: with SMTP id t14mr4565635ooq.77.1630701962156;
        Fri, 03 Sep 2021 13:46:02 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:01 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 06/18] ledtrig-blkdev: Add function to get gendisk by name
Date:   Fri,  3 Sep 2021 15:45:36 -0500
Message-Id: <20210903204548.2745354-7-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add ledtrig_blkdev_get_disk() to find block device by name and increment
its reference count.  (Caller must call put_disk().)  Must be built in to
access block_class and disk_type symbols.

Add (inline) helper function to compare C string with non-terminated
character sequence (within the buffer passed to a sysfs attribute store
function).

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev-core.c | 43 ++++++++++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.h      | 12 ++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
index 102cdbe26d66..87d439f425ad 100644
--- a/drivers/leds/trigger/ledtrig-blkdev-core.c
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -33,3 +33,46 @@ void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
 
 	mutex_unlock(&ledtrig_blkdev_mutex);
 }
+
+
+/*
+ *
+ *	ledtrig_blkdev_get_disk() - get a gendisk by name
+ *
+ *	Must be built in for access to block_class and disk_type
+ *	Caller must call put_disk()
+ *
+ */
+
+/* Non-null-terminated character sequence of known length */
+struct ledtrig_blkdev_gdname {
+	const char	*buf;
+	size_t		len;
+};
+
+/* Match function for ledtrig_blkdev_get_disk() */
+static int blkdev_match_gdname(struct device *const dev, const void *const data)
+{
+	const struct ledtrig_blkdev_gdname *const gdname = data;
+
+	if (dev->type != &disk_type)
+		return 0;
+
+	return ledtrig_blkdev_streq(dev_to_disk(dev)->disk_name,
+				    gdname->buf, gdname->len);
+}
+
+struct gendisk *ledtrig_blkdev_get_disk(const char *const name,
+					const size_t len)
+{
+	const struct ledtrig_blkdev_gdname gdname = { .buf = name, .len = len };
+	struct device *dev;
+
+	dev = class_find_device(&block_class, NULL,
+				&gdname, blkdev_match_gdname);
+	if (dev == NULL)
+		return NULL;
+
+	return dev_to_disk(dev);
+}
+EXPORT_SYMBOL_NS_GPL(ledtrig_blkdev_get_disk, LEDTRIG_BLKDEV);
diff --git a/drivers/leds/trigger/ledtrig-blkdev.h b/drivers/leds/trigger/ledtrig-blkdev.h
index 914fb1523a2f..9a3528fd183a 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.h
+++ b/drivers/leds/trigger/ledtrig-blkdev.h
@@ -11,5 +11,17 @@
 
 extern struct mutex ledtrig_blkdev_mutex;
 extern void (*__ledtrig_blkdev_disk_cleanup)(struct gendisk *gd);
+extern struct gendisk *ledtrig_blkdev_get_disk(const char *name, size_t len);
+
+/*
+ * Compare a null-terminated C string with a non-null-terminated character
+ * sequence of a known length.  Returns true (1) if equal, false (0) if not.
+ */
+static inline bool ledtrig_blkdev_streq(const char *const cstr,
+					const char *const cbuf,
+					const size_t buf_len)
+{
+	return strlen(cstr) == buf_len && memcmp(cstr, cbuf, buf_len) == 0;
+}
 
 #endif	/* __LEDTRIG_BLKDEV_H */
-- 
2.31.1

