Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B692E686B
	for <lists+linux-leds@lfdr.de>; Mon, 28 Dec 2020 17:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441047AbgL1Qfz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Dec 2020 11:35:55 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:42093 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634202AbgL1Qfu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Dec 2020 11:35:50 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MSbp1-1kRhLg0nZh-00SylT; Mon, 28 Dec 2020 17:33:01 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1ktvS6-0002Gf-OR; Mon, 28 Dec 2020 17:32:59 +0100
Received: (nullmailer pid 32617 invoked by uid 2001);
        Mon, 28 Dec 2020 16:32:54 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v9 2/4] ARM: dts: berlin: Fix schema warnings for pwm-leds
Date:   Mon, 28 Dec 2020 17:32:15 +0100
Message-Id: <20201228163217.32520-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 1a0b367694e79faea72b17a9cb5f6f3c
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:BIWACTo4Z6dV+m64LgCGv/Vy0/a5dj1c8GrQ+LVFfnAsjn9pbRu
 OvhYDB/heVEN49gTOdTW+6bhMTkcoYhEOv3lGnuGEoSrfmHnnponayTCeojRygBhzKmRDhC
 FzJIjHBySUsLsm1sQSTjG+Nn1i2VA2o7lRXEIY2ap6P/zSEm+E63f3SDda+WvfbPoUbblGI
 wbUdRWhp8lEWanbHhZEDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EC0dEAJ8sXs=:15Cb8byaC2se/ynuP9EhBD
 Ooqmt4/MUCgEujHdVGQVHmW6C/dMw6yYFBsWJ2ERrla65NNNGNd4Uu9kpY/l60LWYkyUIUQa5
 g8R9c71pA2MC1iLa9W1PZQBx2CtsrNl605fqjaPc6q/hN/3J4PVAfoIat/MMIBmw6ZnO+ZQoM
 A9g1yf3jqlk4jLXrfohe9ZmS6p6Hlm8MDQ75H1SsvYUmc5wVQ0WRzz3x2P6JfJADS+wZ4u0T+
 +oGrc3ZjdDX9AxHGw/6IcdQlx1iaSv1vYom93p5F88b77Xz/SRAt/FKmxOxGqP1J3vtG0mpSi
 8NqiEFG03AkM6fxFJnFhxOhpExw1MtzgqDEbkEli7vacXisgq2M+zHAUDULIMnOjNGhZA0Kw3
 ZsGmQuMXDAmftPek0Zd/5JjXPrA47G8zULE4ndaTcfvMgpsmxkXhj71ALsU4fj40+GoNgJW9Q
 6Bmck/13LA==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
  CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v8 -> v9:
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..c1d91424e658 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -34,19 +34,19 @@
 		linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-0 = <&ledpwm_pmux>;
 		pinctrl-names = "default";
 
-		white {
+		led-1 {
 			label = "white";
 			pwms = <&pwm 0 600000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-2 {
 			label = "red";
 			pwms = <&pwm 1 600000 0>;
 			max-brightness = <255>;
-- 
2.20.1

