Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DCF4158A7
	for <lists+linux-leds@lfdr.de>; Thu, 23 Sep 2021 08:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbhIWG55 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Sep 2021 02:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239666AbhIWG5p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Sep 2021 02:57:45 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403AFC0613E0
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:56:09 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c1so4814717pfp.10
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+bVI50/U/Px2zafLKGxljVTDM1XHyN1eJT93Wdky9A=;
        b=bXaP7hsMAlQQDjWuf7Lz+35buzCADQS6gm4KXJB3lS7Z0C732tfosARG3sqLV7KaA9
         Fdtg9gllDyWvAqwNtq5gOg8E4PPyJWnJKEWJGrhNJDWtV8tZ0r4r8KQpGXkN9zoG3RL6
         RHY6xQi1+tKzCWgd8EEy5+exMwsDMAf5zp5Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+bVI50/U/Px2zafLKGxljVTDM1XHyN1eJT93Wdky9A=;
        b=xtijJ3yxWlDrXiGFMgmeSrMzvUUyTu3zEngb5/1KHJyhrO6yeQOdqa1qYOHj9WACWO
         Vf+97hGMhyC+cPNUN9+5Yq17srlH6Q6eu0n1KQaJo0pDVkYZPjZsEhAS43NRnTKplKC5
         zKjeqY263KKRurhOLLgxE/ViHq5kgMMNwt97J5nDftT92KNZjYoMFYxi2AIjiVdiU2ve
         KnFFN5joZN15pVriNI9JzKZu2Qaggx2288wye9FwqHwiYCST6BmJ8CCxDfGomV1RPSGe
         1iJfo/Lbws4Pf8KCyOIB83wHtnZhV/Vcp6ScZOWuW/kIMp+5IJ8YVaDvXd7R7mJE6l7p
         qiag==
X-Gm-Message-State: AOAM533U0whcOo8AX6moFwAuSsGpSk0kwnmU+dHzmYR9pTU3mDx1PI8K
        Q+VQ5WLMBxxuA6ivEcPTrNf1aQ==
X-Google-Smtp-Source: ABdhPJxVSpxmZt6T0yS0J0POEvpxKeFeTedQKq5tV5O5Ar/V2msMW3vnS2WcW7sX52oHPQC1n+bDgQ==
X-Received: by 2002:a63:b505:: with SMTP id y5mr2775207pge.91.1632380168827;
        Wed, 22 Sep 2021 23:56:08 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:56:08 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 11/11] ARM: dts: mstar: unitv2: Add wifi switch
Date:   Thu, 23 Sep 2021 15:55:00 +0900
Message-Id: <20210923065500.2284347-12-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a GPIO controlled fixed regulator for the Realtek WiFi
connected via USB.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
index ec8da9cc8cb2..b3eaffa6ee06 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -56,6 +56,14 @@ reg_vcc_dram: regulator-vcc-dram {
 		regulator-max-microvolt = <1500000>;
 		regulator-boot-on;
 	};
+
+	reg_vcc_wifi: regulator-vcc-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio SSD20XD_GPIO_GPIO14 0>;
+	};
 };
 
 &pm_uart {
-- 
2.33.0

