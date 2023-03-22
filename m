Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E21D6C4596
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 10:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjCVJGA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 05:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjCVJF6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 05:05:58 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301DE5D460;
        Wed, 22 Mar 2023 02:05:56 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v25so12729389wra.12;
        Wed, 22 Mar 2023 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679475954;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNSb6njbnC6E2KhzKme0YrMoOVs1TaPW5WrGVtWuHp8=;
        b=HgigbtANxq4HrPqcft+7AzsYb4fSV4JVHsm8Vog5E2oGLkJvgZ3sMjna6a1r/VbuUu
         2ItQsflpS+9ioBHEu8tEscJu9qf8DqtI7yyY4iP7UJTsBRnxEkz6ta8l7o7WN4iGOOJx
         2lOJXRsOZYjXHovk+PGMB9hc8fXpBC64XFC+8jAZDY1M9UrAtX7Y0H5OuGITYu3ZEMWT
         9rKG9jYD20XazJIwuW3hXnVU7tYrYcunS3eMV7IW7O+Q0wUDTe3fljqTsx+RmVcmpdYW
         6XJjVeoieAXvv0POng3dqb9WzEbkJdWgZmM4VYMX2145PWhtwGbhXXY9fIeiN9TXftWU
         1KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679475954;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNSb6njbnC6E2KhzKme0YrMoOVs1TaPW5WrGVtWuHp8=;
        b=D17CHFpfP70wcFkWunyS4GFk3Izx1XBH6m0Q6I0BzNIZeB0rjPiJEA/0PLpURICOxV
         S9U+lVzGluf9Xpd4KKjjtDVJ/8L/K8/gWjxg9MrgOHwYvyzZ62stP8Tnx2egxR35Lq7P
         7/5ZUuUqMZJfrQPesnGU7+M/hAq9wITBRE/NMD14lRAXMwQWAN532FNIwtWtwdhOXqXT
         600N5yzbaDdAHmHxl3wAMD4hyezRoQJusTP+yMwiB6gttpxrKX0DFCs6GiztADc9ecB/
         0hjCOU7RTn/lBNeqsJPifZL7+jVwbKwCDWHkCOzVumJmJT4RbzaCiU5E7EzUNQub+/Wc
         fBiQ==
X-Gm-Message-State: AO0yUKVuwLcyfC30PmEI/h/np0+VLdLk7DI3KXlTLIiUlmweQOn23KE+
        YyJUu5NGWyeQhv+LC6xcG4U=
X-Google-Smtp-Source: AK7set/OvTqiyWwC9zGgC/8n00ZyCJIkBBARyh1VoCPJZRJt5uOxJrj1gXRYzcaB2NobXLA0oPSj8g==
X-Received: by 2002:a05:6000:1a48:b0:2c5:3ccf:e99a with SMTP id t8-20020a0560001a4800b002c53ccfe99amr4183708wry.6.1679475954532;
        Wed, 22 Mar 2023 02:05:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b002c707785da4sm13291214wru.107.2023.03.22.02.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 02:05:54 -0700 (PDT)
Date:   Wed, 22 Mar 2023 12:05:49 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: flash: qcom: Fix a signedness bug in
 qcom_flash_register_led_device()
Message-ID: <20aeda89-7ed2-4dd8-b707-404a15289fbc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This bug is basically harmless at runtime because of the surrounding lines.
Still the fwnode_property_count_u32() function returns negative error codes
so storing them in an unsigned int will not work.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
The patch prefix on this was slightly tricky.  Ideally when people add a
new driver the patch which adds the driver would use the patch prefix
for the driver instead of the subsystem:

Not ideal: [PATCH] leds: Add new driver for QWERTY
    Ideal: [PATCH] leds: qwerty: Add new driver

 drivers/leds/flash/leds-qcom-flash.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 406ed8761c78..4ea33ca88fa8 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -529,8 +529,9 @@ static int qcom_flash_register_led_device(struct device *dev,
 	struct led_init_data init_data;
 	struct led_classdev_flash *flash = &led->flash;
 	struct led_flash_setting *brightness, *timeout;
-	u32 count, current_ua, timeout_us;
+	u32 current_ua, timeout_us;
 	u32 channels[4];
+	int count;
 	int i, rc;
 
 	count = fwnode_property_count_u32(node, "led-sources");
-- 
2.39.1

