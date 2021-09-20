Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D81412AD4
	for <lists+linux-leds@lfdr.de>; Tue, 21 Sep 2021 03:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240597AbhIUCAm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Sep 2021 22:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhIUBlX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Sep 2021 21:41:23 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF47C05BD11;
        Mon, 20 Sep 2021 13:56:36 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso25358475otr.13;
        Mon, 20 Sep 2021 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=53uUEn1niTJFMWHbqrfcvMjK+5kvFlm4UNg31RZYsII=;
        b=ogCN5FngrJNwxo3tSygRe+/e6y8+1b6DB1p5QRtjX3+LAHGg+gGmETYbwP8+vBsJi3
         yjs/f20uUVPww38yYAIMEsNBn/RItzTdUxWx6VtqYqNPjSZAfAMX47sscSOkjoP0PytZ
         S9+q0Uhc5IyKWZdPNhVa/t4r3zTaN/4zm8Lm4+r+stdLUUJx/cWQfkRhPmrIENZQXyR9
         RU0ZpWUlO8KJnRQsDMdc2CMYSw8jBCFbtEGqpNkYpqFxEKw7aaDqYznrnsXRRJVCqgrm
         XpzJfMv8dZNEHD4JqTpWfi0atJ//J2nWA7goH4ZBJ76l3FWhkD/Uoq5fH/TBkRow8jzn
         oYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53uUEn1niTJFMWHbqrfcvMjK+5kvFlm4UNg31RZYsII=;
        b=e660SopkzRGpKy3Y9/JIwEbLcqFRE/oy3kgjVukJ6Md+2p7yfH+ntgCj8MmNqdlRJY
         pTKDiU67z5PXi3GsqQORblQrFa87zEoS0RhNUI5agjoyx/P+JsIlS80Dgp9M9ngXxUqV
         cfRciFY+TFsApswiO95j22TYODg91jFkV4cVd4eVSImVeV1XgF3FbzKL9Y0pmB/NjMgY
         FPfanIZZv+FkeuOJLWHbZ+VYMXB1jzid9DeP2awDQH7C4j5Y/+HSHWsml8GmtJyInGQB
         4/MvCpReUWp42Gc7MDCX982ZLk/GbcZiJX8IiDXCjitbk2OTKBLZ1kVBYLjzw5caSm1B
         y6Zw==
X-Gm-Message-State: AOAM530AHqr4aL5Hq2gFEpn6MS+ebipjDySkigc5KxBLiNTCQXs3fViy
        f0cF4jmIDPHYBBwnw1f7dLs=
X-Google-Smtp-Source: ABdhPJx37QrXUTm7Ourwqn8tWAXcaikuXJTFUNZk0jh0D4I34JASLn9erMhF2XS5m211eaCbDCHcTg==
X-Received: by 2002:a9d:4694:: with SMTP id z20mr22882972ote.379.1632171396182;
        Mon, 20 Sep 2021 13:56:36 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id j10sm3719514oog.13.2021.09.20.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:56:35 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, hch@infradead.org
Subject: [PATCH v5 1/2] docs: Add block device (blkdev) LED trigger documentation
Date:   Mon, 20 Sep 2021 15:56:25 -0500
Message-Id: <20210920205626.288366-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920205626.288366-1-arequipeno@gmail.com>
References: <20210920205626.288366-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add Documentation/ABI/testing/sysfs-class-led-trigger-blkdev to
document:

  * /sys/class/leds/<led>/blink_time
  * /sys/class/leds/<led>/mode
  * /sys/class/leds/<led>/link_device
  * /sys/class/leds/<led>/unlink_device
  * /sys/class/leds/<led>/linked_devices
  * /sys/class/ledtrig_blkdev/interval

Add /sys/block/<disk>/linked_leds to
Documentation/ABI/testing/sysfs-block.

Add overview in Documentation/leds/ledtrig-blkdev.rst.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 Documentation/ABI/testing/sysfs-block         |   9 ++
 .../testing/sysfs-class-led-trigger-blkdev    |  48 ++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 148 ++++++++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst

