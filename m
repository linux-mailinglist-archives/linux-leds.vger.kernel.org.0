Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE0A8F172
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2019 19:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbfHORAr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Aug 2019 13:00:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34639 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbfHORAr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Aug 2019 13:00:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so1635823pfp.1;
        Thu, 15 Aug 2019 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h/9CsJGmHC2k7mkEH3qy3JiPzHPuCIzjhAVDf1/O6Fc=;
        b=FG9XfN38rVy8J0Fx0L2GzzGLSo97RVUwi5K/zZqiLn2lB+N5hVN0/NnyMRhdtJ0nHb
         9UWP3HtGJQdgzzEQWnBNwQ5I6JURKASkwLfVMfrUu5BKJb7EYe34YPJ9xMiZMoyH1Mfs
         gbvcp8DAu2ZNh+aiO2+ssoENG2ZFJkRXkUmYFt2Ggm+f0H3pvIt7sSpYsaGTDz5TI+ia
         Wp4ySYiQGhfdydmfXelMl45OEtN4zux54nxMopIYN1l9Vah3SP6F6G7MZhIzcIevGCHy
         jYOv3ccTVCusx29O4rEa74Fd7DvZTqjPuNiu/OTkq27COxtdjAJT/e9QCdzXDxpteiTE
         DgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h/9CsJGmHC2k7mkEH3qy3JiPzHPuCIzjhAVDf1/O6Fc=;
        b=ccIMovtx0zWqCDGN9y9njIjc3UPqXUEDyV3r4G68uLP7H0UaHrkmdY8p7WkBWgXcCI
         6iOJN3Sy7kBVZmHXEUQqaZ3WJN9bu/eHe907BjnVSNO+mpkXr9t95etkNvSxd6LQXUSP
         TKRLuEDG51UpN2efmZQ5PhHskWh5iMXdDJr7+4MLF6p3pXGeSR8EM+lic52u/R3afiJM
         3yQShAb9HdEL0b7nXF5M8Hsx5WTjlXtFWj/uikssWYSoeXOhi5Xmlh1NOCZOuJQNC9Zo
         s3WODHIkfSUqcZImiif4+YVhRnxMKLyUCGpxgDv8YDzxiFYO8kikqjY1DKHxmzWvT/cP
         ndig==
X-Gm-Message-State: APjAAAXeRbxM/U7SakDQjlFzeBSntbrhZt2zbEAS6inY8zlS+AcpoIeH
        bSHF00vf5BqEAE9CU50+GHW7AdFfhWo=
X-Google-Smtp-Source: APXvYqx5Y2iCVnEH/8slULuy/zuvvskR3ra4nGVYiDkW+XMdYezUCKW03mAvHWTYTragLPLC5z2pgw==
X-Received: by 2002:a63:2705:: with SMTP id n5mr74184pgn.224.1565888446274;
        Thu, 15 Aug 2019 10:00:46 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:12:b19f:559d:7305])
        by smtp.gmail.com with ESMTPSA id b30sm3943942pfr.117.2019.08.15.10.00.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 10:00:45 -0700 (PDT)
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
Subject: [PATCH v4 5/5] scsi: sd: stop polling disk stats by ledtrig-blk during runtime suspend
Date:   Fri, 16 Aug 2019 01:59:59 +0900
Message-Id: <1565888399-21550-6-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
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

