Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B765BA1FA
	for <lists+linux-leds@lfdr.de>; Thu, 15 Sep 2022 22:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiIOUuW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Sep 2022 16:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiIOUuV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2022 16:50:21 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C863F1C6
        for <linux-leds@vger.kernel.org>; Thu, 15 Sep 2022 13:50:19 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id t62so3736222oie.10
        for <linux-leds@vger.kernel.org>; Thu, 15 Sep 2022 13:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=dhrR7u98MPwzRx6Hn3a+FcY7xGLa/pPq3aUPxOxKMEo=;
        b=FcDPpAWVPcEj4Mkv5zvspbN6/lM9KQvEXBG/05+KoJzkpJQ5okMqkaeraNdfFxbGYI
         mPs7lIdg96If7icuTOUIBl9w5dUrXjlMPQxP5x1V/oG4hEpKFOIPUyCSHfvFAJv81FsP
         eIyBwCVbRzPROExBwFI+eZmN/VeFcF/T2f3nBkY7/rU4LDxZRJzcyxdjSFnIPcx0GmGk
         g6mmg+6GzEdjYDQuvv2A8YJKZmtAqKueG9DzTW0tnlGukrVJNGV7zlZ/BhnXOi5dhHor
         qk9OaiAE1EadhA5SDAWq8uGrMGmtz152t3ODs/v95XulRDcNBEE9TbHIdnaR762kU1WS
         bhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=dhrR7u98MPwzRx6Hn3a+FcY7xGLa/pPq3aUPxOxKMEo=;
        b=qZza1TaGVgaatddTZxM/nLeIdDBryttoaPcZYzS8ctYu9WEd7HAWZkmRYHUGPkCpjX
         BsL4RKTUn/1iOzE8R574/ruLlVMCucW4SNwaKfBUmQCN6Y88S31wao/VkyUCNLnpZLLA
         y4OGOqhFkmSVDE5HsTJ68u6K9fOdMaNY34eWcjj/1DuuThz5cPlOVRqx4j1QDTSB3MMZ
         5i7WnixKsI0Q/fVT/3CwD774/4wJBkH0Cn0B7CnoyEYBQCv8YDeHUWSk4ZPdkP2AtzDS
         3xO16mh+QK3di4aFXMoqyns8gzU3tfaQMW01L5uMkNjZak22GWUWPacWal4PCbwpuxMY
         wFsA==
X-Gm-Message-State: ACrzQf3JnPtU1ST/emJrN4B33ijmmCROh5CF1znzUMLoJ7xS183tFydw
        YFylt/vT0F+lY93Lz75d88E=
X-Google-Smtp-Source: AMsMyM4FIO8nxVqFY4/o2GBpHLhPzDs72mo8p1bCewlRqZo8aQ5jzkzWEtdoSRhzh2HkSQoAk7Kl+w==
X-Received: by 2002:a05:6808:2021:b0:350:4ee8:598a with SMTP id q33-20020a056808202100b003504ee8598amr1010690oiw.23.1663275019238;
        Thu, 15 Sep 2022 13:50:19 -0700 (PDT)
Received: from ian.penurio.us ([47.184.52.85])
        by smtp.gmail.com with ESMTPSA id l14-20020a056830054e00b00655dda40f54sm6866882otb.78.2022.09.15.13.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:50:18 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, kabel@kernel.org, lee.jones@linaro.org
Subject: [PATCH v11 0/2] Introduce block device LED trigger
Date:   Thu, 15 Sep 2022 15:50:16 -0500
Message-Id: <20220915205018.447014-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Summary
=======

These patches add a new "blkdev" LED trigger that blinks LEDs in
response to disk (or other block device) activity.  The first patch is
purely documentation, and the second patch adds the trigger.

It operates very much like the netdev trigger.  Device activity
counters are checked periodically, and LEDs are blinked if the correct
type of activity has occurred since the last check.  The trigger has no
impact on the actual I/O path.

The trigger is extremely configurable.  An LED can be configured to
blink in response to any type (or combination of types) of block device
activity - reads, writes, discards, or cache flushes.  The frequency
with which device activity is checked and the duration of LED blinks
can also be set.

The trigger supports many-to-many "link" relationships between block
devices and LEDs.  An LED can be linked to multiple block devices, and
a block device can be linked to multiple LEDs.  To support these
many-to-many links with a sysfs API, the trigger uses write-only
attributes (link_dev_by_path and unlink_dev_by_path) to create and
remove link relationships.  Existing links are shown as symbolic links
in subdirectories beneath the block device and LED sysfs directories
(/sys/class/block/<DEVICE>/linked_leds and
/sys/class/leds/<LED>/linked_devices).

As their names indicate, link_dev_by_path and unlink_dev_by_path each
take a device special file path (e.g. /dev/sda), rather than a kernel
device name.  This is required, because the block subsystem does not
provide an API to get a block device by its kernel name; only device
special file paths (or device major and minor numbers) are supported.

(I hope that if this module is accepted, it might provide a case for
adding a "by name" API to the block subsystem.  link_dev_by_name and
unlink_dev_by_name could then be added to this trigger.)

The trigger can be built as a module or built in to the kernel.

Changes from v10:
=================

* Fix kfree() of wrong pointer in blkdev_trig_get_bdev().
* Fix typo in ledtrig-blkdev.rst.

Changes from v9:
================

No changes to sysfs API or module functionality.

Readability changes:

* Added overview and data type comments to describe module structure.

* Reordered module source; eliminated almost all forward declarations.

* Consistently refer to blkdev_trig_led structs as "BTLs."

* Refactored LED-block device unlink function into separate variants for
  releasing & not releasing cases; eliminate enum type used as flag.

Changes from v8:
================

* Change sysfs attribute names:
  - link_device ==> link_dev_by_path
  - unlink_device ==> unlink_dev_by_path

* Update documentation for changed attribute names

* Minor code & comment cleanups

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

 Documentation/ABI/stable/sysfs-block          |   10 +
 .../testing/sysfs-class-led-trigger-blkdev    |   68 +
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/ledtrig-blkdev.rst         |  155 +++
 drivers/leds/trigger/Kconfig                  |    9 +
 drivers/leds/trigger/Makefile                 |    1 +
 drivers/leds/trigger/ledtrig-blkdev.c         | 1177 +++++++++++++++++
 7 files changed, 1421 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c


base-commit: 3245cb65fd91cd514801bf91f5a3066d562f0ac4
-- 
2.37.3

