Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BF33F10C2
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbhHSCwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbhHSCwC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:02 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0F5C0612A6;
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id h7-20020a4ab4470000b0290263c143bcb2so1381839ooo.7;
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NFCrLsUf9iuGl/q7hZ+9DQ2aeBND1LI3Kn0Axyc++as=;
        b=OYfl89r0BeFvZj9WgsBh4ULLcCMgIlMtVpPcn7MgL8jU9BnXFYrl9ewYrBaoCHYYcK
         jH4ZzAZ+JiBJ+j1YlY/SrDh379Vb+tK8lNJOEyIihErgf015nK5Ek9uYy7Bkd1YLv3wd
         eFov81p24ptv31Eaa0wnHqdaJcDkebr8FpntNtJhHCzeywdtAlaxwwYBk/ZGmKeRRss4
         H+ai5iRW8wXt6wGuX1B+hZi2hLyUvkLAVM2Tj8EfZXzgazZuGz2tCfGOq/YHjAFsotJN
         F1rltQ4NaDL+6gCjkDwTq5ztKzRVp52j9oNS0GO06Qsqw+LjET5cvfYxPyY8wqOB3+Wj
         XeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NFCrLsUf9iuGl/q7hZ+9DQ2aeBND1LI3Kn0Axyc++as=;
        b=tnvPKmDXPGbEJ8KqIEgH7aeLIjxfqKniRRzOuoIKmuMrKeQKR/Cekk225/HBQV3XCc
         widGBxYbR3FHlFJkFBmADE1AwoRs1KBxeZDSZiqOWkgNjis9HuStUHQEA4vxV2mPyfGD
         ViSUtw4Ryn/aEaXXVAl6YiYocXyBTxQ79YfNX8fbLTZazNmhxxQGgkZNiqIMR+iOELd8
         uoK0FcOWUfgLAF2z621XYrs1VXegRKT/O1WBtILJizr4EGWX/80P6m2FhNJXiH35scSK
         KsRndg4S91+rSIQ1BzsbhMIvaivRk6jkKpcW7AjJF3lFkWpv+yVqGZmN3vT8oy5fcSZB
         E/2Q==
X-Gm-Message-State: AOAM5315GrAlhuwHWa8/U7ZMHMYLLcCG5nJgL/0Q1ChrUK3EtLudbS5P
        b25Yvcrgld/4JTZMDL4ArwJ7dE70aW87O7rP
X-Google-Smtp-Source: ABdhPJyEYp+hyhDJ9HYn/93RsENi587CsY41MMGvUBgUSjy/qm7Llwt7TEvTVXNRKTNH1OLwvjBhBg==
X-Received: by 2002:a4a:3f01:: with SMTP id e1mr9521891ooa.86.1629341476315;
        Wed, 18 Aug 2021 19:51:16 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:15 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 16/18] ledtrig-blkdev: Add function to disassociate an LED from the trigger
Date:   Wed, 18 Aug 2021 21:50:51 -0500
Message-Id: <20210819025053.222710-17-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove all device associations with this LED

Remove /sys/class/leds/<led>/block_devices directory

Free per-LED data structure

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index b331e3f24b04..01573c1ad855 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -704,3 +704,28 @@ static int blkdev_activate(struct led_classdev *const led_dev)
 exit_return:
 	return ret;
 }
+
+
+/*
+ *
+ *	Disassociate an LED from the trigger
+ *
+ */
+
+static void blkdev_deactivate(struct led_classdev *const led_dev)
+{
+	struct ledtrig_blkdev_led *const led = led_get_trigger_data(led_dev);
+	struct ledtrig_blkdev_link *link;
+	struct hlist_node *next;
+
+	mutex_lock(&ledtrig_blkdev_mutex);
+
+	hlist_for_each_entry_safe(link, next, &led->disks, led_disks_node)
+		blkdev_disk_del_locked(led, link, link->disk);
+
+	hlist_del(&led->leds_node);
+	kobject_put(led->dir);
+	kfree(led);
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
+}
-- 
2.31.1

