Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F091C3D9B47
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhG2Byh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbhG2Bye (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:34 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6307C061765;
        Wed, 28 Jul 2021 18:54:30 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 48-20020a9d0bb30000b02904cd671b911bso4219981oth.1;
        Wed, 28 Jul 2021 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e4Cil8UyFveunyfhdg9prQXTKI60qw+NHlxrLHZPnMc=;
        b=W6tx1rbDfbctaNTfj5z+Y97j2ApUcJJ3DCnHPQo+HTvNvZCewBeIobpazgn/Vm5APW
         GQg1bntSSJRkojml4beEpbasjH6BVCAOc4u2TyrRMGRfnL64xx6b1/jyACpYEYmBnXsg
         dJ388clXsqSNOdMBnzcW12Uvd2RQJdXcrEbgR41G+WSAOkp8ZZ7OWtikHF9vuYt0RAqU
         6lKZZQQukCiccsH6JUxOzQF7oGmimTRlEwA5WhgyOg0vA4pZJWmzhyKFS7gybrF4RTSt
         JMLwE/qpB/B/j0LGERe+yruohj7FOr1V2j235PewAp5j3W/DELX9EeSG5UpfzzzC/fu6
         knhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e4Cil8UyFveunyfhdg9prQXTKI60qw+NHlxrLHZPnMc=;
        b=MnIk0mJNnqa+nLLCN1b5qa4dm8MzS49X290ZiARqX4LdNySRzvZRFVOOIQGQkqAF5N
         481XwCGiHRDJJomgoDXE9HgEkbS4sVrB77S/7PRkPnAvCK7Wa+LIHOPL9ZFz/yt/63oS
         YfD9w0ltVf1q+viJe43NXon8e35cxoLAiEYWDP6LVLooohIRyhdzm/wNAWJHgSrJrCbF
         p0/PRcrlp5GEMnZeqPIkiRp8kQBIxVB3EozqQtRLX7kds2g9IsfOOcPXJp+oeTSw0W/K
         ScBYU1QbYNWd59Z947bugFzi/s5uX4pKrqqF7H9wI35yc1y4v/SfrdaSzsx3ZihLyNts
         ZqnQ==
X-Gm-Message-State: AOAM533+CK6xZ7tviVionNlceqwRJZGr0kEHUeG1l8HvmBp3AhQ8aNLg
        beqYG67TgLy4Kk8Ft/W86MnM02YN39fliZF5
X-Google-Smtp-Source: ABdhPJw82QLWhuo6vRkom8k9uuRZcO4NPiIluShNkHW3TZtfVFNkZAPiQuXfM+DVHaAQsc7SOZRBCw==
X-Received: by 2002:a9d:8ac:: with SMTP id 41mr1901869otf.170.1627523670254;
        Wed, 28 Jul 2021 18:54:30 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:29 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 3/8] block: Add kernel APIs to create & delete block device LED triggers
