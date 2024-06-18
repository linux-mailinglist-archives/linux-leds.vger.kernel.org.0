Return-Path: <linux-leds+bounces-2010-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B423990D428
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 16:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BB61C209EF
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 14:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD731607A7;
	Tue, 18 Jun 2024 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry7b2TKA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3386815FCFE;
	Tue, 18 Jun 2024 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719221; cv=none; b=mG+oTrkKcXTJxl3T1FbkBwm7dzC2tiaTLRF4zDNthFwzoSEnZ4pSWsToFP3RMomTEO66TcYynXM7jnEIuUAnNIYq1yOXvnhmWX3Ilm8zyJ6lfhcOhr1R8w5qea4rsCjX9pcOh0UYpZ2rlnbplcbWkFqgKtcjIAF5xMiG/0qMCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719221; c=relaxed/simple;
	bh=/5IwQ99bQQRhP1wEuLRjxNnEs6zzgSHLcHa2YEf0U7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ABCh9U5KvZxN6slryF0ZWhK3GsHmais5N85CGOS9RiQ0p0TKCZH72H7dJefeJchm/7IjpyPUgoEDrB5IlyWp6B3k9A10MLhSSBJHGFK4SHUPA03qx6ObwRx74CaFp412HkYsG++VsgVaaZkjORemaVNG2RFDGOyOWIKfc/Api8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry7b2TKA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c83100cb4so6291666a12.1;
        Tue, 18 Jun 2024 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718719217; x=1719324017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iyl7EIOgIrVaZahoT7LEDslZvULejKLZ0v4aPQDoonI=;
        b=Ry7b2TKAm1yR5Ryl0s6GIF0YOolM9igb92CEKouivniPhTBsatR5BeP4lrpV+KEbj4
         zBVelCfcsw+eFBr1FSwg5JojIU9vnkE9OCJuNMCH1MIbfqfUDAYZytQF65exKd6vFEws
         wNB7r/MTGFn0bLl7ld8deCRmIreOdEfTUKgVy8PWPuFUclvRpHssvN0aZKN0xMoaZdh7
         aCckPh7vAy4b6MmRH0rYEKZMEpujkOg8hFflrZfF7/uWN7VhiWFF3rCYYPBFb8645Gbt
         2m0uSXXw1tvjZJqWgUYGhVwCUF1WSTmxqmbhHWBp+oUS+gjb/vAadIdCiPNkh0WjY2YM
         Bnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719217; x=1719324017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iyl7EIOgIrVaZahoT7LEDslZvULejKLZ0v4aPQDoonI=;
        b=M+1e3/0v+1p11HNtd3CMgJRhosPbxAhZ/D3mtSmdhmxHiY4zpyj1M12hZVTsZ0vWZC
         Gc8g1jYrW8ATH6bxKf4lhUXYcb/gQ3nPlvkbgK2Pa9ZquGcYtuVTD0PPHOxSuaYLKFNn
         l9uniil4kvXyNSiiozkfd0U/uP1wPuVywKFpmXMiJ1ufjI5kXhs1t6es5eXtSjpxyY1p
         uRiJxrV99+2LFoS+mIMQp+3p7/0xJs7BkcmU/craLSUnlYAr1Hco3I5xoh1FqXD/ovR2
         InRwbC8jHaV4MvKGcvqq0IWP5iyCpnShzXkIJlZ4kLW7RtKaIjcEa0FlZyIVdt0dLaWf
         YmOw==
X-Forwarded-Encrypted: i=1; AJvYcCUi2HiV/C9tmixniD2/gTyHLV5VdwfC7UIXniTRjCmpf0vzyZdMCM2cYGn/ynGrbE91pbpdBPdopTzOC0LuGaqlt7Paj885iREO8AxmbrEqR12rDE7GAacDI5hGQODojo9zJ1NhPCpFeZ4/ZKM+7JK/ql8B7NeC2JAul2TUl8G+SEgUGZc1JDxfULs+FbZsdoe2Ra8ysbj9M66HyRt9rLeIlf4XqEktMJx8GWdd/VRlPygssZyd6757pEZ521rylVvV0tQrfRURSUTzNkslpMcfxZZKyt9HQM3ilGPuGJDRZqdc6eX8uOSSarf0Yp/25h9GGK4HwRHueisLD/XQzC1BOKwqdGEEHkHgbLrC9/b/24ayLvLNeC4wnePJDflhrZKHLozYUd1pLLLdx7q0hR2X9ywPP/iU
X-Gm-Message-State: AOJu0YygOZy9ch78//V+ANnffnC7NPMXpYTIUtz1ugxc6jSfWYFd/B5+
	a0QRq5AX3KKyPaqkJmcXCQdhgxzcHS4qccU9e07R+N22NrvZTwCAKPm3agSx
