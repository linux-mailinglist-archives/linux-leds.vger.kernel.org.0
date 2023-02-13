Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E7B693EDF
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 08:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjBMHVs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 02:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjBMHVr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 02:21:47 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D3611673
        for <linux-leds@vger.kernel.org>; Sun, 12 Feb 2023 23:21:44 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id k13so12655242plg.0
        for <linux-leds@vger.kernel.org>; Sun, 12 Feb 2023 23:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT8zpDqYQcjOZkqrBpMihAQffHhfUXaPhjYeHne2afs=;
        b=c46py5DNV36Z2OLMFEBvIUKOTgtKE8Z/Kckhfx3/kzihc8ohYCpAwXfEzFAi2ANvfA
         r0lAAJtDkjT4vZ0CGN6RP26Wzed91gJ1s5H7jzcm1gQwZgJonZMlKtA0C5xmCqhA/Wec
         XlXBi9e1RgtZIathAxMUZWC4MPVo8guwgD5VEKv3MlDkjurDLAwstCdaSTJ/8WDQ1RRK
         c8k/b4KXxZ6oGBOCle83gfgF9OYP76Y5tab0YM+WtXFjDlreS3dBsVPXBPNeZZjsj9Gv
         lOCKjttEAAssqVyGnr7jwEF9x3AAn+bNiPK12hJ3mxfrdWiqX0zpdbP3wslzp/RsA5Q0
         Mzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT8zpDqYQcjOZkqrBpMihAQffHhfUXaPhjYeHne2afs=;
        b=Ye6h8X5hnbQhTo/AjYEbQ5owcTjoCAZmLD2zv1AhtH3xKOqEmvP6fJM4BJx6fF9p4u
         RrYJT79YMnLOKkCPgZEseP9kkAC2f4eos2q4Kwl/JFlwb8gP/SKwAfucm4u/ddXQeSIs
         ou92LF3xhoE6Nr4oNXP40pobd7622oYWHOoYvfsQl9z9a6fOdKWOiPzslrZmRBRRBznE
         BIh3mIwmrxyZMi8KyVEWTtHMLKD3f7InN9UZ6eZf6nCtMyEsRBKzUA926HWxa5YvQN+Q
         drSAqA+Xx9ZnAzcc4tGtH6K+2pQ2c9kpWyJqnkG8RLGRxMAxf+vUN5KASANuOdAqV7HA
         rF+A==
X-Gm-Message-State: AO0yUKW+ltH4eyDjWx5QOLRvOOn+bJ8Kwl1PXPoU/qjQhKtcSUpp4R1J
        O9k1DBHhr/byVQcNmqxndkQ7
X-Google-Smtp-Source: AK7set/D7G2horz+5S+Dwde3l8hkLUzhvaw8EIVOo6axA0zWK8mjibCrqCzobD76L/pgAvmyMHTmGw==
X-Received: by 2002:a17:902:d4ca:b0:19a:7f25:4d90 with SMTP id o10-20020a170902d4ca00b0019a7f254d90mr9383889plg.33.1676272903787;
        Sun, 12 Feb 2023 23:21:43 -0800 (PST)
Received: from localhost.localdomain ([117.217.182.252])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b00199524dc67bsm7460930pls.163.2023.02.12.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 23:21:43 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lee@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, thunder.leizhen@huawei.com,
        festevam@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6] dt-bindings: leds: Document commonly used LED triggers
Date:   Mon, 13 Feb 2023 12:51:33 +0530
Message-Id: <20230213072133.5977-1-manivannan.sadhasivam@linaro.org>
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

While at it, also place the comment above the triggers (hci, mmc, wlan)
to match the rest of the binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

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

 .../devicetree/bindings/leds/common.yaml      | 37 +++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index d34bb58c0037..9814371eaa4c 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -98,13 +98,44 @@ properties:
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
+            # LED indicates disk read activity
+          - disk-read
+            # LED indicates disk write activity
+          - disk-write
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
+          - usb-gadget
+            # LED indicates USB host activity
+          - usb-host
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

