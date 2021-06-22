Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5083AFC59
	for <lists+linux-leds@lfdr.de>; Tue, 22 Jun 2021 07:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhFVFEh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Jun 2021 01:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFVFEf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Jun 2021 01:04:35 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA254C061766
        for <linux-leds@vger.kernel.org>; Mon, 21 Jun 2021 22:02:18 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t40so22471628oiw.8
        for <linux-leds@vger.kernel.org>; Mon, 21 Jun 2021 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2VziDaVw7AQP16cHBrR18mCTRK6FsXt1uYtJ2gwusbU=;
        b=pPGuVJF76xVB2bzNF7+KpG9ySpQ63uqucA2lIyaIxOejbovl2hflHS5j6x2m+1wks3
         xsKrSo/G/P+967X1zeBjzyYxSgFvywqj2H6T0xmFxOoO0gMYi3YLpWAK+inV8On9kHce
         G55hlDLU9DK/joos5kXBICqjTCKFBpWNrhPHxjWyW4VAXeRbZQKLg3BwUr5yj8joDdw1
         Vz4CV9BZOW6IreB8f+TGRPz+36Y2MYMbFFtTPlubiysqlbXl7EXkKYwATrx0zJBH4bJh
         XaN0slhvVz7t9f69vAEpxJZM2Rt7LT0dhSuKOajLW0JX+isc9wR+tbdi256Iu/b6c04q
         oyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2VziDaVw7AQP16cHBrR18mCTRK6FsXt1uYtJ2gwusbU=;
        b=l2gZC1dzgmfK6pey5duZ4A3Sx/rsdTHTtX5fIrC7H4b7WWH+GAPNpzw5sDfxxW6sZ6
         vdgBsWYuFzIqXMw6A3LMkbo2QkhA1OquDoNQumlZp9AbK3t8lUu9I15BfrplkRhJUhci
         r96xgu29HybPyCMPlU4CorpZQYRnGwx85VL2qYFMrg6tc4LCQXvG442EZsRa7nQwPFKx
         OAGxjdQ4ckigOqyGvWHh/PtDy+5xBUGj+0l8ePcd972Gb924gMNTX4km+s42qbjw04Qz
         gGddqKiEDyydVqbaHtrKmSah6/+awBdB241X+soLbN54aEZpC+m8Twzsk6cSy5hZyEEa
         MGbg==
X-Gm-Message-State: AOAM531boGJEoi/c+QuEJGB/fS+E1RyT3Z1O9iz4trce1t4CJWkxHZU5
        o+JuFimews/Wa521PbOMXP+psg==
X-Google-Smtp-Source: ABdhPJzVyxUHTq5HYCviGIxsaNDPDKjrHra6qqs2ESHXRX2xZuPTTs7Iq+GsticursNOjejx4Dxocw==
X-Received: by 2002:aca:5a04:: with SMTP id o4mr1710761oib.33.1624338137650;
        Mon, 21 Jun 2021 22:02:17 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r1sm4467744oth.19.2021.06.21.22.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 22:02:17 -0700 (PDT)
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
Subject: [PATCH v8 1/2] dt-bindings: leds: Add Qualcomm Light Pulse Generator binding
Date:   Mon, 21 Jun 2021 22:01:11 -0700
Message-Id: <20210622050113.231902-1-bjorn.andersson@linaro.org>
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

