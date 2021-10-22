Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDAB437BC9
	for <lists+linux-leds@lfdr.de>; Fri, 22 Oct 2021 19:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhJVRXW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Oct 2021 13:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbhJVRXV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Oct 2021 13:23:21 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014C9C061767;
        Fri, 22 Oct 2021 10:21:04 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id d144-20020a4a5296000000b002b6cf3f9aceso209226oob.13;
        Fri, 22 Oct 2021 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cCZZi4oneih+j/c7HNK295qk48mTZ76jjhA6SXqtuvk=;
        b=LMOI47sQATkoIh+XHhFAP971LMl2AOvrU1pXcXEEO3lPPy9LJrHeUihLZ/uPCcR/AL
         BMFzd9o64hBlpshS1TNZr7n4HR5jNvQySbw6bw2J8gRVlkKRIIXo5aeJDtf8p8trCXbh
         ITfozr+WTWLU/7Vt0ZlAyxJBsAl9+KOvy07IocJ6COxWrry35RWax1AQ53342UzDDUKB
         JyuAyN90zdZDIYxMieRelW17d3JNYAVRMzdI2PJIe7xWIY8e4h7fqT2f7imbJUFArLIq
         0wTrm0k8Jo670wkqshXu4n85Svwz3Gn+o6XJrri1+2+1vyBkso6IO8ReKPYc52dgpCZv
         9YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cCZZi4oneih+j/c7HNK295qk48mTZ76jjhA6SXqtuvk=;
        b=eT53UpqA44vo8c9OXAlWXRq87nlOp3mhD8lqqJ0IYoiWIU2uNT8zcUiweUlEpv+QSS
         38CIi2EE2LzlXmVp1FW77RpqsjYaW+jSmXjZrUXVdgNwcYaClHG7/UlPNGakeYMABjWm
         QoetAWWUbIwipCV9WDQgv4uh70TuX/i771910WEFVLfYLl+hUxbq3ynTDIaoeIz3nCZU
         19FVd9gm9dArLaH7xHGyfVuLIm9yJgoG68PMbwj7xpcglKs8jpVthDQ8NMWgFdy0PSLY
         wt7LU6p+sUN47HLjWIJq/EHwhVeDvNUFtXVjRbNTos2pYWYDWhFu1F3YOnjRHx2PhAO6
         kOuA==
X-Gm-Message-State: AOAM530zU21tgT3uX8HjKCWfEU1kLolcAo3lQmzPElADBv7NxQYPvWRm
        IanyOhwb55YFq6N8XQX3RNA=
X-Google-Smtp-Source: ABdhPJwX9oNbnx5/QZgehsbKCs+JZILEOYfJK1GUpxGfDSF3otUnffTHX0BwixTo2q9IJuWAXSRH8Q==
X-Received: by 2002:a4a:c883:: with SMTP id t3mr983130ooq.58.1634923263204;
        Fri, 22 Oct 2021 10:21:03 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id n7sm1856927oij.46.2021.10.22.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:21:02 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, hch@infradead.org
Subject: [RESEND PATCH v8 1/2] docs: Add block device (blkdev) LED trigger documentation
Date:   Fri, 22 Oct 2021 12:20:32 -0500
Message-Id: <20211022172033.210435-2-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022172033.210435-1-arequipeno@gmail.com>
References: <20211022172033.210435-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add Documentation/ABI/testing/sysfs-class-led-trigger-blkdev to
document:

  * /sys/class/leds/<led>/blink_time
  * /sys/class/leds/<led>/check_interval
  * /sys/class/leds/<led>/blink_on_{read,write,discard,flush}
  * /sys/class/leds/<led>/link_device
  * /sys/class/leds/<led>/unlink_device
  * /sys/class/leds/<led>/linked_devices

Add /sys/block/<disk>/linked_leds to
Documentation/ABI/testing/sysfs-block.

Add overview in Documentation/leds/ledtrig-blkdev.rst.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 Documentation/ABI/testing/sysfs-block         |   9 +
 .../testing/sysfs-class-led-trigger-blkdev    |  68 ++++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 154 ++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst

diff --git a/Documentation/ABI/testing/sysfs-block b/Documentation/ABI/testing/sysfs-block
index a0ed87386639..26931894084b 100644
--- a/Documentation/ABI/testing/sysfs-block
+++ b/Documentation/ABI/testing/sysfs-block
@@ -328,3 +328,12 @@ Description:
 		does not complete in this time then the block driver timeout
 		handler is invoked. That timeout handler can decide to retry
 		the request, to fail it or to start a device recovery strategy.
