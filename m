Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695CB3E3E48
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232791AbhHIDdJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbhHIDdJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:09 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C57C061760;
        Sun,  8 Aug 2021 20:32:49 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o20so21693795oiw.12;
        Sun, 08 Aug 2021 20:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GWuq4x5Ma8/N/51ftwpP4AD0F7izQuOl1Oao0AbJWv0=;
        b=Xy+ucOGn3nozc0ifyyuOMg6MPM+itH8mqmavs1lMyi51OEDbmG0AghOoXnl5XzM29W
         40RbBWmegX48ZF43bVyoFYwUtIJGpDqAgND8sumjaxEz98Wh4v03EyaiAc37h/WwvItX
         /nOrmZ0wppNuBrsMBCPDkisMiuHl1t2hXTwq6v1edBFm4GBLOralBQqDApGgZQ1U5LoZ
         iSPon0bEpKsM7rB3O9Vi0rTamsTI+vqDvoryLHS7dGraT6SZo+U75TH7H+H1XUiU9odZ
         A//qDX5T47go8g5YOCNQuppxZzku2fijjRUQls+X7Xe5XQt6jpJbjNSYLxfrb9Hvw161
         tH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GWuq4x5Ma8/N/51ftwpP4AD0F7izQuOl1Oao0AbJWv0=;
        b=Fs4UsoSQmvgKaQuto/n5AATUj1q8O0qwx8ztnMXqdXAO5nehXcz/kC9d/YZb/PnT8i
         1/UzWpdZaYxiDqkpF4VuMJ+df2Uh+mhlNxjd/nJvhn4UEHsfPxM6NMEVS8G4FrmxJgh/
         iKrGaNLii0EAlbHONH6lkNFrEghnHJp39raYqgbL+xjR0PdochPulK9RGqVNQ6/olSet
         Zm4Y4aVy0xiJTquWGOtmuNptAueRkR63d+mwmoWe5cy4iJVJ/lO37VMIWC/Xh56yE4SD
         0rPRPcwiHXo8gSb06S8IuNWwiZTDgy04C5QEeU9YoLytnoxK9my81RCWzojR+A+va8uY
         zSRA==
X-Gm-Message-State: AOAM532c8foCQtC98EDSOT1RxxF6CzaXuakO0p/VGtXWNHTTGytqG710
        DjdDDAMC1sM+3fqP/xsRL6tWJLQnPQDzRf0S
X-Google-Smtp-Source: ABdhPJyZQsNuoGiQWsOX7Js8N8w1bmGJg7pP+RdemzXG1FZZb9vBYq5SAKwfjdvBIj9qtz6EGr7cdg==
X-Received: by 2002:aca:90c:: with SMTP id 12mr5402436oij.37.1628479968774;
        Sun, 08 Aug 2021 20:32:48 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:48 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 01/10] docs: Add block device LED trigger documentation
Date:   Sun,  8 Aug 2021 22:32:08 -0500
Message-Id: <20210809033217.1113444-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add Documentation/ABI/testing/sysfs-class-led-trigger-blkdev to
document:

  * /sys/class/leds/<led>/blink_on
  * /sys/class/leds/<led>/blink_off
  * /sys/class/leds/<led>/block_devices

Add /sys/block/<disk>/led to Documentation/ABI/testing/sysfs-block

Add usage overview in Documentation/block/blk-ledtrig.rst

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 Documentation/ABI/testing/sysfs-block         | 16 ++++
 .../testing/sysfs-class-led-trigger-blkdev    | 28 +++++++
 Documentation/block/blk-ledtrig.rst           | 79 +++++++++++++++++++
 Documentation/block/index.rst                 |  1 +
 4 files changed, 124 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/block/blk-ledtrig.rst

diff --git a/Documentation/ABI/testing/sysfs-block b/Documentation/ABI/testing/sysfs-block
index e34cdeeeb9d4..36253fff25b2 100644
--- a/Documentation/ABI/testing/sysfs-block
+++ b/Documentation/ABI/testing/sysfs-block
@@ -316,3 +316,19 @@ Description:
 		does not complete in this time then the block driver timeout
 		handler is invoked. That timeout handler can decide to retry
 		the request, to fail it or to start a device recovery strategy.
