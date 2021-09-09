Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B08A405F69
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346563AbhIIW0n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345294AbhIIW0h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:37 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610D8C061574;
        Thu,  9 Sep 2021 15:25:27 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id m14-20020a4ad50e000000b002912a944a47so1058145oos.12;
        Thu, 09 Sep 2021 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GdOcaIt+lEs3P/5jE6RLnbfIIvqFBGA/JhoMskjrSdU=;
        b=hCMclT5Mqq4sU+Yr0lvxe+xbbwa0bmJ8/8QFGcmhfAsJs7mGj3WMBkP4REPpn1Y49Q
         XTS1RBL190LzsPM5VgmKOWOqoTyBGCNLHoCjkyiLQtM3Mlnw4yaR9oCBAenIDve9qm5B
         s9pS4SqZFXGhiaddxJ7f8TQ7quoPYDHtUnQwESp1ipRLCMRKeu+lTJWDtwPCFBM4vXjd
         YbL2ESZydO0TxFC6KpqkxBjgqg9hSgILIAIRGrv2WWlBpPAzUQ8dM/RQOZ3CF1GocIyP
         V3qtiRp7JCKzQrbu6kgjdswc1Aa6+zMZs8rgXgVJnsohNoUOp8hfeG61ixsmBMHhBhaf
         Vvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdOcaIt+lEs3P/5jE6RLnbfIIvqFBGA/JhoMskjrSdU=;
        b=nNqlwJKK7PGHdUIioZ3I/a+Fx4ON9GoJN9B/hwlBZfULeLR5mDB7OaUQmiUR3hPFrW
         Of9Z3jQGgOC485KnuI8SV2fzDSNgzYhOr8aSgP+KPP3oxlgPWtZzJN0LyKt4HSoAHCm6
         +6nmGwnA0/8aEH60gUX5loPbUfu3WqhtITSkFUl5VIt98Pv/UIldo/oG/2wASn7h+Twj
         eEw6/3ho9W6qL1K6df2NA9+Vx43tC68+O25duMzOq7m7SOCo/e8uHalsyLQbw7xMblIa
         2jUqnwP7LD4yuR9ue2t258G78WaLKU2I0KLlGGIYXLb9s9gJCJjT3Ob/RLeWErbNIt9T
         THNw==
X-Gm-Message-State: AOAM533IY7b8WozlQE4fYdB2O+JNQI0XBPvO4KTjEAu/rCYS2ztwZDJJ
        zc7tAiygbL140DI0c83bG8Y=
X-Google-Smtp-Source: ABdhPJwkjpFiiNvLdHXbnfuH2r8Lk2hJNSCAkfhUOmt3idGydzd3vpNQEFdl+gjVbpxhFOXiMjH3OQ==
X-Received: by 2002:a4a:a78a:: with SMTP id l10mr1809670oom.30.1631226326744;
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:26 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 08/15] leds: trigger: blkdev: Add stub LED trigger structure
Date:   Thu,  9 Sep 2021 17:25:06 -0500
Message-Id: <20210909222513.2184795-9-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Needed to avoid unused function warnings/errors from subsequent patches

Make ledtrig_blkdev_trigger non-static for now to avoid unused variable
warning/error

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 38a2cd2df85c..53b62e320491 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -59,3 +59,28 @@ struct ledtrig_blkdev_led {
 	struct hlist_node		leds_node;
 	enum ledtrig_blkdev_mode	mode;
 };
+
+
+/*
+ *
+ *	Initialization - register the trigger
+ *
+ */
+
+static struct attribute *ledtrig_blkdev_attrs[] = {
+	NULL
+};
+
+static const struct attribute_group ledtrig_blkdev_attr_group = {
+	.attrs	= ledtrig_blkdev_attrs,
+};
+
+static const struct attribute_group *ledtrig_blkdev_attr_groups[] = {
+	&ledtrig_blkdev_attr_group,
+	NULL
+};
+
+struct led_trigger ledtrig_blkdev_trigger = {
+	.name		= "blkdev",
+	.groups		= ledtrig_blkdev_attr_groups,
+};
-- 
2.31.1

