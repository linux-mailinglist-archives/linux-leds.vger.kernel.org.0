Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3113DF281
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 18:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhHCQ1j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 12:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233638AbhHCQ1i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 12:27:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5096BC0613D5;
        Tue,  3 Aug 2021 09:27:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC4001F42632;
        Tue,  3 Aug 2021 17:27:20 +0100 (BST)
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 4/5] ARM: dts: qcom: pm8941: Add nodes for QCOM SPMI Flash LEDs
Date:   Tue,  3 Aug 2021 13:26:40 -0300
Message-Id: <20210803162641.1525980-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803162641.1525980-1-nfraprado@collabora.com>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add nodes for Qualcomm's SPMI Flash LEDs present in PM8941. There are
two white LEDs which can be used as flash or torch.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

Changes in v3:
- Disabled node
- Removed LED configuration (moved to hammerhead dts in patch 5)

Changes in v2:
- Moved from hammerhead dts to pm8941 dtsi, as it was this way downstream
- Now using values from leds-qcom-spmi-flash.h

 arch/arm/boot/dts/qcom-pm8941.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index c1f2012d1c8b..e9e4369a488b 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -2,6 +2,7 @@
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/leds/common.h>
 
 &spmi_bus {
 
@@ -189,5 +190,29 @@ pm8941_5vs2: 5vs2 {
 				regulator-initial-mode = <1>;
 			};
 		};
+
+		spmi-flash-leds@d300 {
+			status = "disabled";
+
+			compatible = "qcom,spmi-flash-leds";
+			reg = <0xd300 0x100>;
+			flash-boost-supply = <&pm8941_5vs1>;
+			torch-boost-supply = <&pm8941_5v>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			pm8941_flash0: led@0 {
+				reg = <0>;
+				function = LED_FUNCTION_FLASH;
+				color = <LED_COLOR_ID_WHITE>;
+			};
+
+			pm8941_flash1: led@1 {
+				reg = <1>;
+				function = LED_FUNCTION_FLASH;
+				color = <LED_COLOR_ID_WHITE>;
+			};
+		};
 	};
 };
-- 
2.32.0

