Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8D5702DF
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 17:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfGVPAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 11:00:03 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40807 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfGVPAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 11:00:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so19279671pla.7;
        Mon, 22 Jul 2019 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H/mgA5Q6Tay1+ixdoqgmaZ9E59OoWK8q1G0jb5mfWTU=;
        b=T/wva0ycJqMHPLQKhAXy5V2lfzKN76yWpvWsrPHtca0NDIyzmovmqZgvwVqF14v2L8
         fBrD47foZqJBwmOlF5kvBbL5MtnGVvtp6/bOZvyElrrjnl63poUJtgV/ycVD0VAkKCe0
         IJWuezmPWL2Onh1qDU+eD3K5ATWu2YrINCgSIrdoGFLXUa5IyTfvzNGUJAblJbCNi3p5
         8fPvWMfBE8yA5Y1Gts097/nIort/T/1wP1L1J4wFIhOKveGGWVIYyN8/YbCTc6HmCYI5
         r7xdAi1ReLdIIJwpHR+9VK//9e7Uz4d7vSNv9p/9skFEMIpNHEgnPE1wGq4kbPK2N+3H
         Pqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H/mgA5Q6Tay1+ixdoqgmaZ9E59OoWK8q1G0jb5mfWTU=;
        b=qk9NDY1hPvmnCl8i9A0F9d2RFvKbdlcFeA4u9M8vuU8PMSwhvQkg25xHCNDWCggQcs
         Af//vCouwZJaVuAP3WvlLMVVpm/ayRbNU7jOaz+XMEskCKAvNKZxQ9NNXd8Q8HX0n9EN
         oi2pQZmKYxmvwFbf8SNL9Xh99iXv15f0IfEGvvd1iHeTs1e/lYx0tZHcm+QfEekK5HbN
         bPyeeY+eT081Y7tjDRW7Qr7U0O5+imXEuZgKRiaUNTAQbsJ5n0ICM3ne6koy340LBEl9
         nENBOCwaqCPHB9gSpW/4xLkAIqASyfUIJW7G1q5gtVOBk/lm5ZRT7do56hPbsQm0m9KZ
         3Ndw==
X-Gm-Message-State: APjAAAV2WpQwxynm//oihyc7koHoml4T3btjtw/ju+CXI6JKqaYhzsN9
        08Kc4x45b5JbZMSqC5cYi6Jpi8wV
X-Google-Smtp-Source: APXvYqxgJ+C74y1G4cEu9kZN1sEr0LOAv6Ih4XmhsV8n8HLqX2VM3eQps23ZbUAPOuHVbaq3um9WrQ==
X-Received: by 2002:a17:902:8ec3:: with SMTP id x3mr74560918plo.313.1563807602716;
        Mon, 22 Jul 2019 08:00:02 -0700 (PDT)
Received: from mita-MS-7A45.lan (KD027092233113.ppp-bb.dion.ne.jp. [27.92.233.113])
        by smtp.gmail.com with ESMTPSA id a16sm42533174pfd.68.2019.07.22.07.59.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 08:00:02 -0700 (PDT)
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
Subject: [PATCH v2 3/3] scsi: sd: stop polling disk stats by ledtrig-blk during runtime suspend
Date:   Mon, 22 Jul 2019 23:59:12 +0900
Message-Id: <1563807552-23498-4-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
References: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
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