diff --git a/Documentation/ABI/testing/sysfs-block b/Documentation/ABI/testing/sysfs-block
index a0ed87386639..80d4becc4e6d 100644
--- a/Documentation/ABI/testing/sysfs-block
+++ b/Documentation/ABI/testing/sysfs-block
@@ -328,3 +328,12 @@ Description:
 		does not complete in this time then the block driver timeout
 		handler is invoked. That timeout handler can decide to retry
 		the request, to fail it or to start a device recovery strategy.
+
+What:		/sys/block/<disk>/linked_leds
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all LEDs that are associated
+		with this block device through the blkdev LED trigger.  Only
+		present when at least one LED is associated.  (See
+		Documentation/leds/ledtrig-blkdev.rst.)
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
new file mode 100644
index 000000000000..fe5184243e64
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
@@ -0,0 +1,48 @@
+What:		/sys/class/leds/<led>/blink_time
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Time (in milliseconds) that the LED will be on during a single
+		"blink".
+
+What:		/sys/class/leds/<led>/mode
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Type of events for which LED will blink - read, write,
+		or rw (both).  Note that any activity that changes the state of
+		the device's non-volatile storage (including discards and cache
+		flushes) is considered to be a write.
+
+What:		/sys/class/leds/<led>/link_device
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Associate a block device with this LED by writing the path to
+		the device special file (e.g. /dev/sda) to this attribute.
+		Symbolic links are followed.
+
+What:		/sys/class/leds/<led>/unlink_device
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Remove the association between this LED and a block device by
+		writing the path to the device special file (e.g. /dev/sda) to
+		this attribute.  Symbolic links are followed.
+
+What:		/sys/class/leds/<led>/linked_devices
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all block devices that are
+		associated with this LED.  (Note that the names of the
+		symbolic links in this directory are *kernel* names, which
+		may not match the device special file paths written to
+		link_device and unlink_device.)
+
+What:		/sys/class/ledtrig_blkdev/interval
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Frequency (in milliseconds) with which block devices associated
+		with the blkdev LED trigger will be checked for activity.
diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index e5d63b940045..e3c24e468cbc 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -10,6 +10,7 @@ LEDs
    leds-class
    leds-class-flash
    leds-class-multicolor
+   ledtrig-blkdev
    ledtrig-oneshot
    ledtrig-transient
    ledtrig-usbport
