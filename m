Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D054988C8E
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 19:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHJRz3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 13:55:29 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44346 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfHJRz3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 13:55:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so47656165pfe.11;
        Sat, 10 Aug 2019 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nsf9ZthSXv1/yV9kWDWDkPOUB22nzlZHkBRY4IpkC3Y=;
        b=MkIw/oIzRQHLiwxtGLO1OG9EuDmoIfVErNB+BpwxFrJYS0GkK3RdHfifyD1uhLorkU
         Wff5R05mvV62CccEa3xyzAIr8qCxAX+4TwlaJ2D2QJcmbi6vSsXbzBHGg81AQwcSpoFJ
         hcwfeuFU+BHYPpvvElJRA31BPhEPz3JDOZG7S1QC+xm9FFI8fFlb03RWj+vMYJCmHzZ/
         5fAB/GuGbEW1PyHszJdWZENiZODfUpKvNAZwYJJF3S3UTonpsBTnangCXo137ns6jjP0
         mxg6ZX4gX9RgTZp8UyeqLKVXhnPGuewwdjtubWzX+ehb7QHEa8zPWh1dhFp9MiegGwE1
         vhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nsf9ZthSXv1/yV9kWDWDkPOUB22nzlZHkBRY4IpkC3Y=;
        b=EuUueM1gwJtZAEDTEPK40bvyirqjczu5oll1NrRcs1TcP2WjeLpi3N7xCFcqPyTyzR
         YxBsLCC6cpBNz9qgT7o9lzuG/tp2gs2/CgfMAZZRHJYzs1bCBcJc5LNe4xJm4EnFms++
         dDRWalTjMm+VHF3eFv54AxeLt1zwpMCiDaZIL5jRzF/ifR4Paeb49TlI/VppocfsARIU
         tUweFbbRGmLBLtLz81U0M0JA/JnNc+8pj67Bts/D2q0IWF1sFqz++2Ux2ZafskWl4Hg9
         6Ww5ELfze1sorNAZ6vGwRoFMzllTY4bYIh5Bd3W8IWmBiWxBBfd6BHxnQoPstl3bVZMC
         o5yw==
X-Gm-Message-State: APjAAAWsPOYTegXrC7NWwHDY1cLoHXNdgVCMtBHO2vfW115P9Jde73xy
        /6oa5taYtppsIOBOvBZYWE07OuGvkBk=
X-Google-Smtp-Source: APXvYqztQuW+miBcLyquIukVLXl0rpEMoNL1syXrbuxcI7kdqMTay3sJfxoJOroudOACkS0lbFJrzw==
X-Received: by 2002:a17:90a:b312:: with SMTP id d18mr15181170pjr.35.1565459728092;
        Sat, 10 Aug 2019 10:55:28 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:a137:2bda:e96e:808])
        by smtp.gmail.com with ESMTPSA id 185sm102146544pfd.125.2019.08.10.10.55.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 10 Aug 2019 10:55:27 -0700 (PDT)
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
Subject: [PATCH v3 0/6] introduce LED block device activity trigger
Date:   Sun, 11 Aug 2019 02:54:57 +0900
Message-Id: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This work is inspired by the report on linux-nvme mailing list.

disk-activity trigger not working for nvme disk:
http://lists.infradead.org/pipermail/linux-nvme/2019-July/025253.html

This LED block device activity trigger works with any block devices.

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

Akinobu Mita (6):
  block: umem: rename LED_* macros to MEMCTRL_LED_*
  scsi: mvsas: rename LED_* enums to SGPIO_LED_*
  scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*
  block: introduce LED block device activity trigger
  ledtrig-blk: add interface to stop and restart polling disk stats
  scsi: sd: stop polling disk stats by ledtrig-blk during runtime
    suspend

 .../ABI/testing/sysfs-class-led-trigger-blk        |  37 +++
 block/genhd.c                                      |   2 +
 drivers/block/umem.c                               |  20 +-
 drivers/block/umem.h                               |  20 +-
 drivers/leds/trigger/Kconfig                       |   9 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-blk.c                 | 258 +++++++++++++++++++++
 drivers/scsi/mvsas/mv_94xx.c                       |   2 +-
 drivers/scsi/mvsas/mv_94xx.h                       |  24 +-
 drivers/scsi/nsp32.c                               |   7 +-
 drivers/scsi/nsp32.h                               |   4 +-
 drivers/scsi/sd.c                                  |  40 ++--
 include/linux/genhd.h                              |   3 +
 include/linux/leds.h                               |  38 +++
 14 files changed, 410 insertions(+), 55 deletions(-)
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

