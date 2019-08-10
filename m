Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90AE88CA2
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 19:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfHJRzy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 13:55:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33044 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHJRzy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 13:55:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id g2so47693129pfq.0;
        Sat, 10 Aug 2019 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h/9CsJGmHC2k7mkEH3qy3JiPzHPuCIzjhAVDf1/O6Fc=;
        b=ezPjll7Lb5sAV1hP9STQ2H5TEWxJogWsWbSW7y+KFt8hKb48Uc6nbNCEiJHuxAeqHA
         7UzTKft2gkU9gK1+83GaQU5HrmqlshJxETLy3P6NAhzmzEBEszr7pLK7w25zRBbjySqp
         OZOQE4fBLDV0iLkIPzRy4UWpRD4RDqG+pn3hclJ0igWjzJuvdukgkXmHdZ7VVK0P/BA2
         /0ZLPBDn1A2xu1bW572g7bTPIXOw96XakrAKTDe99583c+Y+UWTiUSPe8IfmYwMdFpj2
         +v/drnpSO1KPgGt3c2SzbPrWFp4r2t5jFN6KYVe88i03JTpkqghSKG8o7sK8+4HN3b3T
         +V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h/9CsJGmHC2k7mkEH3qy3JiPzHPuCIzjhAVDf1/O6Fc=;
        b=K5XyPcRZaAYQI19IRaZsOek3hyc6sO+2RcZ7vNBdL68ASXqW31Q6wohHbG7Ic7tmNc
         QaUq9VnIgeLVOyYVrdoIGmbvujJGgVAFDs7qCY1yzmmHXESA+PxKAsTyH0k0gR0AWmWq
         8NlFF1Q4IxlzEFt1xeOarRqHURNskacGysjEuiKOzJW/gWMHrKaZNekqvR1jgGD0fJpL
         12N4adYqL8p6wZbEEXvFTS13p7DORP/L6BChRkrzqmLDYka/Lv4OuCXky9I/KfgmAhRy
         uSs5yiJS2l4nkjBpCU6WPd8MLlatpe375RK+oveRQN29OBxbfhh/uyfjmJTvxAIpDCne
         2gvA==
X-Gm-Message-State: APjAAAU2f4F+zD7AqDGGTSnZMJWaJi+S6E4OYxQ+V4AeEVtpEng0fYMN
        wrPQJAmiTQHu4hOvqcV0jJvK6H/MF8U=
X-Google-Smtp-Source: APXvYqzF2UwGISoFhldo7ZZvtdBY4gBhWZntLgvppdH9tAoUWH7GgkeTyFQlSEYAwteeWPypa4ORuA==
X-Received: by 2002:a17:90a:2041:: with SMTP id n59mr15025439pjc.6.1565459753633;
        Sat, 10 Aug 2019 10:55:53 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:a137:2bda:e96e:808])
        by smtp.gmail.com with ESMTPSA id 185sm102146544pfd.125.2019.08.10.10.55.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 10 Aug 2019 10:55:53 -0700 (PDT)
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
Subject: [PATCH v3 6/6] scsi: sd: stop polling disk stats by ledtrig-blk during runtime suspend
Date:   Sun, 11 Aug 2019 02:55:03 +0900
Message-Id: <1565459703-30513-7-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LED block device activity trigger periodically polls the disk stats
to collect the activity.  However, it is pointless to poll while the
scsi device is in runtime suspend.

This stops polling disk stats when the device is successfully runtime
suspended, and restarts polling when the device is successfully runtime
resumed.

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
 drivers/scsi/sd.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 149d406..5f73142 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3538,7 +3538,7 @@ static int sd_suspend_common(struct device *dev, bool ignore_stop_errors)
 {
 	struct scsi_disk *sdkp = dev_get_drvdata(dev);
 	struct scsi_sense_hdr sshdr;
-	int ret = 0;
+	int ret;
 
 	if (!sdkp)	/* E.g.: runtime suspend following sd_remove() */
 		return 0;
@@ -3550,18 +3550,16 @@ static int sd_suspend_common(struct device *dev, bool ignore_stop_errors)
 		if (ret) {
 			/* ignore OFFLINE device */
 			if (ret == -ENODEV)
-				return 0;
-
-			if (!scsi_sense_valid(&sshdr) ||
-			    sshdr.sense_key != ILLEGAL_REQUEST)
-				return ret;
+				goto success;
 
 			/*
 			 * sshdr.sense_key == ILLEGAL_REQUEST means this drive
 			 * doesn't support sync. There's not much to do and
 			 * suspend shouldn't fail.
 			 */
-			ret = 0;
+			if (!scsi_sense_valid(&sshdr) ||
+			    sshdr.sense_key != ILLEGAL_REQUEST)
+				return ret;
 		}
 	}
 
@@ -3569,11 +3567,14 @@ static int sd_suspend_common(struct device *dev, bool ignore_stop_errors)
 		sd_printk(KERN_NOTICE, sdkp, "Stopping disk\n");
 		/* an error is not worth aborting a system sleep */
 		ret = sd_start_stop_device(sdkp, 0);
-		if (ignore_stop_errors)
-			ret = 0;
+		if (ret && !ignore_stop_errors)
+			return ret;
 	}
 
-	return ret;
+success:
+	ledtrig_blk_disable(sdkp->disk);
+
+	return 0;
 }
 
 static int sd_suspend_system(struct device *dev)
@@ -3589,19 +3590,24 @@ static int sd_suspend_runtime(struct device *dev)
 static int sd_resume(struct device *dev)
 {
 	struct scsi_disk *sdkp = dev_get_drvdata(dev);
-	int ret;
 
 	if (!sdkp)	/* E.g.: runtime resume at the start of sd_probe() */
 		return 0;
 
-	if (!sdkp->device->manage_start_stop)
-		return 0;
+	if (sdkp->device->manage_start_stop) {
+		int ret;
+
+		sd_printk(KERN_NOTICE, sdkp, "Starting disk\n");
+		ret = sd_start_stop_device(sdkp, 1);
+		if (ret)
+			return ret;
 
-	sd_printk(KERN_NOTICE, sdkp, "Starting disk\n");
-	ret = sd_start_stop_device(sdkp, 1);
-	if (!ret)
 		opal_unlock_from_suspend(sdkp->opal_dev);
-	return ret;
+	}
+
+	ledtrig_blk_enable(sdkp->disk);
+
+	return 0;
 }
 
 /**
-- 
2.7.4

