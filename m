Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535E94006F5
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351021AbhICUrE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351014AbhICUrE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:04 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F70C061575;
        Fri,  3 Sep 2021 13:46:03 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id e206-20020a4a55d7000000b00291379cb2baso55288oob.9;
        Fri, 03 Sep 2021 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9hutJg2NBiDrRLjL630z/kyOrNBO2Ri17VCGD1drxqg=;
        b=YqUn9X87uDQ72AcDlg5wG6xYmQhH2fKHaIvHG8v214clxBCXz6TpORsfhGbUEs8bsj
         sJDcf5lQzVpfaguLmxZCJ+PATWHalPIx3ln16bL63QIIIKHvAUjXcZao+uSDzbF+iPSK
         ofy1FGttltLAaSC/A8vbJ0lpkG1YvgT2IscBaQ9/k0DP4qe9Vv0DfnGxokW4uA0P+6MW
         UELET05KgwUOtMtXqnbKemlkoeWqYHdxwA3dr3Vug83LV0GJ/Q2eITLgdBZcgvvuJb4D
         FZOsEeRUmlCQltqqlsBfGBzqdSf+ADPT0k26hDjoZX4yDjXC16PZAt5Hdhs4lKOiua2F
         444A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9hutJg2NBiDrRLjL630z/kyOrNBO2Ri17VCGD1drxqg=;
        b=IfUZOS1IZr6WhzqjbHr9ngaIzsUNr0qCxWGMLwLainoPkNBkxCkWFnlWjWNxXzHfQE
         u4b73sZEEwT1yP5nJ0ACE9K04nX9o5ossh9oRqimOW5rPRJR++rgzrojzHhIX3cHFro9
         pBI7Gd2tWzYphokNg++wse92O79VRX9s1Br0DgbG0vKNcoHoWhBBATBkrRffXbShYi6d
         a5dRk64QOraCy4y1NUSStrj3WtzI8SWZ4/4vXlqIyPO0Z3lbUe0ATh8YSjeruuqZYcBW
         Z+ZDmFS3CtdSvCmyteTTN6vthl6Lt6p99CKjEZUf2tiePEL8BoAtcUgeYZHRkSK9YPG2
         iLvQ==
X-Gm-Message-State: AOAM532i7BEiz3BsBgt1I7Ih+wIhpD4cqpmWxWJmEp36wf74jqczCU3d
        cxQrwd3/B2+WuXe72X/ivD4=
X-Google-Smtp-Source: ABdhPJziDAbdC/tf8Dp+x6Dsi6PvljSnfhKwBvGK0jCh8Rr8pUAoi7abSwksgTapYDvZPhKAFPRbQA==
X-Received: by 2002:a4a:245c:: with SMTP id v28mr4542463oov.3.1630701963108;
        Fri, 03 Sep 2021 13:46:03 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:02 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 07/18] ledtrig-blkdev: Add constants, data types, and global variables
Date:   Fri,  3 Sep 2021 15:45:37 -0500
Message-Id: <20210903204548.2745354-8-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 8cbeb80697ae..db8326874400 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -14,3 +14,55 @@ MODULE_DESCRIPTION("Block device LED trigger");
 MODULE_AUTHOR("Ian Pilcher <arequipeno@gmail.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(LEDTRIG_BLKDEV);
+
+/* Default blink time & polling interval (milliseconds) */
+#define LEDTRIG_BLKDEV_BLINK_MSEC	75
+#define LEDTRIG_BLKDEV_INTERVAL		100
+
+/* Minimum VALUE for interval or blink_time */
+#define LEDTRIG_BLKDEV_MIN_TIME		25
+
+enum ledtrig_blkdev_mode {
+	LEDTRIG_BLKDEV_MODE_RO	= 0,	/* blink for reads */
+	LEDTRIG_BLKDEV_MODE_WO	= 1,	/* blink for writes */
+	LEDTRIG_BLKDEV_MODE_RW	= 2	/* blink for reads and writes */
+};
+
+/* Trigger-specific info about a block device */
+struct ledtrig_blkdev_disk {
+	struct gendisk		*gd;
+	struct kobject		*dir;		/* blkdev_leds dir */
+	struct hlist_head	leds;
+	unsigned long		read_ios;
+	unsigned long		write_ios;
+	unsigned int		generation;
+	bool			read_act;
+	bool			write_act;
+};
+
+/* For many-to-many relationships between "disks" (block devices) and LEDs */
+struct ledtrig_blkdev_link {
+	struct hlist_node		disk_leds_node;
+	struct hlist_node		led_disks_node;
+	struct ledtrig_blkdev_disk	*disk;
+	struct ledtrig_blkdev_led	*led;
+};
+
+/* Every LED associated with the blkdev trigger gets one of these */
+struct ledtrig_blkdev_led {
+	struct kobject			*dir;		/* block_devices dir */
+	struct led_classdev		*led_dev;
+	unsigned int			blink_msec;
+	struct hlist_head		disks;		/* linked block devs */
+	struct hlist_node		leds_node;
+	enum ledtrig_blkdev_mode	mode;
+};
+
+/* All LEDs associated with the trigger */
+static HLIST_HEAD(ledtrig_blkdev_leds);
+
+/* Total number of device-to-LED associations */
+static unsigned int ledtrig_blkdev_count;
+
+/* How often to check for drive activity - in jiffies */
+static unsigned int ledtrig_blkdev_interval;
-- 
2.31.1

