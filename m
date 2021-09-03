Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39159400705
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351034AbhICUrQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351025AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B55BC0612E7;
        Fri,  3 Sep 2021 13:46:09 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id c79so656749oib.11;
        Fri, 03 Sep 2021 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=so5+kyaOT/da0yN0VU0aGvAcY1qRuzguWXk7JsxCV3I=;
        b=hzrwMsmM+ATPHkRe37Oo+sor+vUW/bOXGAgAYXXemRHsPcd0t2/gLVOzUc+7DTjhgE
         jW8AmGMgOwbsXRmICx2q3bwzdNbx396Ubz5LD6XddJ23t9nNQpQlptNz4/mPNlriBQQn
         ZlaPwgBe5CWCesF2xbl4PNVrOVoDjoz7gf1TjPDk/lEoN+jwKQ8tv+sVfrKBXo8seY6z
         ItFA+SjTykqCS2I93HwkyzHNSAar43qx8o5Ez7AnH74cFPRDIbSmoCqdj6kzF/ovu9WG
         3EA5Lg97xm4V8ZQFqNNnnHfGCmWRCVncdHgEHumCwy4aRQodo5YnqH04IOZiyX7VdiPu
         mTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=so5+kyaOT/da0yN0VU0aGvAcY1qRuzguWXk7JsxCV3I=;
        b=Y3ohORy2XAUoMOac5m7s6ngf/oiGSv29GeVa2tTn5jULbmDFo1CczkskQKL/satfAS
         3Hoe2ZAIg1VI/qKyiXY96gR0ljb7HQUfnWMyHGYcSaQdtv+O6lVs7b742T33z+NfNxtU
         2NrrcXa1BFrTcMEszn5gw3FGwitEsJ7/mCteV9rgMtsxiQbJVI30T2j/DDbRkENz4xrN
         W1hdshIagjI63o55VmD9yNSrFfjDqSkALyD76M+pesim6PMUncMkutSiYnT/QGs9cJqx
         BhnZLpFp8dGMdhHcexnXfPD97FKjYv+qJRATo4jBnFCg09H3EcAgddMLt+9jxcQc8W6I
         BwsA==
X-Gm-Message-State: AOAM530dW6KtDdR6ui0iGlz7UxKuLBs2BUlkP/8sOIesUALM6gIN3Hkn
        q/FuNx9SVYRzYA1/qUp0BZ8tF9nvU4V0/g==
X-Google-Smtp-Source: ABdhPJxKL7Xk/ofGbnnwIQEaMAz849nh4xwbj1xHV19pizZY4ZvAc0D5CZfYxv8uQt7UcDCDJmyJGw==
X-Received: by 2002:aca:241a:: with SMTP id n26mr537523oic.137.1630701968664;
        Fri, 03 Sep 2021 13:46:08 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:08 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 14/18] ledtrig-blkdev: Add function to disassociate an LED from the trigger
Date:   Fri,  3 Sep 2021 15:45:44 -0500
Message-Id: <20210903204548.2745354-15-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove all device associations with this LED

Remove /sys/class/leds/<led>/block_devices directory

Free per-LED data structure

Decrement module reference count

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 1be9de431c08..b2ec85b805d0 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -482,3 +482,30 @@ static void blkdev_disk_cleanup(struct gendisk *const gd)
 				  &gd->ledtrig->leds, disk_leds_node)
 		blkdev_disk_del_locked(link->led, link, gd->ledtrig);
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
+
+	module_put(THIS_MODULE);
+}
-- 
2.31.1

