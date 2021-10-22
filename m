Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19710437BC8
	for <lists+linux-leds@lfdr.de>; Fri, 22 Oct 2021 19:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbhJVRXW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Oct 2021 13:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233858AbhJVRXV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Oct 2021 13:23:21 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8725CC061766;
        Fri, 22 Oct 2021 10:21:03 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so2707957ote.8;
        Fri, 22 Oct 2021 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UMnFNY0uIDI76jK/dmFziQ2KScbKCg1SLolCMQbj1hg=;
        b=eXYn2LQrst246PBEOyDOC4ulJllhz1Qd9coBfFLYIOCyQDdSY22xihZi17ZxEHCvZM
         o5Vx3USf/Zpguxgf/S4oV5eSY5OYTMZoT13VrMzvMaF85mqQGFPOeuCfo0yaKSNKHAyC
         pw99VBxNgnPHWTiZaoaCJbHtR95YCFl8dtIeHyR/TlDbDNWkCXAv4/rsprW3DlJvE2Gx
         h0lmn0Fn54aCzZz1NPKEsnrxTfSQGD5WV+qdxLW0RQQMSL/Oiak3MNEbIGM1GKCkEYSk
         BSZOCQmKTuvOga8UCg21qtIVjgjhT7s2dARCpvmpriwa2Pqo6pd/aDbVPNWyKcgQHys+
         wPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UMnFNY0uIDI76jK/dmFziQ2KScbKCg1SLolCMQbj1hg=;
        b=4fn8YjC3Jnb1OjY2KVv1WqvNI/9WkXJVHRAgC0w6xLCVLQDhqCKTjz0qsp8NRBrEq0
         W9uOYo7Y4UDgX5pqpsjKuuzKYi0sOUPW7arCnMDELpZbPJ+Hhq9jj+XY84DweUHIgeQg
         kC0TebpnSBWvBk4PvcNgHN7GIuIdxOyAyPo2daZRxY5Gur8By7KkA/uF7qAPHrfK/H2y
         NeMnS1u60+vAakD7KVJtwNpHdw2CCSXPEY6Dv5xRdaQ04eL5Umdpgj7S57GtWfw4TUZI
         7Mh76DXl3YJgjMJe0xbDoxtGr/vj4DUT2pB4C9CE+p+FbyWJkX9Ylum6jMOqX0ef1QDu
         Dq8g==
X-Gm-Message-State: AOAM530yCJW5nBySGzV8OUpwuVGJVtu+BUjHDO3OzaeFKhNQ81aGOUmP
        N7JPQ/Y3mrIepdcKPWZJGA/XHglVhe8lzQ==
X-Google-Smtp-Source: ABdhPJxbT0G9KskKfL2IvOtzY6fsdL6RWhnkrU8689cDaNWHnHWmiJh3OFUt6SDokWSNg8X0zc1nHQ==
X-Received: by 2002:a05:6830:1318:: with SMTP id p24mr978527otq.82.1634923262770;
        Fri, 22 Oct 2021 10:21:02 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id n7sm1856927oij.46.2021.10.22.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:21:02 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, hch@infradead.org
Subject: [RESEND PATCH v8 0/2] Introduce block device LED trigger
Date:   Fri, 22 Oct 2021 12:20:31 -0500
Message-Id: <20211022172033.210435-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Changes from v7:
================

Fix blkdev_trig_activate() - Lock 'blkdev_trig_mutex' before accessing
'blkdev_trig_next_index'.

Changes from v6:
================

Remove incorrect use of get_jiffies_64().  We use the helper functions in
include/linux/jiffies.h for all time comparisons, so jiffies rolling over
on 32-bit platforms isn't a problem.

Changes from v5:
================

sysfs API changes:

* Frequency with which the block devices associated with an LED are
  checked for activity is now a per-LED setting ('check_interval' device
  attribute replaces 'interval' class attribute).

* 'mode' device attribute (read/write/rw) is replaced by 4 separate
  attributes - 'blink_on_read', 'blink_on_write', 'blink_on_discard', and
  'blink_on_flush'.

Logic changes:

* Use jiffies instead of static "generation" variable.

* LED mode is now a bitmask - 1 bit per read, write, discard, and flush.

* When updating block device I/O stats, save separate I/O counter ('ios')
  and timestamp ('last_activity') for each activity type, along with
  'last_checked' timestamp.

* When checking an LED, save 'last_checked' timestamp.

* When checking LEDs (in delayed work), determine when the next check
  needs to be performed (based on each LED's 'last_checked' and
  'check_jiffies' values) and schedule the next check accordingly.  (See
  blkdev_trig_check() at ledtrig-blkdev.c:661.)

* When linking a block device to an LED, modify the delayed work schedule
  if necessary.  (See blkdev_trig_sched_led() at ledtrig-blkdev.c:416.)

Style changes:

* "Prefix" of data types, static variables, function names, etc. is
  changed to 'blkdev_trig' ('BLKDEV_TRIG' for constants).

* Don't declare function parameters and local variables as const.

* Don't explicitly compare return values to 0 - i.e. 'if (ret == 0)'.
  Change variable name to 'err' and use 'if (err)' idiom.

* In error path, return directly when no cleanup is required (instead of
  jumping to a single exit point).

* Use kzalloc(), rather than kmalloc(), to allocate per-LED structs.

Changes from v4:
================

* Use xarrays, rather than lists, to model "links" between LEDs and block
  devices.  This allows many-to-many relationships without the need for a
  separate link object.

* When resolving (getting) a block device by path, don't retry with
  "/dev/" prepended to the path in the ENOENT case.

* Use an enum, rather than a boolean, to tell led_bdev_unlink() whether
  the block device is being released or not.

