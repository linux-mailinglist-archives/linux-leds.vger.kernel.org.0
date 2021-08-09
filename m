Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA9E3E3E4C
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhHIDdL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhHIDdK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:10 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBC6C061757;
        Sun,  8 Aug 2021 20:32:50 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id bj40so2130284oib.6;
        Sun, 08 Aug 2021 20:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wknaelJleWmbQStzTD7XQOjUKLb9/tYz0iCEj9R3vek=;
        b=CnDQZSZGJnUZTRodt0mNNiPtMnyiz7zKnBnkyAZKnTbqnyMjZToT2XlH/JgVEZ9LLy
         N0PZGawTN0hZb8cJyOF0wf7Fth2dRyyeSXdiSihl1OQjAuH0Kn1wSvAh2hoRufsjhzKq
         b9FhX4t6uxCt2BLKaXtbj1xM5N2begvkEUjpDrm5on9yGtSXT6HoNjrmuAaGvWlwmQMA
         HLGfn/+AUR4CgkejBol9AUmrvW9kdDRzVbOOUHUa5+tqJgibWigTrbntUnTIsT5BA3Fs
         6a5dXh6NpWYvxxWexLN2pP9oOwQZmAqwjNtvA5W8NoYjIoYXMssVT49mRzOvmIWRH9Ba
         MHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wknaelJleWmbQStzTD7XQOjUKLb9/tYz0iCEj9R3vek=;
        b=Dn9U6BJSTnVt6MdHesyKamlMA2SlAxQsdpGjKRXQlGGzxdNO8UH9uJkK8JSMHqTyiv
         6C9OJkQUQl0qvi91rSLUFelTmK2DcD73U5zyFG5Z6GRnvG20qZ8g4iBTkvWtA6mY1Fqt
         b8UH7mFIir8HXKEpOIqy5N9049yNiZgB3niVtjpAQuzNxQa42WRs8h0gByobv0BJUg6b
         qLLY1zIISrNgPJws0exhpZGOk66gQNAJAzZlrsY+h1FsFg5myGnXB4BqF3tqqfaFT/js
         Kb70cp8L6UJFjLEp8ps9H/Z3uDHlshurZIS6zgs36MYNsjqUVdaWf7lvCanpcIsY+5bP
         F4Gg==
X-Gm-Message-State: AOAM533Vb86vJMURfzSIZ5pPKav024VqzFQd+3Ul6M17ZE3w3bf7hs5A
        pKbzLThuyuweuUZQFgS90vMDVq7iBtqd1WQw
X-Google-Smtp-Source: ABdhPJwybw7WflJ/i/e8jE/wSXFutGTw2x27POz0yzW2/k47dS7U5tD6xg8yUTmcQXBw0wsAAMPs1w==
X-Received: by 2002:aca:2809:: with SMTP id 9mr21937984oix.3.1628479969470;
        Sun, 08 Aug 2021 20:32:49 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:49 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 02/10] block: Add file (blk-ledtrig.c) for block device LED trigger implementation
Date:   Sun,  8 Aug 2021 22:32:09 -0500
Message-Id: <20210809033217.1113444-3-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Define data structure for all associated LEDs

Add list of associated LEDs and list search helper

Add trigger mutex - must be held when accessing trigger/LED or device/LED
associations

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 block/blk-ledtrig.c

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
new file mode 100644
index 000000000000..c5ad57ed9c3b
--- /dev/null
+++ b/block/blk-ledtrig.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED triggers
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#include <linux/leds.h>
+#include <linux/mutex.h>
+
+/*
+ *
+ *	Trigger mutex and LED list
+ *
+ */
+
+// Must hold when doing anything with LED/trigger/block device
+// associations
+static DEFINE_MUTEX(blk_ledtrig_mutex);
+
+static LIST_HEAD(blk_ledtrig_leds);
+
+// Every LED associated with the blkdev trigger gets one of these
+struct blk_ledtrig_led {
+	struct kobject		*dir;		// block_devices subdirectory
+	struct led_classdev	*led;
+	unsigned int		blink_on;
+	unsigned int		blink_off;
+	struct list_head	leds_list_node;
+	struct list_head	dev_list;
+};
+
+// Caller must hold blk_ledtrig_mutex
+static struct blk_ledtrig_led *blk_ledtrig_find(const char *const led_name,
+						const size_t name_len)
+{
+	struct blk_ledtrig_led *bd_led;
+
+	list_for_each_entry(bd_led, &blk_ledtrig_leds, leds_list_node) {
+		if (strlen(bd_led->led->name) != name_len)
+			continue;
+		if (memcmp(bd_led->led->name, led_name, name_len) == 0)
+			return bd_led;
+	}
+
+	return NULL;
+}
-- 
2.31.1

