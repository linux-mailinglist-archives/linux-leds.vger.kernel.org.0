Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3E73D9B4B
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhG2Byj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbhG2Bye (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:34 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA99C0613C1;
        Wed, 28 Jul 2021 18:54:31 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so4247814oti.0;
        Wed, 28 Jul 2021 18:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwbk+n8V82DYCRSAvUIXW0Vdrx9nBNIpoXbvhprm1aU=;
        b=tPAeipBo6QTlClkDwJ3yEjd1cMxq2ZmPpYnmp44H4/gUBSAxf/yrYO46DG0WkVbQhb
         nJGB7ygsfUTSaieb9OtgRb3vR0Vr74gv2dgLRcvRA2XWcHNK5f3KxKL4ipP/Lu+eCcwO
         Myp4cTMrYFJHLqv8aW9RpC1nj9hIB3N0pkQ7BD/CZVSXs7FmSVsV8KCNCSnxec6uVf1G
         OtlEAqu5q6HUW9/7skhJi3N3pcpjUU1PhxoR1XaXdrRtPVo/WPtUbIFNBdQZJFWqWfPM
         V2No7psrjQTFOddQ+uLiCoNbAdT7p6DE7wflddqHsCVJl2p7nzMv8iY0Fv4OAMe1Edhp
         v/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwbk+n8V82DYCRSAvUIXW0Vdrx9nBNIpoXbvhprm1aU=;
        b=jTX3d5oJnr42jWUeq9sFcTOg/7mRj8IxCBqL7ICx3I/+0zyE3ep5MGaI9dRa708u8F
         UXLGw6xv8dhGn6aEsl9sxoNLWG9HSo4lmYn79HXzd5IntCdhVoRkLtm1p9XPy87CgpLr
         kYCA9bb8niDg2OJfA/kR3bqqZQNK4so3EDpMZHba8EcVfljtug7IBtQMQ/1mrnRl9eVJ
         JCxIugoGBzXJnT3pXmnK0HjqpIXYPf/hCePaJUh6bAB/Aqxq4TQOQTegS76rr/OywksT
         827QqxtTl/gXxHcBxshmOkowbIR+lcjk8GLTt0jANe0LcqP3T+xlcDR3tDoxvp3spwiR
         7vsQ==
X-Gm-Message-State: AOAM533r5XSSQOT2l9dCKiJRJpuZwuDtdHVbrvonv131Sgjju2CQzbg3
        iRSMoZoCxmO95/fXbeSELDC8rzkvBCRVDryN
X-Google-Smtp-Source: ABdhPJy4WA8YQHAm65LnVLGVEyhm3WD7rnl+XeLhSw5+oD0I9pdM+KIFG97DgxlRuxCZlCL7DIhMEA==
X-Received: by 2002:a05:6830:40c4:: with SMTP id h4mr1928304otu.75.1627523671009;
        Wed, 28 Jul 2021 18:54:31 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:30 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 4/8] block: Add block class attributes to manage LED trigger list
Date:   Wed, 28 Jul 2021 20:53:40 -0500
Message-Id: <20210729015344.3366750-5-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* New class attributes - /sys/class/block/led_trigger_{new,list,del}

* Add init function - blk_ledtrig_init() - to create the attributes
  in sysfs.  Call blk_ledtrig_init() from genhd_device_init() (in
  block/genhd.c).

* New file - block/blk-ledtrig.h

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 147 ++++++++++++++++++++++++++++++++++++++++++++
 block/blk-ledtrig.h |  22 +++++++
 block/genhd.c       |   2 +
 3 files changed, 171 insertions(+)
 create mode 100644 block/blk-ledtrig.h

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index c69ea1539336..6392ab4169f9 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -7,11 +7,15 @@
  */
 
 #include <linux/blk-ledtrig.h>
