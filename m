Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23ACF52B4D8
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 10:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbiERIWX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 04:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbiERIWX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 04:22:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD74B104CB9
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 01:22:20 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b32so1635021ljf.1
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 01:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdJpvkWYTOnWvkoIPd4KYauwa7ctY5TQOeL36DvVqdU=;
        b=gd2Tn1U+Uo/c2muLFCnoR47YLR9gp6z6anQ5w7ZJYGPJOQfvoBGwpYv4QXZLwlk6sa
         ymcB0aTJz1bo0Mt0we1suE4GGCOX1m1ujGbq/p2uItTvR2WQ58fHL58hSCYc2pQyU97V
         tM+WBlTwNlXBFVq5Zwc21Qq3biMfsVoLxtSU2AmU8/LIT2dFIckWJp88pAJSQ1AH3ay9
         zWgVlqwTcDzMi+KMKwhcAJmd8hI2fQ7js2wVzfEK9T2UrySLL9mtC6OluGRBsdpxpY6K
         QIStOSOZnjIvUPmEZcFakLCBYcPstO1JsUYiZ7kauztPZouua3t+U9+SurBdRY2tgNAP
         QUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdJpvkWYTOnWvkoIPd4KYauwa7ctY5TQOeL36DvVqdU=;
        b=IgKHgFIj0Kf3TlPzboE2z/NyF1pVaiG4UrxHHaIFVbJbOHuy69jqmNfnt2YE67iRtc
         PeNoaVaLJHX2oT+qUcQB3PuWQNxeWazrOEvmG1nym52D+QTn2dBcyECUBU+tonStsZ8Q
         Hc+MDTqz0dKCreDE/pdNmbK95ZLlaHAeVrRZHes+e49oeQowm4XFFsJNl4kpE7DzBj2P
         L7vjMBrqVkpPNLAR+atDkLkXM3LpNLKo2l2hnnVTCwFxpNEG24ez4yEMBLedPrmYkNMI
         os/IpirC4C9UtPBqtIOtOAC58HqkRTjunh70c/EbfjT6lv2faU0CPmUZUbuLg1ve3hDE
         CMgg==
X-Gm-Message-State: AOAM533R0IRq5t+GJQMQiPQWCEYoDX6t3m5B8A9taXY4cnsPNJbZDEMi
        Ip0qL2BZEUlpBesmm79r1X6vQw==
X-Google-Smtp-Source: ABdhPJwT5RTTAxwpR5t/FcglX1IVPzT00EfqYqhhyDelqjbjNAV2o8RUapTvLAbf3eCG5pBm+8TqZg==
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id m15-20020a2e934f000000b0024f0ea16232mr16534478ljh.135.1652862139286;
        Wed, 18 May 2022 01:22:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t13-20020ac243ad000000b0047255d210dbsm139264lfl.10.2022.05.18.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 01:22:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kyle Swenson <kyle.swenson@est.tech>
Subject: [PATCH 1/2] dt-bindings: leds: lp50xx: correct reg/unit addresses in example
Date:   Wed, 18 May 2022 10:22:14 +0200
Message-Id: <20220518082215.14358-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The multi-led node defined address/size cells, so it intended to have
children with unit addresses.

The second multi-led's reg property defined three LED indexes within one
reg item, which is not correct - these are three separate items.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Kyle Swenson <kyle.swenson@est.tech>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index f12fe5b53f30..dc1ac905bb91 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -99,35 +99,41 @@ examples:
                color = <LED_COLOR_ID_RGB>;
                function = LED_FUNCTION_CHARGING;
 
-               led-0 {
+               led@0 {
+                   reg = <0x0>;
                    color = <LED_COLOR_ID_RED>;
                };
 
-               led-1 {
+               led@1 {
+                   reg = <0x1>;
                    color = <LED_COLOR_ID_GREEN>;
                };
 
-               led-2 {
+               led@2 {
+                   reg = <0x2>;
                    color = <LED_COLOR_ID_BLUE>;
                };
           };
 
           multi-led@2 {
             #address-cells = <1>;
-            #size-cells = <2>;
-            reg = <0x2 0x3 0x5>;
+            #size-cells = <0>;
+            reg = <0x3>, <0x4>, <0x5>;
             color = <LED_COLOR_ID_RGB>;
             function = LED_FUNCTION_STANDBY;
 
-            led-6 {
+            led@3 {
+              reg = <0x3>;
               color = <LED_COLOR_ID_RED>;
             };
 
-            led-7 {
+            led@4 {
+              reg = <0x4>;
               color = <LED_COLOR_ID_GREEN>;
             };
 
-            led-8 {
+            led@5 {
+              reg = <0x5>;
               color = <LED_COLOR_ID_BLUE>;
             };
          };
-- 
2.32.0

