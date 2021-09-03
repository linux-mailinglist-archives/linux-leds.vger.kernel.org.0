Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5584006E6
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350253AbhICUq7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235953AbhICUq7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:46:59 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8C3C061575;
        Fri,  3 Sep 2021 13:45:58 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q39so648199oiw.12;
        Fri, 03 Sep 2021 13:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcmHwQY+Etz5k7FUE3JqhXtdTnQXSGBqgITy4Qw50K4=;
        b=CuHn2SNGr+271aKjZ9ZM6ouKgChjkF5acCD6vX8d6uny0T+NL1Q8Jl52YDY3/Hlazi
         EcxHkiocTKZCq/QD39znsE+Yfbqvr/G4rphdsVv6Z5HbgRvLFcDBnFB7PfvElMcPk4Ec
         gq1iRuZ9HKgKBYOcWJoec1+Ll6yZssKPw7BGbtk1QK+wTOV5swMw0Yn+hlsyPJvYdsPw
         8MfyfFvdXDHrtcqYAU4kqnEv5Z/FoFSfPFzWMxu7VeRhZFL9XdK8JK2VtTYUS/ZjC+CH
         XteBwfmfx8A0QiOc5qCzrPswZD7sySieoRtl3793/BOTzYE1OROimZ9jYjDXHK25WcWs
         ocqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcmHwQY+Etz5k7FUE3JqhXtdTnQXSGBqgITy4Qw50K4=;
        b=Xx9WE90svnurBvFZEFPwHe+KkDyfotrbC9u7Z4uS0NvjFaPkmn+++mS28Ap4xUqdNA
         uqquCao9wPEypZJ3ch4j5fW2ViibgxJa6OpzrJBjGELhMpF46ngBK+Bmjwo3QzOs6SE7
         TIHuS5WpWKr4Md8laNhkqV3Yr6Juh9E+IgMXRkUh5pUxWvl50dnywuRE+833t+QOVixB
         KyqB+WSDcMUxLF1plEtEC/1WJgPyi+e7C/bylLnCZgQSmw0tf0fGcqkog0edjoX607vC
         dabWHFLed2crN8yyH+FVca36P7onSJRlLM75UoA+2Nh39z27Wzi/S4y5eYI/zJ3JBsp7
         PplA==
X-Gm-Message-State: AOAM531D9dLk8T6B8OR8s5fLfaLMKcD8/liKB3FFHdvriBkTBdcprRpQ
        vSJWoFhI4GE3JiVQ662T8q8=
X-Google-Smtp-Source: ABdhPJzKs8vv7VRGpciVIKeCNbKtdqvZ0tCV4n6/gjHjcQazfAzAybzFF0oFvkPHZQrtDcXAGTBbbA==
X-Received: by 2002:aca:c481:: with SMTP id u123mr487740oif.23.1630701958251;
        Fri, 03 Sep 2021 13:45:58 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:45:57 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 01/18] docs: Add block device (blkdev) LED trigger documentation
Date:   Fri,  3 Sep 2021 15:45:31 -0500
Message-Id: <20210903204548.2745354-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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
 .../testing/sysfs-class-led-trigger-blkdev    |  48 ++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 144 ++++++++++++++++++
 4 files changed, 202 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst

diff --git a/Documentation/ABI/testing/sysfs-block b/Documentation/ABI/testing/sysfs-block
index a0ed87386639..4d27e2d98091 100644
--- a/Documentation/ABI/testing/sysfs-block
+++ b/Documentation/ABI/testing/sysfs-block
@@ -328,3 +328,12 @@ Description:
 		does not complete in this time then the block driver timeout
 		handler is invoked. That timeout handler can decide to retry
 		the request, to fail it or to start a device recovery strategy.
+
+What:		/sys/block/<disk>/blkdev_leds
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all LEDs that are associated
+		with this block device through the blkdev LED trigger.  Only
+		present when at least one LED is associated.  (See
+		Documentation/leds/ledtrig-blkdev.rst.)
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
new file mode 100644
index 000000000000..514f23f9a72d
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
+What:		/sys/class/leds/<led>/add_blkdev
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Associate a block device with this LED by writing its kernel
+		name (as shown in /sys/block) to this attribute.  Multiple
+		device names may be written at once, separated by whitespace.
+
+What:		/sys/class/leds/<led>/delete_blkdev
+Date:		September 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Remove the association between this LED and a block device by
+		writing the device's kernel name to this attribute.  Multiple
+		device names may be written at once, separated by whitespace.
+
+What:		/sys/class/leds/<led>/block_devices
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
index 000000000000..1a2b6c406258
--- /dev/null
+++ b/Documentation/leds/ledtrig-blkdev.rst
@@ -0,0 +1,144 @@
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
+* ``Documentation/ABI/testing/sysfs-block`` (``/sys/block/<disk>/leds``)
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
+  for activity.  (Note that this is a global setting.  Any change affects all
+  LEDs associated with the ``blkdev`` trigger.)
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

