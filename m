Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800403F1092
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbhHSCvl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbhHSCvk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:40 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5248AC061764;
        Wed, 18 Aug 2021 19:51:05 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so6931099oti.0;
        Wed, 18 Aug 2021 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+KJ+LtUcknzEkHfsTVvqfXOdgjk417QG3hNVVCZe1bo=;
        b=DSAn74ZT+ETInT+hMQJI9ycd6AOUHJqZPUfUv4Tr4IzidsSPGhsXkS3KRgEdg8pJBZ
         nYtkweFwJ5q8sFl7BC2Ov1bcEz6a/nJXcfaOCc8/4BjnqLuJyr++czk93CZ+jDyFZwY3
         sOkMlFTfP0WjE9LtBoB4fg4nifsJO2cnLwwoh6vk4pjAufGrL/CDn5WfyCRnA122cAYR
         mBBQsQ6wwBbQdWoA/faldjlkUM8l3UNqgyuloIGOLtYAPsyTzR/FKeghvuEwYu8rAt8J
         se7wdlbA56RmxbusJvUxOt3BDHWR+O6vqjKWmGBnWu5Qra4IEu+TywprfLv/oZWIqlGF
         UadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+KJ+LtUcknzEkHfsTVvqfXOdgjk417QG3hNVVCZe1bo=;
        b=O+Z2JbIUl6nVPm9c72Aj7wVh7/E2WwJz10iDh71PJ0+Jayy3y772gSWrmzIcQS9/FI
         tYEP7rmL8Aq0DVnLFRMGMJFzAcOcl+ZGixw/AjEk3ovbRCtjbzJte7QzYDaGzMIDQoC4
         AAqCIfQFEzoNS9HEFtP0vwvf1orReSb6P1CPswbhTkfomREbS4WYdb6OhtohMo2SnYuW
         im5UIfX5HJK2OxsfJ5vsdMdOhKDCWAZ6xt5kR5xR1BkLkIrH5I9+Y6tunKhLWCJtVJD9
         W6flR//hjIHtDwDbz8eySrqm+ByrBD8Xftu/XFm/ZSxXEva0BLuzyGvx3CWlZxjZfEmH
         bi9w==
X-Gm-Message-State: AOAM533yWG5GkR+vl1snWWikbwmqxWakkJa+VdtmBPbUt71yF78QyXJn
        zYBI1kMlUrn7U0j/JQ1/Q3RsTxelDXPCl60d
X-Google-Smtp-Source: ABdhPJyf5nFinNpn1fZT34q1cYXqVBZ/pFNAwXBAOk+Kr7cm4xyehmm+fYwmI7uKx0PQ0w6zXXYKWQ==
X-Received: by 2002:a9d:1408:: with SMTP id h8mr9476386oth.151.1629341464141;
        Wed, 18 Aug 2021 19:51:04 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:03 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 01/18] docs: Add block device (blkdev) LED trigger documentation
Date:   Wed, 18 Aug 2021 21:50:36 -0500
Message-Id: <20210819025053.222710-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
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
  * /sys/class/leds/<led>/add_blkdev
  * /sys/class/leds/<led>/delete_blkdev
  * /sys/class/leds/<led>/block_devices

Add /sys/block/<disk>/blkdev_leds to Documentation/ABI/testing/sysfs-block

Add overview in Documentation/leds/ledtrig-blkdev.rst

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 Documentation/ABI/testing/sysfs-block         |   9 ++
 .../testing/sysfs-class-led-trigger-blkdev    |  48 +++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 132 ++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst

diff --git a/Documentation/ABI/testing/sysfs-block b/Documentation/ABI/testing/sysfs-block
index e34cdeeeb9d4..702601d6a276 100644
--- a/Documentation/ABI/testing/sysfs-block
+++ b/Documentation/ABI/testing/sysfs-block
@@ -316,3 +316,12 @@ Description:
 		does not complete in this time then the block driver timeout
 		handler is invoked. That timeout handler can decide to retry
 		the request, to fail it or to start a device recovery strategy.
