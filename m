Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E1388C95
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 19:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfHJRzi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 13:55:38 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42608 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfHJRzi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 13:55:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so47408318pgb.9;
        Sat, 10 Aug 2019 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xxf/HVq1oOiY+aojPeB31TYL+w9kpCEUs73K8+rOlTU=;
        b=XgQKdFPyq4/igad3UxcEd6J37M+Y3GDA6fYhzatJ2Z3doFBBfkLiwl8BI4vNCEj+UH
         O5C2UnDadOqsHpU9g2NnRnGAN9jnaeMGwekCFzRWGOCZzKlqx/a/kdSLPRTmvyNcPun1
         jsdnrC7IAtv8PA/xem6DhQI3k7anZ3eb59tzBQDD6BJg2PrLYP7c7F+gLhyhiJaXrGcp
         GrZByG5YwWhcvlCSckJQ/aCxKkeeUJ/EKMVdVJn0M/DlxZRzEQIEP6ka6vfkmXdNLrGv
         vSDhGM6tR85W7UBuQsUlmGuCUUAeDoXgjiaSn4AvVIOT3GT5GC/boqsObuqQk09z/h/m
         UuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xxf/HVq1oOiY+aojPeB31TYL+w9kpCEUs73K8+rOlTU=;
        b=hBzjoQwnhwoHzhrESh9nakSPgCUsFm/NNfa3OVT7Pw2m3qLJedZbNRVqIQvQkf5gyH
         ePEDSGeVE4mK2SkWY3C9YWG59X1VfY2vzQpkPl6ZqFko6ps1MPT3Y3eub+kpH3iZZoII
         x/aRx9foKasAwWeKyWbO94RwO6KdbkC05YunjWqCvwipFysLisHuO1BAcyO0lqCK8Q7x
         4STs3P6d+j820FdPVCRAdxZMh4MTlwTdgLlE09lZ34VYJ2apf05RXr0JyXI2Da+Ajj4J
         vBNngCirQY1iso/mR4mW3cUofxkM2cbFiE9Do+Kky7VJYgTYMPoi6OgBqcfkIn4D49Ah
         bntQ==
X-Gm-Message-State: APjAAAVh2hESLvlEY8mSekyoyozh1XJlfgxTV8wbAsANLERuz5P9RP/q
        44+scOzGLqWQCisYi+7poQpmJJyyLII=
X-Google-Smtp-Source: APXvYqx+qII4lVboFkSeKu2D27nWV5kO0BFoKHrSQGrW/XAkxubiMEeV9ski/vlVYOFvqdOAEOddUQ==
X-Received: by 2002:a65:5144:: with SMTP id g4mr23027005pgq.202.1565459737248;
        Sat, 10 Aug 2019 10:55:37 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:a137:2bda:e96e:808])
        by smtp.gmail.com with ESMTPSA id 185sm102146544pfd.125.2019.08.10.10.55.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 10 Aug 2019 10:55:36 -0700 (PDT)
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
        Hannes Reinecke <hare@suse.com>
Subject: [PATCH v3 2/6] scsi: mvsas: rename LED_* enums to SGPIO_LED_*
Date:   Sun, 11 Aug 2019 02:54:59 +0900
Message-Id: <1565459703-30513-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
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
Cc: Hannes Reinecke <hare@suse.com>
Reviewed-by: Hannes Reinecke <hare@suse.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
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

