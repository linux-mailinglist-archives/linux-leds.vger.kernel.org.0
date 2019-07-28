Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3804377FBB
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 16:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfG1OBT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 10:01:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35661 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfG1OBS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 10:01:18 -0400
Received: by mail-pg1-f196.google.com with SMTP id s1so20606830pgr.2;
        Sun, 28 Jul 2019 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/XMXgmnlnByuPDG+i9evCH1V2lk/xNNqdwLnBs7ygAA=;
        b=NSw6Ca4remyYSoKED7/pL1ofjE6N1tnQT8YBy9PpseseeWGqpRuOnvwcCu2pKh6O+K
         xpVzqN4gqRdKNiho1uHT3pmrw+ZVNI4LfLsbWtUnJnozgXrHPBoldWX4unXSDXS4u1OE
         eV38cEFmAHmczInsA80w/JJEqxGDtCSEW2cU/r3yeNZiZr3FG0KyLJOpkIpxeRkdMuUz
         LEKZwedGlZqnKoJ+kh+YPyfE+1Um/sd9ddPWJ1L35xggjjIdOPneUQ7IcSaR7vB2LvgC
         AA9goHVAu7UujbUnN/H1dT2Mg1bgoD9WAw11Z185Omde0t0DO1C1cAST3KLDICdNHG4y
         T36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/XMXgmnlnByuPDG+i9evCH1V2lk/xNNqdwLnBs7ygAA=;
        b=EePfOQOwNJE14HxwWC3OvQir/pQIQKZ3/Ok2i0M0x4TWcOTa25nsPFnYmhMECYsG3p
         aPqTAxbeyzQDbOqT6N/4ZHDbfMa2K1AH8bhYhHF2kESZLp1PHbrJ8ELEDFQC0mf1qhWX
         7njUP+TfnqmvqUv+QFJG5NXwWWSeAMkFDOQs2nzfHZgfyfaqrzgUN1oEaJoOEnE7YuEI
         iWRSLgUDxpu8qlLNLCcRnmi61ioRSZXUAC0qAJtSE3PmDWAPR9LN+2eeYy2EdTIppSxn
         BX4lVySFgBtzv8vE7OhFQ4Fz946Qu+ZP5U/0noVDjWAoOC5Wj77J5jcwzLVhonVW91mc
         N44Q==
X-Gm-Message-State: APjAAAVCIkvx8jeqUAgU10gjmdCmB9pq12TMu+VFmNuyzM1TWDtvzehf
        Cu2YZ1dfroNtXOXm3IMMMJUd6FOM
X-Google-Smtp-Source: APXvYqzRBdv3B2l6rH1Dg6rPzFysT6j//MEHxEopL+OUuFkPG4LWaB0zF1O1/mZFNFI4Y+L6tlrzBA==
X-Received: by 2002:a63:10a:: with SMTP id 10mr15991252pgb.281.1564322477896;
        Sun, 28 Jul 2019 07:01:17 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:c118:b59:e3b3:19e7])
        by smtp.gmail.com with ESMTPSA id k36sm59911042pgl.42.2019.07.28.07.01.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 28 Jul 2019 07:01:17 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 2/3] scsi: mvsas: rename LED_* enums to SGPIO_LED_*
Date:   Sun, 28 Jul 2019 23:00:45 +0900
Message-Id: <1564322446-28255-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The mvsas driver declares LED_* enums for enum sgpio_led_status. The
LED_OFF and LED_ON enums cause redeclaration of enumerator with the
LED subsystem's LED_OFF and LED_ON enums.

This adds 'SGPIO_' prefix to these enums in mvsas driver.

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/scsi/mvsas/mv_94xx.c |  2 +-
 drivers/scsi/mvsas/mv_94xx.h | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/mvsas/mv_94xx.c b/drivers/scsi/mvsas/mv_94xx.c
index fc0b8eb..3558a625 100644
--- a/drivers/scsi/mvsas/mv_94xx.c
+++ b/drivers/scsi/mvsas/mv_94xx.c
@@ -1085,7 +1085,7 @@ static int mvs_94xx_gpio_write(struct mvs_prv_info *mvs_prv,
 				block &= ~((0x7 << MVS_SGPIO_DCTRL_ACT_SHIFT)
 					<< driveshift);
 					/* hardwire activity bit to SOF */
-				block |= LED_BLINKA_SOF << (
+				block |= SGPIO_LED_BLINKA_SOF << (
 					MVS_SGPIO_DCTRL_ACT_SHIFT +
 					driveshift);
 				break;
diff --git a/drivers/scsi/mvsas/mv_94xx.h b/drivers/scsi/mvsas/mv_94xx.h
index a243182..2c96ff1 100644
--- a/drivers/scsi/mvsas/mv_94xx.h
+++ b/drivers/scsi/mvsas/mv_94xx.h
@@ -275,23 +275,23 @@ enum sgpio_registers {
 };
 
 enum sgpio_led_status {
-	LED_OFF	= 0,
-	LED_ON	= 1,
-	LED_BLINKA	= 2,
-	LED_BLINKA_INV	= 3,
-	LED_BLINKA_SOF	= 4,
-	LED_BLINKA_EOF	= 5,
-	LED_BLINKB	= 6,
-	LED_BLINKB_INV	= 7,
+	SGPIO_LED_OFF		= 0,
+	SGPIO_LED_ON		= 1,
+	SGPIO_LED_BLINKA	= 2,
+	SGPIO_LED_BLINKA_INV	= 3,
+	SGPIO_LED_BLINKA_SOF	= 4,
+	SGPIO_LED_BLINKA_EOF	= 5,
+	SGPIO_LED_BLINKB	= 6,
+	SGPIO_LED_BLINKB_INV	= 7,
 };
 
-#define DEFAULT_SGPIO_BITS ((LED_BLINKA_SOF << \
+#define DEFAULT_SGPIO_BITS ((SGPIO_LED_BLINKA_SOF << \
 				MVS_SGPIO_DCTRL_ACT_SHIFT) << (8 * 3) | \
-			(LED_BLINKA_SOF << \
+			(SGPIO_LED_BLINKA_SOF << \
 				MVS_SGPIO_DCTRL_ACT_SHIFT) << (8 * 2) | \
-			(LED_BLINKA_SOF << \
+			(SGPIO_LED_BLINKA_SOF << \
 				MVS_SGPIO_DCTRL_ACT_SHIFT) << (8 * 1) | \
-			(LED_BLINKA_SOF << \
+			(SGPIO_LED_BLINKA_SOF << \
 				MVS_SGPIO_DCTRL_ACT_SHIFT) << (8 * 0))
 
 /*
-- 
2.7.4

