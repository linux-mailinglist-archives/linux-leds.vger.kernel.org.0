Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9F3405F5A
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhIIW0e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbhIIW0d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:33 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8555C061574;
        Thu,  9 Sep 2021 15:25:23 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso4613853otu.0;
        Thu, 09 Sep 2021 15:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3LhuXF9MRbEItaz0Ns7sMYeLJyjCIE9BGVJOBLCxy8=;
        b=m2uEZPcKK3zzw2R/gD94gAyHf7pPmmT58ci17QO8QERu0f2OMSYiCwwGxtHr4vNed0
         zIm+AI/GP9SJjHSfyvDQBUD/2h8UrzaK78X0F3mY9aI5LG5J8xc2R4opwNHR1DX7znuf
         PeLuA6c5eTXQHml9oa+LMTy05fEuFKgsSUcKO82qV0rvBPGATtb/ePskjO160VDeEb6o
         wT3ac8HnoRKrlTZGyiH/aztKgyGH3pReP01RwKgdmRVgeJfFC034MZd6pWh7nTCcH6BJ
         PKp68a1g3SIlPbq7sJ2gTS391fYQ+r8baQRXM1h5/UogGO6BHkElh8sTnZDVSyJTHY7q
         +Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3LhuXF9MRbEItaz0Ns7sMYeLJyjCIE9BGVJOBLCxy8=;
        b=bRyIkxYz9EwJSrFszZqZlLqLdEUhOfX+yZwC7vFWMxEkKesO5xeT5VP7RoKltetHeB
         aggzF1teVmBbaDF76d2GF14w9b44p9p1YQj2HDXy5hBiCqo4ab+IvhOBhsHHztiCCxQq
         Vpkrzab5ECVPG9BfkuiyBRLDhSG6q6HIhtnh8e3HohgxAdqXObNyyw4+NvJQ8aRadzC0
         Ky5aaG7UnaM2XTRNVQHCtD5wftrsEhO0cDt7pFhcywYZVluJnWG9131geTE89Mvi/6Y+
         0xqzhDDVb/FsP25Tuixt3E+2Oghw+rgAsj3xGmp3r5vtf++l+KcdNq+Q4RQUSB2x72Qq
         DPCQ==
X-Gm-Message-State: AOAM531fCiTdsn1sYPC6vOTA6i9awoPmZi88WuBE4A0is8WIx3ORUqfe
        fy4LbO3NluCbEQGLTOBUhjm/BCnaFVA=
X-Google-Smtp-Source: ABdhPJwbXKjZ2OxED2uFoLU8xALOXBEkG2Yo7pHywUB9k/hRTfqrpCnwlhOsii8mEmEJbefEHA9RaQ==
X-Received: by 2002:a05:6830:20cf:: with SMTP id z15mr1878662otq.7.1631226323068;
        Thu, 09 Sep 2021 15:25:23 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:22 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 00/15] Introduce block device LED trigger
Date:   Thu,  9 Sep 2021 17:24:58 -0500
Message-Id: <20210909222513.2184795-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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

Notes:
======

* Documentation for all sysfs attributes added in the first patch.

* All patches build without warnings or errors when trigger is disabled,
  modular or built-in.

V1 summary:
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


Ian Pilcher (15):
  docs: Add block device (blkdev) LED trigger documentation
  leds: trigger: blkdev: Add build infrastructure
  leds: trigger: blkdev: Add functions needed by block changes
  block: Add block device LED trigger integrations
  leds: trigger: blkdev: Complete functions called by block subsys
  leds: trigger: blkdev: Add function to get gendisk by name
  leds: trigger: blkdev: Add constants and types
  leds: trigger: blkdev: Add stub LED trigger structure
  leds: trigger: blkdev: Check devices for activity and blink LEDs
  leds: trigger: blkdev: Add LED trigger activate function
  leds: trigger: blkdev: Enable linking block devices to LEDs
  leds: trigger: blkdev: Enable unlinking block devices from LEDs
  leds: trigger: blkdev: Add LED trigger deactivate function
  leds: trigger: blkdev: Add remaining sysfs attributes
  leds: trigger: blkdev: Add disk cleanup and init/exit functions

 Documentation/ABI/testing/sysfs-block         |   9 +
 .../testing/sysfs-class-led-trigger-blkdev    |  46 ++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 138 ++++
 block/genhd.c                                 |   4 +
 drivers/leds/trigger/Kconfig                  |  18 +
 drivers/leds/trigger/Makefile                 |   2 +
 drivers/leds/trigger/ledtrig-blkdev-core.c    |  55 ++
 drivers/leds/trigger/ledtrig-blkdev.c         | 686 ++++++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.h         |  18 +
 include/linux/genhd.h                         |   3 +
 include/linux/leds.h                          |  20 +
 12 files changed, 1000 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev-core.c
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.h


base-commit: a3fa7a101dcff93791d1b1bdb3affcad1410c8c1
-- 
2.31.1