+
+What:		/sys/block/<disk>/led
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Set the LED associated with this block device (or show available
+		LEDs and the currently selected LED, if any).
+
+		Reading the attribute will display the available LEDs (LEDs that
+		are associated with the blkdev LED trigger).  The currently
+		selected LED is enclosed in square brackets.  To clear the
+		device's LED association write 'none' (without the quotes) or
+		an empty string/line to the attribute.
+
+		See Documentation/ABI/testing/sysfs-class-led-trigger-blkdev and
+		Documentation/block/blk-ledtrig.rst.)
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
new file mode 100644
index 000000000000..1139a099a3cc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
@@ -0,0 +1,28 @@
+What:		/sys/class/leds/<led>/blink_on
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Time (in milliseconds) that the LED will be on during a single
+		"blink".
+
+What:		/sys/class/leds/<led>/blink_off
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Time (in milliseconds) that the LED will be off during a single
+		"blink".  Effectively the amount of time that the LED will be
+		off before the next blink, when the associated block device(s)
+		are continuously active.
+
+What:		/sys/class/leds/<led>/block_devices
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all block devices that are
+		associated with this LED.
+
+		Once an LED has been associated with the blkdev trigger, a block
+		device can be associated with that LED by writing the LED name
+		to the device's /sys/[class/]block/<disk>/led attribute.  (See
+		Documentation/ABI/testing/sysfs-block and
+		Documentation/block/blk-ledtrig.rst.)
diff --git a/Documentation/block/blk-ledtrig.rst b/Documentation/block/blk-ledtrig.rst
new file mode 100644
index 000000000000..194fc6a51019
--- /dev/null
+++ b/Documentation/block/blk-ledtrig.rst
@@ -0,0 +1,79 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+Block Device (blkdev) LED Trigger
+=================================
+
+Available when ``CONFIG_BLK_LED_TRIGGERS=y``.
+
+See also:
+
+* ``Documentation/ABI/testing/sysfs-class-led-trigger-blkdev``
+* ``Documentation/ABI/testing/sysfs-block`` (``/sys/block/<disk>/led``)
+
+.. note::
+	The examples below use ``<LED>`` to refer to the name of a
+	system-specific LED.  If no suitable LED is available on a test
+	system (in a virtual machine, for example), it is possible to
+	use a userspace LED (``Documentation/leds/uleds.rst``).
+
+Associate the LED with the ``blkdev`` LED trigger::
+
+	# echo blkdev > /sys/class/leds/<LED>/trigger
+
+	# cat /sys/class/leds/<LED>/trigger
+	... kbd-ctrlrlock [blkdev] disk-activity ...
+
+Note that the ``blink_on`` and ``blink_off`` attributes have been added to the
+LED, along with the ``block_devices`` subdirectory.
+
+The LED is now available for association with block devices::
+
+	# cat /sys/block/sda/led
+	[none] <LED>
+
+Associate the LED with the block device::
+
+	# echo <LED> > /sys/block/sda/led
+
+	# cat /sys/block/sda/led
+	none [<LED>]
+
+Reads and write activity on the device should cause the LED to blink.  The
+duration of each blink (in milliseconds) can be adjusted by setting
+``/sys/class/leds/<LED>/blink_on``, and the minimum delay between blinks can
+be set via ``/sys/class/leds/<LED>/blink_off``.
+
+Associate a second device with the LED::
+
+	# echo <LED> > /sys/block/sdb/led
+
+	# cat /sys/block/sdb/led
+	none [<LED>]
+
+Note that both block devices are linked from the LED's ``block_devices``
+subdirectory::
+
+	# ls /sys/class/leds/<LED>/block_devices
+	sda sdb
+
+Other notes:
+
+* Many types of block devices work with this trigger, including:
+
+  * SCSI (including SATA and USB) hard disk drives and SSDs
+  * SCSI (including SATA and USB) optical drives
+  * SD cards
+  * loopback block devices (``/dev/loop*``)
+
+* NVMe SSDs and most virtual block devices can be associated with LEDs, but
+  they will produce little or no LED activity.
+
+* Multiple LEDs can be associated with the ``blkdev`` trigger; different block
+  devices can be associated with different LEDs.
+
+* This trigger causes associated LED(s) to blink (per the LED's ``blink_on``
+  and ``blink_off`` attributes) when a request is sent to an associated
+  block device's low-level driver.  It does not track the duration (or
+  result) of requests further.  Thus, it provides an approximate visual
+  indication of device activity, not an exact measurement.
diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
index 86dcf7159f99..cbb11a42f825 100644
--- a/Documentation/block/index.rst
+++ b/Documentation/block/index.rst
@@ -25,3 +25,4 @@ Block
    stat
    switching-sched
    writeback_cache_control
+   blk-ledtrig
-- 
2.31.1

