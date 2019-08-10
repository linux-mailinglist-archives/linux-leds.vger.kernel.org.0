Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E37A288C91
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 19:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfHJRzd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 13:55:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36212 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfHJRzd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 13:55:33 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so47407168pgm.3;
        Sat, 10 Aug 2019 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PmIPB6mpwRGbhjpdu5g6+bYsqRrGPw+jzXIFXUmiX/4=;
        b=rMGTB26PZzfQPjNuaOz1PdVTNvl4YlNb3nNq+dBmEXUUSO8ucQNXpLW4shoe951H3P
         6yCKP0PSCTWBRnKy7o4IK6gwovXK/d2QLrhcWsjTP2cGXcQq+sM/58F9EdDQ2clvT5ry
         SJ8R9bFfWst6IIF80FlA2Y3/Fowj24in5ZRNe4fvXdVYYhkVROe3F7ZWNAGYfssRcxwg
         xpp47M0pJIIuQO1anLt3/e054VFNN7fpYadCxE/pwVfUvP1lBo9sUCOq5h3cxnSuL5I1
         RRimwqdNeuCPKvCzi+PytMffNGxBAhQD4oS4mbv83P2kGz7domnO/UbQy9ROhy715XtB
         t6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PmIPB6mpwRGbhjpdu5g6+bYsqRrGPw+jzXIFXUmiX/4=;
        b=aDHgevXIJon9d1Yt1GEfQgHfrHYtj2eQ7evQkvzsHqqGU9XLLNuRzEwjIPsr+aOPei
         7bd8LEEXW/9M4yuJU9NSUHeHsOdINDOhG1CEZOt7S9KdEaEYAqELhVcG/Xw/LQGza++9
         hi8OFlQpRla2UvlzIC2UtHAdK8UmcM0x9O/y3b6xsL/hQdFzJJoFgEUR5Mz1En4kR7ve
         WpQJVwwjKKnsf22bA9bajZ/hd4BgGvzXwTeSB3vpq1xIWAv8MX1NuthfQ74TssfOlhlV
         Teu3NzzFdMYQxMciz1stXMTOTslpGRhulyryJ/ysayR0oGrXgdlPOryHZM/Q7UmbHsWP
         6TUg==
X-Gm-Message-State: APjAAAW5FNzgI+lcOLCBpipGTTS3KdSVsM5n3LjFMow5e9euRsVIx9s6
        Eq6dBewXQSRt//BBf+vqS2mGNew3VQg=
X-Google-Smtp-Source: APXvYqxwUrt6hrxviYyAAYYiew/16nbDXI4MNwzMURXf4jbdSSAQHJNWRuXnfFIOoaIUD0liPM7N+Q==
X-Received: by 2002:a17:90a:7788:: with SMTP id v8mr15933812pjk.132.1565459732302;
        Sat, 10 Aug 2019 10:55:32 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:a137:2bda:e96e:808])
        by smtp.gmail.com with ESMTPSA id 185sm102146544pfd.125.2019.08.10.10.55.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 10 Aug 2019 10:55:31 -0700 (PDT)
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
Subject: [PATCH v3 1/6] block: umem: rename LED_* macros to MEMCTRL_LED_*
Date:   Sun, 11 Aug 2019 02:54:58 +0900
Message-Id: <1565459703-30513-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
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

