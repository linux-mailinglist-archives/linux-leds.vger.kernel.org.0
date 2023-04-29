Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4F46F243A
	for <lists+linux-leds@lfdr.de>; Sat, 29 Apr 2023 12:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjD2KqC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 Apr 2023 06:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjD2KqA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 Apr 2023 06:46:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B481FCD;
        Sat, 29 Apr 2023 03:45:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f32588c13so115444266b.2;
        Sat, 29 Apr 2023 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682765157; x=1685357157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85dGX3BcJlsvsmIB6J26oSZoBGI3NIb+OIXm3X+ki1M=;
        b=SavQORTDBSYuMf4NYpgxnmvNWIzE5CKP433xtRUMTq7J/Q6oYvGzI2G07vovknCplW
         aKOMKbde1U6gPNSmEhbHyKLXhY3Yz1V6wTf55xiuGHClESIuGM4+Jp6CD7HlgR9fc4uM
         hpiD6zq9LOb2Z2Lv3J8miwjq0WhyybIk76uNwYF3Su3lCyRwK0O/j4xDX+Xbvbh62um7
         oho9YD5G2iVO9Z16716wKfe28m9CC7jgPAS8OZpNYRuvdeId/8LJBRwOTdSeK0teBJbE
         UtzF7qNFdOJHeMHjcJaYkZwpGeyZuZuagXqS8sQNyVI27SI3f+CcOMWS4cvUytTtoqxM
         U8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682765157; x=1685357157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85dGX3BcJlsvsmIB6J26oSZoBGI3NIb+OIXm3X+ki1M=;
        b=HMzUwZTSngxeGy53yv1K9FST9pUEV+vAlMGrPwXqJ95O5l8hD0kc/nLV2VXeJln4Ca
         pwwEYBUDT7swNpzQA+e9Qpl/3yCdN+efRlEXYBPzmkM0lVkzFpEdWD2CO23fjIAl/Qek
         lCtNIWl9D3MpR5r075iMRfzjLN34KVjdA5PUYeXWtRdUm7rMNNlp0pVm4Fj+eghpIU4Q
         e6UB0RS2GnHim0ydvvk2qQwCR1uP8uYCBsQH9EZpTri8gV9uYQT7N8Lb7T6PUN0//ZPM
         REyx5wv0AX//y+yZZAcbW5TGqmRPxaIYo5qPe+qkizfBDC03fAhxI+UM46QQ40m9sadt
         eD/A==
X-Gm-Message-State: AC+VfDxQlD6FXaNPLikf9zSzrQSnjtTtf9UVdNC4JmlE3RtO75+54z40
        mHMAUSJkINm5VpKuJEYuASE=
X-Google-Smtp-Source: ACHHUZ4Iks8feZLZPZ6+i/k546kbejwZ5TdS3uy3LbDxgsao9syengkKD6aI8RhLUoQTP/Dzj7NCig==
X-Received: by 2002:a17:907:3e08:b0:94a:5c6d:3207 with SMTP id hp8-20020a1709073e0800b0094a5c6d3207mr7154482ejc.44.1682765157169;
        Sat, 29 Apr 2023 03:45:57 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl. [83.8.115.30])
        by smtp.gmail.com with ESMTPSA id b11-20020a056402138b00b004bd6e3ed196sm9952522edv.86.2023.04.29.03.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 03:45:56 -0700 (PDT)
From:   Artur Weber <aweber.kernel@gmail.com>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Helge Deller <deller@gmx.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Artur Weber <aweber.kernel@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/4] video: backlight: lp855x: get PWM for PWM mode during probe
Date:   Sat, 29 Apr 2023 12:45:32 +0200
Message-Id: <20230429104534.28943-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429104534.28943-1-aweber.kernel@gmail.com>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Also deprecate the pwm-period DT property, as it is now redundant
(pwms property already contains period value).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/video/backlight/lp855x_bl.c | 48 ++++++++++++++++-------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 81012bf29baf..21eb4943ed56 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -218,23 +218,10 @@ static int lp855x_configure(struct lp855x *lp)
 
 static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
-	struct pwm_device *pwm;
 	struct pwm_state state;
 
-	/* request pwm device with the consumer name */
-	if (!lp->pwm) {
-		pwm = devm_pwm_get(lp->dev, lp->chipname);
-		if (IS_ERR(pwm))
-			return;
-
-		lp->pwm = pwm;
-
-		pwm_init_state(lp->pwm, &state);
-	} else {
-		pwm_get_state(lp->pwm, &state);
-	}
+	pwm_get_state(lp->pwm, &state);
 
-	state.period = lp->pdata->period_ns;
 	state.duty_cycle = div_u64(br * state.period, max_br);
 	state.enabled = state.duty_cycle;
 
@@ -339,6 +326,7 @@ static int lp855x_parse_dt(struct lp855x *lp)
 	of_property_read_string(node, "bl-name", &pdata->name);
 	of_property_read_u8(node, "dev-ctrl", &pdata->device_control);
 	of_property_read_u8(node, "init-brt", &pdata->initial_brightness);
+	/* Deprecated, specify period in pwms property instead */
 	of_property_read_u32(node, "pwm-period", &pdata->period_ns);
 
 	/* Fill ROM platform data if defined */
@@ -399,6 +387,7 @@ static int lp855x_probe(struct i2c_client *cl)
 	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
 	const struct acpi_device_id *acpi_id = NULL;
 	struct device *dev = &cl->dev;
+	struct pwm_state pwmstate;
 	struct lp855x *lp;
 	int ret;
 
@@ -457,11 +446,6 @@ static int lp855x_probe(struct i2c_client *cl)
 		}
 	}
 
-	if (lp->pdata->period_ns > 0)
-		lp->mode = PWM_BASED;
-	else
-		lp->mode = REGISTER_BASED;
-
 	lp->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(lp->supply)) {
 		if (PTR_ERR(lp->supply) == -EPROBE_DEFER)
@@ -472,11 +456,31 @@ static int lp855x_probe(struct i2c_client *cl)
 	lp->enable = devm_regulator_get_optional(dev, "enable");
 	if (IS_ERR(lp->enable)) {
 		ret = PTR_ERR(lp->enable);
-		if (ret == -ENODEV) {
+		if (ret == -ENODEV)
 			lp->enable = NULL;
-		} else {
+		else
 			return dev_err_probe(dev, ret, "getting enable regulator\n");
-		}
+	}
+
+	lp->pwm = devm_pwm_get(lp->dev, lp->chipname);
+	if (IS_ERR(lp->pwm)) {
+		ret = PTR_ERR(lp->pwm);
+		if (ret == -ENODEV || ret == -EINVAL)
+			lp->pwm = NULL;
+		else
+			return dev_err_probe(dev, ret, "getting PWM\n");
+
+		lp->mode = REGISTER_BASED;
+		dev_dbg(dev, "mode: register based\n");
+	} else {
+		pwm_init_state(lp->pwm, &pwmstate);
+		/* Legacy platform data compatibility */
+		if (lp->pdata->period_ns > 0)
+			pwmstate.period = lp->pdata->period_ns;
+		pwm_apply_state(lp->pwm, &pwmstate);
+
+		lp->mode = PWM_BASED;
+		dev_dbg(dev, "mode: PWM based\n");
 	}
 
 	if (lp->supply) {
-- 
2.40.1

