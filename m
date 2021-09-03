Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABFE400703
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350946AbhICUrP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351046AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE11DC061764;
        Fri,  3 Sep 2021 13:46:08 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id y47-20020a4a9832000000b00290fb9f6d3fso62600ooi.3;
        Fri, 03 Sep 2021 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ddUNcQWl43CcyLFdyW3CCnB77S01D/X70KFyP+iXI4c=;
        b=ipsAIcwXqpa3HRALAJ8Ax9ZLjmftpDoQjivvAZ7aqN1j+AT9X8gsoWfKitVQj/S5GS
         uOKloH6FP5VfDamTWFQKem54hYqp+xqQPKX6EelUTKcXHoTiqjYt2xCLeY1YGjQbHJs1
         nz4FbMQig2ESvuymDbZ7j7q4BuqxV68CjCjFht8Vzo3AzvbncVgH5cjP7qQODVwdQmZO
         lY4pU3Nwv9jbD790JAFQjSQS2hLRptfmUJ6RT7oRPsgdUU3bvATrwC8om/pRYWV0iBk/
         AIeIG844/0Ti/Tcm6nQATgMBBw56wk8Ng0pJUEG7epkfVk4bTV5DdbHTaMOrxngFJnY1
         He+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ddUNcQWl43CcyLFdyW3CCnB77S01D/X70KFyP+iXI4c=;
        b=lwE5lrOQjy+MZIbH+pRXNqFgqV4RTInEjLNc2A50077WhcqEAo6qvkLKprpkAkJmN8
         yw0HL5vDR2LMTIWbIFI/g8Nqx58/a/Msiyv9L2gcjZMXVtZ5Wxe3dq0fQFAIamX2YUEt
         gQ9ZWkwBh+VkSe6tWF0l/A2XcAnEVFieq/fuWdvPgHyhPHlEBCu7qGRnMW5E9EZdA3xb
         acFfEE69aGYYpqidowQK4Ys6P+2O551/0y65D8Ght5A4lYst5qQmv13J6yagwQ8WBAQh
         9oiDglinhTzMwfEFpFvR0KXgN+cpqjdzNj8JwqiUPN/c+ydGWABcn2Pvl7Fax+g43noP
         KvKA==
X-Gm-Message-State: AOAM533F6GUMmejImrfe7c6Jobp0gl8b3ZHhyzgxmwR3ebNt22Dnsjfi
        VjcctBn7YFhGgELvPqHqeWGW9iZBri3KMw==
X-Google-Smtp-Source: ABdhPJwzEIbXTXctAtsDHMnWh7Cs0nFhMKhNb16fZL5OhC33gZZPsxC4ofoBHR9jQePQoqfkF19uIw==
X-Received: by 2002:a4a:e499:: with SMTP id s25mr4627682oov.46.1630701967949;
        Fri, 03 Sep 2021 13:46:07 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:07 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 13/18] ledtrig-blkdev: Add function to disassociate a device from all LEDs
Date:   Fri,  3 Sep 2021 15:45:43 -0500
Message-Id: <20210903204548.2745354-14-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Called when block device is being removed

Called via __ledtrig_blkdev_disk_cleanup function pointer from
ledtrig_blkdev_disk_cleanup() in ledtrig-blkdev-core.c

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 7edbc48050a5..1be9de431c08 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -465,3 +465,20 @@ static void blkdev_disk_delete(struct ledtrig_blkdev_led *const led,
 exit_unlock:
 	mutex_unlock(&ledtrig_blkdev_mutex);
 }
+
+
+/*
+ *
+ *	Disassociate all LEDs from a block device (because it's going away)
+ *
+ */
+
+static void blkdev_disk_cleanup(struct gendisk *const gd)
+{
+	struct ledtrig_blkdev_link *link;
+	struct hlist_node *next;
+
+	hlist_for_each_entry_safe(link, next,
+				  &gd->ledtrig->leds, disk_leds_node)
+		blkdev_disk_del_locked(link->led, link, gd->ledtrig);
+}
-- 
2.31.1

