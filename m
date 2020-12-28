Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355652E686A
	for <lists+linux-leds@lfdr.de>; Mon, 28 Dec 2020 17:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441050AbgL1Qfz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Dec 2020 11:35:55 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:34531 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634206AbgL1Qfx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Dec 2020 11:35:53 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MK3BO-1kakAl18Pe-00LYy0; Mon, 28 Dec 2020 17:33:01 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1ktvS3-0002GQ-UH; Mon, 28 Dec 2020 17:32:56 +0100
Received: (nullmailer pid 32623 invoked by uid 2001);
        Mon, 28 Dec 2020 16:32:54 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v9 3/4] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date:   Mon, 28 Dec 2020 17:32:16 +0100
Message-Id: <20201228163217.32520-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 36fd1d55df1a518e40d0076c137e1855
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:LimgWNDLRRVaCNMFJ+i8uoeo7wemoEqSTqKIxlEjwEQ0TAFGuEF
 giflE4niugQcsvUU03fAn7MZtYe0yiKtyYHhcinoIFrm0EL1hfhSgXxxogmZgjhDw0GJGAo
 gnw4rIbBS3xmUwabYbz3VxjgpcnKvJTCVDmD596yvbM/yFNWAoL/r+ZqihH4loDs1yvLvS8
 EZkd8Z5h/dhqRv2iqJfjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SRKurWlsH04=:ZZo6M80gCHdBDukFBDuNcl
 cW3FHOCbtY1D1gzP68XLOr4owTJJYM0qqPUDoHdpTsB5c02qQZINbdknIQxUuKeHukJgVc6+S
 Z4QBAJsTK3SQMi8gKHg9z1HhJNNy/uydY88DGi2MIy1yfrVRCc36kkV0fJ0rwju9MQXIHJf7Y
 59dS32EvXgACAHgVeawKAH9QtZct6FGgZe4SsTSRjD/Og4TnldOuV3juNPL1hRIKjbc48DNVF
 EqTLOR0kYduP1wMva9WjTk/JiVdYTmnG9YkIAa9WZPXE7r1yFRtjtkeOn3BfUd16xLw0xCL2h
 FvEvz+fjbNFp0h3McyFFeVnw+0+TGV+/iMPVrmkl3b0QlE6Mz6DNMB6/KTR+XWkyn2TM8JkW/
 CagKjGdtuNNbw2O+7aX29X9bo2uvqyOI/PBGlt65tmsBlY7SLgxU9ppdlz2L9nXYMYd+Hjwpi
 SfOMsK60AQ==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
  CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

Notes:
    v8 -> v9:
      * added Acked-by (Ahmad Fatoum)
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
      * updated indexes and added comment (Ahmad Fatoum)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index cda8e871f999..1e9bf7eea0f1 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,35 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-0 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-0 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		led-red {
+		/* led-1 to led-3 are part of a single RGB led */
+		led-1 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-2 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-3 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1

