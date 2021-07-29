Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144593D9B3F
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbhG2Byc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbhG2Byb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:31 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6276C061757;
        Wed, 28 Jul 2021 18:54:28 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o20so6293654oiw.12;
        Wed, 28 Jul 2021 18:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bBOOqkTj7VfQtppJgA3DRf1xTVJ3jngXH3eM9beR2jE=;
        b=UZkPpHJbUa1GEesgvUr8RRfY/5uEgz/fkHrUhw28ymMT9TuywUDUXPlFoY6RAKFVen
         izjQux0i9YVdlnuik22EdrnNrOGIC4QKjW+SLFKShfrylFH/OvSAOHdiJTBaJstQ1GJz
         2SGSy0OAv85CrCbdbtrQE80Hb0b5QYoLH3yS2DZrIn+j6ry9tN1+YFEUMHwTDNElRuMV
         sSZl0ZafFEzlVyV43HxReGGRSnBVcNygonSh3eRTjnpwWAwGqt9egAKtQR1ilWoffN1D
         kKajE6Iqk4xD4xFyydMlfhsPp+6ODEVmcC5VyWtpZwJvw3HDIVBrsOwpnT8dQVTTJLPC
         PrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bBOOqkTj7VfQtppJgA3DRf1xTVJ3jngXH3eM9beR2jE=;
        b=QObnXoo0pAMwlCJeeYX2jBr9w2yd+tW2kYfAlGDa0sCf9UJam1X5A9+v0K88c0W5Dd
         PkNikAjIpaqB2dldKz7B9PFsE977jA6EB4mBCyNJ6odPeyHK0st3Z36kgsItzvoO56Ka
         sINhk5/FqJQfZ3TXdHaNcqOT7U4YFVA/jn3/PqCbFEWaMfQG0UDL3DP7NAwKBaXTzLMI
         PciHZnYe36o24ytdMPdCHveDX3MWBMdHr13UXCdWEeDWBr7Ej4j58UdcbIOtyKulUsNX
         dCTJUCMmjlOjVXJxXe2oQEwjSAxuGmb4np/44oLKUV3YtWP8pn/Ky1eOsM4vMs/KhShD
         gPOA==
X-Gm-Message-State: AOAM531ozDKMMprafQrk5nvCoJ2AoYSwPhmmRRRvUB/IcbJRz4cb+2dy
        Apmr/CHxyVQXWIkS9JaIgR99KQayJNScn1z0
X-Google-Smtp-Source: ABdhPJzDiG5SfOf1a07BhZr0SfMvHnTgGzGUFjdhVz5hP19aH4QWkq156EjGle0acTV57e58Lp12Pg==
X-Received: by 2002:a05:6808:1887:: with SMTP id bi7mr47393oib.115.1627523668026;
        Wed, 28 Jul 2021 18:54:28 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:27 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 0/8] Add configurable block device LED triggers
Date:   Wed, 28 Jul 2021 20:53:36 -0500
Message-Id: <20210729015344.3366750-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series adds configurable (i.e. user-defined) block device LED
triggers.

* Triggers can be created, listed, and deleted via sysfs block class
  attributes (led_trigger_{new,list,del}).

* Once created, block device LED triggers are associated with LEDs just
  like any other LED trigger (via /sys/class/leds/${LED}/trigger).

* Each block device gains a new device attribute (led_trigger) that can
  be used to associate the device with a trigger or clear its
  association.

* My expectation is that most configuration will be done via sysfs
  (driven by udev), but there also in-kernel APIs for creating,
  deleting, and (dis)associating triggers.

* Multiple devices can be associated with one trigger, so this supports
  a single LED driven by multiple devices, multiple device-specific
  LEDs, or arbitrary combinations.

  Along with support for more than just ATA devices, this is the main
  difference between this function and the current disk activity
  trigger.  It makes it suitable for use on systems like the Thecus
  N5550 NAS, which has a software-driven activity LEDs for each disk.

* In addition to physical block devices, many types of virtual block
  devices can drive LEDs; device mapper, MD RAID, and loop devices
  work (but zram swap devices do not).

* The led trigger is "blinked" (75 msec on, 25 msec off) when a request
  is successfully sent to the low-level driver.  The intent is to
  provide a visual indication of device activity, not any sort of exact
  measurement.

* Related to the previous bullet, if the blink function is unable to
  immediately acquire a lock on the device's LED trigger information
  it simply returns, so that I/O processing can continue.

It's probably obvious that I'm basically a complete newbie at kernel
development, so I welcome feedback.

Thanks!

Ian Pilcher (8):
  docs: Add block device LED trigger documentation
  block: Add block device LED trigger list
  block: Add kernel APIs to create & delete block device LED triggers
  block: Add block class attributes to manage LED trigger list
  block: Add block device LED trigger info to struct genhd
  block: Add kernel APIs to set & clear per-block device LED triggers
  block: Add block device attributes to set & clear LED triggers
  block: Blink device LED when request is sent to low-level driver

 Documentation/block/index.rst        |   1 +
 Documentation/block/led-triggers.rst | 124 ++++++
 block/Kconfig                        |  10 +
 block/Makefile                       |   1 +
 block/blk-ledtrig.c                  | 570 +++++++++++++++++++++++++++
 block/blk-ledtrig.h                  |  51 +++
 block/blk-mq.c                       |   2 +
 block/genhd.c                        |  14 +
 include/linux/blk-ledtrig.h          |  24 ++
 include/linux/genhd.h                |   4 +
 10 files changed, 801 insertions(+)
 create mode 100644 Documentation/block/led-triggers.rst
 create mode 100644 block/blk-ledtrig.c
 create mode 100644 block/blk-ledtrig.h
 create mode 100644 include/linux/blk-ledtrig.h

-- 
2.31.1

