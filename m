Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F06140B8D8
	for <lists+linux-leds@lfdr.de>; Tue, 14 Sep 2021 22:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbhINUSk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 16:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbhINUSj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 16:18:39 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4500FC061574;
        Tue, 14 Sep 2021 13:17:22 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id x10-20020a056830408a00b004f26cead745so250210ott.10;
        Tue, 14 Sep 2021 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KT5dyx/vmQi0yEQIfgRG7ZEpQ5HE7LDhgAq288yunpQ=;
        b=af5yfXscNvGMj+J3n9mvqxZmlW02TexiGLin5v+Q9idlzShJw6V6pFSpWT+FpLl/Vb
         4tbDnSf90mAxOzOZxUNfNb/llFr4eTtVDj7GYdbOJkUhNa/eNnHcDlBRzdRuh+WbOKKC
         SyKae2vvKyGd7bSMr4IO5ZLRnJBSG5t3xk8Dnux9AGN66pq4aSYaF5J8BMoPtMfr37Ox
         UGkjPJN8UPUmnCbKqWq2sX4NcLs4whBEX+3p/mcuNqh94E5KDtLOhzvBI0OvTmUEyJ0z
         4+DeDHGXUEMSJApVbplXEYqUt8Zc2e8jYV/M3+PTqoZznDk9FAYlq0aU90pdETgh2qaZ
         PSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KT5dyx/vmQi0yEQIfgRG7ZEpQ5HE7LDhgAq288yunpQ=;
        b=2GsVxpuQGLytvFo5yn61+1/f636rHaNI3xTA/IGAhnqfRG1nmmJCD4Vq3iwW3usx9U
         94+TqNChZh5wfaAtleVdmJpy8amsNJb6DWR7kt1u6TuxSI54zTSBWl1iDkvx8bhhDrkP
         lUKcbjvubuECb/m/rh222cOR0tnBBK5otnjlS9cWf42+RpsBgHM1f/sNiV7ypckOz/SC
         kJCO673OmhW9rN1aZOJ686EImAVVtynVVJXLvYwOZInQivVSTI+GaaBLvj7Actq5kxuo
         uK2YrMdavL8h39qWizRY6lF/85PgqzGQw3hwjoVTcVfp3daBUQ19zGXxE3Iz538nbuRJ
         n6uw==
X-Gm-Message-State: AOAM532cd1XAoEfmRdZt769D80hiDC3tN14cDw3TK6gsMNQjkfAgLfS6
        RR3K9F1CeA69o/WiONfz0GA=
X-Google-Smtp-Source: ABdhPJyiEhEDOq01WilvqLOLj3um+jAYaHVD0/HzH9MpvqzfcmvJLjG2MLaQJmyLiSnkPfPel37Sww==
X-Received: by 2002:a9d:6506:: with SMTP id i6mr16296296otl.207.1631650641605;
        Tue, 14 Sep 2021 13:17:21 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id p81sm2629455oia.48.2021.09.14.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:17:21 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org, chaitanyak@nvidia.com
Subject: [PATCH v3 0/3] Introduce block device LED trigger
Date:   Tue, 14 Sep 2021 15:17:10 -0500
Message-Id: <20210914201713.14922-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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

Ian Pilcher (3):
  docs: Add block device (blkdev) LED trigger documentation
  block: export block_class for use by the blkdev LED trigger
  leds: trigger: Add block device LED trigger

 Documentation/ABI/testing/sysfs-block         |   9 +
 .../testing/sysfs-class-led-trigger-blkdev    |  43 +
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 144 +++
 block/genhd.c                                 |   1 +
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-blkdev.c         | 889 ++++++++++++++++++
 8 files changed, 1097 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c


base-commit: 1619b69edce14c4a4665fa8ff4c587dcc77202a9
-- 
2.31.1

