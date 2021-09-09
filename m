Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3801A405F75
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344616AbhIIW0r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345835AbhIIW0j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:39 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A5DC061575;
        Thu,  9 Sep 2021 15:25:29 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id x10-20020a056830408a00b004f26cead745so4552061ott.10;
        Thu, 09 Sep 2021 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Hi3pqytord6VA6AZ/0fy4UVgNbJFo01Go8vz0Qkno0=;
        b=TSplS6Yn6eAoeV4ddIRj6XrP5QxQ8Xa9Y21MMWF2ELp6X5d9C677r47b+QL3CO3hmB
         BzegxKvURdRvBJbR7tJt9TgLBH5cs/Y0c7wGJsI1vtrPXDmKhe8SuYScGtMed9VAg+Mb
         169ZKk0ro/Q2sNc0pYSJHkAAT1sxCbmanu8Y1rOL0EPWIFlRxgMM5Hhmwewi2P8vex/1
         m7945xyUWTC5TG/7A3ip7l1MrEF/8BxiF7y6o+Kedy+CSxn70dKJIvcU29cm5L4rLXEr
         5JMyu0420EQqBrJ45LEeJAtdstCTFrOXBcLh3byS7aCrg78Hifj9xIuPDlQV74oQFl20
         +ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Hi3pqytord6VA6AZ/0fy4UVgNbJFo01Go8vz0Qkno0=;
        b=LnxFTsnmaWKjlkIsyfSSpQHULTC8TANL7kqkkai4VCQuS/TQXty2PMrY02AQ+qmmyJ
         OLCVURwoJqOpOi16hSaQL75/atcWTEBONvyapgRiOrsFZqjGum/mhxiUYgXhADWOjkLp
         EixTx+LSfyA4Dzt7fJA6+3jIIzYQ0Fq7lWtYzdYrSK3FJU3qGP8udmauRsccB6QCcYOR
         gOBG3A69VSTcXfRbHbB3tiKeJIVNfGaa+hy3r3J5ZoqDf0fASpmSUTwJMPG0XBGMNRuJ
         Q+CzyoFJBzIMZknebGaVMR9fgX010S0Nu6tD+hblEk+YYpdSHLbkircUVLnbB+cYxSP8
         9ukQ==
X-Gm-Message-State: AOAM532/ABAFiavp1o1Q7Nfyn6aQOJXh/bJmb61qH9JRJruKHaPCFH3M
        7KD+U6TSOh/GUDUj7zhxYGI=
X-Google-Smtp-Source: ABdhPJyxD4gYU6utv6Hj8J6aFumDEknFcUs+8upzTbGMx/d63HjKBngDqRqB9mqRuDxQnbK5zgakag==
X-Received: by 2002:a9d:7ccc:: with SMTP id r12mr1946300otn.350.1631226328999;
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 13/15] leds: trigger: blkdev: Add LED trigger deactivate function
Date:   Thu,  9 Sep 2021 17:25:11 -0500
Message-Id: <20210909222513.2184795-14-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove all device links from this LED

Remove /sys/class/leds/<led>/block_devices directory

Free per-LED data structure

Decrement module reference count

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index fff67ebd28f2..c7e101935bf6 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -435,6 +435,33 @@ static ssize_t unlink_device_store(struct device *const dev,
 static DEVICE_ATTR_WO(unlink_device);
 
 
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
+		blkdev_disk_unlink_locked(led, link, link->disk);
+
+	hlist_del(&led->leds_node);
+	kobject_put(led->dir);
+	kfree(led);
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
+
+	module_put(THIS_MODULE);
+}
+
+
 /*
  *
  *	Initialization - register the trigger
@@ -459,5 +486,6 @@ static const struct attribute_group *ledtrig_blkdev_attr_groups[] = {
 struct led_trigger ledtrig_blkdev_trigger = {
 	.name		= "blkdev",
 	.activate	= blkdev_activate,
+	.deactivate	= blkdev_deactivate,
 	.groups		= ledtrig_blkdev_attr_groups,
 };
-- 
2.31.1

