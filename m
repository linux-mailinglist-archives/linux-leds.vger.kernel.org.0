Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810FA427094
	for <lists+linux-leds@lfdr.de>; Fri,  8 Oct 2021 20:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238903AbhJHSPE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 8 Oct 2021 14:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239719AbhJHSO7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Oct 2021 14:14:59 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DACC061755;
        Fri,  8 Oct 2021 11:12:54 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso3165191oom.4;
        Fri, 08 Oct 2021 11:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVQFM7Qsu0zFECy9UDg1R3Xd9GhTo5u1FQ6VlQxyxOY=;
        b=p8m7Yr/1J6mafa+ChFmAsKMoZJhNHezvjGsL1WOG+1za2knmE49ahG9dAXDxGYeXpF
         qcJ6uSNShLz8anQcOhyzxvHLuMBHIj+LHN97MNbL5rsAme8qCXfTdBiymS+zCFUR7Ze1
         v31EozN8Jg+nOcKHTWN2NVe7nU+5+8bfPT3bVU0xkuwbxlsJXzgYI+HU1JWn2ePgKmp7
         r+lmxcaCwn12/ySvEkfK4BKs6mj2Fjh1jb8K9i/DJnSvuV8sVfyx3IDVBG1SkQXcHUTT
         BTeW4fQqXru/GCEeoon5XH1bphvk65a+a0lwfvLkfSKt0GZ2HLAmIGeeLqRBpZTJZIJt
         Z+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVQFM7Qsu0zFECy9UDg1R3Xd9GhTo5u1FQ6VlQxyxOY=;
        b=0IzkMRwWGvcVwkXXCT+LgowJR3rryC7RRP49epLqJqG5N/YSBquPMjTgBJJYTCjWg4
         YPFrrWuzyjx16bbaszEadaNDqtbDFcFYvqwxlGdJ5LNc+xtGqX5+84F5Dmby/cNzRBkC
         cu2z8LFaIN1v+gw4JUQdljoZqBzV5HoIRYDzAnZJeWS+d3lsw7gjQFps85z1twttljeD
         hCLb/Zm9r6i0xB6xe1Ju1bLuYsXfsSWaPJrpJF5OFgo/99rHDyxfwnOLd1osJN8cexMr
         w+/iXrHpggZSXMsf6jqhnxGigT1vejfHorJmiHAcvEMj/wbszaMSVNuWrdMtHPeDhYx+
         rnow==
X-Gm-Message-State: AOAM531+7WorfTZkAogL5OK6JMoYK2T7PNSyRbUqxgvhGO/qQrAvWmPO
        BSzkNP+Zp380lp4MVurRO0o=
X-Google-Smtp-Source: ABdhPJx3b5Nw4dWDsVEYfFqaFsS7GlXq0yxuPK5o2PakznO4Uq2JK0Xj8nytXkA0vlvSm2Lhn89suA==
X-Received: by 2002:a4a:e899:: with SMTP id g25mr9361243ooe.68.1633716773930;
        Fri, 08 Oct 2021 11:12:53 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id u26sm19279oic.51.2021.10.08.11.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 11:12:53 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, hch@infradead.org
Subject: [PATCH v6 0/2] Introduce block device LED trigger
Date:   Fri,  8 Oct 2021 13:12:22 -0500
Message-Id: <20211008181224.185829-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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
 drivers/leds/trigger/ledtrig-blkdev.c         | 1128 +++++++++++++++++
 7 files changed, 1370 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c


base-commit: 1da38549dd64c7f5dd22427f12dfa8db3d8a722b
-- 
2.31.1