X-Google-Smtp-Source: AGHT+IGGllCbRRfBvYmKtKXfQgz30xuR5BJBT8uIwbflUAozAyJ4/JF5SSTi5ZjGzFImDK2lcpqPHA==
X-Received: by 2002:a50:c346:0:b0:578:f472:d9d5 with SMTP id 4fb4d7f45d1cf-57cbd906889mr7353992a12.37.1718719217184;
        Tue, 18 Jun 2024 07:00:17 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by. [178.122.232.167])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 07:00:16 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:47 +0300
Subject: [PATCH v3 13/23] input: add max77705 haptic driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-13-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=12244;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=/5IwQ99bQQRhP1wEuLRjxNnEs6zzgSHLcHa2YEf0U7U=;
 b=IwqH87QADreHlElJVBH5g4BbXvWQGNAdUcyW7w342IefcdtH3+/qzYsds1Feycq0cFdWX/lgJ
 hLq8aG1QBixAubL/2LUzHO+Svtbe1BLs23uvNyDAmy3jBOGBU0mNcYn
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=

Add support for haptic controller on MAX77705 Multifunction
device.

This driver supports external pwm and LRA (Linear Resonant Actuator) motor.
User can control the haptic device via force feedback framework.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/input/misc/Kconfig           |  11 +
 drivers/input/misc/Makefile          |   1 +
 drivers/input/misc/max77705-haptic.c | 378 +++++++++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6ba984d7f0b1..26f7b25a0b42 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -233,6 +233,17 @@ config INPUT_MAX77693_HAPTIC
 	  To compile this driver as module, choose M here: the
 	  module will be called max77693-haptic.
 
+config INPUT_MAX77705_HAPTIC
+	tristate "MAXIM MAX77705 haptic controller support"
+	depends on MFD_MAX77705 && PWM
+	select INPUT_FF_MEMLESS
+	help
+	  This option enables support for the haptic controller on
+	  MAXIM MAX77705 chip.
+
+	  To compile this driver as module, choose M here: the
+	  module will be called max77705-haptic.
+
 config INPUT_MAX8925_ONKEY
 	tristate "MAX8925 ONKEY support"
 	depends on MFD_MAX8925
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 04296a4abe8e..4dea2720b757 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
+obj-$(CONFIG_INPUT_MAX77705_HAPTIC)	+= max77705-haptic.o
 obj-$(CONFIG_INPUT_MAX8925_ONKEY)	+= max8925_onkey.o
 obj-$(CONFIG_INPUT_MAX8997_HAPTIC)	+= max8997_haptic.o
 obj-$(CONFIG_INPUT_MC13783_PWRBUTTON)	+= mc13783-pwrbutton.o
