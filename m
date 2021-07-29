Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6813D9B44
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhG2Bye (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbhG2Byd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:33 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F17C061757;
        Wed, 28 Jul 2021 18:54:30 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so4189578oth.7;
        Wed, 28 Jul 2021 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1f/SxtepgyjeAa5xFLbjbkeuNqISFy3PTrve9ir2rAc=;
        b=fCOe4rqRxw6SqV9uk9MpxuiUC9149oYHi6rbVfcg+KgaE/qHn5mwswIDYJ0SwFY+b1
         eK8FEBwMJCp5rFT1S7dp42jG+v+nFBG/Us+bUu6uDCHYePeRlFv6MhsMm69K5wjSKaDC
         ZFolXFJka7u7RyUTzJgt34evLcRvH3aSOZ/PUVpT1k4QA9LSoH70nVLMg0m2N6lWAwYs
         +3E/4wnPo07PBFMvFtFc9lfx7Z6EmXltY2bNbOd8bupO+Lu1dmzX67pNhZpUgs4dn6XM
         tQWab73+IufvgU6kDVHJSx6kp62GyIKZf7re2lzyja5O1Z1Zny5etk2WtcAxU+7ohU3o
         EopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1f/SxtepgyjeAa5xFLbjbkeuNqISFy3PTrve9ir2rAc=;
        b=tXmEaB+dAjjvuBcSZU4Fo0tTmXRRDsl/qcdNXpfIZL7sk4wZ2FIXo8tQyp71Nw2u8Z
         brZLLmnISDHlcv5UpIBypwWCWcGraS+7/ap4NWubzE3pUkHytRZG1CotkamGdRgUVnQx
         C3YKbwMIgxqhBuaAIzx1Y2LZC/e8Uz/AJVzTyiaPm97OsfZq0Bzhdwb9OIhl4HJKAZ55
         c6nfEIF76EL4tFL8j1F4+zMM2lEPEblmdELcTqpDqD/2d9IEGWFWukWr/P27eSkQQCoo
         rW22M0r/FRiqjxNotiJPEbsR3TLP9rzpqjpRd7oIrrOKz3/nEtToBPsFyYwH63BZh38C
         Qeww==
X-Gm-Message-State: AOAM531BhPebQPm9bqjicBg8GB7byzS70dZrYIVwdGGok+13WchDssa6
        kqXSxNcsMW2mN1pSX+/ma6GUxA0ZhEy1B/uD
X-Google-Smtp-Source: ABdhPJw8oRvrTnkHJKTijlAFiacDHgpqLu1mz1oZfo3fN8XvtZva5yr2NFp9LnaHTjz3UQrKimxbSw==
X-Received: by 2002:a05:6830:23a7:: with SMTP id m7mr1910820ots.17.1627523669477;
        Wed, 28 Jul 2021 18:54:29 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:29 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 2/8] block: Add block device LED trigger list
Date:   Wed, 28 Jul 2021 20:53:38 -0500
Message-Id: <20210729015344.3366750-3-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* New config option (CONFIG_BLK_LED_TRIGGERS) to enable/disable
  block device LED triggers

* New file - block/blk-ledtrig.c

* Use a linked list of dynamically allocated triggers.  There
  aren't likely to be that many of them, and the list is only
  searched when creating/deleting a trigger or setting/clearing
  a device/trigger association - none of which should occur very
  often.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/Kconfig       | 10 +++++++++
 block/Makefile      |  1 +
 block/blk-ledtrig.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 block/blk-ledtrig.c

diff --git a/block/Kconfig b/block/Kconfig
index fd732aede922..051488413d6e 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -220,6 +220,16 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_LED_TRIGGERS
+	bool "Enable block device LED triggers"
+	depends on LEDS_TRIGGERS
+	help
+	  Enabling this allows LED triggers to be created and
+	  associated with block devices via sysfs/udev (or an
+	  in-kernel API).  These trigers can be used to drive
+	  physical or user-space activity indicators.  See
+	  Documentation/block/led-triggers.rst.
+
 menu "Partition Types"
 
 source "block/partitions/Kconfig"
diff --git a/block/Makefile b/block/Makefile
index bfbe4e13ca1e..bcd97ee26462 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
+obj-$(CONFIG_BLK_LED_TRIGGERS)	+= blk-ledtrig.o
diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
new file mode 100644
index 000000000000..345a3b6bdbc6
--- /dev/null
+++ b/block/blk-ledtrig.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED triggers
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#include <linux/leds.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+
+/*
+ *
+ *	The list of block device LED triggers
+ *
+ */
+
+struct blk_ledtrig {
+	struct led_trigger	trigger;
+	struct list_head	list_node;
+	struct mutex		refcount_mutex;
+	int			refcount;
+	char			name[];
+};
+
+LIST_HEAD(blk_ledtrig_list);
+DEFINE_MUTEX(blk_ledtrig_list_mutex);
+
+static inline
+struct blk_ledtrig *blk_ledtrig_from_node(struct list_head *const node)
+{
+	return container_of(node, struct blk_ledtrig, list_node);
+}
+
+// Caller must hold blk_ledtrig_list_mutex
+static struct blk_ledtrig *blk_ledtrig_find(const char *const name,
+					    const size_t len)
+{
+	struct blk_ledtrig *t;
+	struct list_head *n;
+
+	list_for_each(n, &blk_ledtrig_list) {
+		t = blk_ledtrig_from_node(n);
+		if (strlen(t->name) == len && memcmp(name, t->name, len) == 0)
+			return t;
+	}
+
+	return NULL;
+}
-- 
2.31.1

