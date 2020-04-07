Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB9D1A1096
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2020 17:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgDGPsG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Apr 2020 11:48:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:12697 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727751AbgDGPsG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Apr 2020 11:48:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586274485; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zJmKM10kCOi3CxoHMeerZ71oCXF92PPozf5dFAnoWi8=; b=PG64Wm1QXGufXvMKm8/l9DEwgFwZSY3iLpgqkrJEUmIuIwdCF74EUr4rPDaFvRgsCAFXnX38
 4cpfsrAbLn+Qz+9l6jRRGwrd5fAaQsRcLvDW//+YJXhDoT5diQ/bKnZ53k75LnEhB92QkpNK
 +C2dwUFf0FIlgB0aysHyD4phRrQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ca0aa.7fa3023ade30-smtp-out-n03;
 Tue, 07 Apr 2020 15:47:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A4C4C44799; Tue,  7 Apr 2020 15:47:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFE48C43637;
        Tue,  7 Apr 2020 15:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFE48C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH V5 3/4] backlight: qcom-wled: Add WLED5 bindings
Date:   Tue,  7 Apr 2020 21:17:09 +0530
Message-Id: <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add WLED5 specific bindings.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml         | 60 ++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 770e780..5714631 100644
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
     description:
       brightness value on boot.
-    minimum: 0
-    maximum: 4095
-    default: 2048
 
   label: true
 
+  max-brightness:
+    description:
+      Maximum brightness level.
+
   qcom,cs-out:
     description:
       enable current sink output.
@@ -130,6 +132,31 @@ properties:
       This feature is not supported for WLED3.
     type: boolean
 
+  qcom,modulator-sel:
+    description:
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
+    description:
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
@@ -179,6 +206,33 @@ allOf:
             - const: ovp
             - const: short
 
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
+            minimum: 0
+            maximum: 4095
+        
+        max-brightness:
+          minimum: 0
+          maximum: 4095
+
 required:
   - compatible
   - reg
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
