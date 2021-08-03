Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082C83DF285
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 18:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbhHCQ1t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 12:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhHCQ1t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 12:27:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7557C061757;
        Tue,  3 Aug 2021 09:27:37 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 946C51F42408;
        Tue,  3 Aug 2021 17:27:26 +0100 (BST)
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
Subject: [PATCH v3 5/5] ARM: dts: qcom: msm8974-hammerhead: Enable and configure flash LED node
Date:   Tue,  3 Aug 2021 13:26:41 -0300
Message-Id: <20210803162641.1525980-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803162641.1525980-1-nfraprado@collabora.com>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Enable the flash LED node from PM8941 and configure the LEDs. This
enables the Nexus 5 to make use of the LEDs as flash or lantern.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

Added in v3

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 30ee913faae6..78ac56be81b3 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -759,4 +759,24 @@ otg {
 			};
 		};
 	};
+
+	pm8941@1 {
+		spmi-flash-leds@d300 {
+			status = "okay";
+
+			led@0 {
+				led-max-microamp = <200000>;
+				flash-max-microamp = <1000000>;
+				flash-max-timeout-us = <1280000>;
+				default-state = "off";
+			};
+
+			led@1 {
+				led-max-microamp = <200000>;
+				flash-max-microamp = <1000000>;
+				flash-max-timeout-us = <1280000>;
+				default-state = "off";
+			};
+		};
+	};
 };
-- 
2.32.0

