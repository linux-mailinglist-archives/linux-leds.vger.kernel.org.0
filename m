Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D38D405F5C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344624AbhIIW0f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236975AbhIIW0e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:34 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9504AC061574;
        Thu,  9 Sep 2021 15:25:24 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id r26so105399oij.2;
        Thu, 09 Sep 2021 15:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oE2dmDo4LT1pVf6VTHd6IbjQP+KgGw77nfi53BDXduM=;
        b=S16JJiZrgD3R6keXvN/r8v3uH+XTwhEjNThmCeNDgkocLm93wivja+wmCtrhzAhP5Z
         EmLLw6gYvZydbppgp3jWN+zbAiYO9kcapSIXFrcmq0bZB1NBL9JhpKDzMq0QYCiroHCX
         gN0eVMeLwbBHhBlla84IMtWV4z1fg/e8rGDrdQRr24qxc6yjo6typaIWwbvdc8XJUeHc
         prOIeWvli8r15sv/pdGIxP656QD97rHU93pl7uy0leKtRakC6QWcOU0+5lrzYmDsGNLW
         stkdKBJALNe6vry/lw1Y+g03T0kfEGPvfYZZQzoktt0M+iTYOQaEMi3+OyCQ9cXAo0Mh
         pctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oE2dmDo4LT1pVf6VTHd6IbjQP+KgGw77nfi53BDXduM=;
        b=RifOCGNzUSvKGmiRwI2QTxF1YuwWnfRDhp3paN3xjHiAZ+tH8AKV+ZcQac/mZ02fr6
         oOCUDTMo6qZF8wNcyBm1nYMXn9L+YYu2Lm67fFAAucSx333tIF0jrMP0ep5qM4DK0YzX
         cMn7p1vOM31iRkx60Q1sIqfA0CiddRnqz9bD/2yWeLwnXUITvptNdW9H4PCVENYuQl9u
         lGlo/upnrItE7mf+YqgS5La4c/bNFG+yGB7S61x3cXuCVg12hxTSdsZBg5PimWjEHNSg
         B4aQfKua2tguGLeg/3TwNiG4Yz+mjjDTA+zLUsL/wUokPzyIXWrrM6RAyMuThIKYQ043
         VjQA==
X-Gm-Message-State: AOAM531EOPytYw/jmCRLwiJkU/+MmvutcqLldjGcn0kdsyJkSHKQcX5G
        XCSl65YI6Jy5IqnwEleURI0=
X-Google-Smtp-Source: ABdhPJx81UtcafQ/b9mUND8pAEly10N1ZOs6UvDF/ZPCkhNEveY1Ev60KsbUP5LjL6RcP5qsWwyagw==
X-Received: by 2002:aca:4344:: with SMTP id q65mr1757970oia.70.1631226323966;
        Thu, 09 Sep 2021 15:25:23 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:23 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 02/15] leds: trigger: blkdev: Add build infrastructure
Date:   Thu,  9 Sep 2021 17:25:00 -0500
Message-Id: <20210909222513.2184795-3-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add files:
  * ledtrig-blkdev-core.c - trigger components that are always built-in
  * ledtrig-blkdev.c - trigger components that can be built as a module
  * ledtrig-blkdev.h - common declarations

Add Kconfig options - CONFIG_LEDS_TRIGGER_BLKDEV (visible, tristate) and
CONFIG_LEDS_TRIGGER_BLKDEV_CORE (hidden, boolean)

Make CONFIG_LEDS_TRIGGER_BLKDEV select CONFIG_LEDS_TRIGGER_BLKDEV_CORE, so
built-in portion of the trigger is enabled when trigger is either built-in
or modular

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/Kconfig               | 18 ++++++++++++++++++
 drivers/leds/trigger/Makefile              |  2 ++
 drivers/leds/trigger/ledtrig-blkdev-core.c |  9 +++++++++
 drivers/leds/trigger/ledtrig-blkdev.c      | 16 ++++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.h      | 12 ++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev-core.c
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.h

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 1f1d57288085..ad49d92713fb 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -153,4 +153,22 @@ config LEDS_TRIGGER_TTY
 
 	  When build as a module this driver will be called ledtrig-tty.
 
+config LEDS_TRIGGER_BLKDEV
+	tristate "LED Trigger for block devices"
+	depends on BLOCK
+	select LEDS_TRIGGER_BLKDEV_CORE
+	help
+	  The blkdev LED trigger allows LEDs to be controlled by block device
+	  activity (reads and writes).
+
+	  See Documentation/leds/ledtrig-blkdev.rst.
+
+config LEDS_TRIGGER_BLKDEV_CORE
+	bool
+	depends on LEDS_TRIGGER_BLKDEV
+	help
+	  This enables the portion of the block device LED trigger that must
+	  be built-in to the kernel, even when the trigger is built as a
+	  module.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 25c4db97cdd4..3732eeb86775 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -16,3 +16,5 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
 obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
+obj-$(CONFIG_LEDS_TRIGGER_BLKDEV)	+= ledtrig-blkdev.o
+obj-$(CONFIG_LEDS_TRIGGER_BLKDEV_CORE)	+= ledtrig-blkdev-core.o
diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
new file mode 100644
index 000000000000..bd9e5f09b7e3
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED trigger - built-in components
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#include "ledtrig-blkdev.h"
diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
new file mode 100644
index 000000000000..b615a8bf38e2
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED trigger - modular components
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#include <linux/module.h>
+
+#include "ledtrig-blkdev.h"
+
+MODULE_DESCRIPTION("Block device LED trigger");
+MODULE_AUTHOR("Ian Pilcher <arequipeno@gmail.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(LEDTRIG_BLKDEV);
diff --git a/drivers/leds/trigger/ledtrig-blkdev.h b/drivers/leds/trigger/ledtrig-blkdev.h
new file mode 100644
index 000000000000..6264d8a9201b
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ *	Block device LED trigger
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#ifndef __LEDTRIG_BLKDEV_H
+#define __LEDTRIG_BLKDEV_H
+
+#endif	/* __LEDTRIG_BLKDEV_H */
-- 
2.31.1

