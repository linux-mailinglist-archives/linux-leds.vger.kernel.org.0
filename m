Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B58A3F109A
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhHSCvo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235809AbhHSCvm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:42 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAFEC061764;
        Wed, 18 Aug 2021 19:51:07 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so6837170oth.7;
        Wed, 18 Aug 2021 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qbI1pPRxf25pr2Ei2jsbhNXjyN2At2UDUcIa0sXZlcc=;
        b=jXCqHfVzezbg84KWtIvjU7ss5ey/Rscavur5r8e3DywfgBSXVBtUkY0NzxSGKM2Pzd
         TnKa5l+QAyOXOczLXa9CIxleWka6VNkPvFj5L345VIsLGeZu1b5gxa7BVTMnuR7LyrkN
         w0KVQeBbisl1VJD8oQqaB/lQLbQKSF1kENggJbztncIFrIwp1a38AIHtU8Q18KV8rIcV
         XMSrxER3QcZE/N2X/D3/An7Z5JaIvlU3rkR2wP5stZFxjYNqoLfhHjt0CG7vYHwFsqtn
         g0Zy81YI8T647dIpQSK2lZQMJqqjcO7D4MCpApxvKIUvdkKC9hGhpq4VUns8zAdoArIM
         qweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qbI1pPRxf25pr2Ei2jsbhNXjyN2At2UDUcIa0sXZlcc=;
        b=WrzaMcfNS5QRGXXlCd/A0CSjPVdEPGk6oNuqsCpEdwO+/8XlpTKe6vJBbYFg/fmCMg
         XiJobii35ZMGgqUAqxw7aTj54KrF1qy32GA6AtmUlw4TUShcWcFHsqLyms64YtvHQFg3
         4F8XLrlpLGLMmYaon1oW5H+WawK4nCujrhLzzwF+mpzKIEOrB0naLEkXq857Fl/iKpWs
         9Ii8wsH2ILWwaCoFt+yPXEJ63iBmYVZuIN2dakGb6+xhaZH2p5SvWwa4tvJbtMhpsmFq
         jCwbzjhEGXqxWKS0K9KaJbBPoPq8JDgOW7mtSE924CmtGBznUFydwZpqCnA47DQ9TxNM
         PUww==
X-Gm-Message-State: AOAM533Vw+tsUthGZT6GNNXCNrukkeHuFtbBpZHWf/Yl4tP/BdZz31Of
        SOpu3e9Wrim/VNX5dXMCvLABac4ZDBvuHO7R
X-Google-Smtp-Source: ABdhPJxhwdZVhIqT/etxLmyLnab1ijJigyk+plkkQknuZwxkylxcmMbHRDdpygEecfT5B5vYKjBhPQ==
X-Received: by 2002:a9d:560a:: with SMTP id e10mr9928797oti.219.1629341466512;
        Wed, 18 Aug 2021 19:51:06 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:06 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 04/18] ledtrig-blkdev: Add misc. helper functions to blkdev LED trigger
Date:   Wed, 18 Aug 2021 21:50:39 -0500
Message-Id: <20210819025053.222710-5-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add various helper functions to the block device LED trigger:

  * blkdev_mkdir() - create a sysfs directory (and don't swallow error
    codes)

  * blkdev_streq(), blkdev_skip_space() & blkdev_find_space() - for
    parsing writes to sysfs attributes

  * blkdev_read_mode() & blkdev_write_mode() - LED mode activity type
    helpers

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 74 +++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 28ccbd7946ba..fcae7ce63b92 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -6,6 +6,7 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/ctype.h>
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -64,3 +65,76 @@ static unsigned int ledtrig_blkdev_count;
 
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
+/* Like kobject_create_and_add(), but doesn't swallow error codes */
+static struct kobject *blkdev_mkdir(const char *const name,
+				    struct kobject *const parent)
+{
+	struct kobject *dir;
+	int ret;
+
+	dir = kobject_create();
+	if (dir == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	ret = kobject_add(dir, parent, "%s", name);
+	if (ret != 0) {
+		kobject_put(dir);
+		return ERR_PTR(ret);
+	}
+
+	return dir;
+}
+
+/*
+ * Compare a null-terminated C string with a non-null-terminated character
+ * sequence of a known length.  Returns true if equal, false if not.
+ */
+static bool blkdev_streq(const char *const cstr,
+			 const char *const cbuf, const size_t buf_len)
+{
+	return (strlen(cstr) == buf_len) && (memcmp(cstr, cbuf, buf_len) == 0);
+}
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