+
+What:		/sys/block/<disk>/blkdev_leds
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all LEDs that are associated
+		with this block device through the blkdev LED trigger.  Only
+		present when at least one LED is associated.  (See
+		Documentation/leds/ledtrig-blkdev.rst.)
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
new file mode 100644
index 000000000000..1fd164983f13
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
@@ -0,0 +1,48 @@
+What:		/sys/class/leds/<led>/blink_time
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Time (in milliseconds) that the LED will be on during a single
+		"blink".
+
+What:		/sys/class/leds/<led>/interval
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Frequency (in milliseconds) with which block devices associated
+		with the blkdev LED trigger will be checked for activity.
+
+		NOTE that this attribute is a global setting.  All changes
+		apply to all LEDs associated with the blkdev LED trigger.
+
+What:		/sys/class/leds/<led>/mode
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Type of events for which LED will blink - read, write,
+		or rw (both).  Note that any activity that changes the state of
+		the device's non-volatile storage (including discards and cache
+		flushes) is considered to be a write.
+
+What:		/sys/class/leds/<led>/add_blkdev
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Associate a block device with this LED by writing its kernel
+		name (as shown in /sys/block) to this attribute.  Multiple
+		device names may be written at once, separated by whitespace.
+
+What:		/sys/class/leds/<led>/delete_blkdev
+Date:		August 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Remove the association between this LED and a block device by
+		writing the device's kernel name to this attribute.  Multiple
+		device names may be written at once, separated by whitespace.
+
+What:		/sys/class/leds/<led>/block_devices
+Date:		August 2021
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
index 000000000000..0b1a9359ec39
--- /dev/null
+++ b/Documentation/leds/ledtrig-blkdev.rst
@@ -0,0 +1,132 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+Block Device (blkdev) LED Trigger
+=================================
+
+Available when ``CONFIG_LEDS_TRIGGER_BLKDEV=y``.
+
+See also:
+
+* ``Documentation/ABI/testing/sysfs-class-led-trigger-blkdev``
+* ``Documentation/ABI/testing/sysfs-block`` (``/sys/block/<disk>/leds``)
+
+Overview
+========
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
+Note that several new device attributes are available.
+
+* ``add_blkdev`` and ``delete_blkdev`` are used to associate block devices with
+  this LED, and to remove associations.
+
+* ``mode`` is used to control the type of device activity that will cause this
+  LED to blink - read activity, write activity, or both.  (Note that any
+  activity that changes the state of a device's non-volatile storage is
+  considered to be a write.  This includes discard and cache flush requests.)
+
+* ``blink_time`` is the duration (in milliseconds) of each blink of this LED.
+
+* ``interval`` is the frequency (in milliseconds) with which devices are checked
+  for activity.
+
+* The ``block_devices`` directory will contain a symbolic link to every device
+  that is associated with this LED.
+
+Associate the LED with the block device::
+
+	# echo sda > /sys/class/leds/<LED>/add_blkdev
+
+	# ls /sys/class/leds/<LED>/block_devices
+	sda
+
+Reads and write activity on the device should cause the LED to blink.  The
+duration of each blink (in milliseconds) can be adjusted by setting
+``/sys/class/leds/<LED>/blink_on``, and the minimum delay between blinks can
+be set via ``/sys/class/leds/<LED>/blink_off``.
+
+Associate a second device with the LED::
+
+	# echo sdb > /sys/class/leds/<LED>/add_blkdev
+
+	# ls /sys/class/leds/<LED>/block_devices
+	sda  sdb
+
+When a block device is associated with one or more LEDs, the LEDs are linked
+from the device's ``blkdev_leds`` directory::
+
+	# ls /sys/block/sd{a,b}/blkdev_leds
+	/sys/block/sda/blkdev_leds:
+	<LED>
+
+	/sys/block/sdb/blkdev_leds:
+	<LED>
+
+(The ``blkdev_leds`` directory only exists when the block device is associated
+with at least one LED.)
+
+The ``add_blkdev`` and ``delete_blkdev`` attributes both accept multiple,
+whitespace separated, devices.  For example::
+
+	# echo sda sdb > /sys/class/leds/<LED>/delete_blkdev
+
+	# ls /sys/class/leds/<LED>/block_devices
+
+``interval`` and ``blink_time``
+===============================
+
+* The ``interval`` attribute is a global setting.  Changing the value via
+  ``/sys/class/leds/<LED>/interval`` will affect all LEDs associated with
+  the ``blkdev`` LED trigger.
+
+* All associated devices are checked for activity every ``interval``
+  milliseconds, and a blink is triggered on appropriate LEDs.  The duration
+  of an LED's blink is determined by its ``blink_time`` attribute (also in
+  milliseconds).  Thus (assuming that activity of the relevant type has occurred
+  on one of an LED's associated devices), the LED will be on for ``blink_time``
+  milliseconds and off for ``interval - blink_time`` milliseconds.
+
+* The LED subsystem ignores new blink requests for an LED that is currently in
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

