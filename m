Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88FC78F162
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2019 19:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbfHORAU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Aug 2019 13:00:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37944 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729084AbfHORAU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Aug 2019 13:00:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id e11so1548102pga.5;
        Thu, 15 Aug 2019 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ph3z3OX8TOm5fwkAgRwuk2oCHCA8KPoeo401VRgwoe0=;
        b=ZQ/7Hu4/sNsp8P9rB8y0CcfXjOCycDWN9wMK1l3dxNYCOfXGLJfJoSLk2m5ZxIgDI9
         6hvcMsvosXJeqRB9oAinRqmjqE3aAXn+tgtapg9cbek2Q7hw5Id0q8X+zopGl6EkEf9X
         ed0vzgfaWGDtww7QZa8gT6ijqkvs2CZg25ntL8/gJQx7WeW2YyI/ThflGKeFlQEsMbMd
         b9vVrUUc0qbbld2fTyVB7qG8D+uKTn0lFyuOG0ps4lphlxNA7M3Wxv9DvEm+4wdvsgOF
         4GfGXlr6+WVKtxmDqLnMRlh/ZC3z9SviTVLtXk9CyPStuMj3EvDGeNGYVruj2yOzXymT
         canA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ph3z3OX8TOm5fwkAgRwuk2oCHCA8KPoeo401VRgwoe0=;
        b=RHR9ByOOqanL0WdtE/gBpK6P754Agl78WrHdGCQYDOviVLCnbcXaqihf0gvi0Dsi6c
         M8axqII7EptzviAnMmOzKcSmnVHygE+HALp0lNaFAaPecOAEoujoSRiQ3oKJ5WRZuyck
         yiik0g9JI45QUgG2F1upA+m3jNyqQv8nQB3lnSxIBcQWrJ4uN2ECc7XmJjjrM/t6e771
         Bkb3abW9GPi5JCd8YNZAHdECuwUHNsUhe55oD6+EG/C/Hxc1vHY8xFVr6Q9wb5gbK6N7
         2NTt6EPE9rR4/7iSuP/wsZeyCR5ipTy8Y5mEt7xiatkUbyrPx7cWH/c/TLcHsvC+q0wR
         IUZA==
X-Gm-Message-State: APjAAAUNjf+kElAl9CZ23yIjOkNQVHEYDn97L8DWHbbFCgJrkJjXsfFP
        KIBesJPvCHwKJOeIy+C6KUui42ttx1M=
X-Google-Smtp-Source: APXvYqz/zgCzBeEtq6Iu3Pe068aerxZosiJXoZW7RjfE1TBygzwr+M+jnrQhmwlssyfQxZDRWNxBAQ==
X-Received: by 2002:a17:90a:2764:: with SMTP id o91mr3128474pje.57.1565888419088;
        Thu, 15 Aug 2019 10:00:19 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:12:b19f:559d:7305])
        by smtp.gmail.com with ESMTPSA id b30sm3943942pfr.117.2019.08.15.10.00.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 10:00:17 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        GOTO Masanori <gotom@debian.or.jp>,
        YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>,
        Hannes Reinecke <hare@suse.com>
Subject: [PATCH v4 0/5] introduce LED block device activity trigger
Date:   Fri, 16 Aug 2019 01:59:54 +0900
Message-Id: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This work is inspired by the report on linux-nvme mailing list.

disk-activity trigger not working for nvme disk:
http://lists.infradead.org/pipermail/linux-nvme/2019-July/025253.html

This LED block device activity trigger works with any block devices.

* v4
- Squash patch 'add interface to stop and restart polling disk stats' into
  the ledtrig-blk introduction patch
- Rename 'led' to 'led_trig' in struct ledtrig_blk

* v3
- Avoid the name collision with LED_OFF and LED_ON
- Add ABI documentation
- Add more detail to Kconfig help text

* v2
- Remove "move declaration of led_stop_software_blink() to linux/leds.h" patch
- Move the trigger implementation to drivers/leds/trigger
- s/blk_ledtrig/ledtrig_blk/
- Add CONFIG_LEDS_TRIGGER_BLOCK
- Fix wrong bitops usages
- Add interface to stop and restart polling disk stats
- Stop polling disk stats for scsi disk during runtime suspend

Akinobu Mita (5):
  block: umem: rename LED_* macros to MEMCTRL_LED_*
  scsi: mvsas: rename LED_* enums to SGPIO_LED_*
  scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*
  block: introduce LED block device activity trigger
  scsi: sd: stop polling disk stats by ledtrig-blk during runtime
    suspend

 .../ABI/testing/sysfs-class-led-trigger-blk        |  37 +++
 block/genhd.c                                      |   2 +
 drivers/block/umem.c                               |  20 +-
 drivers/block/umem.h                               |  20 +-
 drivers/leds/trigger/Kconfig                       |   9 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-blk.c                 | 259 +++++++++++++++++++++
 drivers/scsi/mvsas/mv_94xx.c                       |   2 +-
 drivers/scsi/mvsas/mv_94xx.h                       |  24 +-
 drivers/scsi/nsp32.c                               |   7 +-
 drivers/scsi/nsp32.h                               |   4 +-
 drivers/scsi/sd.c                                  |  40 ++--
 include/linux/genhd.h                              |   3 +
 include/linux/leds.h                               |  38 +++
 14 files changed, 411 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blk
 create mode 100644 drivers/leds/trigger/ledtrig-blk.c

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: GOTO Masanori <gotom@debian.or.jp>
Cc: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
Cc: Hannes Reinecke <hare@suse.com>
-- 
2.7.4

