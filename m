Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D90D753200
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 08:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235258AbjGNGcl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 02:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbjGNGc1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 02:32:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B19126B7
        for <linux-leds@vger.kernel.org>; Thu, 13 Jul 2023 23:32:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fba03becc6so3471314e87.0
        for <linux-leds@vger.kernel.org>; Thu, 13 Jul 2023 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689316339; x=1691908339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRfq/FnV4GDUp4lmVRajes2WnSt3YSSixMUmZn3Jbvs=;
        b=oTjDXdOtjWYW3YdlfhZrwfW8eLgHAr5EGs05Oqjjh/iGEfXgH1aTEwQAGI1hARh00N
         XQgKz2IxHV0yhKYa9fix+zmHBXsU2xcGfnfXGfX79e3fOdDtVwM8AVjScSo6WE8qECSl
         ajvhtLL/lGL/fD5xPu47Z0wSwiNXktAPIcrAanM3e6EWBibfX/8579ko6uOJf4m4juH2
         s8nghBMe1RzXwDOrAtaGPYBGfYM0gdPKGElG7jPsPyKwcnK6fL6XD1bNQfo6UPhNYFMX
         HODYD/caDW8UTT70nQtHL9JqCNfqY6XuVp+aa7vSjcMmUi5jk9G4zfVkuSyZGGhhUYta
         SJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689316339; x=1691908339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRfq/FnV4GDUp4lmVRajes2WnSt3YSSixMUmZn3Jbvs=;
        b=T8npteH6CDeHm0lvnTHBaOfJlW4k7HnUEXYBNh33UpXpt7nwrnLpf/WRUwyTcPq1L3
         UkgdNYrS0s7wONfIMIxW1hd2YAUdqaJV7dfYDBUVuPazjknRLb+QaQFTVVUwwsjXgP9f
         Yxboy/+qiXvgXor6O0Cc7hD59ZQuhysEK4di+ACgBbmGwvVPFojr0hDrDhWM4lhUI1n9
         +hiw8KmEKaYil1ImAmRx8KcJyVySLYtNlxXKRlBCfDOCTIWaYfUBLN5JsMrETHvpSk6+
         QotN1+zhG4IBS1hxYFgBAqPM/iszaXcWqw5T6pBDrcwaWyAEFCk6MKZ3iJdkeZIxNCUv
         5B/g==
X-Gm-Message-State: ABy/qLb6ZQKh73PJF7XTat0i7IK4g5AX0iWbryZXoZ/ly8VZmOcmwQZc
        VmXjpx1DCunwxDJ7h8Q1ozmnXRVDhzLqQg==
X-Google-Smtp-Source: APBJJlGoRurXDmSGcjN2lekqD04bigCJ934SaZ3XxqEytvqwh8PyfrTLP5Kqw3fiYc7KwCDsx1xG8A==
X-Received: by 2002:a05:6512:1590:b0:4f8:453f:732f with SMTP id bp16-20020a056512159000b004f8453f732fmr836925lfb.2.1689316339125;
        Thu, 13 Jul 2023 23:32:19 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id b6-20020ac25e86000000b004fb2244563fsm1367462lfq.289.2023.07.13.23.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 23:32:18 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        linux-leds@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] leds: bcm63138: rename dependency symbol ARCH_BCM4908 to ARCH_BCMBCA
Date:   Fri, 14 Jul 2023 08:32:14 +0200
Message-Id: <20230714063214.3791-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Symbol ARCH_BCM4908 has been merged/removed without updating leds
Kconfig.

Fixes: dd5c672d7ca9 ("arm64: bcmbca: Merge ARCH_BCM4908 to ARCH_BCMBCA")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/blink/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index 945c84286a4e..bdcb7377cd4e 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -1,10 +1,10 @@
 config LEDS_BCM63138
 	tristate "LED Support for Broadcom BCM63138 SoC"
 	depends on LEDS_CLASS
-	depends on ARCH_BCM4908 || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
+	depends on ARCH_BCMBCA || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
-	default ARCH_BCM4908
+	default ARCH_BCMBCA
 	help
 	  This option enables support for LED controller that is part of
 	  BCM63138 SoC. The same hardware block is known to be also used
-- 
2.35.3

