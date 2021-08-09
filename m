Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6105C3E3E4B
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhHIDdK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhHIDdJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:09 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3C0C061757;
        Sun,  8 Aug 2021 20:32:48 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u25so21732132oiv.5;
        Sun, 08 Aug 2021 20:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQUClTMviLXFilKUZkYDlG4dFYcNKwc8DGMBuYM6LPM=;
        b=gkx/+qhr03Rrp3H/arWri6RY7olzdo2fg1nqA8vP7jQupA62YXZoHex10txZliDqff
         X8Wq663hYioQqu0bGiAUe4VENr6nr9Qw+uaL5VMqu9Dew6TRag54D0fj4Ak5W0fXZq/y
         sYqsRembZ8+lnvortVg7NdioQP0RPzXEkYgaYoJ0uvFGqlKxyVe/8mgGyuSEvrFO9r21
         /Fkjp7kOouFbH45jLDzvOolT/ie5BvLKi41yiMI+bJ+VTTCWOu3zceV265a9CXB4LFOt
         Zb/650oacRMnKPcvmKw9Sh7G+c+ZXEaWz87dm5aFOaXoIe8kY+tpvFO7vbkR2A9MiQ4F
         Soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQUClTMviLXFilKUZkYDlG4dFYcNKwc8DGMBuYM6LPM=;
        b=bLcvJM7uKqufsb4YIv4BlMzH9kGwn85x/mU8QdNjDKSJURPvatrxSsCWGdddiOmgGH
         ko7PVr2wZ1fHJRj7ty7JXDpgHzUglTdS71U1vTEL/TI0Rd2WRu0ioY08V8bbaC0wSERT
         ovd8SgVXRA2qu5llo6jzu8AhTiCpJhNyKG2+2D5Icb8Ov60tflKoQwEKpHlBLHCgrce4
         SuFydE0sSJ4xbtJO2nauqasSSWa6PdBglvsRwRALZnsDtm95KUG0ZnzJKNA6BvPCp0cm
         fDbbAHMV0+4qItbMdJyEPIP8TqvzqdS965tINF2dZsH924VvavFk0bMc+RG/4RTawYWa
         7wmQ==
X-Gm-Message-State: AOAM532wA5h2XutcmUrLbW4esjJ4G3/vy1ubkTsJk1FZKT2EsFrgWH/1
        CT1IhGgLCggkm0hX3YbpU1GQx+sHn1kBTVyj
X-Google-Smtp-Source: ABdhPJzlOquy6MqH9DYdpYZjFIND1GvsCfWmiraLPoEvM6vh0h5qVKZpQGGjxN4tscyUJQn5XZAFJA==
X-Received: by 2002:a05:6808:9aa:: with SMTP id e10mr5261792oig.31.1628479968085;
        Sun, 08 Aug 2021 20:32:48 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:47 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Date:   Sun,  8 Aug 2021 22:32:07 -0500
Message-Id: <20210809033217.1113444-1-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a significant rewrite of the patchset that I originally posted
back on 28 July.  It incorporates almost all of the suggestions that I
received as feedback to my original patchset (largely because I was
finally able to wrap my head around how complex LED triggers work).

One thing that has not changed is that associations between block
devices and LEDs are still set via an attribute on the device, rather
than the LED.  This is much simpler, as the device attribute only has
to handle a single value (the name of the associated LED), rather than
potentially handling multiple device names.

More importantly, it avoids the need to iterate through all of the
block devices on the system, searching by name.  This was proposed
fairly recently, and the reaction was not positive.[1][2]

I have modeled the interface for the /sys/block/<DEVICE>/led
attribute on the sysfs interface used for selecting a trigger.  All
available LEDs (all LEDs associated with the blkdev trigger) are
shown when the attribute is read, with the currently selected LED
enclosed in square brackets ([]).

As before, this is all very new to me (particularly the RCU stuff), so
I welcome feedback.

Thanks!

Changes from the original patchset:

* Use a single complex LED trigger ("blkdev"), rather than multiple
  user-defined triggers.

* Configurable blink time and interval for each LED:

    /sys/class/leds/<LED>/blink_{on,off}

* Associated block devices linked from LED subdirectory:

    /sys/class/leds/<LED>/block_devices

  (Avoids violating the "one value per entry" sysfs rule.)

* Device-LED associations set via /sys/block/<DEVICE>/led

* Document all sysfs attributes in Documentation/ABI/testing (but also kept
  the overview doc)

* Removed unnecessary [un]likely macros

* Reduced number of "user error" log messages and changed level to INFO

* More detailed commit messages

* Add Kconfig option in final commit

* Use RCU-protected pointer (rather than mutex)

* No in-kernel APIs for now

[1] https://www.spinics.net/lists/linux-leds/msg18256.html
[2] https://www.spinics.net/lists/linux-leds/msg18261.html

Ian Pilcher (10):
  docs: Add block device LED trigger documentation
  block: Add file (blk-ledtrig.c) for block device LED trigger
    implementation
  block: Add block device LED trigger fields to gendisk structure
  block: Add functions to set & clear block device LEDs
  block: Add block device sysfs attribute to set/clear/show LED
  block: Add activate and deactivate functions for block device LED
    trigger
  block: Add sysfs attributes to LEDs associated with blkdev trigger
  block: Add init function for block device LED trigger
  block: Blink device LED (if any) when request is sent to its driver
  block: Add config option to enable block device LED triggers

 Documentation/ABI/testing/sysfs-block         |  16 +
 .../testing/sysfs-class-led-trigger-blkdev    |  28 ++
 Documentation/block/blk-ledtrig.rst           |  79 +++
 Documentation/block/index.rst                 |   1 +
 block/Kconfig                                 |   8 +
 block/Makefile                                |   1 +
 block/blk-ledtrig.c                           | 469 ++++++++++++++++++
 block/blk-ledtrig.h                           |  45 ++
 block/blk-mq.c                                |   2 +
 block/genhd.c                                 |  11 +
 include/linux/genhd.h                         |   4 +
 11 files changed, 664 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blkdev
 create mode 100644 Documentation/block/blk-ledtrig.rst
 create mode 100644 block/blk-ledtrig.c
 create mode 100644 block/blk-ledtrig.h

-- 
2.31.1

