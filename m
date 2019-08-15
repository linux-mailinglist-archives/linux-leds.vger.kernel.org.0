Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF3CA8F16A
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2019 19:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbfHORAg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Aug 2019 13:00:36 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37970 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbfHORAg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Aug 2019 13:00:36 -0400
Received: by mail-pg1-f195.google.com with SMTP id e11so1548505pga.5;
        Thu, 15 Aug 2019 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tuWIrZdeip2SwEu1Up/Cgz1RXLdTxno3PAy39P4ux3s=;
        b=Sc/hFVtBa1kDleXupt6VxqKCVfqsUCGiT9MBL7ZrtpWFeW6BSE5VfigLZwVyr43zG6
         QkyaiQ6jcXANdaaRSh+raVNgY+hdDkbYwmeVMk3Tc+Aky0yG/Gx5gl7b+BSMoU6F8Zte
         i6YaOhvWC665Gdx4g8/k4Y7TzaSme50hfOlKa83FtQXwNzUybIO447o7LpgyGHK9Yw/d
         0GHp/0UiNtYma83x9/390TkDAPpsbDGtMH2pUiZU1EPT4w88+Ywd+TDdq8mvS9KwWW4n
         7S2A16bbwmEzdTqg32w2VzPxtvhoX4ua1HhuRqffsCd50PfQKS2KKq8Ca9r+39nnQXtf
         t3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tuWIrZdeip2SwEu1Up/Cgz1RXLdTxno3PAy39P4ux3s=;
        b=Z0ZjpPhNnEhm1Gvt6Km63g8P/XeV4ou1sl/MPUyWM8d+ufTAzDzSsYL0f23T8XUSNL
         aFNU/FY+ilcvlgkMYUqrbQUJGxN969MRalcURR782S6j0eJvRhGiulgCoj8s4dWRqx9G
         HV4VtZMFkrOo5V/YXNB1Z1SNbHyIh1s1FdTzfb9ar/aoSCZ0IX4fQGB2Vr5RUyDeZf7/
         pHZJjCrCSUh7RQz9nZHoBd0vAwW7IL+t/VXDL7cM/yM7yUQ18UDyFl8ULSKa0HD67pcL
         mMvmTP360AN1kw86OXiATs+9zIlQkhwvDbNXrSy5skZey9FIevf/LJTUu94BxHPn42Gb
         82wA==
X-Gm-Message-State: APjAAAVxSh7sXLh7X0L7VHzt7rXaWLtNiJsIIrjgcLkFShtgp0pTnTmp
        8zXZ4VCJhkT3h3Fqr+x+2YcBhz4+66k=
X-Google-Smtp-Source: APXvYqyEb6YHlds52FFvJadwAnFCxPLcpKH0blH2HteX/ZuPbIT3I2s2dyxATa45s8g5HYhSPABLvQ==
X-Received: by 2002:a63:f91c:: with SMTP id h28mr4023147pgi.397.1565888435282;
        Thu, 15 Aug 2019 10:00:35 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:12:b19f:559d:7305])
        by smtp.gmail.com with ESMTPSA id b30sm3943942pfr.117.2019.08.15.10.00.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 10:00:34 -0700 (PDT)
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
Subject: [PATCH v4 3/5] scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*
Date:   Fri, 16 Aug 2019 01:59:57 +0900
Message-Id: <1565888399-21550-4-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
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

