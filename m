Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F71412AD3
	for <lists+linux-leds@lfdr.de>; Tue, 21 Sep 2021 03:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240591AbhIUCAl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Sep 2021 22:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbhIUBlV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Sep 2021 21:41:21 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5DFC05BD10;
        Mon, 20 Sep 2021 13:56:36 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 24so5506267oix.0;
        Mon, 20 Sep 2021 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jR3GNigyqHTwaoVoiOatPIrHfjSVIgN+5VwB+nBinds=;
        b=oxDsOHP3Qt/B6Da0Lo8ISND3okRJNfpw0w+StlYWZx8kAgnTXufgyxLLWQu/cIkY7Y
         MhMP+5RhzqPuF4Q6LjUUGF6dHbJeDJhcNZLlrBrrrqiUTtn6+i4sHQdlcRNsqbB5JTlw
         h5i/b8ip52aBWJJ4fF/MqahphpJIcNWMN44MgQPDLq8shVShBO5/HXPP8VtW4lbca62O
         hGTRw9POmco4RoqPL6a6w9GUCYElkIwMndlmUnm7txTlgNUhVSPtPWFci+IaLSO/c+UR
         Vq/Ae5ylzB+MLo9qRiYTPZWywFN99XeHgmawYL8iS4i53YiF9x81G/vc6Gfn3zaCOkLm
         t62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jR3GNigyqHTwaoVoiOatPIrHfjSVIgN+5VwB+nBinds=;
        b=TbOSz4Pq4dTuroNbljpB7bU5ehyEMU9PVcuxCBTYek9rcB7D5h1yMePaiO6/Wr09uV
         afeGZL60NZ6Jt3ZeOONonZ24Qrbt4qqSLdVrGkFDL9SbYM3x0t13d+Rqr+Z0E5r+q7Ss
         2Nc5I42fT77oxs0GHUNMYXIVjWyyUPjkfCc0J83qtk8ivVK3jur9ktXE4G6TgTOd1hDR
         6vRL4+WrdemUxgzTKneDtSBujeOf0E4GEU6eOrg+tDuXSdOQMK7KfpVavtoeirW9UiYs
         7OQKXTU8OCoTugKgN5NeG3HCdX8aGXeMkWplEKYiKE7uPWQlwlmvubcSXSPPYumbMlhc
         F4vw==
X-Gm-Message-State: AOAM530Sz2FgygY3G+77o0qLiOH/6pTPJvSdFfzJpDwSr+xr087ZEI2s
        RDmzzqtQTDxyFrr84qloRsuST0jipHndqA==
X-Google-Smtp-Source: ABdhPJzeOCZgRoe5sUhVJLwnz3Ka8os6amPFm6T4GSDgLRcZdOblgbDzZVfNWCT08etjve88P1gWbA==
X-Received: by 2002:aca:1703:: with SMTP id j3mr851673oii.116.1632171395757;
        Mon, 20 Sep 2021 13:56:35 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id j10sm3719514oog.13.2021.09.20.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:56:35 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, hch@infradead.org
Subject: [PATCH v5 0/2] Introduce block device LED trigger
Date:   Mon, 20 Sep 2021 15:56:24 -0500
Message-Id: <20210920205626.288366-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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
*** BLURB HERE ***

Ian Pilcher (2):
  docs: Add block device (blkdev) LED trigger documentation
  leds: trigger: Add block device LED trigger

 Documentation/ABI/testing/sysfs-block         |   9 +
 .../testing/sysfs-class-led-trigger-blkdev    |  48 +
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 148 +++
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-blkdev.c         | 965 ++++++++++++++++++
 7 files changed, 1181 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c


base-commit: e8f71f89236ef82d449991bfbc237e3cb6ea584f
-- 
2.31.1

