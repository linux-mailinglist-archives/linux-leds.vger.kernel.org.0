Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560968F164
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2019 19:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730623AbfHORA0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Aug 2019 13:00:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43693 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729084AbfHORAZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Aug 2019 13:00:25 -0400
Received: by mail-pf1-f195.google.com with SMTP id v12so1601440pfn.10;
        Thu, 15 Aug 2019 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3nK98dgFoyjBvX7GN5x7UY25xQPiZUMPFR2l0frTXk0=;
        b=VNWxlaGzdZIIppEwlc6lC084plrHsbKyGgFtdhKT8ZMPe4co79SVcZUyjwoqShL5OB
         Tc7V90bjULG6N94KNiBfPkxboAJniGi/vFYnJGOqe50RWxAZk/IcTv8wZtiVxveTwc93
         y8BfYXmwcCu/LQ40wzlR59tHhSsEny8krqMV2eUjo3D8JM0GOl5KgzcWSbsKri4STtpT
         eZKj/N9qLz/6cLCRaC+7RTFV8ZtEQMTc3n0bTJPGPEgFK2Tjtq3KZKYBS5aYTb3Ij91/
         KySPJgAp/jq8n1/H0SnH8N7nja5eJZs4f8MFgt3ej7Pm7GIj/CmJxoPdqtCzUKDMgPpA
         QvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3nK98dgFoyjBvX7GN5x7UY25xQPiZUMPFR2l0frTXk0=;
        b=dPPr2X7+3R2QX4y9AcjNnk0utp9BF/eOTjMKAvv3Oy65GnZ/FPlo5n0MC0IKleW1jC
         mGw2KbqyBjLSOJy3HvsOJInRf74j7VSJ8tga9S8WwQOh/qVgNwbmApAVgc83F1NrsNYV
         KRd8k+BB/Og7rgs3g/lfoRCJr+zKxMq9tSu4G4MNYSXMxMr7x8V8Ac5NMXg0uMBjxorc
         P0+qKd6XcKwhx3QaktGEDEZHzHpk7wyZuqaiO92rbqsFY19Pa9dsW8JWC0MrHvSf7YEC
         RhP1D2Xy/2msSPQDP1s2VnW05CmpkIlB+u0KBGsCFuIqJ/iklqtivgzRocZD3rm+jBxE
         Sy4Q==
X-Gm-Message-State: APjAAAUx/JfEwdmU3cRgHWCz/srSaMq13ZP6EwVBloRgWmsYMqKEOCne
        GsvlgeJBNjGwhlPV81boO1dlJMVH3Sc=
X-Google-Smtp-Source: APXvYqwpsnTtERDRec76lXOv668Lb26b4nhGOo3/y6Qa6tILPiCrbP784XJhT6Esw43s+z3WtZ5c4A==
X-Received: by 2002:a62:107:: with SMTP id 7mr6485812pfb.4.1565888424464;
        Thu, 15 Aug 2019 10:00:24 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:12:b19f:559d:7305])
        by smtp.gmail.com with ESMTPSA id b30sm3943942pfr.117.2019.08.15.10.00.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 10:00:23 -0700 (PDT)
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
Subject: [PATCH v4 1/5] block: umem: rename LED_* macros to MEMCTRL_LED_*
Date:   Fri, 16 Aug 2019 01:59:55 +0900
Message-Id: <1565888399-21550-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The umem driver defines LED_* macros for MEMCTRLCMD_LEDCTRL register
values.  The LED_OFF and LED_ON macros conflict with the LED subsystem's
LED_OFF and LED_ON enums.

