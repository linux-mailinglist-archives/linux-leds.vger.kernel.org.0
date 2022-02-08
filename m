Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90EE64AD73D
	for <lists+linux-leds@lfdr.de>; Tue,  8 Feb 2022 12:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356812AbiBHLcT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Feb 2022 06:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356428AbiBHKqT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Feb 2022 05:46:19 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD16C03FEC5
        for <linux-leds@vger.kernel.org>; Tue,  8 Feb 2022 02:46:17 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso1026613wmh.4
        for <linux-leds@vger.kernel.org>; Tue, 08 Feb 2022 02:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtZWNw9Rcg3r2OPM4Cd7rgO9cXEHRHPNGugcBi7HcnM=;
        b=ndu7HwBw/9YXXqck+eFMaNO6yXBWThFPF4n5xldsJT3JxAK9VRfdquWeWZvFIXEgsk
         toQfLl0WcNpp/CGQlSYGoRdC58KfbINdku4kUOoLXZrxlN2LmrUu33a+8JdufGmi5J4p
         O45OAyZyCqkZ3dWNSPkNAijh/tCUIJPqzahvDcjUR28BJrTchxdyoFEe+a1+FiB0Z0UY
         SunjqCIauDIAiVA3luTVT3j0sX3EDv6matvmbTOYsVYCZTAEtNZFE8ykV8RjIXaJOSlO
         FFBPXn4hklp5cczVqaD/H8v2Ko0OZHMKMUjHUcVE0nOAz2Sbj1iH7XynsKH7zLK2yk39
         RNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtZWNw9Rcg3r2OPM4Cd7rgO9cXEHRHPNGugcBi7HcnM=;
        b=eJclyDcT5qDL1/cFkwd78gqtK+UYGqx+CuUsuCMt9bFjT6ksWb2faOt1fObPFKmvPh
         Q5+PGq+JpiwurVpaRDxr5PbGtC+5UBy9+/CISIUYw7tJRyhdYilEo7ARNbebOpIeNlq9
         t6gU4Ii0G7nBIJ2zyNLQuQNyJPZhmEpSQFGfhxPbE2L0rSGQh3Muvs2QSfXac9N2XdNr
         jHHLribAjGHNQVTFTgxCkSLU7ZyzdwpyLSjXvJ//MbsJziW0I9fwo06W8t4usUT533XW
         kHIMFRfP+XmVl0+g6b9Ay+A/gzu24TeYd2eY0sHdzWxOJ/WBz8wKUCRSti/3anEAi9Sb
         6PFA==
X-Gm-Message-State: AOAM531hi+lm32/rjOBTQMZlJXRLqRilnvb1kQRDBHcL0Rc/xTSHfbtV
        Ok7BFoswxwzB2P3BsEKU59XahQ==
X-Google-Smtp-Source: ABdhPJwXA8yZq+kf2tFPyJgQwaQkBQW67aJaZfh0O7r2VS91Dy10bye/29WKRvdWKc9PWM09CWpGGg==
X-Received: by 2002:a05:600c:3544:: with SMTP id i4mr588789wmq.23.1644317175577;
        Tue, 08 Feb 2022 02:46:15 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e13sm14172933wrq.35.2022.02.08.02.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 02:46:15 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     krzysztof.kozlowski@canonical.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3] leds: remove ide-disk trigger
Date:   Tue,  8 Feb 2022 10:46:01 +0000
Message-Id: <20220208104601.3751852-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

No user of ide-disk remains, so remove this deprecated trigger.
Only a few platforms used this and were fixed in 2016.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Change since v1:
- remove also DEFINE_LED_TRIGGER(ledtrig_ide)
Changes since v2:
- Added the fact that few platforms used this and it was fixed old ago.
- Added Rob's ack

 Documentation/devicetree/bindings/leds/common.yaml | 3 ---
 drivers/leds/trigger/ledtrig-disk.c                | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 37f8a6fd6518..c89f430df4a0 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -91,9 +91,6 @@ properties:
       - disk-activity
       - disk-read
       - disk-write
-        # LED indicates IDE disk activity (deprecated), in new implementations
-        # use "disk-activity"
-      - ide-disk
         # LED flashes at a fixed, configurable rate
       - timer
         # LED alters the brightness for the specified duration with one software
diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
index 0741910785bb..0b7dfbd04273 100644
--- a/drivers/leds/trigger/ledtrig-disk.c
+++ b/drivers/leds/trigger/ledtrig-disk.c
@@ -16,7 +16,6 @@
 DEFINE_LED_TRIGGER(ledtrig_disk);
 DEFINE_LED_TRIGGER(ledtrig_disk_read);
 DEFINE_LED_TRIGGER(ledtrig_disk_write);
-DEFINE_LED_TRIGGER(ledtrig_ide);
 
 void ledtrig_disk_activity(bool write)
 {
@@ -24,8 +23,6 @@ void ledtrig_disk_activity(bool write)
 
 	led_trigger_blink_oneshot(ledtrig_disk,
 				  &blink_delay, &blink_delay, 0);
-	led_trigger_blink_oneshot(ledtrig_ide,
-				  &blink_delay, &blink_delay, 0);
 	if (write)
 		led_trigger_blink_oneshot(ledtrig_disk_write,
 					  &blink_delay, &blink_delay, 0);
@@ -40,7 +37,6 @@ static int __init ledtrig_disk_init(void)
 	led_trigger_register_simple("disk-activity", &ledtrig_disk);
 	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
 	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
-	led_trigger_register_simple("ide-disk", &ledtrig_ide);
 
 	return 0;
 }
-- 
2.34.1