* Use preprocessor constant, rather than magic number, for the mode passed
  to blkdev_get_by_path() and blkdev_put().

* Split the data structure used by mode attribute show & store functions
  into 2 separate arrays and move them into the functions that use them.

Changes from v3:
================

* Use blkdev_get_by_path() to "resolve" block devices
  (struct block_device).  With this change, there are now no changes
  required to the block subsystem, so there are only 2 patches in this
  series.

* link_device and unlink_device attributes now take paths to block device
  special files (e.g. /dev/sda), rather than kernel names.  Symbolic
  links also work.

  If the path written to the attribute doesn't exist (-ENOENT), we re-try
  with /dev/ prepended, so "simple" names like sda will still work as long
  as the corresponding special file exists in /dev.

* Fixed a bug that could cause "phantom" blinks because of old device
  activity that was not recognized at the correct time.

* (Slightly) more detailed commit message for the patch that adds the
  trigger code.  As with v3, the real details are found in the comments
  in the source file.

Changes from v2:
================

* Allow LEDs to be "linked" to partitions, as well as whole devices.
  Internally, the trigger now works with block_device structs, rather
  than gendisk structs.

  (Investigating the lifecycle of block_device structs led me to
  discover the device resource API, so ...)

* Use the device resource API to manage the trigger's per-block device
  data structure (struct led_bdev_bdi).  The trigger now uses a release
  function to remove references to block devices that have been removed.

  Because the release function is automatically called by the driver core,
  there is no longer any need for the block layer to explictly call the
  trigger's cleanup function.

* Since there is no need to provide a built-in "stub" cleanup function
  when the trigger is built as a module, I have removed the always
  built-in "core" portion of the trigger.

* Without a built-in component, the module does need access to the
  block_class symbol.  The second patch in this series exports the symbol
  to the LEDTRIG_BLKDEV namespace and explains the reason for doing so.

* Changed the interval sysfs attribute from a device attribute to a class
  attribute.  It's single value that applies to all LEDs, so it didn't
  make sense as a device atribute.

* As requested, I am posting the trigger code (ledtrig-blkdev.c) as a
  single patch.  This eliminates the commit messages that would otherwise
  describe sections of the code, so I have added fairly extensive comments
  to each function.

Changes from v1:
================

* Use correct address for LKML.

* Renamed the sysfs attributes used to manage and view the set of block
  devices associated ("linked") with an LED.

  - /sys/class/leds/<LED>/link_device to create associations

  - /sys/class/leds/<LED>/unlink_device to remove associations

  - /sys/class/leds/<LED>/linked_devices/ contains symlinks to all block
    devices associated with the LED

  - /sys/block/<DEVICE>/linked_leds (which only exists when the device is
    associated with at least one LED) contains symlinks to all LEDs with
    which the device is associated

  link_device and unlink_device are write-only attributes, each of which
  represents a single action, rather than any state.  (The current state
  is shown by the symbolic links in the <LED>/linked_devices/ and
  <DEVICE>/linked_leds/ directories.)

* Simplified sysfs attribute store functions.  link_device and
  unlink_device no longer accept multiple devices at once, but this was
  really just an artifact of the way that sysfs repeatedly calls the
  store function when it doesn't "consume" all of its input, and it
  seemed to be confusing and unpopular anyway.

* Use DEVICE_ATTR_* macros (rather than __ATTR) for the sysfs attributes.

* Removed all pr_info() "system administrator error" messages.

* Different minimum values for LED blink time (10 ms) and activity check
  interval (25 ms).

v1 summary:
===========

This patch series adds a new "blkdev" LED trigger for disk (or other block
device) activity LEDs.

It has the following functionality.

* Supports all types of block devices, including virtual devices
  (unlike the existing disk trigger which only works with ATA devices).

* LEDs can be configured to show read activity, write activity, or both.

* Supports multiple devices and multiple LEDs in arbitrary many-to-many
  configurations.  For example, it is possible to configure multiple
  devices with device-specific read activity LEDs and a shared write
  activity LED.  (See Documentation/leds/ledtrig-blkdev.rst in the first
  patch.)

* Doesn't add any overhead in the I/O path.  Like the netdev LED trigger,
  it periodically checks the configured devices for activity and blinks
  its LEDs as appropriate.

* Blink duration (per LED) and interval between activity checks (global)
  are configurable.

* Requires minimal changes to the block subsystem.

  - Adds 1 pointer to struct gendisk,

  - Adds (inline function) call in device_add_disk() to ensure that the
    pointer is initialized to NULL (as protection against any drivers
    that allocate a gendisk themselves and don't use kzalloc()), and

  - Adds call in del_gendisk() to remove a device from the trigger when
    that device is being removed.

  These changes are all in patch #4, "block: Add block device LED trigger
  integrations."

* The trigger can be mostly built as a module.

  When the trigger is modular, a small portion is built in to provide a
  "stub" function which can be called from del_gendisk().  The stub calls
  into the modular code via a function pointer when needed.  The trigger
  also needs the ability to find gendisk's by name, which requires access
  to the un-exported block_class and disk_type symbols.

Ian Pilcher (2):
  docs: Add block device (blkdev) LED trigger documentation
  leds: trigger: Add block device LED trigger

 Documentation/ABI/testing/sysfs-block         |    9 +
 .../testing/sysfs-class-led-trigger-blkdev    |   68 +
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/ledtrig-blkdev.rst         |  154 +++
 drivers/leds/trigger/Kconfig                  |    9 +
 drivers/leds/trigger/Makefile                 |    1 +
 drivers/leds/trigger/ledtrig-blkdev.c         | 1140 +++++++++++++++++
 7 files changed, 1382 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c


base-commit: 64222515138e43da1fcf288f0289ef1020427b87
-- 
2.31.1

