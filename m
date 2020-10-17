Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457C1290F27
	for <lists+linux-leds@lfdr.de>; Sat, 17 Oct 2020 07:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411659AbgJQF3q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Oct 2020 01:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411628AbgJQF3n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Oct 2020 01:29:43 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35433C051109
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2020 22:20:22 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id l18so1155858ooa.9
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2020 22:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Am11ttHsA0DQGqbaWBINshvKBjWKydVsOnpvVxHgLqA=;
        b=GgJ0F82RgLNPenXfBHY3Yuam0WuUgNNRsHU3kZ9RxCI0cztz44uqB65UALb8JACGqO
         b/kwohjUGJMdgoy5SuW5bvE3iO3PptyjJLvsTe0m4S2/wg3CdZPL6SbhmcafhKaf9uHq
         BHr4kioSB89b1RaD2OIGaDnzaPowIRJ5nc+RtPJ7lJ37mAWueTfNfTzS+NSgN4cRGswd
         y0xWxaTrNWDxU6W1vfI0PAezq1EFPRXarkP8uhYGcXGnoyH9/DQDyhB+qTzrODTZOJLG
         QwWgQLdrOfUqNxzBvB+yWAxfD9Fn3bkPRvczHRfr5Y8vZMsMunwbr76YVbSuvUUbPUoZ
         j1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Am11ttHsA0DQGqbaWBINshvKBjWKydVsOnpvVxHgLqA=;
        b=pHk6666ZTZpumlxfpflcCzMH3P17IsD95j2Ihoc3uwsXlNhcxbUJczNtr9yYxr3iff
         4/aT5hIOWKL7jgNMeHtDHTpVAyxzeqvuF5sueBFhdb7W6Papb9O/azb31ztYG+oRr3Z0
         sI5w5Q6F0Ow1mHlCmgxkHDqFofho6fs9BYaU041DaEN0BCUDg/64kj7aT8i3D57dj6ds
         BH0JqwLJaZ+F1jZw4sd62J5rUFu+a8DhOB8v3JT7kZ1ZiYmfUeYHkNVI9dmZud/aGUTx
         hwiAXKNVBDCRnvED75i1w+L8Vjda9ouwfgkr3kGk/6iqyF96lxASfzLTu0tC+OxfDevr
         jvmQ==
X-Gm-Message-State: AOAM531zAL87F7qIIwooSRxiQGzKZJUd+Oq3OA8XDnLs0jr56c+K5G05
        NSuKNsD+eXwjUSnsofjdE5PvEQ==
X-Google-Smtp-Source: ABdhPJylLggLu5AkxzhvDUwAo5oPqq2BFPVnonhOahpzng8sR+Z2KckCismnGoNPMyY4/Y0/5QJA6Q==
X-Received: by 2002:a4a:b78f:: with SMTP id a15mr5211950oop.33.1602912021584;
        Fri, 16 Oct 2020 22:20:21 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f2sm1572769ots.64.2020.10.16.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 22:20:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH v5 4/4] arm64: dts: qcom: Add user LEDs on db820c
Date:   Fri, 16 Oct 2020 22:20:57 -0700
Message-Id: <20201017052057.2698588-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017052057.2698588-1-bjorn.andersson@linaro.org>
References: <20201017052057.2698588-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The db820c has 4 "user LEDs", all connected to the PMI8994. The first
three are connected to the three current sinks provided by the TRILED
and the fourth is connected to MPP2.

By utilizing the DTEST bus the MPP is fed the control signal from the
fourth LPG block, providing a consistent interface to the user.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..7e51677d256e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -8,6 +8,7 @@
 #include "pmi8994.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -682,6 +683,54 @@ pinconf {
 	};
 };
 
+&pmi8994_mpps {
+	pmi8994_mpp2_userled4: mpp2-userled4 {
+		pins = "mpp2";
+		function = "sink";
+
+		output-low;
+		qcom,dtest = <4>;
+	};
+};
+
+&pmi8994_lpg {
+	qcom,power-source = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmi8994_mpp2_userled4>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led@1 {
+		reg = <1>;
+		label = "green:user1";
+
+		linux,default-trigger = "heartbeat";
+		default-state = "on";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "green:user0";
+		default-state = "on";
+	};
+
+	led@3 {
+		reg = <3>;
+		label = "green:user2";
+	};
+
+	led@4 {
+		reg = <4>;
+		label = "green:user3";
+
+		qcom,dtest = <4 1>;
+	};
+};
+
 &pmi8994_spmi_regulators {
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
-- 
2.28.0

