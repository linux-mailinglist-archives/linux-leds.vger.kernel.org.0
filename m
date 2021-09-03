Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57134006F8
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351040AbhICUrL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351022AbhICUrF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:05 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65375C0613C1;
        Fri,  3 Sep 2021 13:46:04 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id c79so656474oib.11;
        Fri, 03 Sep 2021 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joEWcX6/HEUX6AMOsJywxpKlr4Qh1MnJ1mIBW/70C7k=;
        b=QYAg4F18BQA7/3t5hS8ay0LIQPKY/u01Nfj4iYRBkgqNQ3Q1HFeWji/M967vnZC8Ir
         XSyBY/F9+3JqANS7L8/eqIcAGdDO5U0Uvkjwazr4EFt2odnpvqA2eCtssc4c2f4//ZGx
         4IzOCytiwDnsmKgeqOG1WB9tkJX0GCIykEtaXl/KV1mj1u6Q90agDtkpkmpnTAG25mUw
         bCoJtNqsK1mf8ul/OETFzaTsH8HM4+3g1/QP4m4klZMeUiIXd9IcWUGYUzJD+xeo2N9e
         pxFzfRqphlSL3jrPG5kCMeWrVpCgbWmiQIyOloZR+i2ZXGreLjhWhJyhPCQIvFfVAUnE
         3k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joEWcX6/HEUX6AMOsJywxpKlr4Qh1MnJ1mIBW/70C7k=;
        b=cXImG2DNkMpy3v+JzxMO4ef7Mc+bQ8l96sJ7WSCZuQdwu9XGmATU+Cua77xriV5EEd
         vpZqOS1NT752kBcuvCAH6QdVQ4qwLntoZLuB6HsUzsIkC7VWBF7zsrlJAR4K38pRH6E2
         0cUwGImgAweaDLBcNVHmL1PznMJowLNddUvIqzZwjgetl4R9FUQee0rQDgV4YxzvSZGi
         ShqNKinXWrbMAl1Mixj8yCKYDxd2L8+nMv0H0IWYgwozff5QRswM4m+vQb9Wm24s501V
         FULRTmktaSZwxYFkLfSWd8YRan3HoXoBt2hRzxrkZDMdzzaQVwTbPb5ibeC/BSO4W6Tb
         m7sw==
X-Gm-Message-State: AOAM532THFQifNwuv/X+WYy9jIWvnD7H+d0qr+drrtEJUDyjjZq2eTRA
        j+AMzqAB/97GAzpRpsROzQEQGRVYcVz+yQ==
X-Google-Smtp-Source: ABdhPJy4oIpkbxu9uwa51ya0ql9PQJPSRy8hG6tU29R02/9VKnIEQ72IWIfWfrHWpG2aC7H55Bbzvg==
X-Received: by 2002:aca:ad55:: with SMTP id w82mr510224oie.45.1630701963808;
        Fri, 03 Sep 2021 13:46:03 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:03 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 08/18] ledtrig-blkdev: Add miscellaneous helper functions
Date:   Fri,  3 Sep 2021 15:45:38 -0500
Message-Id: <20210903204548.2745354-9-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add blkdev_skip_space() and blkdev_find_space() for parsing writes to
sysfs attributes

Add blkdev_read_mode() and blkdev_write_mode() LED comparison helpers

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index db8326874400..1f319529c3be 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -6,6 +6,7 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/ctype.h>
 #include <linux/module.h>
 
 #include "ledtrig-blkdev.h"
@@ -66,3 +67,46 @@ static unsigned int ledtrig_blkdev_count;
 
 /* How often to check for drive activity - in jiffies */
 static unsigned int ledtrig_blkdev_interval;
+
+
+/*
+ *
+ *	Miscellaneous helper functions
+ *
+ */
+
+/*
+ * Returns a pointer to the first non-whitespace character in s
+ * (or a pointer to the terminating null).
+ */
+static const char *blkdev_skip_space(const char *s)
+{
+	while (*s != 0 && isspace(*s))
+		++s;
+
+	return s;
+}
+
+/*
+ * Returns a pointer to the first whitespace character in s (or a pointer to the
+ * terminating null), which is effectively a pointer to the position *after* the
+ * last character in the non-whitespace token at the beginning of s.  (s is
+ * expected to be the result of a previous call to blkdev_skip_space()).
+ */
+static const char *blkdev_find_space(const char *s)
+{
+	while (*s != 0 && !isspace(*s))
+		++s;
+
+	return s;
+}
+
+static bool blkdev_read_mode(const enum ledtrig_blkdev_mode mode)
+{
+	return mode != LEDTRIG_BLKDEV_MODE_WO;
+}
+
+static bool blkdev_write_mode(const enum ledtrig_blkdev_mode mode)
+{
+	return mode != LEDTRIG_BLKDEV_MODE_RO;
+}
-- 
2.31.1

