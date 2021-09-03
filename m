Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA82A4006E4
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350946AbhICUq7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350253AbhICUq6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:46:58 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CB7C061575;
        Fri,  3 Sep 2021 13:45:58 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso502273otv.12;
        Fri, 03 Sep 2021 13:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9S0kpV5mlX6BkGy78Jg15IjjkuNjYYMU9acmesUiW8=;
        b=l6cEfKTpUhmCQInDxqV5sMQJUyLmKx9RP4RLk4GvLHmwEyyCsa02mM4FH65Jra4WjK
         t3xIEU4uwIofgcRr2V1kCm+ttTHYgeXEJj1T4L8oOMbThudw8Asc0tSC47k9NEe/eOIe
         NUNKMCGfg6Z1Hjj6qT/ggA25rJKMNazieiK6ESGAwrmq2UM1Frbv0lz5tP6PV/q9kxnh
         Z5KbTW9+Fceyz7/d0Kn30S6AK4hUk+dab6ZacIsFr2NQ+I4nHw2fMTYYGjNkXg3BHgTi
         NLWmOG8kuYOlw3TxIllrjkuNMiB0tkrle34fNO4Mg8tMdLPPRV6lPUnBrvYlyOF7wmS/
         5FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9S0kpV5mlX6BkGy78Jg15IjjkuNjYYMU9acmesUiW8=;
        b=VsdESxiusDNr/UkoJeqL67ZUw3gHa9A3obKHJJpWV2OJ1xjvx+ugAAUtwjew/sOD+q
         fhUQTQYKmDJuKsp4SJNj1G1C/W3UNncrCx+q399HyFmukAS8mZIZyXb71zCcqaw/LcNU
         m/pDTK2nV7Kp5Sqw4GatCn7Vt50sxY0bbpwq7yT99BMzN422Cv1UMv3TGXP3pgU0cqEm
         WOOvwOQ24KthQn9R0oyY/msRzobkJTZYufPztXStmJZ/Bkh7/VmpHqQ1bvm5YV347VRD
         abcvQn8oSaALr67OfGhbJSEW8eOXywlvk+Bw6GzXkf1qswFucYBX6vcP80A+gg3U0Gq7
         G21g==
X-Gm-Message-State: AOAM533GNx1mshFlMmv6f3USsmGQYE1c9UamTn4pfYjCaVn4rGIKUsH9
        7K/USkxGyDqbb8djJiO/OVrHXtVsWDjIJA==
X-Google-Smtp-Source: ABdhPJw12y/mpqmW7pi3b3/sKAlDEfSBdmWr4cw/oGORZJi8mWumS5JqDtY62F1wKbmYPSi6yEHThQ==
X-Received: by 2002:a9d:411d:: with SMTP id o29mr794908ote.111.1630701957500;
        Fri, 03 Sep 2021 13:45:57 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:45:56 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 00/18] Introduce block device LED trigger
Date:   Fri,  3 Sep 2021 15:45:30 -0500
Message-Id: <20210903204548.2745354-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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

NOTES:

* This patch series applies cleanly to the linux-block and linux-next
  (20210903) trees.  All patches other than the block subsystem patch
  (patch #4) apply cleanly to the linux-leds tree.

* All patches compile (modulo warnings) with the trigger disabled,
  modular, or built-in.

Ian Pilcher (18):
  docs: Add block device (blkdev) LED trigger documentation
  ledtrig-blkdev: Add build infra for block device LED trigger
  ledtrig-blkdev: Add function placeholders needed by block changes
  block: Add block device LED trigger integrations
  ledtrig-blkdev: Implement functions called from block subsystem
  ledtrig-blkdev: Add function to get gendisk by name
  ledtrig-blkdev: Add constants, data types, and global variables
  ledtrig-blkdev: Add miscellaneous helper functions
  ledtrig-blkdev: Periodically check devices for activity & blink LEDs
  ledtrig-blkdev: Add function to associate the trigger with an LED
  ledtrig-blkdev: Add function to associate a device with an LED
  ledtrig-blkdev: Add function to remove LED/device association
  ledtrig-blkdev: Add function to disassociate a device from all LEDs
  ledtrig-blkdev: Add function to disassociate an LED from the trigger
  ledtrig-blkdev: Add sysfs attributes to [un]link LEDs & devices
  ledtrig-blkdev: Add blink_time & interval sysfs attributes
  ledtrig-blkdev: Add mode (read/write/rw) sysfs attributue
  ledtrig-blkdev: Add initialization & exit functions

 Documentation/ABI/testing/sysfs-block         |   9 +
 .../testing/sysfs-class-led-trigger-blkdev    |  48 ++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 144 ++++
 block/genhd.c                                 |   4 +
 drivers/leds/trigger/Kconfig                  |  18 +
 drivers/leds/trigger/Makefile                 |   2 +
 drivers/leds/trigger/ledtrig-blkdev-core.c    |  78 ++
 drivers/leds/trigger/ledtrig-blkdev.c         | 767 ++++++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.h         |  27 +
 include/linux/genhd.h                         |   3 +
 include/linux/leds.h                          |  20 +
 12 files changed, 1121 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev-core.c
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.h

-- 
2.31.1

