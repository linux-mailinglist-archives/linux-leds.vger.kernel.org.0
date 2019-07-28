Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C18577FC0
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 16:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfG1OB2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 10:01:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46926 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfG1OB1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 10:01:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id c3so3534033pfa.13;
        Sun, 28 Jul 2019 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NRafqqL/OnqN2ZpY7kTQX7CWX4qWrQHLhACG154FPvw=;
        b=TkILfb/0g5zGSSi3I/bK9urvqTntxorYMX3rWE0QQXHwCwO3GDzLZStgEyMogD4+V/
         2Rml+GYYCNDMmdk4gSEF7Z3vAfEXAQQTliEUiAFWW+3uRXyxD0eFJsnIBbaEtQiubtUs
         I5LnYUT0W9BhRPpKBxVlirfqzcUNEae8HU84TOfaUMA86XTnOcvmXZO694ZDDgPJUI2N
         v+xyP7EZO+kXCny7wRJVx2Hsbf343K6FQfvFTyU4TQpMR7+EstRnuXG6MgW7LW6MzZhl
         WsbqxqOPKqemP3zacj6FoS7bjIepsrjixQ2LGwCzrDtH9H+wNHninVEIcRV2yDmV0BFs
         KnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NRafqqL/OnqN2ZpY7kTQX7CWX4qWrQHLhACG154FPvw=;
        b=pLjS2Vo4DfEVx+rZeywB5uERGiJqisYJeBXWT3LmJBaUXy4+JQmMi8HffagHWQTT1e
         i4x1Q1fwSHbyFIdBvt7hliHHucBd9O5nQir4GJPIvCPNk/gh/Ja1Fkm0y8MLoZRB2rp1
         v/5KVvz5Hhy0A0iFE0xbe1icHHxuZhI1IftH/Xu8ey6rsyN5sdKxrJGXdHXUBEuXFoPX
         M4pGZH7CmLSYjFiMmrRjD1NV2eaD/Y6h2JxGJvRjKZr32NcyWEO0awMluboh8B0d8O0C
         h5qmRDPV+fLPg4eKIVTZr2z6jG+wNrxYks3nX3Pv1vczYYIqXVPXFwXwnL76W5bfV6Ur
         eaIg==
X-Gm-Message-State: APjAAAUr5mWIvnOqv0UQGY1JfWhuz0il+GF0ZLwbSF4tuw8KfMWTsYss
        ulYcQdRV+/UmGgfd2zhtNPIwo70g
X-Google-Smtp-Source: APXvYqzAci1FG8L/T/tBkvm8atyPsd9NaE9XTWBINy6Da8ZRwSqvc3ek3yObSOKWfnjOmqFBAPk8WQ==
X-Received: by 2002:a17:90a:cb81:: with SMTP id a1mr104603570pju.81.1564322487093;
        Sun, 28 Jul 2019 07:01:27 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:c118:b59:e3b3:19e7])
        by smtp.gmail.com with ESMTPSA id k36sm59911042pgl.42.2019.07.28.07.01.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 28 Jul 2019 07:01:26 -0700 (PDT)
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
Subject: [PATCH 3/3] scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*
Date:   Sun, 28 Jul 2019 23:00:46 +0900
Message-Id: <1564322446-28255-4-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
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
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/scsi/nsp32.c | 6 +++---
 drivers/scsi/nsp32.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/nsp32.c b/drivers/scsi/nsp32.c
index 70db792..330cf4c 100644
--- a/drivers/scsi/nsp32.c
+++ b/drivers/scsi/nsp32.c
@@ -763,7 +763,7 @@ static int nsp32_arbitration(struct scsi_cmnd *SCpnt, unsigned int base)
 	if (arbit & ARBIT_WIN) {
 		/* Arbitration succeeded */
 		SCpnt->result = DID_OK << 16;
-		nsp32_index_write1(base, EXT_PORT, LED_ON); /* PCI LED on */
+		nsp32_index_write1(base, EXT_PORT, EXT_PORT_LED_ON); /* PCI LED on */
 	} else if (arbit & ARBIT_FAIL) {
 		/* Arbitration failed */
 		SCpnt->result = DID_BUS_BUSY << 16;
@@ -1137,8 +1137,8 @@ static int nsp32hw_init(nsp32_hw_data *data)
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

