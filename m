Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF180405F62
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345760AbhIIW0j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344830AbhIIW0f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:35 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1A8C061575;
        Thu,  9 Sep 2021 15:25:25 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id n27so150225oij.0;
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bS03gH8cDYgvnSLfr8sw2gf9sO3fp5rYXzNR2wunLpo=;
        b=gP0F9TDVP2eJ/K4hqxcGEN4xE574UeLdZinlUrJRAlWtcnaFxcLCR0hJVFDg8yMv1h
         sT3bs6UFXNx4pWRqNdRlcyuCVSbuN4RNosITz0FTuN6i+nAe7CDTuD61lsr7dOgF3jQj
         FDfzPHlSbmQDWp8OKgXyN/zHViZ1KyDP5pVIvdcRalrBmuphr/LckAdKjlxwQsgWFQSG
         4YDH1gbEohg+D8aUSgOHPV2UpYZWVFUbBgxdiB9AkjbZfetQ3qsS0VcUuRSIQFbEWbow
         godwykb0LpHkAhlafEFsoqLXmDn0OpIeeG1RNXGiLHPHdtNddHuGE2TJtn2Blta5Hp0B
         /DBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bS03gH8cDYgvnSLfr8sw2gf9sO3fp5rYXzNR2wunLpo=;
        b=vAwOFBboa8+aZLInXJDFmJySm6kAaYt9i/iJB0T86t8YPh6IzlClaqqyQ5xQQTXY8e
         OKiQdvOPkj8ApHYw6DiwVDAVCiZWYqn91t9uDxqXv7mIJCWO0rMqO14gtfXO7lmrPBev
         OJMPD5QlaIa7YwIKEP1BdExqQfldqmnAMz0DtN73sUqr1KNZ6ZGH6vT/2VssL6vE3R1L
         /n4Q3FRBvKgmwaz+qwPoAzUk/oP1uW30QaRn5uHWBRXPRa1MPKqliW9KGWpXnhpYT6IY
         HBISi3hhMl05TtloeewAmBfP0oZjN2iuyapdJl3ZM+/6Jz0avWZQdrwtOpsEvu6VwXac
         hwxA==
X-Gm-Message-State: AOAM530Vj7mMtkZZjSP5oRx8GeWeFQoYrgiQb1mEju9SHIkja57qC9Sh
        QLBAC5NPbnYuQk4Z00rKkKPzgAdoq5U=
X-Google-Smtp-Source: ABdhPJyhIEf0GTHss77cGnhq4UIPnI7nX1fu8GYJP+BY66rosfT6fysHT/C1Az0gUczeZV3WSlerFg==
X-Received: by 2002:aca:b2c4:: with SMTP id b187mr1829292oif.90.1631226323548;
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
Subject: [PATCH v2 01/15] docs: Add block device (blkdev) LED trigger documentation
Date:   Thu,  9 Sep 2021 17:24:59 -0500
Message-Id: <20210909222513.2184795-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add Documentation/ABI/testing/sysfs-class-led-trigger-blkdev to
document:

  * /sys/class/leds/<led>/blink_time
  * /sys/class/leds/<led>/interval
  * /sys/class/leds/<led>/mode
  * /sys/class/leds/<led>/link_device
  * /sys/class/leds/<led>/unlink_device
  * /sys/class/leds/<led>/linked_devices

Add /sys/block/<disk>/linked_leds to Documentation/ABI/testing/sysfs-block

