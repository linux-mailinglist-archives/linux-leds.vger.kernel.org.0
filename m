Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1A977FB5
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 16:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfG1OBG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 10:01:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42945 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfG1OBG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 10:01:06 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so26660125pff.9;
        Sun, 28 Jul 2019 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4ZKPOJwGJUN/barxJQihjI3Rt3a9eU2XrZx34cohEY0=;
        b=LQE4eayiW2Mn3oLAlTh8P7Jxek42pSyJIe47P5HzCNw1jW1EtsCWEJAexteaAT/MzM
         naotDSK//CrnG+0qHI9HFMH0LgejZhKCWCytreb89HRfydUsxZ8+mIwNhRA7GlQnsZDG
         OlAdiNjjY9gZ8dVKUsm2j8EkuT/fWNvhPWGmVUi7PtktJ6R25Dp1IaM4cQKNZjz+kYBP
         Bf1Zeq7i0CxS72UeouqrJUJ7TnlEFG84wc5lCz1zVVgjNyeK7KqzvKw9NEvBJ7zkiq7G
         aY/PlfynL9BZfnrnb1rIE+cT7aySVtlhfyb/qzFfcRizFJwwBzK+VNoVmtP0vzjrmCJf
         0fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4ZKPOJwGJUN/barxJQihjI3Rt3a9eU2XrZx34cohEY0=;
        b=p5YyCFwpEg7G83KSA3lqjMUMN+DjNLbm1sVz97nj/TJungKqzZP+wRHTZ6+4FGAOLQ
         HuZ/EqK79GnpaxPEuJrJDlFBilwUIqPsyGe1+KbPV3GgdsPgiBWSVsvcFJE8B/1CAxCc
         ndqqTbQjyv6A0aUeazNQ5mlT73d5N/hHS05XKMVMXc6P4P2CmcZF9DYIXZGm3CUDAM3/
         SNOJAmeqGmlJe9np9C10J3QmcLuEytud6KrxHcT2iPz4u+VDSj8k9y6g837xyYkrmmEf
         5Mk0d9058kJixdV4qjUOKERqmbPuHya2RO3GVrcpbRtl83cNqM1Ntfen0LOUlstnLmQr
         vqJg==
X-Gm-Message-State: APjAAAW2S0o7bQDzOp7XPBK+g6+iVTc/ySW5hzIt8qBvXekgY4qioZkg
        wUx8qlc29wVYr+rUZz3yTyl26LMd
X-Google-Smtp-Source: APXvYqyVXllJ9+B2ScBmkspFMrqaR3r0Oa49+BGHPMFOuzoT4bmQb21K2/p5GE8+D2321EAjwXZOvw==
X-Received: by 2002:a63:6187:: with SMTP id v129mr15214069pgb.153.1564322465486;
        Sun, 28 Jul 2019 07:01:05 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:c118:b59:e3b3:19e7])
        by smtp.gmail.com with ESMTPSA id k36sm59911042pgl.42.2019.07.28.07.00.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 28 Jul 2019 07:01:04 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        GOTO Masanori <gotom@debian.or.jp>,
        YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
Subject: [PATCH 0/3] rename LED_OFF and LED_ON to avoid name collision with leds subsystem
Date:   Sun, 28 Jul 2019 23:00:43 +0900
Message-Id: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

These are preparatory changes for LED block device activity trigger.

Some drivers internally defines LED_OFF and LED_ON, but they conflict with
the LED subsystem's LED_OFF and LED_ON enums.
This renames these driver's LED_* definisions to avoid the name collision.

Akinobu Mita (3):
  block: umem: rename LED_* macros to LEDCTRL_*
  scsi: mvsas: rename LED_* enums to SGPIO_LED_*
  scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*

 drivers/block/umem.c         | 20 ++++++++++----------
 drivers/block/umem.h         | 20 ++++++++++----------
 drivers/scsi/mvsas/mv_94xx.c |  2 +-
 drivers/scsi/mvsas/mv_94xx.h | 24 ++++++++++++------------
 drivers/scsi/nsp32.c         |  6 +++---
 drivers/scsi/nsp32.h         |  4 ++--
 6 files changed, 38 insertions(+), 38 deletions(-)

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: GOTO Masanori <gotom@debian.or.jp>
Cc: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
-- 
2.7.4

