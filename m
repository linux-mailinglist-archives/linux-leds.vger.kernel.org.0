Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5670579475
	for <lists+linux-leds@lfdr.de>; Tue, 19 Jul 2022 09:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbiGSHpt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Jul 2022 03:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiGSHps (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jul 2022 03:45:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D97B9586
        for <linux-leds@vger.kernel.org>; Tue, 19 Jul 2022 00:45:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e28so23324264lfj.4
        for <linux-leds@vger.kernel.org>; Tue, 19 Jul 2022 00:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wh0dgiKmSiILClmOpbIfSiljIy7KFxVZW+Mg5DvdEm4=;
        b=iOBmtlwR2YHnnMd4hQU4t995VjKvc70SYAH5Bxg96bAAoubB4j2x71LZALgXuoXXbg
         Oy6+1EC3Gh4Jnx0hCOP+Exm5pKPBVLJljRENg0rzBQi7nPdCbhpr8NVDBJPJKQ6HhfMy
         mgQH2/OqK7RRbYnZau06KVgzDrZGuEbVGiXIuxsqOxl3guTX2j9kUPpCt7heGqg2Rft4
         yy656IRVOtK3EKeAtxAq4AtWVN69vWVPbO7BIzPKepQqVztGZGFndHqwMjvdQdbSSDj5
         eMf2GGnoHtpf5J2d4fwpTd0bztUowowNpkDtpCSCBOsCUlgtd8leOAA2fo+MHNwAHf8Q
         9Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wh0dgiKmSiILClmOpbIfSiljIy7KFxVZW+Mg5DvdEm4=;
        b=2pfi1gOkKZA6xdZCaIhuFEhXfkcX1tN/PF2LkbzplkYOtmK1PDk33/3Hza7FL5qpn3
         3pVN1CljyUo1VmuaiEH6qBD74EfjgJQy7bCSeLQA/tDV0Q1Gpf9VoKWSL3RoNW1DtLoM
         7498w1FetnDBoYQaXXyB4u1GNfDF4peG/fF2dGATkWRcakEzS90k5X0Ls82FvSTXN6dh
         pz7yI7QiNMEtjMxb4sHESFeoceiVJj3An37Qidgm81WuLO1AvdWIJR+iz5qxo36FFe5W
         egTRuG1fMBgee9/GIgBLKWIpHrLZimIxJ7XZ3j5sZCfF4IkuvX1f+t1CSkg59M+pb0SD
         mYxg==
X-Gm-Message-State: AJIora88XNkOEf2Qqv20i1I45/9B9z+RCipasbM0GPG5uk8taD7G6JK8
        vsO9gDZ1Mbs7U/sb9BaTggq3UPycp8Dem7/N
X-Google-Smtp-Source: AGRyM1ui8UUtjT+BR0tutTilm3Q52rq8nnNUwsiME5hBr5XnCxp4ScxwagX3WCuj6dfULdtSJj2ZoA==
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id p36-20020a05651213a400b004793b9ff13cmr16529483lfa.380.1658216745492;
        Tue, 19 Jul 2022 00:45:45 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9257000000b0025a7338317esm2449669ljg.64.2022.07.19.00.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 00:45:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: leds: pwm-multicolor: document max-brigthness
Date:   Tue, 19 Jul 2022 09:45:42 +0200
Message-Id: <20220719074542.24581-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The Multicolor PWM LED uses max-brigthness property (in the example and
in the driver), so document it to fixi dt_binding_check warning like:

  leds/leds-pwm-multicolor.example.dtb:
    led-controller: multi-led: Unevaluated properties are not allowed ('max-brightness' was unexpected)

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index d0f846cd019d..bd6ec04a8727 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -22,6 +22,12 @@ properties:
     $ref: leds-class-multicolor.yaml#
     unevaluatedProperties: false
 
+    properties:
+      max-brightness:
+        description:
+          Maximum brightness possible for the LED
+        $ref: /schemas/types.yaml#/definitions/uint32
+
     patternProperties:
       "^led-[0-9a-z]+$":
         type: object
-- 
2.34.1

