Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D85D3F10A5
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbhHSCvm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhHSCvm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:42 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E87FC061764;
        Wed, 18 Aug 2021 19:51:06 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id t35so6465436oiw.9;
        Wed, 18 Aug 2021 19:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3RRDN8bijQwsoqPWVruCdSUNXKFKGVON2X6+jAlmv4=;
        b=Tjeeecq3I7NTk2XXKM1NItrtNGA67sP5QkkQUdNCDSnFgmgqxJ7Xx0ICeV0+mPCHT8
         2CSBX5jkn+g/eH4u0M7TDj0k59qSa3p/1Ks1JZKuctF33WyHC3JYo5BulUg/D9F5+ZpZ
         R8FdZPO24iYt4tfIPLg2e3RY+vOUNQU5oSrCD+xu2NydukYLf+zqGbbo+Xw46GMWQXG9
         u/l6tICTfZwiJYmEdruNvHMoJtsvEYaZmPBkX3+yAnEWI2BP9CfFeHAjxUBcuAlBnPpN
         5JcGGrVBPUlyLQQUbgMvF1i8ikMcZerq6s4bby93r/4s+1y54uspc/ZULjTSHLrOD5Yw
         btJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3RRDN8bijQwsoqPWVruCdSUNXKFKGVON2X6+jAlmv4=;
        b=e0ycrNfnYhQ7fimYz2uSBVTwIUAfzOmIHfU6tQJpZNW/3TTm5u/JqFE5Xu6iadOBpv
         JFCMx60JfJ3Jzkazs8q/MQsmEpuYGC03qbAy1rvTqeGG7vcAQvibFvktUzY58ZgdeHrN
         kX4Tr+94NWNvsvnU13QhSW9IPXdRTtmU4S3BcKfIMjSgu0Ao8O//9WxfjC/1iHw692RC
         xcivmaIz4ovp5qXT7oagZ3osxTZgs3srLARqIK6Ef3lGu//iKiUen3NDVt0Di0IWEoTY
         ViSwL/JNhopD1YnqzcMdUZ1yDXoepvHm4Il2aLaPZBm44MFmsIi2y+RfWmQ+lF8CGwCj
         yMVw==
X-Gm-Message-State: AOAM5333UVC5jlKW4FI9oTzZyI89vWDdN2+fnf2TEVC/MkL+aoIxNnEj
        7PyCksS/jmuT794myoeoGc/5p7VIwGDLjuYf
X-Google-Smtp-Source: ABdhPJwrEUeY8+ucrN8skEp2O7F2N3gAPfSbef8yyOI5DdbmJnCQv5hk7cpZAddbN3hgLeZMvyhI6g==
X-Received: by 2002:a05:6808:1442:: with SMTP id x2mr1011606oiv.162.1629341465681;
        Wed, 18 Aug 2021 19:51:05 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:05 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 03/18] ledtrig-blkdev: Add file (ledtrig-blkdev.c) for block device LED trigger
Date:   Wed, 18 Aug 2021 21:50:38 -0500
Message-Id: <20210819025053.222710-4-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add data types and global variables

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-blkdev.c

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
new file mode 100644
index 000000000000..28ccbd7946ba
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *	Block device LED triggers
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#include <linux/leds.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
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
+	struct kobject		*dir;
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
+/* Must hold when changing trigger/LED/device associations */
+static DEFINE_MUTEX(ledtrig_blkdev_mutex);
+
+/* Total number of device-to-LED associations */
+static unsigned int ledtrig_blkdev_count;
+
+/* How often to check for drive activity - in jiffies */
+static unsigned int ledtrig_blkdev_interval;
-- 
2.31.1