diff --git a/drivers/input/misc/max77705-haptic.c b/drivers/input/misc/max77705-haptic.c
new file mode 100644
index 000000000000..e92dcb4fff37
--- /dev/null
+++ b/drivers/input/misc/max77705-haptic.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Based on max77693-haptic.c:
+ *	Copyright (C) 2014,2015 Samsung Electronics
+ *      Jaewon Kim <jaewon02.kim@samsung.com>
+ *      Krzysztof Kozlowski <krzk@kernel.org>
+ *
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+ *
+ * This program is not provided / owned by Maxim Integrated Products.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mfd/max77705.h>
+#include <linux/mfd/max77705-private.h>
+
+#define MAX_MAGNITUDE_SHIFT	16
+
+enum max77705_haptic_motor_type {
+	MAX77705_HAPTIC_ERM = 0,
+	MAX77705_HAPTIC_LRA,
+};
+
+enum max77705_haptic_pulse_mode {
+	MAX77705_HAPTIC_EXTERNAL_MODE = 0,
+	MAX77705_HAPTIC_INTERNAL_MODE,
+};
+
+enum max77705_haptic_pwm_divisor {
+	MAX77705_HAPTIC_PWM_DIVISOR_32 = 0,
+	MAX77705_HAPTIC_PWM_DIVISOR_64,
+	MAX77705_HAPTIC_PWM_DIVISOR_128,
+	MAX77705_HAPTIC_PWM_DIVISOR_256,
+};
+
+struct max77705_haptic {
+	enum max77705_types dev_type;
+
+	struct regmap *regmap_pmic;
+	struct regmap *regmap_haptic;
+	struct device *dev;
+	struct input_dev *input_dev;
+	struct pwm_device *pwm_dev;
+	struct regulator *motor_reg;
+
+	bool enabled;
+	bool suspend_state;
+	unsigned int magnitude;
+	unsigned int pwm_duty;
+	enum max77705_haptic_motor_type type;
+	enum max77705_haptic_pulse_mode mode;
+
+	struct work_struct work;
+};
+
+static int max77705_haptic_set_duty_cycle(struct max77705_haptic *haptic)
+{
+	struct pwm_args pargs;
+	int delta;
+	int error;
+
+	pwm_get_args(haptic->pwm_dev, &pargs);
+	delta = (pargs.period + haptic->pwm_duty) / 2;
+	error = pwm_config(haptic->pwm_dev, delta, pargs.period);
+	if (error) {
+		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int max77705_haptic_bias(struct max77705_haptic *haptic, bool on)
+{
+	int error;
+
+	error = regmap_update_bits(haptic->regmap_haptic,
+							   MAX77705_PMIC_REG_MAINCTRL1,
+							   MAX77705_MAINCTRL1_BIASEN_MASK,
+							   on << MAX77705_MAINCTRL1_BIASEN_SHIFT);
+
+	if (error) {
+		dev_err(haptic->dev, "failed to %s bias: %d\n",
+			on ? "enable" : "disable", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int max77705_haptic_configure(struct max77705_haptic *haptic,
+				     bool enable)
+{
+	unsigned int value, config_reg;
+	int error;
+
+	value = ((haptic->type << MAX77705_CONFIG2_MODE_SHIFT) |
+		(enable << MAX77705_CONFIG2_MEN_SHIFT) |
+		(haptic->mode << MAX77705_CONFIG2_HTYP_SHIFT) |
+		MAX77705_HAPTIC_PWM_DIVISOR_128);
+	config_reg = MAX77705_PMIC_REG_MCONFIG;
+
+	error = regmap_write(haptic->regmap_haptic,
+			     config_reg, value);
+	if (error) {
+		dev_err(haptic->dev,
+			"failed to update haptic config: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void max77705_haptic_enable(struct max77705_haptic *haptic)
+{
+	int error;
+
+	if (haptic->enabled)
+		return;
+
+	error = pwm_enable(haptic->pwm_dev);
+	if (error) {
+		dev_err(haptic->dev,
+			"failed to enable haptic pwm device: %d\n", error);
+		return;
+	}
+
+	error = max77705_haptic_configure(haptic, true);
+	if (error)
+		goto err_enable_config;
+
+	haptic->enabled = true;
+
+	return;
+
+err_enable_config:
+	pwm_disable(haptic->pwm_dev);
+}
+
+static void max77705_haptic_disable(struct max77705_haptic *haptic)
+{
+	int error;
+
+	if (!haptic->enabled)
+		return;
+
+	error = max77705_haptic_configure(haptic, false);
+	if (error)
+		return;
+
+	pwm_disable(haptic->pwm_dev);
+	haptic->enabled = false;
+}
+
+static void max77705_haptic_play_work(struct work_struct *work)
+{
+	struct max77705_haptic *haptic =
+			container_of(work, struct max77705_haptic, work);
+	int error;
+
+	error = max77705_haptic_set_duty_cycle(haptic);
+	if (error) {
+		dev_err(haptic->dev, "failed to set duty cycle: %d\n", error);
+		return;
+	}
+
+	if (haptic->magnitude)
+		max77705_haptic_enable(haptic);
+	else
+		max77705_haptic_disable(haptic);
+}
+
+static int max77705_haptic_play_effect(struct input_dev *dev, void *data,
+				       struct ff_effect *effect)
+{
+	struct max77705_haptic *haptic = input_get_drvdata(dev);
+	struct pwm_args pargs;
+	u64 period_mag_multi;
+
+	haptic->magnitude = effect->u.rumble.strong_magnitude;
+	if (!haptic->magnitude)
+		haptic->magnitude = effect->u.rumble.weak_magnitude;
+
+	/*
+	 * The magnitude comes from force-feedback interface.
+	 * The formula to convert magnitude to pwm_duty as follows:
+	 * - pwm_duty = (magnitude * pwm_period) / MAX_MAGNITUDE(0xFFFF)
+	 */
+	pr_info("magnitude: %d(%x)", haptic->magnitude, haptic->magnitude);
+	pwm_get_args(haptic->pwm_dev, &pargs);
+	period_mag_multi = (u64)pargs.period * haptic->magnitude;
+	haptic->pwm_duty = (unsigned int)(period_mag_multi >>
+						MAX_MAGNITUDE_SHIFT);
+
+	schedule_work(&haptic->work);
+
+	return 0;
+}
+
+static int max77705_haptic_open(struct input_dev *dev)
+{
+	struct max77705_haptic *haptic = input_get_drvdata(dev);
+	int error;
+
+	error = max77705_haptic_bias(haptic, true);
+	if (error)
+		return error;
+
+	error = regulator_enable(haptic->motor_reg);
+	if (error) {
+		dev_err(haptic->dev,
+			"failed to enable regulator: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void max77705_haptic_close(struct input_dev *dev)
+{
+	struct max77705_haptic *haptic = input_get_drvdata(dev);
+	int error;
+
+	cancel_work_sync(&haptic->work);
+	max77705_haptic_disable(haptic);
+
+	error = regulator_disable(haptic->motor_reg);
+	if (error)
+		dev_err(haptic->dev,
+			"failed to disable regulator: %d\n", error);
+
+	max77705_haptic_bias(haptic, false);
+}
+
+static int max77705_haptic_probe(struct platform_device *pdev)
+{
+	struct max77705_dev *max77705 = dev_get_drvdata(pdev->dev.parent);
+	struct max77705_haptic *haptic;
+	int error;
+
+	haptic = devm_kzalloc(&pdev->dev, sizeof(*haptic), GFP_KERNEL);
+	if (!haptic)
+		return -ENOMEM;
+
+	haptic->regmap_pmic = max77705->regmap;
+	haptic->dev = &pdev->dev;
+	haptic->type = MAX77705_HAPTIC_LRA;
+	haptic->mode = MAX77705_HAPTIC_EXTERNAL_MODE;
+	haptic->suspend_state = false;
+
+	/* Variant-specific init */
+	haptic->dev_type = max77705->type;
+	haptic->regmap_haptic = max77705->regmap;
+
+	INIT_WORK(&haptic->work, max77705_haptic_play_work);
+
+	/* Get pwm and regulatot for haptic device */
+	haptic->pwm_dev = devm_pwm_get(&pdev->dev, NULL);
+	if (IS_ERR(haptic->pwm_dev)) {
+		dev_err(&pdev->dev, "failed to get pwm device\n");
+		return PTR_ERR(haptic->pwm_dev);
+	}
+
+	/*
+	 * FIXME: pwm_apply_args() should be removed when switching to the
+	 * atomic PWM API.
+	 */
+	pwm_apply_args(haptic->pwm_dev);
+
+	haptic->motor_reg = devm_regulator_get(&pdev->dev, "haptic");
+	if (IS_ERR(haptic->motor_reg)) {
+		dev_err(&pdev->dev, "failed to get regulator\n");
+		return PTR_ERR(haptic->motor_reg);
+	}
+
+	/* Initialize input device for haptic device */
+	haptic->input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!haptic->input_dev) {
+		dev_err(&pdev->dev, "failed to allocate input device\n");
+		return -ENOMEM;
+	}
+
+	haptic->input_dev->name = "max77705-haptic";
+	haptic->input_dev->id.version = 1;
+	haptic->input_dev->dev.parent = &pdev->dev;
+	haptic->input_dev->open = max77705_haptic_open;
+	haptic->input_dev->close = max77705_haptic_close;
+	input_set_drvdata(haptic->input_dev, haptic);
+	input_set_capability(haptic->input_dev, EV_FF, FF_RUMBLE);
+
+	error = input_ff_create_memless(haptic->input_dev, NULL,
+				max77705_haptic_play_effect);
+	if (error) {
+		dev_err(&pdev->dev, "failed to create force-feedback\n");
+		return error;
+	}
+
+	error = input_register_device(haptic->input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		return error;
+	}
+
+	platform_set_drvdata(pdev, haptic);
+
+	return 0;
+}
+
+static void max77705_haptic_remove(struct platform_device *pdev)
+{
+	struct max77705_haptic *haptic = platform_get_drvdata(pdev);
+
+	if (haptic->enabled)
+		max77705_haptic_disable(haptic);
+}
+
+static int max77705_haptic_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct max77705_haptic *haptic = platform_get_drvdata(pdev);
+
+	if (haptic->enabled) {
+		max77705_haptic_disable(haptic);
+		haptic->suspend_state = true;
+	}
+
+	return 0;
+}
+
+static int max77705_haptic_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct max77705_haptic *haptic = platform_get_drvdata(pdev);
+
+	if (haptic->suspend_state) {
+		max77705_haptic_enable(haptic);
+		haptic->suspend_state = false;
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(max77705_haptic_pm_ops,
+				max77705_haptic_suspend,
+				max77705_haptic_resume);
+
+static const struct of_device_id of_max77705_haptic_dt_match[] = {
+	{ .compatible = "maxim,max77705-haptic", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, of_max77705_haptic_dt_match);
+
+static struct platform_driver max77705_haptic_driver = {
+	.driver		= {
+		.name	= "max77705-haptic",
+		.pm	= pm_sleep_ptr(&max77705_haptic_pm_ops),
+		.of_match_table = of_max77705_haptic_dt_match,
+	},
+	.probe		= max77705_haptic_probe,
+	.remove_new	= max77705_haptic_remove,
+};
+module_platform_driver(max77705_haptic_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
+MODULE_DESCRIPTION("MAXIM 77705/77705 Haptic driver");
+MODULE_LICENSE("GPL");

-- 
2.39.2