Date:   Wed, 28 Jul 2021 20:53:39 -0500
Message-Id: <20210729015344.3366750-4-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* New file - include/linux/blk-ledtrig.h

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c         | 152 ++++++++++++++++++++++++++++++++++++
 include/linux/blk-ledtrig.h |  19 +++++
 2 files changed, 171 insertions(+)
 create mode 100644 include/linux/blk-ledtrig.h

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 345a3b6bdbc6..c69ea1539336 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -6,9 +6,11 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/blk-ledtrig.h>
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/slab.h>
 
 
 /*
@@ -49,3 +51,153 @@ static struct blk_ledtrig *blk_ledtrig_find(const char *const name,
 
 	return NULL;
 }
+
+
+/*
+ *
+ *	Create a new trigger
+ *
+ */
+
+static int __blk_ledtrig_create(const char *const name, const size_t len)
+{
+	struct blk_ledtrig *t;
+	int ret;
+
+	if (len == 0) {
+		pr_warn("empty name specified for blockdev LED trigger\n");
+		ret = -EINVAL;
+		goto create_exit_return;
+	}
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_list_mutex);
+	if (unlikely(ret != 0))
+		goto create_exit_return;
+
+	if (blk_ledtrig_find(name, len) != NULL) {
+		pr_warn("blockdev LED trigger named %.*s already exists\n",
+			(int)len, name);
+		ret = -EEXIST;
+		goto create_exit_unlock_list;
+	}
+
+	t = kzalloc(sizeof(*t) + len + 1, GFP_KERNEL);
+	if (unlikely(t == NULL)) {
+		ret = -ENOMEM;
+		goto create_exit_unlock_list;
+	}
+
+	memcpy(t->name, name, len);
+	t->trigger.name = t->name;
+	mutex_init(&t->refcount_mutex);
+
+	ret = led_trigger_register(&t->trigger);
+	if (ret != 0) {
+		if (likely(ret == -EEXIST)) {
+			pr_warn("LED trigger named %.*s already exists\n",
+				(int)len, name);
+		}
+		goto create_exit_free;
+	}
+
+	list_add(&t->list_node, &blk_ledtrig_list);
+	ret = 0;
+
+create_exit_free:
+	if (ret != 0)
+		kfree(t);
+create_exit_unlock_list:
+	mutex_unlock(&blk_ledtrig_list_mutex);
+create_exit_return:
+	return ret;
+}
+
+/**
+ * blk_ledtrig_create() - creates a new block device LED trigger
+ * @name: the name of the new trigger
+ *
+ * Context: Process context (can sleep).  Takes and releases
+ *	    @blk_ledtrig_list_mutex.
+ *
+ * Return: 0 on success; -@errno on error
+ */
+int blk_ledtrig_create(const char *const name)
+{
+	return __blk_ledtrig_create(name, strlen(name));
+}
+EXPORT_SYMBOL_GPL(blk_ledtrig_create);
+
+
+/*
+ *
+ *	Delete a trigger
+ *
+ */
+
+static int __blk_ledtrig_delete(const char *const name, const size_t len)
+{
+	struct blk_ledtrig *t;
+	int ret;
+
+	if (len == 0) {
+		pr_warn("empty name specified for blockdev LED trigger\n");
+		ret = -EINVAL;
+		goto delete_exit_return;
+	}
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_list_mutex);
+	if (unlikely(ret != 0))
+		goto delete_exit_return;
+
+	t = blk_ledtrig_find(name, len);
+	if (t == NULL) {
+		pr_warn("blockdev LED trigger named %.*s doesn't exist\n",
+			(int)len, name);
+		ret = -ENODEV;
+		goto delete_exit_unlock_list;
+	}
+
+	ret = mutex_lock_interruptible(&t->refcount_mutex);
+	if (unlikely(ret != 0))
+		goto delete_exit_unlock_list;
+
+	if (WARN_ON(t->refcount < 0)) {
+		ret = -EBADFD;
+		goto delete_exit_unlock_refcount;
+	}
+
+	if (t->refcount > 0) {
+		pr_warn("blockdev LED trigger %s still in use\n", t->name);
+		ret = -EBUSY;
+		goto delete_exit_unlock_refcount;
+	}
+
+	led_trigger_unregister(&t->trigger);
+	list_del(&t->list_node);
+
+	ret = 0;
+
+delete_exit_unlock_refcount:
+	mutex_unlock(&t->refcount_mutex);
+	if (ret == 0)
+		kfree(t);
+delete_exit_unlock_list:
+	mutex_unlock(&blk_ledtrig_list_mutex);
+delete_exit_return:
+	return ret;
+}
+
+/**
+ * blk_ledtrig_delete() - deletes a block device LED trigger
+ * @name: the name of the trigger to be deleted
+ *
+ * Context: Process context (can sleep).  Takes and releases
+ *	    @blk_ledtrig_list_mutex and trigger's @refcount_mutex.
+ *
+ * Return: 0 on success; -@errno on error
+ */
+int blk_ledtrig_delete(const char *const name)
+{
+	return __blk_ledtrig_delete(name, strlen(name));
+}
+EXPORT_SYMBOL_GPL(blk_ledtrig_delete);
diff --git a/include/linux/blk-ledtrig.h b/include/linux/blk-ledtrig.h
new file mode 100644
index 000000000000..6f73635f65ec
--- /dev/null
+++ b/include/linux/blk-ledtrig.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ *	Block device LED triggers
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#ifndef _LINUX_BLK_LEDTRIG_H
+#define _LINUX_BLK_LEDTRIG_H
+
+#ifdef CONFIG_BLK_LED_TRIGGERS
+
+int blk_ledtrig_create(const char *name);
+int blk_ledtrig_delete(const char *name);
+
+#endif	// CONFIG_BLK_LED_TRIGGERS
+
+#endif	// _LINUX_BLK_LEDTRIG_H
-- 
2.31.1

