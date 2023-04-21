Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F556EA548
	for <lists+linux-leds@lfdr.de>; Fri, 21 Apr 2023 09:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjDUHxQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Apr 2023 03:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjDUHxP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Apr 2023 03:53:15 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D875F86BC
        for <linux-leds@vger.kernel.org>; Fri, 21 Apr 2023 00:53:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5050497df77so1966190a12.1
        for <linux-leds@vger.kernel.org>; Fri, 21 Apr 2023 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1682063590; x=1684655590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/ZpcQ9NIqFHjhvx0ngEtTv4dAJPVMJ7EISKXYvQAAs=;
        b=BHlMJvYJT9gYXlzOIQmmVpfVb0CBhuWzkOwXRjI7ferZ2YvexT9oXFEF+ZX8pF0dHA
         arpdbDhrseUsOF7xgJK85M3MPneF8kWk1xmEA1bn9H7EtQC/EOzkWhTotFYPIceIBLRP
         aR7dWBQl3vvg91cf1yf7A9BdwnyAnS15sf+jL1dTpzTQ0mVMDop6yUxVTXZjC2mBdLXE
         tKXPMrMDPvt+a0ffDrcb5D6dHg9Ybnonf7mOLxhl/3CCP9LTHc+6EWeXKCQGi61nLDIf
         AF7+mY3RudNDaaHJyPFM0grCGO0OBU0i0Fzh3pbJ/6xiaWYlVaaAps15pgBl9/Ap8Tgs
         jozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682063590; x=1684655590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/ZpcQ9NIqFHjhvx0ngEtTv4dAJPVMJ7EISKXYvQAAs=;
        b=H53Kl6tczFhz1DTkDJ8hvdg6eGUDrXZiVvDE9Qbd4teOGvJZaZJXj/eZSV0A3PPycq
         xCcpedx/C9s9Zyn0gBdjtTULWEMo9uluuQGh9HE4+qNyLK9zGyePtterCs9tXXpKc9lz
         cf2jfrDxgpM8k2hagiF++TIAdxDnn0N4XXJ4M6lhdKEFtvty+YBBk6lKeDXTwTwkk/pY
         t1QZ+UzcF6D3f+hlJotFY9yQFz8Gk97c6K0kAQAR5FQIIwBU9yLf0mt+K4n03PcQbs+W
         5DSsK9wuLRa5HarEw0j3QmwHLD64DVhESZZXTqzyvXdV3AR64ShrEIP5jzsn+wFZJ9Z4
         YlBg==
X-Gm-Message-State: AAQBX9cg2uy5MYZgqdwKGbR76hmeAkWoQccZYXcwDpFgGzZ6ErQeYd35
        x90slou3UIpFEoq87QevHzQwrQ==
X-Google-Smtp-Source: AKy350Z/N0Lv4hhPKzOWY9FR2RrEeUTreU3lCFbsxOSp3Gi0zSmeRP/eX6Od6tlsEEybQek6EwsJ3w==
X-Received: by 2002:a17:906:b6c4:b0:94a:4fc5:4c2e with SMTP id ec4-20020a170906b6c400b0094a4fc54c2emr1305414ejb.49.1682063590295;
        Fri, 21 Apr 2023 00:53:10 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id vp3-20020a170907a48300b0094f14286f86sm1716329ejc.48.2023.04.21.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 00:53:09 -0700 (PDT)
From:   Maarten Zanders <maarten.zanders@mind.be>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Maarten Zanders <maarten.zanders@mind.be>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: leds-lp55xx: add ti,charge-pump-mode
Date:   Fri, 21 Apr 2023 09:53:04 +0200
Message-Id: <20230421075305.37597-2-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230421075305.37597-1-maarten.zanders@mind.be>
References: <20230421075305.37597-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a binding to configure the internal charge pump for lp55xx.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Notes:
    v1: implement as bool to disable charge pump
    v2: rewrite to use string configuration, supporting all modes
    v3: simplification by replacing string option by u8 constant,
        removing previous Reviewed-by tags as it's a complete
        rewrite of the patch.
    v4: added notes
    v5: dual license, change property type to u32
    v6: change license type for leds-lp-55xx.h to preferred tag
    v8: documentation: add default & maximum constraints

 .../devicetree/bindings/leds/leds-lp55xx.yaml          | 10 ++++++++++
 include/dt-bindings/leds/leds-lp55xx.h                 | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/leds/leds-lp55xx.h

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index ae607911f1db..058be1fedbc8 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -66,6 +66,14 @@ properties:
   '#size-cells':
     const: 0
 
+  ti,charge-pump-mode:
+    description:
+      Set the operating mode of the internal charge pump as defined in
+      <dt-bindings/leds/leds-lp55xx.h>.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 3 # auto
+    maximum: 3
+
 patternProperties:
   '^multi-led@[0-8]$':
     type: object
@@ -152,6 +160,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/leds/leds-lp55xx.h>
 
     i2c {
         #address-cells = <1>;
@@ -164,6 +173,7 @@ examples:
             reg = <0x32>;
             clock-mode = /bits/ 8 <2>;
             pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
+            ti,charge-pump-mode = <LP55XX_CP_BYPASS>;
 
             led@0 {
                 reg = <0>;
diff --git a/include/dt-bindings/leds/leds-lp55xx.h b/include/dt-bindings/leds/leds-lp55xx.h
new file mode 100644
index 000000000000..a4fb4567715d
--- /dev/null
+++ b/include/dt-bindings/leds/leds-lp55xx.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_LEDS_LP55XX_H
+#define _DT_BINDINGS_LEDS_LP55XX_H
+
+#define LP55XX_CP_OFF		0
+#define LP55XX_CP_BYPASS	1
+#define LP55XX_CP_BOOST		2
+#define LP55XX_CP_AUTO		3
+
+#endif /* _DT_BINDINGS_LEDS_LP55XX_H */
-- 
2.37.3

