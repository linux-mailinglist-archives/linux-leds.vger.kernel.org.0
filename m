Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208A43F1091
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbhHSCvk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhHSCvk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AA5C061764;
        Wed, 18 Aug 2021 19:51:04 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so6808678otv.11;
        Wed, 18 Aug 2021 19:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PKAD/XWQqdmA6f6n5bABD+8+41idH1rJ1ZZZiu3G5Ac=;
        b=QIDxvEqHLc+V7PaI/ZrE8lZRbvgSqEYBg1hFpVwXAI0COdAdubwM5zPWjM4RLZs8gC
         d2pQj1/mINKzLOaXddsZfbj1Jq0WPdMM4NBy88PCwJZ820zRrCIFxjQkIO5tDH9uVzEH
         iaQa2FeXNS9zX+FOLHnw9jfrmYbIHzn+0iN5Iv0TN+4x3hdFAkbCgb7/my9sj/cKi3Sm
         LLQLNmh/T7IGAEBrGkFLAb0dEK4b92gBAwJKZT20gBOb6dt1a851Nq+hqU4+xTzpwKzM
         EerWaBGdy9X98mQztJsjJV8aYrcwJkF56ZWKzKLrZ9TjlpjHEJETNnKu4BmGISGrjOkq
         5bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PKAD/XWQqdmA6f6n5bABD+8+41idH1rJ1ZZZiu3G5Ac=;
        b=UFF/X+HBCqi4NRofbu4MCqtNXH9P5DAq+B0acZUHXd8HJv0GXAxnCkaV2SuOZ5kN4I
         8Zar09oZuLEAJVz1VV16f6tGCvfLYuf3/MDEfyHWgBnnPQZmIv1myzBZ2svMjHgH6MJM
         KUXJ/9Ir1MZZDU59o1eSxFdUViIZ/ztrTNebBVKudQcjBDnrkNBaCNz0ULxcSRSfg+L/
         YgF5hd22TfJ38ImE2ftDu/eSzIZtMtuGDNugA6JDpAk4mAm3oXMQ1DKs0r1ofaElrcSW
         8ImOjd1yVZhreicNz9Ffwxnokyx21N03xKRodVWgrEWmxDdp2nuQteENmcU2WYUExr9R
         qH0A==
X-Gm-Message-State: AOAM532ngprWdQWGImOODalSixwsXqt021mDV2jUlMty5FSHCIg/nMF1
        Gj5Toet8vn0MEoja2W63C9jPrRGr5E2Xaxgf
X-Google-Smtp-Source: ABdhPJzOQpJ82gYZ7BiCfz/oDYPrZtmwov8j2EgzGob8sGN9UJt5Rh3RGTJKqnfhcrxDA4DWR41wKQ==
X-Received: by 2002:a05:6830:1bf1:: with SMTP id k17mr1258527otb.295.1629341463360;
        Wed, 18 Aug 2021 19:51:03 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:02 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 00/18] Add block device LED trigger
Date:   Wed, 18 Aug 2021 21:50:35 -0500
Message-Id: <20210819025053.222710-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ridiculous or not, here is version 3 of the block device trigger for
"freaking blinkenlights".  It addresses basically all of the points
raised in response to the v2 patchset.

* The main body of the code is moved from the block directory into
  the LED triggers directory (drivers/leds/trigger/ledtrig-blkdev.c)

  The downside of this is that it requires adding an API to the
  block subsystem - get_disk_by_name() - which allows the trigger
  code to resolve a gendisk when asked to monitor it.  I know of
  no good way to do this today, and I don't know of a good way to
  implement the sysfs API requested by Pavel and Marek without
  something like this API.

  Other than that, changes to the block subsystem are as minimal as
  I can make them - a single pointer added to struct gendisk and
  init/cleanup calls when a gendisk is added or deleted.

* This also implements Marek's suggestion of periodically checking
  devices for activity, rather than directly blinking LEDs in the
  I/O path.  This change has the unanticipated benefit of making the
  trigger work on pretty much all types of virtual block devices
  (device mapper, MD RAID, zRAM, etc.), as well as NVMe SSDs.

* Relationships between devices and LEDs are now many-to-many.  An
  LED can monitor multiple devices, and multiple LEDs can monitor
  any one device.  The current "associations" are reflected in two
  sysfs directories.

  - /sys/class/leds/<led>/block_devices contains links to all devices
    associated with an LED, and

  - /sys/block/<disk>/blkdev_leds contains links to all LEDs with
    which the device is associated.

  (The latter directory only exists when the device is associated
  with at least one LED.)

* Each LED can be set to show read activity, write activity, or both.
  Discards and cache flushes are considered to be writes, as they
  affect the state of the device's non-volatile storage.

Ian Pilcher (18):
  docs: Add block device (blkdev) LED trigger documentation
  block: Add get_disk_by_name() for use by blkdev LED trigger
  ledtrig-blkdev: Add file (ledtrig-blkdev.c) for block device LED
    trigger
  ledtrig-blkdev: Add misc. helper functions to blkdev LED trigger
  ledtrig-blkdev: Periodically check devices for activity & blink LEDs
  block: Add LED trigger pointer to struct gendisk
  ledtrig-blkdev: Add function to initialize gendisk ledtrig member
  ledtrig-blkdev: Add function to remove LED/device association
  ledtrig-blkdev: Add function to disassociate a device from all LEDs
  block: Call LED trigger init/cleanup functions
  ledtrig-blkdev: Add function to associate a device with an LED
  ledtrig-blkdev: Add sysfs attributes to [dis]associate LEDs & devices
  ledtrig-blkdev: Add blink_time & interval sysfs attributes
  ledtrig-blkdev: Add mode (read/write/rw) sysfs attributue
  ledtrig-blkdev: Add function to associate blkdev trigger with LED
  ledtrig-blkdev: Add function to disassociate an LED from the trigger
  ledtrig-blkdev: Add initialization function
  ledtrig-blkdev: Add config option to enable the trigger

 Documentation/ABI/testing/sysfs-block         |   9 +
 .../testing/sysfs-class-led-trigger-blkdev    |  48 ++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/ledtrig-blkdev.rst         | 132 +++
 block/genhd.c                                 |  28 +
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-blkdev.c         | 770 ++++++++++++++++++
 include/linux/genhd.h                         |  13 +
 include/linux/leds.h                          |  20 +
 10 files changed, 1031 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/leds/ledtrig-blkdev.rst
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c

-- 
2.31.1