diff --git a/Documentation/leds/ledtrig-blkdev.rst b/Documentation/leds/ledtrig-blkdev.rst
new file mode 100644
index 000000000000..5be141add33f
--- /dev/null
+++ b/Documentation/leds/ledtrig-blkdev.rst
@@ -0,0 +1,148 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+Block Device (blkdev) LED Trigger
+=================================
+
+Available when ``CONFIG_LEDS_TRIGGER_BLKDEV=y`` or
+``CONFIG_LEDS_TRIGGER_BLKDEV=m``.
+
+See also:
+
+* ``Documentation/ABI/testing/sysfs-class-led-trigger-blkdev``
+* ``Documentation/ABI/testing/sysfs-block`` (``/sys/block/<disk>/linked_leds``)
+
+Overview
+========
+
+.. note::
+	The examples below use ``<LED>`` to refer to the name of a
+	system-specific LED.  If no suitable LED is available on a test
+	system (in a virtual machine, for example), it is possible to
+	use a userspace LED.  (See ``Documentation/leds/uleds.rst``.)
+
+Verify that the ``blkdev`` LED trigger is available::
+
+	# grep blkdev /sys/class/leds/<LED>/trigger
+	... rfkill-none blkdev
+
+(If the previous command produces no output, you may need to load the trigger
+module - ``modprobe ledtrig_blkdev``.  If the module is not available, check
+the value of ``CONFIG_LEDS_TRIGGER_BLKDEV`` in your kernel configuration.)
+
+Associate the LED with the ``blkdev`` LED trigger::
+
+	# echo blkdev > /sys/class/leds/<LED>/trigger
+
+	# cat /sys/class/leds/<LED>/trigger
+	... rfkill-none [blkdev]
+
+Note that several new device attributes are available in the
+``/sys/class/leds/<LED>`` directory.
+
+* ``link_device`` and ``unlink_device`` are used to manage the set of block
+  devices associated with this LED.  The LED will blink in response to read or
+  write activity on its linked devices.
+
+* ``mode`` is used to control the type of device activity that will cause this
+  LED to blink - read activity, write activity, or both.  (Note that any
+  activity that changes the state of a device's non-volatile storage is
+  considered to be a write.  This includes discard and cache flush requests.)
+
+* ``blink_time`` is the duration (in milliseconds) of each blink of this LED.
+  (The minimum value is 10 milliseconds.)
+
+* The ``linked_devices`` directory will contain a symbolic link to every device
+  that is associated with this LED.
+
+Link a block device to the LED::
+
+	# echo /dev/sda > /sys/class/leds/<LED>/link_device
+
+	# ls /sys/class/leds/<LED>/linked_devices
+	sda
+
+(The value written to ``link_device`` must be the path of the device special
+file, such as ``/dev/sda``, that represents the block device - or the path of a
+symbolic link to such a device special file.)
+
+Read and write activity on the device should cause the LED to blink.  The
+duration of each blink (in milliseconds) can be adjusted by setting
+``/sys/class/leds/<LED>/blink_time``.  (But see **interval and blink_time**
+below.)
+
+Associate a second device with the LED::
+
+	# echo /dev/sdb > /sys/class/leds/<LED>/link_device
+
+	# ls /sys/class/leds/<LED>/linked_devices
+	sda  sdb
+
+When a block device is linked to one or more LEDs, the LEDs are linked from
+the device's ``linked_leds`` directory::
+
+	# ls /sys/class/block/sd{a,b}/linked_leds
+	/sys/class/block/sda/linked_leds:
+	<LED>
+
+	/sys/class/block/sdb/linked_leds:
+	<LED>
+
+(The ``linked_leds`` directory only exists when the block device is linked to
+at least one LED.)
+
+``interval`` and ``blink_time``
+===============================
+
+* By default, linked block devices are checked for activity every 100
+  milliseconds.  This frequency can be changed via the
+  ``/sys/class/ledtrig_blkdev/interval`` attribute.  (The minimum value is 25
+  milliseconds.)
+
+* All associated devices are checked for activity every ``interval``
+  milliseconds, and a blink is triggered on appropriate LEDs.  The duration
+  of an LED's blink is determined by its ``blink_time`` attribute.  Thus
+  (assuming that activity of the relevant type has occurred on one of an LED's
+  linked devices), the LED will be on for ``blink_time`` milliseconds and off
+  for ``interval - blink_time`` milliseconds.
+
+* The LED subsystem ignores new blink requests for an LED that is already in
+  in the process of blinking, so setting a ``blink_time`` greater than or equal
+  to ``interval`` will cause some blinks to be missed.
+
+* Because of processing times, scheduling latencies, etc., avoiding missed
+  blinks actually requires a difference of at least a few milliseconds between
+  the ``blink_time`` and ``interval``.  The required difference is likely to
+  vary from system to system.  As a  reference, a Thecus N5550 NAS requires a
+  difference of 7 milliseconds (``interval == 100``, ``blink_time == 93``).
+
+* The default values (``interval == 100``, ``blink_time == 75``) cause the LED
+  associated with a continuously active device to blink rapidly.  For a more
+  "always on" effect, increase the ``blink_time`` (but not too much; see the
+  previous bullet).
+
+Other Notes
+===========
+
+* Many (possibly all) types of block devices work with this trigger, including:
+
+  * SCSI (including SATA and USB) hard disk drives and SSDs
+  * SCSI (including SATA and USB) optical drives
+  * NVMe SSDs
+  * SD cards
+  * loopback block devices (``/dev/loop*``)
+  * device mapper devices, such as LVM logical volumes
+  * MD RAID devices
+  * zRAM compressed RAM-disks
+  * partitions on block devics that support them
+
+* The names of the symbolic links in ``/sys/class/leds/<LED>/linked_devices``
+  are **kernel** names, which may not match the paths used for
+  ``link_device`` and ``unlink_device``.  This is most likely when a symbolic
+  link is used to refer to the device (as is common with logical volumes), but
+  it can be true for any device, because nothing prevents the creation of
+  device special files with arbitrary names (e.g. ``sudo mknod /foo b 8 0``).
+
+* The ``blkdev`` LED trigger supports many-to-many device/LED associations.
+  A device can be associated with multiple LEDs, and an LED can be associated
+  with multiple devices.
-- 
2.31.1

