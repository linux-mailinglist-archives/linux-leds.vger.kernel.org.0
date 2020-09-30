Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5C727F631
	for <lists+linux-leds@lfdr.de>; Thu,  1 Oct 2020 01:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731989AbgI3Xr4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 19:47:56 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38859 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgI3Xrz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 19:47:55 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sQ6-1kJuCR17Ok-0050dZ; Thu, 01 Oct 2020 01:47:37 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlos-0007ZT-EL; Thu, 01 Oct 2020 01:47:35 +0200
Received: (nullmailer pid 7769 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:34 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Thu,  1 Oct 2020 01:46:33 +0200
Message-Id: <20200930234637.7573-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 2beb02607f6eb8f9cf7f14ab96a8f994
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:bP90eXR+w48aTn1ppXN+URCgE4TjDapabKR3j+t/0oN2he6UhS4
 m6ghKbSHJkVGW+jQn/1s17fu0hH++ewc1KAf1hb8c6rbXVTMJqhqGfghejlKAXTk2KnVt4u
 h8COnj2ZoHZ2irrHbvClLgCbfgW76zmIICkfLfSaLRqsttzfOoomDwOmdDJ9wQS0PwVO3A7
 j4ZxtfGDHC5halIijwdXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rgwX+3edwsM=:+F+Lk5lVZWeAg1oAkNSG2l
 SeNBwiXso4jjoA9hE5cjQmT5n1frhfkYKkSwkP8a+PRRUQk3OtDpB7imMHJcy/tyb1QhjucOx
 nTaigEyQCndAl7P1/tyOBj1iqi4pG8eXsFzwTmyO4++fa2WZ6GsanWGyNcFezGStaDM5JpGgx
 mDiNjkdTBAkvEfYa2KnfFKWPwfizSuQums2wQqeqEdQgrqPjbvBUPq6DuGEmZ3Gf5L4vvRdDY
 H3kNDrfmtK/HGq71MqNte9mz/ZQlP3TiHqiYC2Z0ViB8FYTGhWs9OoJZZ+LlgigwRLu3d+LAb
 QByBZNMQU+xQxc83GT6CmOzDkrhHMoUG6n/OZJTC2slrWkinAwZJ8/8UXhChLua1odpvo+eaC
 jyZdaaZALVM29FucV6cqPi70jJiZaXO+Zk/CzYw79AsXA5KiHPvIwoGMcRCmvAmGGR3+XQ0h8
 UKa4FPHw1WIm4/pxlj/Ux1wxmGodnkQsN+jTugFS1Q3RKfEWOkcWpDL26bWy9ynkk/pxXhEFx
 jhJZE3mkhzPFXAGqMDBNkGjYsdQo9xRiXYG9FJc1k8BGgQtHbj4PMJO2rUskedyqNjcfhCXMD
 pQ58YgwQsyFFeM06xF0W51AvBYs3vdSK66cQ3p8i+tO0yurEJKYM2tIulI8on3Ewl1ei4DbmC
 fGuUkIVAUO81ELOJAu+TfxWclLAKO63cwGNfldBu2hW4zNV9wIpSmCbkHzLT8h7uTAVR4syt7
 l6UxZrGSMg2flMZpQ/1gnTrQ+euWQnpB7tL5PdiDHevMhJo18i4EF1LCJ6OFMhgxH0olQQQBN
 BeaDR6IfQd7ypj/La2v4cK7MtSCIur+WrysyIE8UB0CpHTr1YadNhb1kkz5B/W6muFmzLHw
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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

