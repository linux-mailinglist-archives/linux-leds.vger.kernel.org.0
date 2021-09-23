Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD624158AA
	for <lists+linux-leds@lfdr.de>; Thu, 23 Sep 2021 08:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239506AbhIWG6K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Sep 2021 02:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239516AbhIWG53 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Sep 2021 02:57:29 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88895C061764
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:58 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id g14so4894144pfm.1
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5um0KbUElUK2wie3g8IJWfKY61kEEr/d9t4jOM2pdo=;
        b=Yl+g9sgjL87WjxEchbxLIx4mctvhOvd2EOr+XETwlyUq/v/IjHMcLsKWuAEkhQ1sA4
         /VTGZRb6/GPqjujTVUIVXBTte8W4nlH3mP/pTEHm969g+5QM/ZhaldDShiLnRGIdAH9r
         LneMJ4i0TW5BuEvpWlt/jf2AIRE5Y43RJDr5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b5um0KbUElUK2wie3g8IJWfKY61kEEr/d9t4jOM2pdo=;
        b=JpsPndy+SchG+VfBO/4Z4PlLMEcvrEMTh6Aj9wxBC6D7dcE5HiD33dQf6mVxYDOFau
         cpqt8cUUbk1up6i1kquGaWRBXujZPwDVnF/1Dxv9XJpKIJSTXXxa0siwQhAnsiv//ZeS
         kDU5V+34gyJwmE9jX4iAfQH8Ury4ejHdy5oybNSexOXHuRmbpM/v9YmkXyhADp1SvJYs
         X43IfCtZy/sm3qzTyHRta82J6Y+USZwHhmuIStleMGfdlw1S5sfaX2OW/ZHFIrLAlGQb
         PPw/0hgOb7vGeAXpqR+vBXR2aIfxezMhYa176U/1emDfysrMnVFDlpTMhxFyBK8x/rFS
         Q+gg==
X-Gm-Message-State: AOAM530aca7exBlb4VWKf+X0CTHds/0NaCIhVHgEsYZmgpiF3YyOjlGN
        +4xkdA/UcnE4rGLJtXtyRfU7NA==
X-Google-Smtp-Source: ABdhPJyAYw4vY+PeNDnKquee0BRHunZM0V1nMhmMGrfEU4yxbmb3vew+RZHPJ7QrsR7mUOiOF35pqw==
X-Received: by 2002:a62:5a86:0:b0:445:4b23:9fe5 with SMTP id o128-20020a625a86000000b004454b239fe5mr2667508pfb.65.1632380158092;
        Wed, 22 Sep 2021 23:55:58 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:55:57 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 07/11] ARM: dts: mstar: unitv2: Wire up LEDs
Date:   Thu, 23 Sep 2021 15:54:56 +0900
Message-Id: <20210923065500.2284347-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the red and white leds present on the unitv2.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../boot/dts/mstar-infinity2m-ssd202d-unitv2.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
index a81684002e45..a51490defabc 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "UnitV2";
 	compatible = "m5stack,unitv2", "mstar,infinity2m";
@@ -18,6 +20,18 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-white {
+			gpios = <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "activity";
+		};
+		led-red {
+			gpios = <&gpio SSD20XD_GPIO_GPIO1 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pm_uart {
-- 
2.33.0

