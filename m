Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4773D9B41
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbhG2Byd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbhG2Byc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:32 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61418C061765;
        Wed, 28 Jul 2021 18:54:29 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id c7-20020a9d27870000b02904d360fbc71bso4155969otb.10;
        Wed, 28 Jul 2021 18:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVpQK3T6/YXyYNLRmSxyloWODC3EEBXIYjhI53mzXu8=;
        b=JAstWXGl1hp6+T7Vbu6pjBo3duiubfGtoY6ipH+GiGphbKF8rBS6e+TmeviduQMTyA
         hrdu7vFuTWTeAgS5mGWrCHpt55ixLcxp957LoB6BuQVAFYVzQ2BrvLCDzf9+DF0rY8Bx
         Q1F2aw+5HpaaOX/MsbgmA/QoPpiLtenNeuZjkRh97ezHDeKNhRJ55H6QtY/Rlkzun39N
         JPIXnFvzuqOFAJmP9Y3pDlY5EQhmWoTwyHdBaLKF6cMp5jT2JnqcViZ+ZGNCnAFdCVBG
         PKflNnSjMupJsux6ZNKMQEm4qCNQ1GK2FThw3kPOClXH9JuaIzcMR9qfCLl1qb5jIMd+
         Nttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVpQK3T6/YXyYNLRmSxyloWODC3EEBXIYjhI53mzXu8=;
        b=aGFtZlX6FLW/vlpvv6ITnFopVUUVv8FykoDpR3BqFsjlSVNlcLIAaXa9TFIIf6t1ws
         /Ug35d8rUyZQoxUP2d8ADlkbROnBeJvYN/g92mUMpvyTHk6NlzQrV9Oux+PPbOe76NyJ
         bzQTK1i6FckXOkxN4PHBJPXjbcB+aSOyUD3X+hBnizp1xsR5qVX1PpBBeYWbJ7NGO72U
         5XsdpzPOTCpNnQESFgcpt5krmGwqRUMC5eF1G+VFddnHIvZcSEbN7xXLvGyP6FSPycHF
         buUPGAvcvrWuQG9HAEo0CHK/YNqeGJCZvanIOJqpQMU4ieqn7nrmooyvmdMKs4qOYpn/
         V6kg==
X-Gm-Message-State: AOAM531WBViNbFgFzUVY6FZinLB49agO2TrktR2WX0GbT/Mjuw3Omz0u
        /E3W7e39UkgKZgjRTYf9l4COIwdvjeUYb3xH
X-Google-Smtp-Source: ABdhPJyU7Kdy/yISBb3spl8mSsIIKSuRVPfLyVyjE5VHkSqr5SeTSE4a3kI9iVe4Peko4n9aSrIm5g==
X-Received: by 2002:a9d:6e06:: with SMTP id e6mr1925225otr.350.1627523668769;
        Wed, 28 Jul 2021 18:54:28 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:28 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 1/8] docs: Add block device LED trigger documentation
Date:   Wed, 28 Jul 2021 20:53:37 -0500
Message-Id: <20210729015344.3366750-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Document the sysfs attributes (/sys/class/block/led_trigger_*
  and /sys/class/block/${DEV}/led_trigger) that can be used to
  create, list, and delete block device LED triggers and to
  set and clear device/trigger associations.

* Pull API documentation from block/blk-ledtrig.c (once it
  exists).

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 Documentation/block/index.rst        |   1 +
 Documentation/block/led-triggers.rst | 124 +++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/block/led-triggers.rst

diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
index 86dcf7159f99..a125ecdb4c7b 100644
--- a/Documentation/block/index.rst
+++ b/Documentation/block/index.rst
@@ -25,3 +25,4 @@ Block
    stat
    switching-sched
    writeback_cache_control
