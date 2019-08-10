Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E2D88C9E
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 19:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfHJRzt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 13:55:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42148 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHJRzt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 13:55:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so47671899pff.9;
        Sat, 10 Aug 2019 10:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AVfMX6QMV6PyqWsJPtDzTdoOO2jzzS21Op+O5L+8L7o=;
        b=N7lbfhIpqmHugedPRlThgo1zTW075TGIwh7ISCztXOsmWo2iYU1OgHE+ofsd7qa1/I
         6fvlqI2D+7kXkVNioAIo943hXTyRoAsOliSAWjjFQsNtyHYd32IOMv7ej+G6NkpCa8XE
         oSknfnlzP2WfM+jlXlv3AFdgHkQHas4YQ4Eprj8aWgu/gNc4EY7/mu9B1UMh2rikEfig
         WQGQ23hr9gYBNuyfm22FG/iFONSI8YseuZi+xVAA1KrdshYt4qTMr44wenru9uqRsXBS
         O/ki7++iCiLqOAteQutNBugglv031kPnL023+5Oc/nkdLTKInqQXjguHTGaUzgEwu/Zx
         zChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AVfMX6QMV6PyqWsJPtDzTdoOO2jzzS21Op+O5L+8L7o=;
        b=JtDdGTwDup0TrRwHn+l+7bD8E2QkG5QO1D5WL4DUpCB+eLe6DegGa5mcf9wttVdkdQ
         eIOW/7ZTXq4r17HuDQg3XRYEI831fis6OjP+JOahDeGcO3WtpDV/0X3I+dSbp6JxnKdD
         ZDQzSC2f4KXrTDJ01EfHzctkyw186js0cj/povpt0bOPISJzm0e42vJoZGCtxfMX3fp2
         urb6FfeNhJ8MO1Sm7zRgT+4+924ZPJRxJRwcsPiSf+AH9BF8FppB+qJN7D6W56A1tFpf
         KlpIPFE7mX2VqW7ooMw8xpJV2hKjPK+xmAdPCILQQWw7G2HTNbG9hhl82xsHlJF7SroZ
         W6XA==
X-Gm-Message-State: APjAAAWIZ4gZqbl6Vqp+Adv3EQh2YQywDvvG9R9T8nQFwRZzCI3e1MZo
        Sx/7Ddv9TAL5vNQhFeWBVHqhcaezxU0=
X-Google-Smtp-Source: APXvYqwjSdrkeXQ+uvDURUhSgaO64jF+/9IW/MzfGhAlKHO7CZudOuJ9DFi/SFDlARo2GpOcC9Z2lw==
X-Received: by 2002:a17:90a:cd03:: with SMTP id d3mr152787pju.117.1565459748683;
        Sat, 10 Aug 2019 10:55:48 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:a137:2bda:e96e:808])
        by smtp.gmail.com with ESMTPSA id 185sm102146544pfd.125.2019.08.10.10.55.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 10 Aug 2019 10:55:47 -0700 (PDT)
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
Subject: [PATCH v3 5/6] ledtrig-blk: add interface to stop and restart polling disk stats
Date:   Sun, 11 Aug 2019 02:55:02 +0900
Message-Id: <1565459703-30513-6-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
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
Cc: Hannes Reinecke <hare@suse.com>
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

