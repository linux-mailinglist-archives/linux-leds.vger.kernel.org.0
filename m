Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9023F88C98
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 19:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfHJRzm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 13:55:42 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37476 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfHJRzm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 13:55:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so14595690pgp.4;
        Sat, 10 Aug 2019 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tuWIrZdeip2SwEu1Up/Cgz1RXLdTxno3PAy39P4ux3s=;
        b=aViEr1NQQDYNuTA2BHp2Xh6TL7DCfTOEtIRwXYazb2Mpau/q79W3tvuljGj9+ELOMn
         gHJRBijithncHllSt3KPrXEyzMr/Z2gizvBuCIh0kIf7kYIzwHwdZyhih3MG5Vkg0FIg
         oRN/jasrT/iaOrSbTUXKgNL55A0mmpJoE5Cyg7KC09yoXvCKVNgjbG2DoiGtdJZB7e59
         I98iV9NDXYJw7I4fYE2YcsZ3MSZeUXPn39de6XRRhhgmZbnSiXEbCayfLJGt/2kmGjGT
         RNB1dW8CiTxdjEI3OdoD9nHZnZf5lzKjakqiIDokVcn7CK2pxDc6FOtEX4aHqAonzQ/P
         b7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tuWIrZdeip2SwEu1Up/Cgz1RXLdTxno3PAy39P4ux3s=;
        b=rNhDIdX/c7/6tijEuTROz/dn/Rm/hXfL3yGH6C7tTOeG6gvnRdTK1vfpwQda4tjUZR
         wMZzt2Kw55bkjzNQSq9PpuP9ylFQd4iBzkdiLdVOKPdIYkQdbs62GFJXoJgpAwZQ1SlA
         YBy9OlulJTfSQnLCUA26oK4dRmZUsfL64AfXOhxU0yEWV6CdeCfHK3gQIDiGZ8DbPaev
         XmqBNWl/DCRICf53XpqYn9Lz1V5QrCBLsBEXiZtTaCH6LG/v96NungDoD93RHDwp//Qr
         rhFOhk8iFnP/sfStW/PanAycYAse0bSbOhqPmTPhsQD9Vsc9uGAvQvT3DVsWGXuzFbQR
         cJkg==
X-Gm-Message-State: APjAAAXtvjWbIuy+P3k07G9m20dTrubIGCAL9QubKwj5IOBow/9Ggnuv
        4H8wQtkmVEHt8ect2gixpgADG+0bZFg=
X-Google-Smtp-Source: APXvYqygEe6YPo5KJGV1pbKiWifgPPBKFu3bqF9nw8QG6BpnKrDT8d3s73tlEa4eSqtah8I4w4oh4Q==
X-Received: by 2002:a65:6552:: with SMTP id a18mr23552119pgw.208.1565459741187;
        Sat, 10 Aug 2019 10:55:41 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:a137:2bda:e96e:808])
        by smtp.gmail.com with ESMTPSA id 185sm102146544pfd.125.2019.08.10.10.55.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 10 Aug 2019 10:55:40 -0700 (PDT)
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
Subject: [PATCH v3 3/6] scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*
Date:   Sun, 11 Aug 2019 02:55:00 +0900
Message-Id: <1565459703-30513-4-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The nsp32 driver defines LED_ON and LED_OFF macros for EXT_PORT_DDR or
EXT_PORT register values.  The LED_OFF and LED_ON macros conflict with
the LED subsystem's LED_OFF and LED_ON enums.

This renames these LED_* macros to EXT_PORT_LED_* in nsp32 driver.

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
Reviewed-by: Hannes Reinecke <hare@suse.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/scsi/nsp32.c | 7 ++++---
 drivers/scsi/nsp32.h | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/nsp32.c b/drivers/scsi/nsp32.c
index 70db792..8170358 100644
--- a/drivers/scsi/nsp32.c
+++ b/drivers/scsi/nsp32.c
@@ -763,7 +763,8 @@ static int nsp32_arbitration(struct scsi_cmnd *SCpnt, unsigned int base)
 	if (arbit & ARBIT_WIN) {
 		/* Arbitration succeeded */
 		SCpnt->result = DID_OK << 16;
-		nsp32_index_write1(base, EXT_PORT, LED_ON); /* PCI LED on */
+		/* PCI LED on */
+		nsp32_index_write1(base, EXT_PORT, EXT_PORT_LED_ON);
 	} else if (arbit & ARBIT_FAIL) {
 		/* Arbitration failed */
 		SCpnt->result = DID_BUS_BUSY << 16;
@@ -1137,8 +1138,8 @@ static int nsp32hw_init(nsp32_hw_data *data)
 	nsp32_write2(base, IRQ_CONTROL, 0);
 
 	/* PCI LED off */
-	nsp32_index_write1(base, EXT_PORT_DDR, LED_OFF);
-	nsp32_index_write1(base, EXT_PORT,     LED_OFF);
+	nsp32_index_write1(base, EXT_PORT_DDR, EXT_PORT_LED_OFF);
+	nsp32_index_write1(base, EXT_PORT,     EXT_PORT_LED_OFF);
 
 	return TRUE;
 }
diff --git a/drivers/scsi/nsp32.h b/drivers/scsi/nsp32.h
index ab0726c..a7553ea 100644
--- a/drivers/scsi/nsp32.h
+++ b/drivers/scsi/nsp32.h
@@ -306,8 +306,8 @@ typedef u16 u16_le;
 
 #define EXT_PORT_DDR		0x02	/* BASE+08, IDX+02, B, R/W */
 #define EXT_PORT		0x03	/* BASE+08, IDX+03, B, R/W */
-# define LED_ON	 (0)
-# define LED_OFF BIT(0)
+# define EXT_PORT_LED_ON	(0)
+# define EXT_PORT_LED_OFF	BIT(0)
 
 #define IRQ_SELECT		0x04	/* BASE+08, IDX+04, W, R/W */
 # define IRQSELECT_RESELECT_IRQ      BIT(0)
-- 
2.7.4