+   led-triggers
diff --git a/Documentation/block/led-triggers.rst b/Documentation/block/led-triggers.rst
new file mode 100644
index 000000000000..a67e06c68073
--- /dev/null
+++ b/Documentation/block/led-triggers.rst
@@ -0,0 +1,124 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+LED Triggers
+============
+
+Available when ``CONFIG_BLK_LED_TRIGGERS=y``.
+
+sysfs interface
+===============
+
+Create a new block device LED trigger::
+
+	# echo foo > /sys/class/block/led_trigger_new
+
+The name must be unique among all LED triggers (not just block device LED
+triggers).
+
+Create two more::
+
+	# echo bar baz > /sys/class/block/led_trigger_new
+
+List the triggers::
+
+	# cat /sys/class/block/led_trigger_list
+	baz: 0
+	bar: 0
+	foo: 0
+
+(The number after each trigger is its reference count.)
+
+Associate a trigger with a block device::
+
+	# cat /sys/class/block/sda/led_trigger
+	(none)
+
+	# echo foo > /sys/class/block/sda/led_trigger
+	# cat /sys/class/block/sda/led_trigger
+	foo
+
+Note that ``foo``'s reference count has increased, and it cannot be deleted::
+
+	# cat /sys/class/block/led_trigger_list
+	baz: 0
+	bar: 0
+	foo: 1
+
+	# echo foo > /sys/class/block/led_trigger_del
+	-bash: echo: write error: Device or resource busy
+
+	# dmesg | tail -n 1
+	[23176.475424] blockdev LED trigger foo still in use
+
+Associate the ``foo`` trigger with an LED::
+
+	# cat /sys/class/leds/input1::scrolllock/trigger
+	none usb-gadget usb-host rc-feedback [kbd-scrolllock] kbd-numlock
+	kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock
+	kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock
+	disk-activity disk-read disk-write ide-disk mtd nand-disk panic
+	audio-mute audio-micmute rfkill-any rfkill-none foo bar baz
+
+	# echo foo > /sys/class/leds/input1::scrolllock/trigger
+
+	# cat /sys/class/leds/input1::scrolllock/trigger
+	none usb-gadget usb-host rc-feedback [kbd-scrolllock] kbd-numlock
+	kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock
+	kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock
+	disk-activity disk-read disk-write ide-disk mtd nand-disk panic
+	audio-mute audio-micmute rfkill-any rfkill-none [foo] bar baz
+
+Reads and writes to ``sda`` should now cause the scroll lock LED on your
+keyboard to blink (assuming that it has one).
+
+Multiple devices can be associated with a trigger::
+
+	# echo foo > /sys/class/block/sdb/led_trigger
+
+	# cat /sys/class/block/led_trigger_list
+	baz: 0
+	bar: 0
+	foo: 2
+
+Activity on either ``sda`` or ``sdb`` should now be shown by your scroll lock
+LED.
+
+Clear ``sda``'s LED trigger::
+
+	# echo > /sys/class/block/sda/led_trigger
+
+	# cat /sys/class/block/sda/led_trigger
+	(none)
+
+	# cat /sys/class/block/led_trigger_list
+	baz: 0
+	bar: 0
+	foo: 1
+
+And ``sdb``'s trigger::
+
+	# echo > /sys/class/block/sdb/led_trigger
+
+Delete the triggers::
+
+	# echo foo bar baz > /sys/class/block/led_trigger_del
+
+	# cat /sys/class/block/led_trigger_list
+
+	# cat /sys/class/leds/input1::scrolllock/trigger
+	none usb-gadget usb-host rc-feedback [kbd-scrolllock] kbd-numlock
+	kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock
+	kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock
+	disk-activity disk-read disk-write ide-disk mtd nand-disk panic
+	audio-mute audio-micmute rfkill-any rfkill-none
+
+Also see **Userspace LEDs** (``Documentation/leds/uleds.rst``).
+
+Kernel API
+==========
+
+``#include <linux/blk-ledtrig.h>``
+
+.. kernel-doc:: block/blk-ledtrig.c
+   :export:
-- 
2.31.1

