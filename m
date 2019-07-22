Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCC2702DB
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 16:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfGVO7u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 10:59:50 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36839 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfGVO7u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 10:59:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id k8so19336113plt.3;
        Mon, 22 Jul 2019 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KA1oHbf5AMmxiV0udJaNL+9jpzt1sO1/94tgTVwHPuU=;
        b=HTBPjmcCLPRJk5zA/PwD52IgrOZz5DgvIPTBdD1fyePEgBUWP7doAm8VdR3PGw1fA7
         NJile9oMFoHdWtGpD2w68+44WHdla5npQDnFEiFm8hgyyiSOUTXCPazPenVZd+NdEFYw
         PRbd8B1nFOHd5wMjBzjZk+Ydkou60Z0edwdNm9EoFn3v8J3mmdvdUBb2akL6uhbd4d0c
         tpYV3QFUWY/Wc665JGiXHMzYB0N2gGY7VpxWDxjyNBgOMRbmDeeifSwpCPCIZOh8jYp/
         ZHvTV0DXNZkEcDqE2y6t3LC6IMDaZi3BXIQkjRdm4TFzp/fTP17bRuMk+9DjlsJe5nD+
         /5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KA1oHbf5AMmxiV0udJaNL+9jpzt1sO1/94tgTVwHPuU=;
        b=UdSwmP77xel5nMdbySk0D+dH+TACHJBE8yciwYwQpMmEHAKjOfMhyiOMYC9NxRTVKz
         ZFsr/RUWfZ/urF/Pq17TYC2DGIrXRtmQo/1MdEngDa6by2guOhXEENJvRt6nPCM4rnW6
         +qNRDfPMz4+KvXJX7Z91DEkUAd2Ofaar+khtCAea1IhqxyxC3CNoVTjrt8RYZS5ieD2d
         XkGSLvMo5VYBNtQZqPGNPHTmb/rzFiC4vPgulJLFVeZe48R/cpyaMYFDT/JPoHAk4dLJ
         xA+F0eNCDg8NxR4+FOkcYWXQgDgzWwKvrQN0ugU3bO11X8tiFDpGTztcfT67H52rtIeY
         5XfA==
X-Gm-Message-State: APjAAAUoYezG8tBTeZxokyILfdQQ1zJ+2GQzumaeIcZVxvZ5cHBYW0OY
        UsQ4QbD2muPc9NYi+F7VkDm7Iuhf
X-Google-Smtp-Source: APXvYqwhqAhgaFbhJQ1eHJw8AEBtYiAZ8bPwNSOU0oXSkMOCIcnFBI4r/zMG23rwhQXF4p3wLDeQbg==
X-Received: by 2002:a17:902:8509:: with SMTP id bj9mr76505337plb.79.1563807589710;
        Mon, 22 Jul 2019 07:59:49 -0700 (PDT)
Received: from mita-MS-7A45.lan (KD027092233113.ppp-bb.dion.ne.jp. [27.92.233.113])
        by smtp.gmail.com with ESMTPSA id a16sm42533174pfd.68.2019.07.22.07.59.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 07:59:49 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ledtrig-blk: add interface to stop and restart polling disk stats
Date:   Mon, 22 Jul 2019 23:59:11 +0900
Message-Id: <1563807552-23498-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
References: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LED block device activity trigger periodically polls the disk stats
to collect the activity.  However, it is pointless to poll while the
block device is in quiescent state.

This provides an optional interface to stop and restart polling disk stats
for the lower-level block drivers.

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/trigger/ledtrig-blk.c | 37 +++++++++++++++++++++++++++++++++++--
 include/linux/leds.h               | 11 +++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-blk.c b/drivers/leds/trigger/ledtrig-blk.c
index d5808c9..6b826ed 100644
--- a/drivers/leds/trigger/ledtrig-blk.c
+++ b/drivers/leds/trigger/ledtrig-blk.c
@@ -153,8 +153,9 @@ static void ledtrig_blk_work(struct work_struct *work)
 		trig_data->last_activity = activity;
 	}
 
-	schedule_delayed_work(&trig_data->work,
-			      atomic_read(&trig_data->interval) * 2);
+	if (atomic_read(&disk->led.enable_count))
+		schedule_delayed_work(&trig_data->work,
+				      atomic_read(&trig_data->interval) * 2);
 }
 
 static int ledtrig_blk_activate(struct led_classdev *led_cdev)
@@ -190,6 +191,36 @@ static void ledtrig_blk_deactivate(struct led_classdev *led_cdev)
 	kfree(trig_data);
 }
 
+void ledtrig_blk_disable(struct gendisk *disk)
+{
+	if (disk)
+		atomic_dec(&disk->led.enable_count);
+}
+EXPORT_SYMBOL_GPL(ledtrig_blk_disable);
+
+void ledtrig_blk_enable(struct gendisk *disk)
+{
+	struct led_classdev *led_cdev;
+
+	if (!disk)
+		return;
+
+	atomic_inc(&disk->led.enable_count);
+
+	read_lock(&disk->led.trig.leddev_list_lock);
+
+	list_for_each_entry(led_cdev, &disk->led.trig.led_cdevs, trig_list) {
+		struct ledtrig_blk_data *trig_data =
+			led_get_trigger_data(led_cdev);
+
+		schedule_delayed_work(&trig_data->work,
+				      atomic_read(&trig_data->interval) * 2);
+	}
+
+	read_unlock(&disk->led.trig.leddev_list_lock);
+}
+EXPORT_SYMBOL_GPL(ledtrig_blk_enable);
+
 int ledtrig_blk_register(struct gendisk *disk)
 {
 	int ret;
@@ -203,6 +234,8 @@ int ledtrig_blk_register(struct gendisk *disk)
 	disk->led.trig.deactivate = ledtrig_blk_deactivate;
 	disk->led.trig.groups = ledtrig_blk_groups;
 
+	atomic_set(&disk->led.enable_count, 1);
+
 	ret = led_trigger_register(&disk->led.trig);
 	if (ret) {
 		kfree(disk->led.trig.name);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 395fa61..fd2eb7c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -523,8 +523,11 @@ struct gendisk;
 
 struct ledtrig_blk {
 	struct led_trigger trig;
+	atomic_t enable_count;
 };
 
+void ledtrig_blk_enable(struct gendisk *disk);
+void ledtrig_blk_disable(struct gendisk *disk);
 int ledtrig_blk_register(struct gendisk *disk);
 void ledtrig_blk_unregister(struct gendisk *disk);
 
@@ -533,6 +536,14 @@ void ledtrig_blk_unregister(struct gendisk *disk);
 struct ledtrig_blk {
 };
 
+static inline void ledtrig_blk_enable(struct gendisk *disk)
+{
+}
+
+static inline void ledtrig_blk_disable(struct gendisk *disk)
+{
+}
+
 static inline int ledtrig_blk_register(struct gendisk *disk)
 {
 	return 0;
-- 
2.7.4

