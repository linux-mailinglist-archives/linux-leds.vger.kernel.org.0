Return-Path: <linux-leds+bounces-2774-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3697D49C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 13:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D641C221A5
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 11:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00590140397;
	Fri, 20 Sep 2024 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZmz6NBz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB113E8A5
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726830922; cv=none; b=XIIiGNOCLj109uQimC69Dmh5gF2lewIV3S3Joel+FYVYCIAdJKD6UkOkgbSrwwex/iPULvS3ajqoleqWDrn+5nPzGkDtkRyK0DXDEtJ26vPO/42+er0Lty8wBxQ3BG98dYEJ1hd+Kl6VTPy3nw6bPwiA1aGPwiw7ZQdvTHBl69Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726830922; c=relaxed/simple;
	bh=Gv57wclApeuEMQ7azjdwXA14GxlKdGzrC8sWDLmSgKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzB6ymZ0r2iNopKk255/YCqcz8xGmbv9zhnDP/Czx7H11+Ms2oq5WXDUyEhfOb+IkpQSOwe9YGtLwIFjYA3bGB7I3V5Wk/qOjo87dnIip6lF7YhjGJWOprpn+1E+t1b2048oumbjv9xMqX+DjPS8p7yKnKwsyWTizQmjIpng4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZmz6NBz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d64b27c45so311438566b.3
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726830918; x=1727435718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocdV6UAxfoXgEc5jdC/lvxhHos+UsfjtvMrbaeubl44=;
        b=AZmz6NBzzrhqVOINpatr/2cyLltB0CNoR6pdx1VTT3xq75M0dGgJ276XDD7cpuNqbW
         4xQK0u9FF2QP8YXxmfApKNv7W4yVpm/LDy0UlSjTS0cW6ACs/IN8LKaTE+YSTAGR3hXb
         zOf4ye8nSA7oR1hZNingAPO6gJth9yfr1AT9lqoF6r44m8U03hDGTD0QnCxBpEWtqNxp
         3hu0LMmaTAvkl/xo/IjM/Mn3DHN7edC4v7jUEd0HTyTdZpuoxdNmudvo73m/ob0yjPlt
         xiFwZ5tbFkx9OwaJJoy5D74qYfcmPelLK3nV9uhdCxdniHTD04qEzePlP4oIycX+SXb8
         XkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726830918; x=1727435718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocdV6UAxfoXgEc5jdC/lvxhHos+UsfjtvMrbaeubl44=;
        b=isT9mA7QhPnkJD7P5Z7Z2J7JUUOh5P8KMPPcZHD8iCt0KuPM+lmnDiTUXk12ZpS8YE
         eRnQs8ocQ9/K9KjLMzsdkI8C0BSlLrlPduX1mGHZ91cyfElFMfc788KH244QAZ5NWh3t
         X4UP6ECq1kNli/sRsvOAZrthEUoInCIRDKQ28rcylfewgeQTTN+ftTMrOkle9Bh+XLsJ
         CPI65tijbXN2OxEQIl1H4j4tbGuk79Q+RqAXGPd+LOBM1cYvckTzPo1b270lbK9BfArM
         5dYM563bAHvSRjNBMq4GAOgqbNLwO2PGp6wJlgbGrBsgVBglC54qwwKFl6uPF4tzrwk/
         6RJw==
X-Gm-Message-State: AOJu0YxBMnDl0MP0pzp/lMBwUndqX2SYohcorELL9UaWFp9S3ut6fT/H
	bNLqSmSIsbjgcVFT91bc/s2WPbF4onp1YAi6JYJ9f+l29DDLADfWgC+6kxZf5oE=