This renames these LED_* macros to MEMCTRL_LED_* in umem driver.

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Hannes Reinecke <hare@suse.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/block/umem.c | 20 ++++++++++----------
 drivers/block/umem.h | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 1f3f9e0..1109308 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -167,14 +167,14 @@ static int set_userbit(struct cardinfo *card, int bit, unsigned char state)
 }
 
 /*
- * NOTE: For the power LED, use the LED_POWER_* macros since they differ
+ * NOTE: For the power LED, use the MEMCTRL_LED_POWER_* macros since they differ
  */
 static void set_led(struct cardinfo *card, int shift, unsigned char state)
 {
 	unsigned char led;
 
 	led = readb(card->csr_remap + MEMCTRLCMD_LEDCTRL);
-	if (state == LED_FLIP)
+	if (state == MEMCTRL_LED_FLIP)
 		led ^= (1<<shift);
 	else {
 		led &= ~(0x03 << shift);
@@ -268,7 +268,7 @@ static void mm_start_io(struct cardinfo *card)
 
 
 	if (debug & DEBUG_LED_ON_TRANSFER)
-		set_led(card, LED_REMOVE, LED_ON);
+		set_led(card, MEMCTRL_LED_REMOVE, MEMCTRL_LED_ON);
 
 	desc = &page->desc[page->headcnt];
 	writel(0, card->csr_remap + DMA_PCI_ADDR);
@@ -477,7 +477,7 @@ static void process_page(unsigned long data)
 	}
 
 	if (debug & DEBUG_LED_ON_TRANSFER)
-		set_led(card, LED_REMOVE, LED_OFF);
+		set_led(card, MEMCTRL_LED_REMOVE, MEMCTRL_LED_OFF);
 
 	if (card->check_batteries) {
 		card->check_batteries = 0;
@@ -652,13 +652,13 @@ HW_TRACE(0x36);
 static void set_fault_to_battery_status(struct cardinfo *card)
 {
 	if (card->battery[0].good && card->battery[1].good)
-		set_led(card, LED_FAULT, LED_OFF);
+		set_led(card, MEMCTRL_LED_FAULT, MEMCTRL_LED_OFF);
 	else if (card->battery[0].warned || card->battery[1].warned)
-		set_led(card, LED_FAULT, LED_ON);
+		set_led(card, MEMCTRL_LED_FAULT, MEMCTRL_LED_ON);
 	else if (!card->battery[0].good && !card->battery[1].good)
-		set_led(card, LED_FAULT, LED_FLASH_7_0);
+		set_led(card, MEMCTRL_LED_FAULT, MEMCTRL_LED_FLASH_7_0);
 	else
-		set_led(card, LED_FAULT, LED_FLASH_3_5);
+		set_led(card, MEMCTRL_LED_FAULT, MEMCTRL_LED_FLASH_3_5);
 }
 
 static void init_battery_timer(void);
@@ -919,8 +919,8 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	/* Clear the LED's we control */
-	set_led(card, LED_REMOVE, LED_OFF);
-	set_led(card, LED_FAULT, LED_OFF);
+	set_led(card, MEMCTRL_LED_REMOVE, MEMCTRL_LED_OFF);
+	set_led(card, MEMCTRL_LED_FAULT, MEMCTRL_LED_OFF);
 
 	batt_status = readb(card->csr_remap + MEMCTRLSTATUS_BATTERY);
 
diff --git a/drivers/block/umem.h b/drivers/block/umem.h
index 5838497..cc9cb37 100644
--- a/drivers/block/umem.h
+++ b/drivers/block/umem.h
@@ -32,16 +32,16 @@
 #define  MEM_2_GB		0xe0
 
 #define MEMCTRLCMD_LEDCTRL	0x08
-#define  LED_REMOVE		2
-#define  LED_FAULT		4
-#define  LED_POWER		6
-#define	 LED_FLIP		255
-#define  LED_OFF		0x00
-#define  LED_ON			0x01
-#define  LED_FLASH_3_5		0x02
-#define  LED_FLASH_7_0		0x03
-#define  LED_POWER_ON		0x00
-#define  LED_POWER_OFF		0x01
+#define  MEMCTRL_LED_REMOVE	2
+#define  MEMCTRL_LED_FAULT	4
+#define  MEMCTRL_LED_POWER	6
+#define  MEMCTRL_LED_FLIP	255
+#define  MEMCTRL_LED_OFF	0x00
+#define  MEMCTRL_LED_ON		0x01
+#define  MEMCTRL_LED_FLASH_3_5	0x02
+#define  MEMCTRL_LED_FLASH_7_0	0x03
+#define  MEMCTRL_LED_POWER_ON	0x00
+#define  MEMCTRL_LED_POWER_OFF	0x01
 #define  USER_BIT1		0x01
 #define  USER_BIT2		0x02
 
-- 
2.7.4