+
+What:		/sys/block/<disk>/linked_leds
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all LEDs that are associated
+		with this block device through the blkdev LED trigger.  Only
+		present when at least one LED is associated.  (See
+		Documentation/leds/ledtrig-blkdev.rst.)
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
new file mode 100644
index 000000000000..ee80e97e0a03
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
@@ -0,0 +1,68 @@
+What:		/sys/class/leds/<led>/blink_time
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Time (in milliseconds) that the LED will be on during a single
+		"blink".
+
+What:		/sys/class/leds/<led>/check_interval
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Frequency (in milliseconds) with which block devices linked to
+		this LED will be checked for activity and the LED will
+		(potentially) be blinked.
+
+What:		/sys/class/leds/<led>/blink_on_read
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Boolean that determines whether the LED will blink in response
+		to read activity on any of its linked block devices.
+
+What:		/sys/class/leds/<led>/blink_on_write
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Boolean that determines whether the LED will blink in response
+		to write activity on any of its linked block devices.
+
+What:		/sys/class/leds/<led>/blink_on_discard
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Boolean that determines whether the LED will blink in response
+		to discard activity on any of its linked block devices.
+
+What:		/sys/class/leds/<led>/blink_on_flush
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gamil.com>
+Description:
+		Boolean that determines whether the LED will blink in response
+		to cache flush activity on any of its linked block devices.
+
+What:		/sys/class/leds/<led>/link_device
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Associate a block device with this LED by writing the path to
+		the device special file (e.g. /dev/sda) to this attribute.
+		Symbolic links are followed.
+
+What:		/sys/class/leds/<led>/unlink_device
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Remove the association between this LED and a block device by
+		writing the path to the device special file (e.g. /dev/sda) to
+		this attribute.  Symbolic links are followed.
+
+What:		/sys/class/leds/<led>/linked_devices
+Date:		October 2021
+Contact:	Ian Pilcher <arequipeno@gmail.com>
+Description:
+		Directory containing links to all block devices that are
+		associated with this LED.  (Note that the names of the
+		symbolic links in this directory are *kernel* names, which
+		may not match the device special file paths written to
+		link_device and unlink_device.)
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
index 000000000000..14b598bb07e9
--- /dev/null
+++ b/Documentation/leds/ledtrig-blkdev.rst
@@ -0,0 +1,154 @@
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
+* ``blink_on_read``, ``blink_on_write``, ``blink_on_discard``, and
+  ``blink_on_flush`` are boolean values that determine whether the LED will
+  blink when a particular type of activity is detected on one of its linked
+  block devices.
+
+* ``blink_time`` is the duration (in milliseconds) of each blink of this LED.
+  (The minimum value is 10 milliseconds.)
+
+* ``check_interval`` is the frequency (in milliseconds) with which block devices
+  linked to this LED will be checked for activity and the LED blinked (if the
+  correct type of activity has occurred).
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
+Activity on the device should cause the LED to blink.  The duration of each
+blink (in milliseconds) can be adjusted by setting
+``/sys/class/leds/<LED>/blink_time``.  (But see **check_interval and
+blink_time** below.)
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
+``check_interval`` and ``blink_time``
+=====================================
+
+* By default, linked block devices are checked for activity every 100
+  milliseconds.  This frequency can be changed for an LED via the
+  ``/sys/class/leds/<led>/check_interval`` attribute.  (The minimum value is 25
+  milliseconds.)
+
+* All block devices associated with an LED are checked for activity every
+  ``check_interval`` milliseconds, and a blink is triggered if the correct type
+  of activity (as determined by the LED's ``blink_on_*`` attributes) is
+  detected.  The duration of an LED's blink is determined by its ``blink_time``
+  attribute.  Thus (when the correct type of activity is detected), the LED will
+  be on for ``blink_time`` milliseconds and off for ``check_interval -
+  blink_time`` milliseconds.
+
+* The LED subsystem ignores new blink requests for an LED that is already in
+  in the process of blinking, so setting a ``blink_time`` greater than or equal
+  to ``check_interval`` will cause some blinks to be missed.
+
+* Because of processing times, scheduling latencies, etc., avoiding missed
+  blinks actually requires a difference of at least a few milliseconds between
+  the ``blink_time`` and ``check_interval``.  The required difference is likely
+  to vary from system to system.  As a  reference, a Thecus N5550 NAS requires a
+  difference of 7 milliseconds (``check_interval == 100``, ``blink_time ==
+  93``).
+
+* The default values (``check_interval == 100``, ``blink_time == 75``) cause the
+  LED associated with a continuously active device to blink rapidly.  For a more
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

