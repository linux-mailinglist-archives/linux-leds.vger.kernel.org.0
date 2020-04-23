Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D671B5F68
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 17:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbgDWPep (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 11:34:45 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:42104 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729160AbgDWPeo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Apr 2020 11:34:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587656084; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BvOz3Eu9TepPEcZCJili0SnL3g6yLduNlIUuxlcN+Dc=; b=rd1lir75TXLFB5sSceQ4hggaPDeRfn/3GngEZX9vbs1DqZFUgq6aY0XgmdCYkVMQSYiS8B9e
 GnPDbdkFN5ksUWA66nFCawLHBBNLEgD0AhQf4PBZm34SjeiFk2HKBVfvefJ2CWeQnMB9eX+x
 p8oQsa+q3O77ugTdWOUwsZne8pM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b58a.7fe2f63cf490-smtp-out-n04;
 Thu, 23 Apr 2020 15:34:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37840C43636; Thu, 23 Apr 2020 15:34:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE938C432C2;
        Thu, 23 Apr 2020 15:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE938C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Date:   Thu, 23 Apr 2020 21:03:36 +0530
Message-Id: <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add WLED5 specific bindings.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml         | 59 ++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index b835443b..01c7d93 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,pm8941-wled
       - qcom,pmi8998-wled
       - qcom,pm660l-wled
+      - qcom,pm8150l-wled
 
   reg:
     maxItems: 1
@@ -28,12 +29,13 @@ properties:
   default-brightness:
     description: |
       brightness value on boot.
-    minimum: 0
-    maximum: 4095
-    default: 2048
 
   label: true
 
+  max-brightness:
+    description: |
+      Maximum brightness level.
+
   qcom,cs-out:
     description: |
       enable current sink output.
@@ -141,6 +143,31 @@ properties:
       - const: ovp
       - const: short
 
+  qcom,modulator-sel:
+    description: |
+      Selects the modulator used for brightness modulation.
+      Allowed values are,
+           0 - Modulator A
+           1 - Modulator B
+      This property is applicable only to WLED5 peripheral.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+      - default: 0
+
+  qcom,cabc-sel:
+    description: |
+      Selects the CABC pin signal used for brightness modulation.
+      Allowed values are,
+           0 - CABC disabled
+           1 - CABC 1
+           2 - CABC 2
+           3 - External signal (e.g. LPG) is used for dimming
+      This property is applicable only to WLED5 peripheral.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1, 2, 3 ]
+
 allOf:
   - if:
       properties:
@@ -183,6 +210,32 @@ allOf:
 
         interrupt-names:
           minItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150l-wled
+
+    then:
+      properties:
+        default-brightness:
+          minimum: 0
+          maximum: 32767
+
+        max-brightness:
+          minimum: 0
+          maximum: 32767
+
+    else:
+      properties:
+        default-brightness:
+          minimum: 0
+          maximum: 4095
+
+        max-brightness:
+          minimum: 0
+          maximum: 4095
 
 required:
   - compatible
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