+#include <linux/ctype.h>
+#include <linux/genhd.h>
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
+#include "blk-ledtrig.h"
+
 
 /*
  *
@@ -201,3 +205,146 @@ int blk_ledtrig_delete(const char *const name)
 	return __blk_ledtrig_delete(name, strlen(name));
 }
 EXPORT_SYMBOL_GPL(blk_ledtrig_delete);
+
+
+/*
+ *
+ *	Class attributes to manage the trigger list
+ *
+ */
+
+static ssize_t blk_ledtrig_attr_store(struct class *, struct class_attribute *,
+				      const char *, const size_t);
+static ssize_t blk_ledtrig_list_show(struct class *, struct class_attribute *,
+				     char *);
+
+static struct class_attribute blk_ledtrig_attr_new =
+	__ATTR(led_trigger_new, 0200, 0, blk_ledtrig_attr_store);
+
+static struct class_attribute blk_ledtrig_attr_del =
+	__ATTR(led_trigger_del, 0200, 0, blk_ledtrig_attr_store);
+
+static struct class_attribute blk_ledtrig_attr_list =
+	__ATTR(led_trigger_list, 0444, blk_ledtrig_list_show, 0);
+
+// Returns a pointer to the first non-whitespace character in s (or a pointer
+// to the terminating nul).
+static const char *blk_ledtrig_skip_whitespace(const char *s)
+{
+	while (*s != 0 && isspace(*s))
+		++s;
+
+	return s;
+}
+
+// Returns a pointer to the first whitespace character in s (or a pointer to
+// the terminating nul), which is effectively a pointer to the position *after*
+// the last character in the non-whitespace token at the beginning of s.  (s is
+// expected to be the result of a previous call to blk_ledtrig_skip_whitespace.)
+static const char *blk_ledtrig_find_whitespace(const char *s)
+{
+	while (*s != 0 && !isspace(*s))
+		++s;
+
+	return s;
+}
+
+static ssize_t blk_ledtrig_attr_store(struct class *const class,
+				      struct class_attribute *const attr,
+				      const char *const buf,
+				      const size_t count)
+{
+	const char *const name = blk_ledtrig_skip_whitespace(buf);
+	const char *const endp = blk_ledtrig_find_whitespace(name);
+	const ptrdiff_t name_len = endp - name;		// always >= 0
+	int ret;
+
+	if (attr == &blk_ledtrig_attr_new)
+		ret = __blk_ledtrig_create(name, name_len);
+	else	// attr == &blk_ledtrig_attr_del
+		ret = __blk_ledtrig_delete(name, name_len);
+
+	if (ret < 0)
+		return ret;
+
+	// Avoid potential "empty name" error by skipping whitespace
+	// to next token or terminating nul
+	return blk_ledtrig_skip_whitespace(endp) - buf;
+}
+
+static ssize_t blk_ledtrig_list_show(struct class *const class,
+				     struct class_attribute *const attr,
+				     char *const buf)
+{
+	struct list_head *n;
+	int ret, c = 0;
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_list_mutex);
+	if (unlikely(ret != 0))
+		goto list_exit_return;
+
+	list_for_each(n, &blk_ledtrig_list) {
+
+		struct blk_ledtrig *const t = blk_ledtrig_from_node(n);
+		int refcount;
+
+		ret = mutex_lock_interruptible(&t->refcount_mutex);
+		if (unlikely(ret != 0))
+			goto list_exit_unlock_list;
+
+		refcount = t->refcount;
+
+		mutex_unlock(&t->refcount_mutex);
+
+		ret = snprintf(buf + c, PAGE_SIZE - c, "%s: %d\n",
+			       t->name, refcount);
+		if (unlikely(ret < 0))
+			goto list_exit_unlock_list;
+
+		c += ret;
+		if (unlikely(c >= PAGE_SIZE)) {
+			ret = -EOVERFLOW;
+			goto list_exit_unlock_list;
+		}
+	}
+
+	ret = c;
+
+list_exit_unlock_list:
+	mutex_unlock(&blk_ledtrig_list_mutex);
+list_exit_return:
+	return ret;
+}
+
+
+/*
+ *
+ *	Initialization - create the class attributes
+ *
+ */
+
+void __init blk_ledtrig_init(void)
+{
+	int ret;
+
+	ret = class_create_file(&block_class, &blk_ledtrig_attr_new);
+	if (unlikely(ret != 0))
+		goto init_error_new;
+
+	ret = class_create_file(&block_class, &blk_ledtrig_attr_del);
+	if (unlikely(ret != 0))
+		goto init_error_del;
+
+	ret = class_create_file(&block_class, &blk_ledtrig_attr_list);
+	if (unlikely(ret != 0))
+		goto init_error_list;
+
+	return;
+
+init_error_list:
+	class_remove_file(&block_class, &blk_ledtrig_attr_del);
+init_error_del:
+	class_remove_file(&block_class, &blk_ledtrig_attr_new);
+init_error_new:
+	pr_err("failed to initialize blkdev LED triggers (%d)\n", ret);
+}
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
new file mode 100644
index 000000000000..894843249deb
--- /dev/null
+++ b/block/blk-ledtrig.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ *	Block device LED triggers
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#ifndef _BLOCK_BLK_LEDTRIG_H
+#define _BLOCK_BLK_LEDTRIG_H
+
+#ifdef CONFIG_BLK_LED_TRIGGERS
+
+void blk_ledtrig_init(void);
+
+#else	// CONFIG_BLK_LED_TRIGGERS
+
+static inline void blk_ledtrig_init(void) {}
+
+#endif	// CONFIG_BLK_LED_TRIGGERS
+
+#endif	// _BLOCK_BLK_LEDTRIG_H
diff --git a/block/genhd.c b/block/genhd.c
index af4d2ab4a633..d0b1d8f743ae 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -26,6 +26,7 @@
 #include <linux/badblocks.h>
 
 #include "blk.h"
+#include "blk-ledtrig.h"
 
 static struct kobject *block_depr;
 
@@ -824,6 +825,7 @@ static int __init genhd_device_init(void)
 	if (unlikely(error))
 		return error;
 	blk_dev_init();
+	blk_ledtrig_init();
 
 	register_blkdev(BLOCK_EXT_MAJOR, "blkext");
 
-- 
2.31.1

