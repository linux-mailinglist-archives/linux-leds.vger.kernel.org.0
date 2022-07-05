Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6B256791B
	for <lists+linux-leds@lfdr.de>; Tue,  5 Jul 2022 23:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbiGEVCB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Jul 2022 17:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiGEVBy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Jul 2022 17:01:54 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51D4BFB
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 14:01:53 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 32F2F40AAC
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1657054910;
        bh=EI3mxEAHkgT2vU1OOl7PeFFTw9+zwdjdFkAEZQkp71M=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=u2uiyNzKBeWHBRx93ok0aM+Ks+XvGLOuIffSiqZYQQsGTXhUODF3FoiEVeR31zUqy
         eZ8ZEXlDsHgTUhEq+mtF8db/xzA3cHPx0yKRu9Y+LKzYAjcS36ifIqgypVTy01IC8c
         5++IY/8LekX+Gvnl80Z/1HYueOGAs1PiKDNtD/UovkUzs9pbxFY4tAfCm2x/L+CG35
         tpab34MW8ZNz0qkJspgINd7+CM3EagX5nOxTSwz/LxSfSZltMLoz06ZI2u3g0Zgue6
         rli3NZbZl1VAcACHu9QuVu8snfhxYURkgOjR+pFBjfXeP7l/a67K+ZyoIrplEX8XFA
         La81Wv4qq0wXA==
Received: by mail-wm1-f69.google.com with SMTP id t20-20020a1c7714000000b003a032360873so9417547wmi.0
        for <linux-leds@vger.kernel.org>; Tue, 05 Jul 2022 14:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EI3mxEAHkgT2vU1OOl7PeFFTw9+zwdjdFkAEZQkp71M=;
        b=Fc4gypa/k+C6j20+GR8enUxff3vrz2wC/fxBeya0kmV1kHX8qEyT6a5ouGk/7ZFnjo
         TMfR6CwgUsf/+0M8qSMUAUOJtnKC25FUxBswRtWBFQEAeS/j0al6rpwIIXGazpBLCrX6
         y+AnLesJAc+T6AIecYEB43PSvSgwFAsyyvc7YhPFanyE+J4RgY7d1lOj4jMNocOUgMeK
         1FKWaXzpdjI4q3vH5ebE2Z4qn7YW7Mg/qsRZBdTq3uJP53e4CvOipAauh9dtBCAIHu3d
         zdLYbopnTfelMSIzkoHbtSXAhY2Ge9oASqomm1LpcOGnVetxWyx8L5++27u5JADTPoPU
         tsrA==
X-Gm-Message-State: AJIora9sKTUdWIoyZwosB1yKvY21MjVJSluBMvBDRlv7RvXMBXgnNtj2
        MIMhCE3XcVn9W6FlveCzZoc7Gw1mL2btg556SERq8rA4jGSHLZOt1YW0fh4Lch6UlQbRpF9ee6S
        IheL6/CP+Xfoc1oycAbVGm5MJ4kQpvkV2ORMts/s=
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id v5-20020a056000144500b0021ba91907d3mr33143885wrx.545.1657054909200;
        Tue, 05 Jul 2022 14:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpGtr585A4zBiBrqeprE38gSsAvDrw/l/xt/heeVYnerThl9ghX7+cZz4Gy93kTP7evrM9SQ==
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id v5-20020a056000144500b0021ba91907d3mr33143858wrx.545.1657054908987;
        Tue, 05 Jul 2022 14:01:48 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:48 -0700 (PDT)
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Vincent Pelletier <plr.vincent@gmail.com>,
        Bin Meng <bin.meng@windriver.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Ron Economos <w6rz@comcast.net>,
        Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen L Arnold <nerdboy@gentoo.org>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Mark Kettenis <kettenis@openbsd.org>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        David Abdurachmanov <davidlt@rivosinc.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/4] leds: pwm-multicolor: Support active-low LEDs
Date:   Tue,  5 Jul 2022 23:01:42 +0200
Message-Id: <20220705210143.315151-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for LEDs wired up to light when the PWM output is low, just
like the regular PWM LEDs.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index eb67b89d28e9..da9d2218ae18 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -19,6 +19,7 @@
 struct pwm_led {
 	struct pwm_device *pwm;
 	struct pwm_state state;
+	bool active_low;
 };
 
 struct pwm_mc_led {
@@ -45,6 +46,9 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
 		duty *= mc_cdev->subled_info[i].brightness;
 		do_div(duty, cdev->max_brightness);
 
+		if (priv->leds[i].active_low)
+			duty = priv->leds[i].state.period - duty;
+
 		priv->leds[i].state.duty_cycle = duty;
 		priv->leds[i].state.enabled = duty > 0;
 		ret = pwm_apply_state(priv->leds[i].pwm,
@@ -76,6 +80,7 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
 			goto release_fwnode;
 		}
 		pwm_init_state(pwmled->pwm, &pwmled->state);
+		pwmled->active_low = fwnode_property_read_bool(fwnode, "active-low");
 
 		ret = fwnode_property_read_u32(fwnode, "color", &color);
 		if (ret) {
-- 
2.37.0

