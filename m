Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5532E686D
	for <lists+linux-leds@lfdr.de>; Mon, 28 Dec 2020 17:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407929AbgL1Qf4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Dec 2020 11:35:56 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:45105 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634207AbgL1Qfx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Dec 2020 11:35:53 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmkfQ-1kCel42cH0-00joNN; Mon, 28 Dec 2020 17:33:04 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1ktvS8-0002Go-6X; Mon, 28 Dec 2020 17:33:01 +0100
Received: (nullmailer pid 32611 invoked by uid 2001);
        Mon, 28 Dec 2020 16:32:54 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
        Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Mon, 28 Dec 2020 17:32:14 +0100
Message-Id: <20201228163217.32520-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 467395612c70a9d75b41506b3ac52c2b
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:z5bEGtgUEdxGujZwPS5GQOaXN0MpI1qWj1B7vXebONYPxe/kFgQ
 MvVlnj41sAwtgkdlDHXTKo20kYGG8QLw3pOWqa2U65YZqFf1JgWg6mgePtnR+Z1DSa9jlbN
 T+E1WvkdzoMZfROd8B2IRLjPQptkrEFpjF28qw0y7SwzAES6TV/3uYBXczizSuTvDggGt+j
 RnbFrvlq0041SsPOxsA7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j0TwOYU/4rw=:va139LkldRmqXSUsejaI0g
 qa+9GQNFDVQKwoVBKxp6Q1lxCXJ0b6/wPMFNTCLm0vNy7BbXvblwkgj3CqgXeFhmuL4zU45Wr
 GEY14YwiCc7fZ+d/4gXWjvSLBZnviGNBzJ8rmV+X9foVB0b1mY9iBNGDc50aFu0w+fC/ytYL2
 dFq0SDXi0Bf1Of+F8BRvRcLzMs9FWI3YwVZfbCSYWPF1sw7xodRVKvFlO/FdemjIvBf+b90zP
 ZY0CJe1IWyV72k84MbKSr87WPk3nq4WTPSzYWHMx7P9gCsB48E17p63f7z/NB/4Mi7b7GHpiO
 v7BXY81i20fjnyPkpiuJ+INNjC2swqNGWGWljf/SC4UsvCHnj9YcIUvNNtGA9Nn8/+CojgsTz
 3Gk6ZEgeUd/+7vETcbX/F+qWNiTtW8B9ZCbspizFewaY6XhHYAcs1caNMNxIU8EM4tQSRqChz
 OoqtJHQ9jw==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
/home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Jeff LaBundy <jeff@labundy.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v8 -> v9:
      * added forgotten Acked-by (Jeff LaBundy)
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
      * added Acked-by (Rob Herring)
    
    v6 -> v7:
      * added warning message to commit message (Krzysztof Kozlowski)
    
    v6:
      * added this patch to series

 Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 541b06d80e73..92dc48a8dfa7 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -90,10 +90,11 @@ examples:
             };
     };
 
-    pwmleds {
+    led-controller {
             compatible = "pwm-leds";
 
-            panel {
+            led-1 {
+                    label = "panel";
                     pwms = <&iqs620a_pwm 0 1000000>;
                     max-brightness = <255>;
             };
-- 
2.20.1

