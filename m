Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663946A973D
	for <lists+linux-leds@lfdr.de>; Fri,  3 Mar 2023 13:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCCM3j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Mar 2023 07:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCCM3j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Mar 2023 07:29:39 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A452ED64
        for <linux-leds@vger.kernel.org>; Fri,  3 Mar 2023 04:29:37 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id i3so2489217plg.6
        for <linux-leds@vger.kernel.org>; Fri, 03 Mar 2023 04:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K67aK8Ab6zSc42er2APhm2wp24bW0xcr3MHHlTQF0Aw=;
        b=FWDRYekAJW0YOPHVCThvG+gS40Y/L7MmBGpsAFTvA86lKGRbhz5cuk10cQlWAEmU4a
         5qjnVvsNAgO201ARVXF58stdH+7rMGc1gVHltnfmp8XUIlpOhfALuClnQx4bFNl+5pry
         eMHaGFx8RRTR/yyyzl+K7ljCsKDplEnBNsNClamWViNp/7eZJyZ/jyaJT6sOuoBf0mid
         KxVgUw+afQEtCmuVzTAcsmtUVj1FxRs3TmzMFX8s2uHhj994a4URVvs5xAXntnI+im/N
         rF4rXVBiWMSwrm6gMfMVmcCCQBhChdEIp037ZBa3HOoTCzXgQmwTxq7suYEnLII5UxF9
         AHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K67aK8Ab6zSc42er2APhm2wp24bW0xcr3MHHlTQF0Aw=;
        b=X7grjex9q9TxkpkRguqSLaiYTEsoRPd90X0kHowBPfIGQSh4imw+nJP+V4xdAIw6Sj
         a7hbZajmt8WLZdE9kU3dEEB8TDSBSOnwYkDcF/j6JJ0xWYr6JZIJeMpXVO07c6YVFoJ2
         vjDKWv718+60dsEvuzqz+DYJO2jorXsbjcCyTgY01rZOsL5E0gpFQpAQrd4l9I/mdekU
         1SZI1maxBCQvKd5+SAJhjxWPA2BVzYhN8Se8pij0OT3TcyGMbnHXx6G07IlIatKZYFZ8
         blbDMInWt+L6uM1oKyEgYpXGk0SfTBC4gR2v89qqpXxD01tFWRzWuRZ6mqXztisIwN2I
         ODuA==
X-Gm-Message-State: AO0yUKUYb3SyTcUtM4Gj/bkxOvW0xh82dDqg3qRuTEFBvKdFtvmR0xp7
        txmeZtNN77/6q0W69cwQ4KYt
X-Google-Smtp-Source: AK7set8JZfJlqAxDs/MQ62UW2V/JqCm8gY0xitDzP+jEIKi/vPCiManpejAsTuviiRQtvZZymT98DA==
X-Received: by 2002:a17:90b:4c10:b0:229:2427:532f with SMTP id na16-20020a17090b4c1000b002292427532fmr1427272pjb.40.1677846577309;
        Fri, 03 Mar 2023 04:29:37 -0800 (PST)
Received: from localhost.localdomain ([117.207.30.104])
        by smtp.gmail.com with ESMTPSA id m20-20020a17090a859400b002342ccc8280sm1448325pjn.6.2023.03.03.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:29:36 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lee@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, thunder.leizhen@huawei.com,
        festevam@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7] dt-bindings: leds: Document commonly used LED triggers
Date:   Fri,  3 Mar 2023 17:59:25 +0530
Message-Id: <20230303122925.6610-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the commonly used LED triggers by the SoCs. Not all triggers
are documented as some of them are very application specific. Most of the
triggers documented here are currently used in devicetrees of many SoCs.

While at it, add missing comments and also place the comment above the
triggers (hci, mmc, wlan) to match the rest of the binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v7:

* Rebased on top of next/master

Changes in v6:

* Rebased on top of lee/for-leds-next branch
* Fixed the comment location for few triggers

Changes in v5:

* Rebased on top of v6.2-rc1

Changes in v4:

* Removed the sorting of triggers
* Removed the "items" as they were not needed
* Reworded the description
* Dropped Zhen Lei's tested-by tag as the patch has changed
* Added kbd-capslock trigger

Changes in v3:

* Rebased on top of v6.1-rc1
* Added WLAN Rx trigger
* Added tested tag from Zhen Lei

Changes in v2:

* Added more triggers, fixed the regex
* Sorted triggers in ascending order

 .../devicetree/bindings/leds/common.yaml      | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 15e3f6645682..61e63ed81ced 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -90,22 +90,49 @@ properties:
           - heartbeat
             # LED indicates disk activity
           - disk-activity
+            # LED indicates disk read activity
           - disk-read
+            # LED indicates disk write activity
           - disk-write
             # LED flashes at a fixed, configurable rate
           - timer
             # LED alters the brightness for the specified duration with one software
             # timer (requires "led-pattern" property)
           - pattern
+            # LED indicates mic mute state
+          - audio-micmute
+            # LED indicates audio mute state
+          - audio-mute
+            # LED indicates bluetooth power state
+          - bluetooth-power
+            # LED indicates activity of all CPUs
+          - cpu
+            # LED indicates camera flash state
+          - flash
+            # LED indicated keyboard capslock
+          - kbd-capslock
+            # LED indicates MTD memory activity
+          - mtd
+            # LED indicates NAND memory activity (deprecated),
+            # in new implementations use "mtd"
+          - nand-disk
+            # No trigger assigned to the LED. This is the default mode
+            # if trigger is absent
+          - none
+            # LED indicates camera torch state
+          - torch
+            # LED indicates USB gadget activity
           - usb-gadget
+            # LED indicates USB host activity
           - usb-host
+        # LED is triggered by CPU activity
       - pattern: "^cpu[0-9]*$"
-      - pattern: "^hci[0-9]+-power$"
         # LED is triggered by Bluetooth activity
-      - pattern: "^mmc[0-9]+$"
+      - pattern: "^hci[0-9]+-power$"
         # LED is triggered by SD/MMC activity
-      - pattern: "^phy[0-9]+tx$"
+      - pattern: "^mmc[0-9]+$"
         # LED is triggered by WLAN activity
+      - pattern: "^phy[0-9]+tx$"
 
   led-pattern:
     description: |
-- 
2.25.1

