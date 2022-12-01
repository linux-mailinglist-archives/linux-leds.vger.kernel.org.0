Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18F863F8FF
	for <lists+linux-leds@lfdr.de>; Thu,  1 Dec 2022 21:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiLAUVz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Dec 2022 15:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbiLAUVv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2022 15:21:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D3DBFCDB
        for <linux-leds@vger.kernel.org>; Thu,  1 Dec 2022 12:21:49 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id s8so4248257lfc.8
        for <linux-leds@vger.kernel.org>; Thu, 01 Dec 2022 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQjrFotBvEBOjNlq+Pe1FPAQOv2mAv4xa7xl6UXuL2g=;
        b=NxTSDW0W3fMh/uuCjr+FjJDpQWcA3hwPTYJexj6jKHSPbTfD3cYbNTTtTzZffgw0w9
         EJ8Pu62yqOlCu6C6Dm+vb58xgMzq0lfrKz+k657UFjifz7esjHICuY9zK/gl4nhxjoJb
         Yw6y4AYs5R3LMI/CZ7weCsDJLSrqlXDNASgt8iPCNlGoCpPyyULYwuWK6DA6HocXfgaL
         cxUvzb+s6rcljcS9Hv2tBL5l1+hB6orDDbmhKkGHDytnTQ/pMFJQYzVGPwaa/T7XvdIo
         oyOUH4Tgz9VPccGzW7ONkZ+esTUNZBEkHFe/SvCIvtwHtWgvrkbcObSaikovn8V79foJ
         ZeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQjrFotBvEBOjNlq+Pe1FPAQOv2mAv4xa7xl6UXuL2g=;
        b=aQc/cpf9vdLcQnmF+YnRYTG9tN1ffz8636FXDcke4FBPOWdWOohXwdMHA6LRBhl5X+
         wW/IcGWPx2mN8w5U1vSccMtfQ2FYbTC8EzTnxED5h59V2/xE8Mia8xqKfLQ5DdzuZNWX
         IpdD9CgAD8Bnkyp97y0tgOj9SN3644bGJhrJmAMKKqDmf5BT8W/lskat9Y/ic4QwsXiu
         6//E1mg071d/y5BXfpNttuTBcn+cJfh062YmJc/kvzarCAqYRXWH/yckU7nEZLr1vf0J
         wot5RsH5O/bwJvWurAjnFBpj0xbeKPcPg8+w2MUaWm7NAceAsFYkHqhJS6b1CestNj/x
         UCow==
X-Gm-Message-State: ANoB5pn4QKeG0VbntP0NFVNzdymFUrEpJZ4D0VfpRlE7WGqn0K2TXiFY
        TlatYRhoAMJnZh5R53ZTM9nBsA==
X-Google-Smtp-Source: AA0mqf5XaqmygrYenKVm7zbx77hIMWaGfCxDJmVverxZqSnyHnlczTbAjKIgC9NiUS/rR5AbTt3OKQ==
X-Received: by 2002:a19:5215:0:b0:4aa:4da0:f8a5 with SMTP id m21-20020a195215000000b004aa4da0f8a5mr21605502lfb.288.1669926108212;
        Thu, 01 Dec 2022 12:21:48 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l30-20020a19495e000000b004b514b27c86sm769679lfj.13.2022.12.01.12.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:21:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
Date:   Thu,  1 Dec 2022 22:21:42 +0200
Message-Id: <20221201202144.448694-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
References: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add gpio, keypad, led, mpps, pwrkey, vibrator and xoadc as possible
child nodes of qcom,pm8xxx, referencing existint schema files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
index 84b87f01e029..1513fe4edad9 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -43,9 +43,37 @@ properties:
   interrupt-controller: true
 
 patternProperties:
+  "gpio@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
+
+  "keypad@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,pm8921-keypad.yaml#
+
+  "led@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/leds/leds-pm8058.yaml#
+
+  "mpps@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/pinctrl/qcom,pmic-mpp.yaml#
+
+  "pwrkey@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,pm8921-pwrkey.yaml#
+
   "rtc@[0-9a-f]+$":
     type: object
-    $ref: "../rtc/qcom-pm8xxx-rtc.yaml"
+    $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
+
+  "vibrator@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,pm8xxx-vib.yaml#
+
+  "xoadc@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/iio/adc/qcom,pm8018-adc.yaml#
 
 required:
   - compatible
-- 
2.35.1

