Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834A33D9B53
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbhG2Byr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbhG2Byh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:37 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B23C061765;
        Wed, 28 Jul 2021 18:54:34 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id y11-20020a4ade0b0000b029024b4146e2f5so1161537oot.1;
        Wed, 28 Jul 2021 18:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UKOzPifcOxboRw82QSFcbD/HkRKqBfmFXN/TjZK3tNM=;
        b=Xxo4L1WAjsxK0AkStEI1tWU1wSyxl/+SCmyVmtSCGxJz7LsE5EadaoAUSOZsjpln3y
         o2a1d6Cf0uEJoWdVvIYj7BV6fwVMPfqhO82Ux+pgE5ckRNEJwFoy5ldpwTTBb21kDxd6
         G1z0/OHY+dNjQ3KhIfNzIdzuKlRhe92RUcWHccVZYp6hNMiTaLOMVMow9eWFVU98wvPT
         DNibWu3exdtdPsoJE9Eh28hi2pAzqIv7pLBzSEYtV+MmtTym98pWI3xvbxTWDbaDhEpB
         vmgrsnkIPob/F1Epz0H+DIw4foMHsee32b2UaZDgN4VaSW4qVXK9L3CE6qi5BJ9rIBCZ
         4Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UKOzPifcOxboRw82QSFcbD/HkRKqBfmFXN/TjZK3tNM=;
        b=Q8oJ4KiTuJquFfIxSH4IrFlaB7S17GjMCyWcocWvQQIG+iXIQpPAFKP57s7lypaLI3
         CsBnVBXmAUPOincELMx+yj5VvLuoN4UDEFtS3sNf4wkEuFacS0hdO+gV4hotFhmGFcE/
         iaPKj53Td73iPbnybQ1+MOQWAW5r813MvFqL7OTl0CH4Rm+I9Euk9gbXnkefItrdP7GI
         G7YvOM8HQeq0Cx9hsFsQLLeUaJzh30sVK51PQ4plZKSVRQGeX3bcQrzDL0uoFVx8YOux
         fWavm4JwxSHduVHbNw6Ubbfp29a5UXQM6TA2qDCGDbTzUhV4qkIgqrMsrm46yY28tdLi
         uceQ==
X-Gm-Message-State: AOAM533vBOfGnGj3uEvRxWyhtuIFTm6VKNkj+nt5OX+ZPSfTVRtJl/H0
        smws0a9rVTeYZSAEk8oXLp5+393Fi+j2vJyR
X-Google-Smtp-Source: ABdhPJx62adXAx+HuWv/EHgbkjiBZk3d7ZmqLFbNj2fEXyRMYzp6AU1fgiKFXguabEtlV0l1xhiu5g==
X-Received: by 2002:a4a:e089:: with SMTP id w9mr1456131oos.50.1627523673391;
        Wed, 28 Jul 2021 18:54:33 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:33 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 7/8] block: Add block device attributes to set & clear LED triggers
Date:   Wed, 28 Jul 2021 20:53:43 -0500
Message-Id: <20210729015344.3366750-8-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Set/store functions in block/blk-ledtrig.c

* Add device attributes to disk_attrs in block/genhd.c

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 block/blk-ledtrig.h |  8 ++++++
 block/genhd.c       |  9 +++++++
 3 files changed, 82 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 7c8fdff88683..2d324df45149 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -479,3 +479,68 @@ bool blk_ledtrig_clear(struct gendisk *const gd)
 	return changed;
 }
 EXPORT_SYMBOL_GPL(blk_ledtrig_clear);
+
+
+/*
+ *
+ *	Set, clear & show LED triggers via sysfs device attributes
+ *
+ *	(See dev_attr_led_trigger and disk_attrs in genhd.c)
+ *
+ */
+
+ssize_t blk_ledtrig_devattr_store(struct device *const dev,
+				  struct device_attribute *const attr,
+				  const char *const buf, const size_t count)
+{
+	struct gendisk *const gd = dev_to_disk(dev);
+	const char *const name = blk_ledtrig_skip_whitespace(buf);
+	const char *const endp = blk_ledtrig_find_whitespace(name);
+	const ptrdiff_t name_len = endp - name;		// always >= 0
+	int ret;
+
+	if (name_len == 0)
+		ret = blk_ledtrig_clear(gd);
+	else
+		ret = __blk_ledtrig_set(gd, name, name_len);
+
+	if (ret < 0)
+		return ret;
+
+	return blk_ledtrig_skip_whitespace(endp) - buf;
+}
+
+ssize_t blk_ledtrig_devattr_show(struct device *const dev,
+				 struct device_attribute *const attr,
+				 char *const buf)
+{
+	struct gendisk *const gd = dev_to_disk(dev);
+	const struct blk_ledtrig *t;
+	size_t name_len;
+	int ret;
+
+	ret = mutex_lock_interruptible(&gd->ledtrig_mutex);
+	if (unlikely(ret != 0))
+		return ret;
+
+	t = gd->ledtrig;
+
+	if (t != NULL) {
+		name_len = strlen(t->name);
+		if (likely(name_len < PAGE_SIZE - 1))
+			memcpy(buf, t->name, name_len);
+	}
+
+	mutex_unlock(&gd->ledtrig_mutex);
+
+	if (t == NULL)
+		return sprintf(buf, "(none)\n");
+
+	if (unlikely(name_len >= PAGE_SIZE - 1))
+		return -EOVERFLOW;
+
+	buf[name_len] = '\n';
+	buf[name_len + 1] = 0;
+
+	return (ssize_t)(name_len + 1);
+}
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 9b718d45783f..5d228905edbf 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -19,6 +19,14 @@ static inline void blk_ledtrig_disk_init(struct gendisk *const gd)
 	mutex_init(&gd->ledtrig_mutex);
 }
 
+ssize_t blk_ledtrig_devattr_store(struct device *const dev,
+				  struct device_attribute *const attr,
+				  const char *const buf, const size_t count);
+
+ssize_t blk_ledtrig_devattr_show(struct device *const dev,
+				 struct device_attribute *const attr,
+				 char *const buf);
+
 #else	// CONFIG_BLK_LED_TRIGGERS
 
 static inline void blk_ledtrig_init(void) {}
diff --git a/block/genhd.c b/block/genhd.c
index fb1617f21d79..fd37efe74d48 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1014,6 +1014,12 @@ static struct device_attribute dev_attr_fail_timeout =
 	__ATTR(io-timeout-fail, 0644, part_timeout_show, part_timeout_store);
 #endif
 
+#ifdef CONFIG_BLK_LED_TRIGGERS
+static struct device_attribute dev_attr_led_trigger =
+	__ATTR(led_trigger, 0644,
+	       blk_ledtrig_devattr_show, blk_ledtrig_devattr_store);
+#endif
+
 static struct attribute *disk_attrs[] = {
 	&dev_attr_range.attr,
 	&dev_attr_ext_range.attr,
@@ -1035,6 +1041,9 @@ static struct attribute *disk_attrs[] = {
 #endif
 #ifdef CONFIG_FAIL_IO_TIMEOUT
 	&dev_attr_fail_timeout.attr,
+#endif
+#ifdef CONFIG_BLK_LED_TRIGGERS
+	&dev_attr_led_trigger.attr,
 #endif
 	NULL
 };
-- 
2.31.1

