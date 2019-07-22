Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCE3702D5
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 16:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfGVO7c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 10:59:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44917 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfGVO7c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 10:59:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so17479987pfe.11;
        Mon, 22 Jul 2019 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CSY0GIGjxOGwbMhm3bGvidcWT9sCWPIvO8wnBMqQ0JE=;
        b=rwjc3keFlsWaPBmJ8jLB4C3po38Ym8n1XBk8VgQd9HJCKrQLggoj2eeHBebKXJCEWw
         +5/fTyM/6UEYMfsibbR0twX2KHz5JoDBXYNvBeSolov9t9iTajKhkkNsIm1vQQwr8jcd
         tqa9IZgzyyRNZ6M3Kzkaub6HVd5EYu3HjDtENdnS8VDIrm51OL2Z+IYhmoHg+zpNIMPe
         DoW0O0OrTzQPuwICT2QSIkOb7VjHUHRzoTSGO7cP+F6dTkacuH41xWkkRUmOQJoiarjA
         PMBa1GzvEg9l9BIZjCcYtamQaNznWJHTophD77077rgCxWIiXvB2U/sKiBhN3SCfUxvF
         z/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CSY0GIGjxOGwbMhm3bGvidcWT9sCWPIvO8wnBMqQ0JE=;
        b=t+H5F1XWwGDanprDAgCKZi4W+55wOtVfTMEYPi/FBs4FGZvt1oa5L9rIaNIt79F/OT
         vPBL6QUI3a75JVXPno1ResBbEcaUi1lh8JHnVm14CsVkaxAT/Lx8n/OibopVX/pYcFD6
         R6u44hdugmoQ/TrgssTKhJ8jgrKe7RHn6AIskll98A5dCxcWxVAZfu7X5OurxIOFGiRU
         oJR9GkxXg7b7vTko6vFL7Lh3Kr8i7gGJs7xwb21SvybWvD4cGttVpbsIYtmrXhjKybbu
         OcUYO7ZP9hFv8Dbh/ZUucq+TaWHxCiMFeTZCloI1pwC+q3jWZjNas58G9mbZDzfPlpp7
         know==
X-Gm-Message-State: APjAAAXyh4zr1kOo6JZau6u78KjIFyz2m6pT5vQZPJEQ+8PiBBBqdEt1
        5mmbEI4/SKsgnIvqWMazF8uACxiE
X-Google-Smtp-Source: APXvYqwdWhKl99dnVa7COvkAeKns+UC3ecDFUj5QGoWmZsb3trQe6iycfl33UfSdS3TCLbM2sMM3ow==
X-Received: by 2002:a17:90a:d997:: with SMTP id d23mr74094110pjv.84.1563807571097;
        Mon, 22 Jul 2019 07:59:31 -0700 (PDT)
Received: from mita-MS-7A45.lan (KD027092233113.ppp-bb.dion.ne.jp. [27.92.233.113])
        by smtp.gmail.com with ESMTPSA id a16sm42533174pfd.68.2019.07.22.07.59.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 07:59:30 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 0/3] introduce LED block device activity trigger
Date:   Mon, 22 Jul 2019 23:59:09 +0900
Message-Id: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This work is inspired by the report on linux-nvme mailing list.

disk-activity trigger not working for nvme disk:
http://lists.infradead.org/pipermail/linux-nvme/2019-July/025253.html

This LED block device activity trigger works with any block devices.

* v2
- Remove "move declaration of led_stop_software_blink() to linux/leds.h" patch
- Move the trigger implementation to drivers/leds/trigger
- s/blk_ledtrig/ledtrig_blk/
- Add CONFIG_LEDS_TRIGGER_BLOCK
- Fix wrong bitops usages
- Add interface to stop and restart polling disk stats
- Stop polling disk stats for scsi disk during runtime suspend

Akinobu Mita (3):
  block: introduce LED block device activity trigger
  ledtrig-blk: add interface to stop and restart polling disk stats
  scsi: sd: stop polling disk stats by ledtrig-blk during runtime
    suspend

 block/genhd.c                      |   2 +
 drivers/leds/trigger/Kconfig       |   7 +
 drivers/leds/trigger/Makefile      |   1 +
 drivers/leds/trigger/ledtrig-blk.c | 258 +++++++++++++++++++++++++++++++++++++
 drivers/scsi/sd.c                  |  40 +++---
 include/linux/genhd.h              |   3 +
 include/linux/leds.h               |  38 ++++++
 7 files changed, 332 insertions(+), 17 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-blk.c

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
-- 
2.7.4

