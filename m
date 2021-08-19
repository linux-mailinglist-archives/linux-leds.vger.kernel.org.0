Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A5D3F10BD
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhHSCwU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236304AbhHSCwC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:52:02 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC177C0612A9;
        Wed, 18 Aug 2021 19:51:18 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id e3-20020a4ab9830000b029026ada3b6b90so1390733oop.0;
        Wed, 18 Aug 2021 19:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ctrum5PuRodGtsvX5XCOy4ikb9APYy6K15rvAPhxuw=;
        b=ILzIQBfS2ieAWmqJdJ9cbsAvbtpfNrmW6+mzp+yOQe8ZXBA5RJgvyDuK32xdtAMmcD
         +cXbntu9cxNLEYwpTguKKlrTm+nONpoSFsNszNJJ6roNR40dSLUsmV3NkHjb2GTM/UxH
         CDxBg5zX3JV/2nwuTH9YTOWYRUnKLPqeHB8tjtIwxMIZO4ud7QNxR8uyXQM4Hf0WwLlt
         TQjxq24MvGA7J6SfkA5aWi0OUbHodsgCBDjOBcDbD4OvFJBiJhmowgOWOLDgL5aSyOaT
         r7WyTe0jvkwny1Vk/tp+vDhCI0qLsYSScTx8DvANWVALO5TOPvUCVw1ffBA9yIFnADL6
         az7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ctrum5PuRodGtsvX5XCOy4ikb9APYy6K15rvAPhxuw=;
        b=JN/TC0fGPc4HR9crQ/l3HGQDNBp7IskquIF6W2n8aOzUxoJoLyJXLmh2cLFFSNtIzC
         URkkEipMCq7VuGPF5XMYSWOm4PAjJwgNVkpZnJK6HP9lrH+uDUWotf4HxhgM87mbo/K2
         BrkedLhTs3XkiHiFnWI1SmDPRlvxytlup1W4LEWQlKHFLyYIx7jrTstNbPMVf+32u5/h
         0w7xfFsTUitpzD3IdvwS9iBw52ED8ZtZhF3G9if0Xoh20G95baMcPVdFvMCQjRGxrvS9
         7YKeiXsmXo9/BCLGyGb8J/TEwhKgpcqpYYk0U9/uhoiYkuZOARI4wjIxgxDXlNsqsv/q
         xI8g==
X-Gm-Message-State: AOAM532Nt6DPEo4OkEOlIngkidene3jzT2iOe67FCRCi61+09z9ExJ91
        YU08/of8JV8ILBxu8JsWy7thU/4YJuqcTLgK
X-Google-Smtp-Source: ABdhPJx8S06js5H4EW3aYT8LArDwry3Rs/BieIVbBdinWG2VSo7OvaTf1BEnioLv+62oWxdySEW9gw==
X-Received: by 2002:a4a:9464:: with SMTP id j33mr9415660ooi.5.1629341477751;
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:17 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 18/18] ledtrig-blkdev: Add config option to enable the trigger
Date:   Wed, 18 Aug 2021 21:50:53 -0500
Message-Id: <20210819025053.222710-19-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/Kconfig  | 9 +++++++++
 drivers/leds/trigger/Makefile | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index b77a01bd27f4..f15d38b3a632 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -153,4 +153,13 @@ config LEDS_TRIGGER_TTY
 
 	  When build as a module this driver will be called ledtrig-tty.
 
+config LEDS_TRIGGER_BLKDEV
+	bool "LED Trigger for block devices"
+	depends on BLOCK
+	help
+	  The blkdev LED trigger allows LEDs to be controlled by block device
+	  activity (reads and writes).
+
+	  See Documentation/leds/ledtrig-blkdev.rst.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 25c4db97cdd4..d53bab5d93f1 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
 obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
+obj-$(CONFIG_LEDS_TRIGGER_BLKDEV)	+= ledtrig-blkdev.o
-- 
2.31.1

