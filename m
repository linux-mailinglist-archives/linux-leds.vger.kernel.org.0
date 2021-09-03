Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9EB4006E8
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350970AbhICUrB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235953AbhICUrA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:00 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4CEC061575;
        Fri,  3 Sep 2021 13:45:59 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id k18-20020a4abd92000000b002915ed21fb8so53929oop.11;
        Fri, 03 Sep 2021 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPeSqG75oU9yfdgj3OGfNn9VWrauOCA58oQedxYiA3s=;
        b=JoMfzcn3g1xrtyjwcrH1JeROlwIG6hzJZYpd+xsIbiK9cu4UDhxzGBYF8OgB/zpybC
         owgHikYGRukyH/RvvgXT/DqWDVcAdkxazwCEJ+aWNlIG67958zorqYan3g5Z/sznMQHa
         TjANXSuYmkOm6VrU+RSARZEE55aFRaQNkNraOsGjWfoyvQsWgB3KQzvRpo0iGcOL53A/
         ShYHJGB+qom36RVtPNsVb64J8GKa5ftgbXKCeqOCM8A659CVfo+Pv2BAuRUknNJtgcqd
         aaRcg35BCJ6oEMYl3SMduyb6AaEsOhJH4tJoY38bzYdIEhHNykIIrnUag4+MgKqbC3pQ
         +aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPeSqG75oU9yfdgj3OGfNn9VWrauOCA58oQedxYiA3s=;
        b=Ny4xDYOTpqjX6TWZZuAiS+En1uuPkQTi+zBrsVywK9b8TmgibHsMul6f8b1cQf1vvw
         EXKWXcFG6ma0tMbmcXiP0373OvJDNNo8ap3GCe5hGO42qVwbmJk9aIJOX9RvCOsaQr5V
         Hs0++KAsb2bXWP5fdv11olt8z/gvVvLhHAjl+aIBD5gev8Uqg6JCib3RASXMkclIGfdL
         ke9VlPLWpNlJjMWpip6giT2+3dhPjMV9l3qz/N4v5sKsC1Xqis27xYxfVje2jH5w1JpY
         Gym+iaZb2Zj0Hp2o1+O4XaG5Ci7o2oshTzXqzepl+7Pa70ZNsF8vItHdHaEIlf4YHPFU
         P0Zg==
X-Gm-Message-State: AOAM531a5zrNlmT4RBFPlCIHjc8jvYemU++hb4Sh5v4Z5tHsAI88ikBj
        Vtpjf/fcfwf9ZOBQA0nICWk=
X-Google-Smtp-Source: ABdhPJwDUdf0Q0Al82yjdqyJNSw2SVf8SEc7/bvv4Ui5PuyTt3A1p2lzYE7Kt7CMY6nDd9gbw06CnA==
X-Received: by 2002:a4a:b64b:: with SMTP id f11mr4552776ooo.18.1630701958955;
        Fri, 03 Sep 2021 13:45:58 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:45:58 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 02/18] ledtrig-blkdev: Add build infra for block device LED trigger
Date:   Fri,  3 Sep 2021 15:45:32 -0500
Message-Id: <20210903204548.2745354-3-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add files:
 * ledtrig-blkdev-core.c - trigger components that are always built in
 * ledtrig-blkdev.c - trigger components that can be built as a module
 * ledtrig-blkdev.h - common declatarions

Add Kconfig options - CONFIG_LEDTRIG_BLKDEV (visible, tristate) and
CONFIG_LEDTRIG_BLKDEV_CORE (hidden, boolean)

Make CONFIG_LEDTRIG_BLKDEV select CONFIG_LEDTRIG_BLKDEV_CORE, so built-in
portion of the trigger is enabled when trigger is built-in or modular

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
index 1f1d57288085..7c31be355349 100644
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
+	  be built in to the kernel, even when the trigger is built as a
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
index 000000000000..a126c7fc0f9f
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED triggers - built-in components
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#include "ledtrig-blkdev.h"
diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
new file mode 100644
index 000000000000..8cbeb80697ae
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED triggers - modular components
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
index 000000000000..50b44461d4ab
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ *	Block device LED triggers
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

