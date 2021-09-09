Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30941405F5E
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345311AbhIIW0h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345235AbhIIW0g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:36 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F1FC06175F;
        Thu,  9 Sep 2021 15:25:26 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so4559121otq.7;
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ytqfu1+r4YEz0nqSMNay+oDma8axhIPc/igiM7FRwE=;
        b=XSmErYRWdzMOC+MCLstVHqd9cwXygzDnbVImyZGh5WrECSfUbKkIhY+Z9kjAAHYPfh
         pnxoo3h/x4D58u7mVL2KmcA6qlx1e8VFOFWkCwk2Xk1lL0lVXSoC0fzmAfhupd6cljjx
         sXZX3bs+326Qe+S5704phqCBt2QIEp0yY+kNLByZAiOoYZQ6oBHtTEFQwL/jdof0HgI4
         slC8AZGH2q5+w0NZOWq3lR/DNlGllCIuPNrSeGOpkGEqFgNSfLJexam+UxhO2LqVMHRb
         E+ZGIdH2usWMZ/cxdHVGZ2V2faIPZz3WvXEJJx41BbQTK1vqeBdR7Gjjph3jULyg2xmR
         mu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ytqfu1+r4YEz0nqSMNay+oDma8axhIPc/igiM7FRwE=;
        b=T6mriN9TnJxkELtgoHrv24isR534qm9zN/DI8B+CJaM/5Ku0H+s6GmYevNEVHpZoaV
         obQNgaOXQGpYBx7zG238eMrJdeAEwRW6ckhTQCl/DEEb8V4TKiACqt+2iqT4N9LKGuuM
         ixOdZNAxEzBaHgCUbCtOsNifYCb6uuk2JMPf0mPp6HvVwUUjLitH5IQJBAzet6s/rbVT
         WVJGr/yJhlUj1g2++iu7kJ46AjVMUr4nlCfkiBPJzygjg5JPkLubGYiFsZRhyEH9HBMw
         +hoxVkWTAQREbzv6UEZwmNqbrORMOD0sXyF/grlob3ijePxQML2Fo1B1i+Bt6R5g1Uh/
         7lLw==
X-Gm-Message-State: AOAM533ST2ymXcuRmmTbSBTTxjPWExcF3oYgpbJU8ZfOhJ6isM+gHmNW
        jFNFZhNuRNi33I1T486af5dwLwjjmJk=
X-Google-Smtp-Source: ABdhPJwZSoxLn1QDZiP9fMUjHH/Q9JkWuwdkzt0CTHbRERk43Od+wJroZzPmarH5V1BYxiMtJEztxg==
X-Received: by 2002:a9d:4914:: with SMTP id e20mr2012120otf.324.1631226325850;
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 06/15] leds: trigger: blkdev: Add function to get gendisk by name
Date:   Thu,  9 Sep 2021 17:25:04 -0500
Message-Id: <20210909222513.2184795-7-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add ledtrig_blkdev_get_disk() to find block device by name and increment
its reference count.  (Caller must call put_disk().)  Must be built-in to
access block_class and disk_type symbols.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev-core.c | 20 ++++++++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.h      |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
index d7b02e760b06..5fd741aa14a6 100644
--- a/drivers/leds/trigger/ledtrig-blkdev-core.c
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -33,3 +33,23 @@ void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
 
 	mutex_unlock(&ledtrig_blkdev_mutex);
 }
+
+/* class_find_device() callback.  Must be built-in to access disk_type. */
+static int blkdev_match_name(struct device *const dev, const void *const name)
+{
+	return dev->type == &disk_type
+			&& sysfs_streq(dev_to_disk(dev)->disk_name, name);
+}
+
+/* Must be built-in to access block_class */
+struct gendisk *ledtrig_blkdev_get_disk(const char *const name)
+{
+	struct device *dev;
+
+	dev = class_find_device(&block_class, NULL, name, blkdev_match_name);
+	if (dev == NULL)
+		return NULL;
+
+	return dev_to_disk(dev);
+}
+EXPORT_SYMBOL_NS_GPL(ledtrig_blkdev_get_disk, LEDTRIG_BLKDEV);
diff --git a/drivers/leds/trigger/ledtrig-blkdev.h b/drivers/leds/trigger/ledtrig-blkdev.h
index b1294da17ba3..a6ff24fad0c2 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.h
+++ b/drivers/leds/trigger/ledtrig-blkdev.h
@@ -12,4 +12,7 @@
 extern struct mutex ledtrig_blkdev_mutex;
 extern void (*__ledtrig_blkdev_disk_cleanup)(struct gendisk *gd);
 
+/* Caller must call put_disk() */
+struct gendisk *ledtrig_blkdev_get_disk(const char *const name);
+
 #endif	/* __LEDTRIG_BLKDEV_H */
-- 
2.31.1