Add overview in Documentation/leds/ledtrig-blkdev.rst

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 Documentation/ABI/testing/sysfs-block         |   9 ++
 .../testing/sysfs-class-led-trigger-blkdev    |  46 ++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 138 ++++++++++++++++++
 4 files changed, 194 insertions(+)
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
index 000000000000..9f75d0bccceb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
@@ -0,0 +1,46 @@
+What:		/sys/class/leds/<led>/blink_time
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Time (in milliseconds) that the LED will be on during a single
+		"blink".
+
+What:		/sys/class/leds/<led>/interval
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Frequency (in milliseconds) with which block devices associated
+		with the blkdev LED trigger will be checked for activity.
+
+		NOTE that this attribute is a global setting.  All changes
+		apply to all LEDs associated with the blkdev LED trigger.
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
+		Associate a block device with this LED by writing its kernel
+		name (as shown in /sys/block) to this attribute.
+
+What:		/sys/class/leds/<led>/unlink_device
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Remove the association between this LED and a block device by
+		writing the device's kernel name to this attribute.
+
+What:		/sys/class/leds/<led>/linked_devices
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all block devices that are
+		associated with this LED.
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
index 000000000000..a4acc532f31b
--- /dev/null
+++ b/Documentation/leds/ledtrig-blkdev.rst
@@ -0,0 +1,138 @@
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
+
+* ``interval`` is the frequency (in milliseconds) with which devices are checked
+  for activity.  (Note that this is a global setting.  Any change affects
+  **all** LEDs associated with the ``blkdev`` trigger.)
+
+* The ``linked_devices`` directory will contain a symbolic link to every device
+  that is associated with this LED.
+
+Link a block device to the LED::
+
+	# echo sda > /sys/class/leds/<LED>/link_device
+
+	# ls /sys/class/leds/<LED>/linked_devices
+	sda
+
+Read and write activity on the device should cause the LED to blink.  The
+duration of each blink (in milliseconds) can be adjusted by setting
+``/sys/class/leds/<LED>/blink_time``.  (But see **interval and blink_time**
+below.)
+
+Associate a second device with the LED::
+
+	# echo sdb > /sys/class/leds/<LED>/link_device
+
+	# ls /sys/class/leds/<LED>/linked_devices
+	sda  sdb
+
+When a block device is linked to one or more LEDs, the LEDs are linked from
+the device's ``linked_leds`` directory::
+
+	# ls /sys/block/sd{a,b}/linked_leds
+	/sys/block/sda/linked_leds:
+	<LED>
+
+	/sys/block/sdb/linked_leds:
+	<LED>
+
+(The ``linked_leds`` directory only exists when the block device is linked to
+at least one LED.)
+
+``interval`` and ``blink_time``
+===============================
+
+* The ``interval`` attribute is a global setting.  Changing the value via
+  ``/sys/class/leds/<LED>/interval`` will change it for all LEDs associated with
+  the ``blkdev`` trigger.
+
+* All associated devices are checked for activity every ``interval``
+  milliseconds, and a blink is triggered on appropriate LEDs.  The duration
+  of an LED's blink is determined by its ``blink_time`` attribute (also in
+  milliseconds).  Thus (assuming that activity of the relevant type has occurred
+  on one of an LED's linked devices), the LED will be on for ``blink_time``
+  milliseconds and off for ``interval - blink_time`` milliseconds.
+
+* The LED subsystem ignores new blink requests for an LED that is already in
+  in the process of blinking, so setting a ``blink_time`` greater than or equal
+  to ``interval`` will cause some blinks to be dropped.
+
+* Because of processing times, scheduling latencies, etc., avoiding missed
+  blinks actually requires a difference of at least a few milliseconds between
+  the ``blink_time`` and ``interval``.  The required difference is likely to
+  vary from system to system.  As a  reference, a Thecus N5550 NAS requires a
+  difference of 7 milliseconds (``interval == 100``, ``blink_time == 93``).
+
+* The default values (``interval == 100``, ``blink_time == 75``) cause the LED
+  associated with a continuously active device to blink rapidly.  For a more
+  "constantly on" effect, increase the ``blink_time`` (but not too much; see
+  the previous bullet).
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
+
+* The ``blkdev`` LED trigger supports many-to-many device/LED associations.
+  A device can be associated with multiple LEDs, and an LED can be associated
+  with multiple devices.
-- 
2.31.1