X-Google-Smtp-Source: AGHT+IHj2ot166L13+w0FJxn9us1Aorz5zwai3bhLb3jdLgcwmz+/gj6pBodxo3X9h/A7yboe/84Fg==
X-Received: by 2002:a17:907:3f9f:b0:a8a:9054:8394 with SMTP id a640c23a62f3a-a90d4e34f51mr226805866b.0.1726830918156;
        Fri, 20 Sep 2024 04:15:18 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f452csm838261266b.89.2024.09.20.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 04:15:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Sep 2024 13:15:13 +0200
Subject: [PATCH 2/2] leds: bcmbca: Add new driver for Broadcom BCMBCA
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-bcmbca-leds-v1-2-5f70e692c6ff@linaro.org>
References: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
In-Reply-To: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The Broadcom BCA (Broadband Access) SoCs have a LED control
block that can support either parallel (directly connected)
LEDs or serial (connected to 1-4 shift registers) LEDs.

Add a driver for that hardware.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                |   7 +
 drivers/leds/Kconfig       |   9 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-bcmbca.c | 391 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 408 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd..0a603b72a6a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4383,6 +4383,13 @@ N:	bcm[9]?6856
 N:	bcm[9]?6858
 N:	bcm[9]?6878
 
+BROADCOM BCMBCA LED DRIVER
+M:	Linus Walleij <linus.walleij@linaro.org>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml
+F:	drivers/leds/leds-bcmbca.c
+
 BROADCOM BDC DRIVER
 M:	Justin Chen <justin.chen@broadcom.com>
 M:	Al Cooper <alcooperx@gmail.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 8d9d8da376e4..e14c7fa587f0 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -146,6 +146,15 @@ config LEDS_BCM6358
 	  This option enables support for LEDs connected to the BCM6358
 	  LED HW controller accessed via MMIO registers.
 
+config LEDS_BCMBCA
+	tristate "LED Support for Broadcom BCMBCA"
+	depends on LEDS_CLASS
+	depends on HAS_IOMEM
+	depends on OF
+	help
+	  This option enables support for LEDs connected to the BCMBCA
+	  LED HW controller accessed via MMIO registers.
+
 config LEDS_CHT_WCOVE
 	tristate "LED support for Intel Cherry Trail Whiskey Cove PMIC"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..96e036f04e18 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
+obj-$(CONFIG_LEDS_BCMBCA)		+= leds-bcmbca.o
 obj-$(CONFIG_LEDS_BD2606MVV)		+= leds-bd2606mvv.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
