Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC1F3B127D
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 05:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhFWDyE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Jun 2021 23:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWDyD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Jun 2021 23:54:03 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2A7C061756
        for <linux-leds@vger.kernel.org>; Tue, 22 Jun 2021 20:51:46 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id v11-20020a9d340b0000b0290455f7b8b1dcso607204otb.7
        for <linux-leds@vger.kernel.org>; Tue, 22 Jun 2021 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DoiBj5BLfecwr4g0Pwg7h6z7bsywem+oXg3CJXF5nhU=;
        b=tUIMuIFCiV9gVf0yoXJoUl31hlsuLwoYj1vnTE97Ek1ls22yDASkuCTcd3ejZ19CJF
         kbwgjEGLSs29yWHy+BEjmI/qhnTgLEj1FC1mo6v4vfJtoLJdTYGePG806DBYXuMRQI/F
         9E7WdNhdxSrVaYEuHJPaV1NFGL3cHb49BbynaDb4+fOxi73lJM7uwgjn4oNauUlGYs3F
         6Vq1cmtH1HCDHKy9sY9xK5PbnJ3w2JWpyqdrmdBMlM6AudtTk7TwMknZ2wAx5ocYuF/p
         gQ1iV0KKBO2gc8broKEweO2Wn5p0zac1FNv/uQUDnB/mLItnyJqvJpyl87mGvOMzXTO9
         FO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DoiBj5BLfecwr4g0Pwg7h6z7bsywem+oXg3CJXF5nhU=;
        b=akoB8ygHnt9aU9q712QpilW/HFuvO1BUxPPGMAo4Avo+kzN5/OSZjieBQA7dK2B5OP
         JEXWtFZSpOpPKNTbU1FFr+AZDimOYLBsBOW7P7vcYmP4hT7CrB/D+1xHFBwyBrLhK3iP
         tZQHfg1MI8c8mu3mATe0tnt2RO77b0Zt8AFlWHjMvZd7yQGatr+Krdjuceh34mmgZK0z
         EB62junTwsdI70UqQbF3XxFlCXmi6aYyBi7ZeN1EWZF8HNPW+BXDrG7OGdrXON5LM9aJ
         zX8QKyzE3PAox5FgL2875rQlMT46yX/AHbrMgXVSW/6EXws3x5oyAy1ayG1Ok3qlRbfv
         SAHw==
X-Gm-Message-State: AOAM531LX6UykxuJQb9IKBYEEXE7zQBcD3UDUQtwDli6n7b5FWH4aEF2
        Wtp5WxCrKiq+slla2svukiS8tQ==
X-Google-Smtp-Source: ABdhPJygjzi3fqM0808AIObNgKqbHPwiPFa0cNqsqsfP37hRyERe4J6jo1bqaNHoRMSmjTvkRZcccw==
X-Received: by 2002:a05:6830:1208:: with SMTP id r8mr6048717otp.155.1624420305361;
        Tue, 22 Jun 2021 20:51:45 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v82sm4752509oia.27.2021.06.22.20.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 20:51:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH v9 1/2] dt-bindings: leds: Add Qualcomm Light Pulse Generator binding
Date:   Tue, 22 Jun 2021 20:50:38 -0700
Message-Id: <20210623035039.772660-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds the binding document describing the three hardware blocks
related to the Light Pulse Generator found in a wide range of Qualcomm
PMICs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v8:
- None

Changes since v7:
- Added qcom,pmc8180c-lpg
- Defined constraints for qcom,power-source
- Changes qcom,dtest to matrix and added constraints
- Changed example from LED_COLOR_ID_MULTI to LED_COLOR_ID_RGB

 .../bindings/leds/leds-qcom-lpg.yaml          | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
new file mode 100644
index 000000000000..10aee61a7ffc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Light Pulse Generator
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: >
+  The Qualcomm Light Pulse Generator consists of three different hardware blocks;
+  a ramp generator with lookup table, the light pulse generator and a three
+  channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-lpg
+      - qcom,pm8150l-lpg
+      - qcom,pm8916-pwm
+      - qcom,pm8941-lpg
+      - qcom,pm8994-lpg
+      - qcom,pmc8180c-lpg
+      - qcom,pmi8994-lpg
+      - qcom,pmi8998-lpg
+
+  "#pwm-cells":
+    const: 2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  qcom,power-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      power-source used to drive the output, as defined in the datasheet.
+      Should be specified if the TRILED block is present
+    enum: [0, 1, 3]
+
+  qcom,dtest:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: >
+      A list of integer pairs, where each pair represent the dtest line the
+      particular channel should be connected to and the flags denoting how the
+      value should be outputed, as defined in the datasheet. The number of
+      pairs should be the same as the number of channels.
+    items:
+      items:
+        - description: dtest line to attach
+        - description: flags for the attachment
+
+  multi-led:
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+
+    properties:
+      reg: true
+
+    required:
+      - reg
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    lpg {
+      compatible = "qcom,pmi8994-lpg";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      qcom,power-source = <1>;
+
+      qcom,dtest = <0 0>,
+                   <0 0>,
+                   <0 0>,
+                   <4 1>;
+
+      led@1 {
+        reg = <1>;
+        label = "green:user1";
+      };
+
+      led@2 {
+        reg = <2>;
+        label = "green:user0";
+        default-state = "on";
+      };
+
+      led@3 {
+        reg = <3>;
+        label = "green:user2";
+      };
+
+      led@4 {
+        reg = <4>;
+        label = "green:user3";
+      };
+    };
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    lpg {
+      compatible = "qcom,pmi8994-lpg";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      qcom,power-source = <1>;
+
+      multi-led {
+        color = <LED_COLOR_ID_RGB>;
+        function = LED_FUNCTION_STATUS;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@1 {
+          reg = <1>;
+          color = <LED_COLOR_ID_RED>;
+        };
+
+        led@2 {
+          reg = <2>;
+          color = <LED_COLOR_ID_GREEN>;
+        };
+
+        led@3 {
+          reg = <3>;
+          color = <LED_COLOR_ID_BLUE>;
+        };
+      };
+    };
+  - |
+    lpg {
+      compatible = "qcom,pm8916-pwm";
+      #pwm-cells = <2>;
+    };
+...
-- 
2.29.2

