Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0E577FB8
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 16:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfG1OBO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 10:01:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33404 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfG1OBN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 10:01:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so26676503pfq.0;
        Sun, 28 Jul 2019 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uuwYrXeTAInUcsW+AxJJ0/aljjnfiTTX/+5Vzm4lAp0=;
        b=VMV03RvUP8JqlIsbv16BFp874wVTGm973jaN6O2HhBRRX44NFN7OuPXCkkX4o6h+LJ
         QDrPMLZDkTlZwo8R4ZnhP1clBUKyKO5UJsxvTc92a54pIUxc6ttS9lDod6ewRivcRqwU
         D/ypaiKuOn93UkB6JN28KB8/hn1lsmAiVQVM7ClsrllY8ctybsm7BIB8VOZj1SYuSIxJ
         2XLDZl03f48sydaW9qR5ngHxeMPRFcR34qHxuCPd4ZRWkowaLDQX3qdi5aPzkXFF/5Bg
         ztsi5luM86IkMm3aWNpYT8UoHljbBZ17+ww9E70lAGp2HnAiIGdXzs/bm/2JfpwrM5VY
         HzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uuwYrXeTAInUcsW+AxJJ0/aljjnfiTTX/+5Vzm4lAp0=;
        b=LlvIEJeDyGKOl06uZ0AW2p+s1FstRnr7dr6viOKF0dk7000fgjxKo3BTi4seYAMS4n
         LjKc3I/WPqRZE3YOw9p4/Xe2ACP7v6LQmpBFk9YUNQO5CMJTWepDkiaY9naRGM8X1OHr
         +C/nj9Pn4QJCYseYyTZuODK/txAcp/DoRfnZb8Xyvnt7eGLilQyt5t0G2qFt7l6/ZYI6
         03huRa9QqqI0mKLBq5jwekySoMGJi4uZ6CbsY4gAPtO5G4vQ1GUJa2b+CGJ1gmHSnNLd
         dsIauL1k7ZJLvFJDWLZFdGF8R/Kyae5Bi+nwYxDegte/urDYNzIwqyBVVS3QFuMgGgLa
         aWUQ==
X-Gm-Message-State: APjAAAVI96uWc3QeaEvL21pBYMZMQZExfq5HHP3ogfkTEE9cPtU7A7aV
        TTAYShDh+MtKwE41qe7X7FwDVZw1
X-Google-Smtp-Source: APXvYqzyW8T2QREIQIwTlovir+WOf8ENXRzaKnHbjTBI2DNhmWr5qQB+cRkvkgEYIlgct2HXopBnEw==
X-Received: by 2002:a62:6454:: with SMTP id y81mr30687153pfb.13.1564322472756;
        Sun, 28 Jul 2019 07:01:12 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:c118:b59:e3b3:19e7])
        by smtp.gmail.com with ESMTPSA id k36sm59911042pgl.42.2019.07.28.07.01.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 28 Jul 2019 07:01:12 -0700 (PDT)
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
Subject: [PATCH 1/3] block: umem: rename LED_* macros to LEDCTRL_*
Date:   Sun, 28 Jul 2019 23:00:44 +0900
Message-Id: <1564322446-28255-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The umem driver defines LED_* macros for MEMCTRLCMD_LEDCTRL register
values.  The LED_OFF and LED_ON macros conflict with the LED subsystem's
LED_OFF and LED_ON enums.

This renames these LED_* macros to LEDCTRL_* in umem driver.

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/block/umem.c | 20 ++++++++++----------
 drivers/block/umem.h | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 1f3f9e0..ea63c14 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -167,14 +167,14 @@ static int set_userbit(struct cardinfo *card, int bit, unsigned char state)
 }
 
 /*
- * NOTE: For the power LED, use the LED_POWER_* macros since they differ
+ * NOTE: For the power LED, use the LEDCTRL_POWER_* macros since they differ
  */
 static void set_led(struct cardinfo *card, int shift, unsigned char state)
 {
 	unsigned char led;
 
 	led = readb(card->csr_remap + MEMCTRLCMD_LEDCTRL);
-	if (state == LED_FLIP)
+	if (state == LEDCTRL_FLIP)
 		led ^= (1<<shift);
 	else {
 		led &= ~(0x03 << shift);
@@ -268,7 +268,7 @@ static void mm_start_io(struct cardinfo *card)
 
 
 	if (debug & DEBUG_LED_ON_TRANSFER)
-		set_led(card, LED_REMOVE, LED_ON);
+		set_led(card, LEDCTRL_REMOVE, LEDCTRL_ON);
 
 	desc = &page->desc[page->headcnt];
 	writel(0, card->csr_remap + DMA_PCI_ADDR);
@@ -477,7 +477,7 @@ static void process_page(unsigned long data)
 	}
 
 	if (debug & DEBUG_LED_ON_TRANSFER)
-		set_led(card, LED_REMOVE, LED_OFF);
+		set_led(card, LEDCTRL_REMOVE, LEDCTRL_OFF);
 
 	if (card->check_batteries) {
 		card->check_batteries = 0;
@@ -652,13 +652,13 @@ HW_TRACE(0x36);
 static void set_fault_to_battery_status(struct cardinfo *card)
 {
 	if (card->battery[0].good && card->battery[1].good)
-		set_led(card, LED_FAULT, LED_OFF);
+		set_led(card, LEDCTRL_FAULT, LEDCTRL_OFF);
 	else if (card->battery[0].warned || card->battery[1].warned)
-		set_led(card, LED_FAULT, LED_ON);
+		set_led(card, LEDCTRL_FAULT, LEDCTRL_ON);
 	else if (!card->battery[0].good && !card->battery[1].good)
-		set_led(card, LED_FAULT, LED_FLASH_7_0);
+		set_led(card, LEDCTRL_FAULT, LEDCTRL_FLASH_7_0);
 	else
-		set_led(card, LED_FAULT, LED_FLASH_3_5);
+		set_led(card, LEDCTRL_FAULT, LEDCTRL_FLASH_3_5);
 }
 
 static void init_battery_timer(void);
@@ -919,8 +919,8 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	/* Clear the LED's we control */
-	set_led(card, LED_REMOVE, LED_OFF);
-	set_led(card, LED_FAULT, LED_OFF);
+	set_led(card, LEDCTRL_REMOVE, LEDCTRL_OFF);
+	set_led(card, LEDCTRL_FAULT, LEDCTRL_OFF);
 
 	batt_status = readb(card->csr_remap + MEMCTRLSTATUS_BATTERY);
 
diff --git a/drivers/block/umem.h b/drivers/block/umem.h
index 5838497..8563fdc 100644
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
+#define  LEDCTRL_REMOVE		2
+#define  LEDCTRL_FAULT		4
+#define  LEDCTRL_POWER		6
+#define	 LEDCTRL_FLIP		255
+#define  LEDCTRL_OFF		0x00
+#define  LEDCTRL_ON		0x01
+#define  LEDCTRL_FLASH_3_5	0x02
+#define  LEDCTRL_FLASH_7_0	0x03
+#define  LEDCTRL_POWER_ON	0x00
+#define  LEDCTRL_POWER_OFF	0x01
 #define  USER_BIT1		0x01
 #define  USER_BIT2		0x02
 
-- 
2.7.4