diff --git a/drivers/leds/leds-bcmbca.c b/drivers/leds/leds-bcmbca.c
new file mode 100644
index 000000000000..74dc4245bea4
--- /dev/null
+++ b/drivers/leds/leds-bcmbca.c
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for BCMBCA memory-mapped LEDs
+ *
+ * Copyright 2024 Linus Walleij <linus.walleij@linaro.org>
+ */
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define BCMBCA_CTRL			0x00
+#define BCMBCA_CTRL_SERIAL_POL_HIGH	BIT(1)
+#define BCMBCA_CTRL_ENABLE		BIT(3) /* Uncertain about this bit */
+#define BCMBCA_CTRL_SERIAL_MSB_FIRST	BIT(4)
+
+#define BCMBCA_MASK			0x04
+#define BCMBCA_HW_EN			0x08
+/*
+ * In the serial shift selector, set bits to 1 from BIT(0) and upward all
+ * set to one until the last LED including any unused slots in the shift
+ * register.
+ */
+#define BCMBCA_SERIAL_SHIFT_SEL		0x0c
+#define BCMBCA_FLASH_RATE		0x10 /* 4 bits per LED so -> 1c */
+#define BCMBCA_BRIGHTNESS		0x20 /* 4 bits per LED so -> 2c */
+#define BCMBCA_POWER_LED_CFG		0x30
+#define BCMBCA_POWER_LUT		0x34 /* -> b0 */
+#define BCMBCA_HW_POLARITY		0xb4
+#define BCMBCA_SW_DATA			0xb8 /* 1 bit on/off for each LED */
+#define BCMBCA_SW_POLARITY		0xbc
+#define BCMBCA_PARALLEL_POLARITY	0xc0
+#define BCMBCA_SERIAL_POLARITY		0xc4
+
+#define BCMBCA_LED_MAX_COUNT		32
+#define BCMBCA_LED_MAX_BRIGHTNESS	8
+
+enum bcmbca_led_type {
+	BCMBCA_LED_SERIAL,
+	BCMBCA_LED_PARALLEL,
+};
+
+/**
+ * struct bcmbca_led - state container for bcmbca based LEDs
+ * @cdev: LED class device for this LED
+ * @base: memory base address
+ * @lock: memory lock
+ * @idx: LED index number
+ * @active_low: LED is active low
+ * @num_serial_shifters: number of serial shift registers
+ * @led_type: whether this is a serial or parallel LED
+ */
+struct bcmbca_led {
+	struct led_classdev cdev;
+	void __iomem *base;
+	spinlock_t *lock;
+	unsigned int idx;
+	bool active_low;
+	u32 num_serial_shifters;
+	enum bcmbca_led_type led_type;
+};
+
+static void bcmbca_led_blink_disable(struct led_classdev *ldev)
+{
+	struct bcmbca_led *led =
+		container_of(ldev, struct bcmbca_led, cdev);
+	/* 8 LEDs per register so integer-divide by 8 */
+	u8 led_offset = (led->idx >> 3);
+	/* Find the 4 bits for each LED */
+	u32 led_mask = 0xf << ((led->idx & 0x07) << 2);
+	u32 val;
+
+	/* Write registers */
+	guard(spinlock_irqsave)(led->lock);
+	val = readl(led->base + BCMBCA_FLASH_RATE + led_offset);
+	val &= led_mask;
+	writel(val, led->base + BCMBCA_FLASH_RATE + led_offset);
+}
+
+static int bcmbca_led_blink_set(struct led_classdev *ldev,
+				unsigned long *delay_on,
+				unsigned long *delay_off)
+{
+	struct bcmbca_led *led =
+		container_of(ldev, struct bcmbca_led, cdev);
+	u8 led_offset = (led->idx >> 3);
+	u32 led_mask = 0xf << ((led->idx & 0x07) << 2);
+	unsigned long period;
+	u32 led_val;
+	u32 val;
+
+	/* Friendly defaults as specified in the documentation */
+	if (*delay_on == 0 && *delay_off == 0) {
+		*delay_on = 240;
+		*delay_off = 240;
+	}
+
+	if (*delay_on != *delay_off) {
+		dev_dbg(ldev->dev, "only square blink supported\n");
+		return -EINVAL;
+	}
+
+	period = *delay_on + *delay_off;
+	if (period > 2000) {
+		dev_dbg(ldev->dev, "period too long, %lu max 2000 ms\n",
+			period);
+		return -EINVAL;
+	}
+
+	if (period <= 60)
+		led_val = 1;
+	else if (period <= 120)
+		led_val = 2;
+	else if (period <= 240)
+		led_val = 3;
+	else if (period <= 480)
+		led_val = 4;
+	else if (period <= 960)
+		led_val = 5;
+	else if (period <= 1920)
+		led_val = 6;
+	else
+		led_val = 7;
+
+	led_val = led_val << ((led->idx & 0x07) << 2);
+
+	/* Write registers */
+	guard(spinlock_irqsave)(led->lock);
+	val = readl(led->base + BCMBCA_FLASH_RATE + led_offset);
+	val &= led_mask;
+	val |= led_val;
+	writel(val, led->base + BCMBCA_FLASH_RATE + led_offset);
+
+	return 0;
+}
+
+static void bcmbca_led_set(struct led_classdev *ldev,
+			    enum led_brightness value)
+{
+	struct bcmbca_led *led =
+		container_of(ldev, struct bcmbca_led, cdev);
+	u8 led_offset = (led->idx >> 3);
+	u32 led_mask = 0xf << ((led->idx & 0x07) << 2);
+	u32 led_val = value << ((led->idx & 0x07) << 2);
+	u32 val;
+
+	dev_dbg(ldev->dev, "LED%u, register %08x, mask %08x, value %08x\n",
+		led->idx, BCMBCA_BRIGHTNESS + led_offset, led_mask, led_val);
+
+	/* Write registers */
+	guard(spinlock_irqsave)(led->lock);
+
+	/* Parallel LEDs support brightness control */
+	if (led->led_type == BCMBCA_LED_PARALLEL) {
+		val = readl(led->base + BCMBCA_BRIGHTNESS + led_offset);
+		val &= led_mask;
+		val |= led_val;
+		writel(val, led->base + BCMBCA_BRIGHTNESS + led_offset);
+	}
+
+	/* Software control on/off */
+	if (value == LED_OFF) {
+		val = readl(led->base + BCMBCA_SW_DATA);
+		val &= ~BIT(led->idx);
+		writel(val, led->base + BCMBCA_SW_DATA);
+		bcmbca_led_blink_disable(ldev);
+	} else {
+		val = readl(led->base + BCMBCA_SW_DATA);
+		val |= BIT(led->idx);
+		writel(val, led->base + BCMBCA_SW_DATA);
+	}
+}
+
+static u8 bcmbca_led_get(void __iomem *base, int idx)
+{
+	u8 led_offset = (idx >> 3);
+	u32 led_mask = 0xf << ((idx & 0x07) << 2);
+	u32 val;
+
+	/* Called marshalled so no lock needed */
+	val = readl(base + BCMBCA_BRIGHTNESS + led_offset);
+	return ((val & led_mask) >> ((idx & 0x07) << 2));
+}
+
+static int bcmbca_led_probe(struct device *dev, struct device_node *np, u32 reg,
+			    void __iomem *base, spinlock_t *lock,
+			    u32 num_shifters, enum bcmbca_led_type led_type)
+{
+	struct led_init_data init_data = {};
+	struct bcmbca_led *led;
+	enum led_default_state state;
+	u32 val;
+	int rc;
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->idx = reg;
+	led->base = base;
+	led->lock = lock;
+
+	if (of_property_read_bool(np, "active-low"))
+		led->active_low = true;
+
+	init_data.fwnode = of_fwnode_handle(np);
+
+	if (led->led_type == BCMBCA_LED_PARALLEL)
+		led->cdev.max_brightness = BCMBCA_LED_MAX_BRIGHTNESS;
+	else
+		led->cdev.max_brightness = LED_ON;
+
+	state = led_init_default_state_get(init_data.fwnode);
+
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		led->cdev.brightness = led->cdev.max_brightness;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		val = bcmbca_led_get(base, led->idx);
+		if (val)
+			led->cdev.brightness = val;
+		else
+			led->cdev.brightness = LED_OFF;
+		break;
+	default:
+		led->cdev.brightness = LED_OFF;
+		break;
+	}
+
+	/*
+	 * Polarity inversion setting per-LED
+	 * The default is actually active low, we set a bit to 1
+	 * in the register to make it active high.
+	 */
+	if (!of_property_read_bool(np, "active-low")) {
+		switch (led_type) {
+		case BCMBCA_LED_SERIAL:
+			val = readl(base + BCMBCA_SERIAL_POLARITY);
+			val |= BIT(led->idx);
+			writel(val, base + BCMBCA_SERIAL_POLARITY);
+			break;
+		case BCMBCA_LED_PARALLEL:
+			val = readl(base + BCMBCA_PARALLEL_POLARITY);
+			val |= BIT(led->idx);
+			writel(val, base + BCMBCA_PARALLEL_POLARITY);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Initial brightness setup */
+	bcmbca_led_set(&led->cdev, led->cdev.brightness);
+
+	led->cdev.brightness_set = bcmbca_led_set;
+	led->cdev.blink_set = bcmbca_led_blink_set;
+	/* TODO: implement HW control */
+
+	rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (rc < 0)
+		return rc;
+
+	dev_info(dev, "registered LED %s\n", led->cdev.name);
+
+	return 0;
+}
+
+static int bcmbca_leds_probe(struct platform_device *pdev)
+{
+	unsigned int max_leds = BCMBCA_LED_MAX_COUNT;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(&pdev->dev);
+	enum bcmbca_led_type led_type;
+	void __iomem *base;
+	spinlock_t *lock; /* memory lock */
+	u32 num_shifters;
+	u32 val;
+	int ret;
+	int i;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	lock = devm_kzalloc(dev, sizeof(*lock), GFP_KERNEL);
+	if (!lock)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "brcm,serial-shifters", &num_shifters);
+	if (!ret) {
+		/* Serial LEDs */
+		dev_dbg(dev, "serial LEDs, %d shift registers used\n", num_shifters);
+		led_type = BCMBCA_LED_SERIAL;
+		/*
+		 * Each shifter can handle maximum 8 LEDs so we cap the
+		 * maximum LEDs we can handle at that.
+		 */
+		max_leds = num_shifters * 8;
+	} else {
+		/* Parallel LEDs */
+		led_type = BCMBCA_LED_PARALLEL;
+		dev_info(dev, "parallel LEDs requested, this is untested\n");
+	}
+
+	spin_lock_init(lock);
+
+	/* Turn off all LEDs and let the driver deal with them */
+	writel(0, base + BCMBCA_HW_EN);
+	writel(0, base + BCMBCA_SERIAL_POLARITY);
+	writel(0, base + BCMBCA_PARALLEL_POLARITY);
+
+	/* Set up serial shift register */
+	switch (num_shifters) {
+	case 0:
+		val = 0;
+		break;
+	case 1:
+		val = 0x000000ff;
+		break;
+	case 2:
+		val = 0x0000ffff;
+		break;
+	case 3:
+		val = 0x00ffffff;
+		break;
+	case 4:
+		val = 0xffffffff;
+		break;
+	}
+	writel(val, base + BCMBCA_SERIAL_SHIFT_SEL);
+
+	/* ??? */
+	writel(0xc0000000, base + BCMBCA_HW_POLARITY);
+	/* Initialize to max brightness */
+	for (i = 0; i < BCMBCA_LED_MAX_COUNT/8; i++) {
+		writel(0x88888888, base + BCMBCA_BRIGHTNESS + 4*i);
+		writel(0, base + BCMBCA_BRIGHTNESS + BCMBCA_FLASH_RATE + 4*i);
+	}
+
+	for_each_available_child_of_node_scoped(np, child) {
+		u32 reg;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg >= max_leds) {
+			dev_err(dev, "invalid LED (%u >= %d)\n", reg,
+				max_leds);
+			continue;
+		}
+
+		ret = bcmbca_led_probe(dev, child, reg, base, lock,
+				       num_shifters, led_type);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Enable the LEDs */
+	val = BCMBCA_CTRL_ENABLE | BCMBCA_CTRL_SERIAL_POL_HIGH;
+	if (of_property_read_bool(np, "brcm,serial-active-low"))
+		val &= ~BCMBCA_CTRL_SERIAL_POL_HIGH;
+	writel(val, base + BCMBCA_CTRL);
+
+	return 0;
+}
+
+static const struct of_device_id bcmbca_leds_of_match[] = {
+	{ .compatible = "brcm,bcmbca-leds", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, bcmbca_leds_of_match);
+
+static struct platform_driver bcmbca_leds_driver = {
+	.probe = bcmbca_leds_probe,
+	.driver = {
+		.name = "leds-bcmbca",
+		.of_match_table = bcmbca_leds_of_match,
+	},
+};
+
+module_platform_driver(bcmbca_leds_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("LED driver for BCMBCA LED controllers");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:leds-bcmbca");

-- 
2.46.0


