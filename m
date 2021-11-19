Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C92B4569CC
	for <lists+linux-leds@lfdr.de>; Fri, 19 Nov 2021 06:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhKSFnw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Nov 2021 00:43:52 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39745 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229457AbhKSFnv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Nov 2021 00:43:51 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 764B12B0114A;
        Fri, 19 Nov 2021 00:40:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 19 Nov 2021 00:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        TpRhN1k597TreggN4ZMHc7KjRI56T3DTTx2Ff6AiAB0=; b=MIOOBodsu7T2tt7L
        29ugfwDu/l7BjZaZ4tB5JMojoQjJSSzbqId3GAvpNWjMQ4Rnx2h8wJB2LUKOw7JQ
        0xWxrCD9gygH/zQm7d0e1MvjvO1+WT0kz97YWEgYg6m9bPk0F+0aOKEQYU1rCwmv
        NL4AWAzAWQlPfqGQbDTOmvQEs8dx77gCyDr9/X+43+3wqKM0SiV6/OQBPs4CTdDx
        wRDtFNpeTTnrsJ1UttFFZ7cOIxAWFuLrumo3cROtMeXPvk37ESwu9SPHSg744Lc4
        esMK5Ri+Ww9PO5pkKLpS3HlJwgEQumdW8boJgm7uCDSDu5LEWICK5b+IJY7qxQZN
        w8wn5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=TpRhN1k597TreggN4ZMHc7KjRI56T3DTTx2Ff6AiA
        B0=; b=g70b/GV6QQeJuM3fQKlVNkobyVfikpL+rtbgJEqlP2dPgNELEIjqMSO3E
        4n0kwEdHazq8xslpYX2ef6gcnO2KRrJBuL8lJrfPlBmWBRUfoLwpr6yAscR8HLhI
        Vvojt9Uf6a0FCqN7sTw1vs6C4KCxjAOqwADEnow5W9lhVprm3snaKMy3cPUWUuO4
        DgFt6VfQyqmFj49CmSuuWAK+g6aD+zlafEvGMqr/bB0LYYH8dLrUUwpE5f28R16W
        Iqh+sIv68p24SxheFwDAGfnkKcmlw1RReuRuXWbLVR9D2U8MPJzeVfSv+SfT10B8
        lJgviXzvs7Q2+GFyxLiZbYRvTMvZA==
X-ME-Sender: <xms:4TiXYagfdxS0IIYiyV2VFUEiC5lUGxLqpl7srh5bGXXlvznD6LWwLw>
    <xme:4TiXYbCG_-M_a-ZYP_lU8zgFTp7nGlk9C-UO1ZTts0T67LM6gA409II8l8xLQZ-lu
    sZCxNtH5J1GPEgMkw>
X-ME-Received: <xmr:4TiXYSHRbmjBafLQxbQIvN4PQvkrJ4BJQqm736Eo4i3EKRk7oltBsVc8UwjLD2B35VDd2S2Ylm-V_ZdFGCbL_3j1Ge8TacpM3phKUkkkr1Adube_rOr_OMN-aPv-jpfTvisJRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeefvdffteegudeitdffgfelledvhfehkeekudffteduvdegfeefudef
    hfegheeujeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:4TiXYTQdYrSGs3Sooltq-jz1nAHoPPRm2E8L4EMFavfSDt5qpcqTYw>
    <xmx:4TiXYXzrNjQiGO_Zn4EPSliRcX_LyRssy7iiKuMWg-kNFpdZliz7qg>
    <xmx:4TiXYR5IKrLobu2ZAezXfDNVJLPhdfnslYGKpxKwhhN8qzjHI2H9VQ>
    <xmx:4TiXYffyyGmpW2anM6APXvYYwPh-dj_gTHPq1QBlxyd7-Q0uXx5BKNTlkCo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 00:40:48 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 2/2] leds: sun50i-r329: New driver for the R329/D1 LED controller
Date:   Thu, 18 Nov 2021 23:40:43 -0600
Message-Id: <20211119054044.16286-2-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119054044.16286-1-samuel@sholland.org>
References: <20211119054044.16286-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some Allwinner sunxi SoCs, starting with the R329, contain an LED
controller designed to drive RGB LED pixels. Add a driver for it using
the multicolor LED framework, and with LEDs defined in the device tree.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - Added vendor prefix to timing/format properties
 - Renamed "format" property to "pixel-format" for clarity
 - Dropped "vled-supply" as it is unrelated to the controller hardware
 - Changed "writesl" to "iowrite32_rep" so the driver builds on hppa

Changes in v2:
 - Renamed from sunxi-ledc to sun50i-r329-ledc
 - Added missing "static" to functions/globals as reported by 0day bot

 drivers/leds/Kconfig            |   8 +
 drivers/leds/Makefile           |   1 +
 drivers/leds/leds-sun50i-r329.c | 553 ++++++++++++++++++++++++++++++++
 3 files changed, 562 insertions(+)
 create mode 100644 drivers/leds/leds-sun50i-r329.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed800f5da7d8..d5c1396788fe 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -297,6 +297,14 @@ config LEDS_SUNFIRE
 	  This option enables support for the Left, Middle, and Right
 	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
 
+config LEDS_SUN50I_R329
+	tristate "LED support for Allwinner R329 LED controller"
+	depends on LEDS_CLASS
+	depends on ARCH_SUNXI || COMPILE_TEST
+	help
+	  This option enables support for the RGB LED controller
+	  provided in some Allwinner sunxi SoCs, like the R329.
+
 config LEDS_IPAQ_MICRO
 	tristate "LED Support for the Compaq iPAQ h3xxx"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c636ec069612..506b2617099d 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
+obj-$(CONFIG_LEDS_SUN50I_R329)		+= leds-sun50i-r329.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
diff --git a/drivers/leds/leds-sun50i-r329.c b/drivers/leds/leds-sun50i-r329.c
new file mode 100644
index 000000000000..ada6625e2bbc
--- /dev/null
+++ b/drivers/leds/leds-sun50i-r329.c
@@ -0,0 +1,553 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
+//
+// Partly based on drivers/leds/leds-turris-omnia.c, which is:
+//     Copyright (c) 2020 by Marek Behún <kabel@kernel.org>
+//
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define LEDC_CTRL_REG			0x0000
+#define LEDC_CTRL_REG_DATA_LENGTH		(0x1fff << 16)
+#define LEDC_CTRL_REG_RGB_MODE			(0x7 << 6)
+#define LEDC_CTRL_REG_LEDC_EN			BIT(0)
+#define LEDC_T01_TIMING_CTRL_REG	0x0004
+#define LEDC_T01_TIMING_CTRL_REG_T1H		(0x3f << 21)
+#define LEDC_T01_TIMING_CTRL_REG_T1L		(0x1f << 16)
+#define LEDC_T01_TIMING_CTRL_REG_T0H		(0x1f << 6)
+#define LEDC_T01_TIMING_CTRL_REG_T0L		(0x3f << 0)
+#define LEDC_RESET_TIMING_CTRL_REG	0x000c
+#define LEDC_RESET_TIMING_CTRL_REG_LED_NUM	(0x3ff << 0)
+#define LEDC_DATA_REG			0x0014
+#define LEDC_DMA_CTRL_REG		0x0018
+#define LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL	(0x1f << 0)
+#define LEDC_INT_CTRL_REG		0x001c
+#define LEDC_INT_CTRL_REG_GLOBAL_INT_EN		BIT(5)
+#define LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN	BIT(1)
+#define LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN	BIT(0)
+#define LEDC_INT_STS_REG		0x0020
+#define LEDC_INT_STS_REG_FIFO_CPUREQ_INT	BIT(1)
+#define LEDC_INT_STS_REG_TRANS_FINISH_INT	BIT(0)
+
+#define LEDC_FIFO_DEPTH			32
+#define LEDC_MAX_LEDS			1024
+
+#define LEDS_TO_BYTES(n)		((n) * sizeof(u32))
+
+struct sun50i_r329_ledc_led {
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subled_info[3];
+};
+#define to_ledc_led(mc) container_of(mc, struct sun50i_r329_ledc_led, mc_cdev)
+
+struct sun50i_r329_ledc_timing {
+	u32 t0h_ns;
+	u32 t0l_ns;
+	u32 t1h_ns;
+	u32 t1l_ns;
+	u32 treset_ns;
+};
+
+struct sun50i_r329_ledc {
+	struct device *dev;
+	void __iomem *base;
+	struct clk *bus_clk;
+	struct clk *mod_clk;
+	struct reset_control *reset;
+
+	u32 *buffer;
+	struct dma_chan *dma_chan;
+	dma_addr_t dma_handle;
+	int pio_length;
+	int pio_offset;
+
+	spinlock_t lock;
+	int next_length;
+	bool xfer_active;
+
+	u32 format;
+	struct sun50i_r329_ledc_timing timing;
+
+	int num_leds;
+	struct sun50i_r329_ledc_led leds[];
+};
+
+static int sun50i_r329_ledc_dma_xfer(struct sun50i_r329_ledc *priv, int length)
+{
+	struct dma_async_tx_descriptor *desc;
+	dma_cookie_t cookie;
+
+	desc = dmaengine_prep_slave_single(priv->dma_chan, priv->dma_handle,
+					   LEDS_TO_BYTES(length),
+					   DMA_MEM_TO_DEV, 0);
+	if (!desc)
+		return -ENOMEM;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie))
+		return -EIO;
+
+	dma_async_issue_pending(priv->dma_chan);
+
+	return 0;
+}
+
+static void sun50i_r329_ledc_pio_xfer(struct sun50i_r329_ledc *priv, int length)
+{
+	u32 burst, offset, val;
+
+	if (length) {
+		/* New transfer (FIFO is empty). */
+		offset = 0;
+		burst  = min(length, LEDC_FIFO_DEPTH);
+	} else {
+		/* Existing transfer (FIFO is half-full). */
+		length = priv->pio_length;
+		offset = priv->pio_offset;
+		burst  = min(length, LEDC_FIFO_DEPTH / 2);
+	}
+
+	iowrite32_rep(priv->base + LEDC_DATA_REG, priv->buffer + offset, burst);
+
+	if (burst < length) {
+		priv->pio_length = length - burst;
+		priv->pio_offset = offset + burst;
+
+		if (!offset) {
+			val = readl(priv->base + LEDC_INT_CTRL_REG);
+			val |= LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN;
+			writel(val, priv->base + LEDC_INT_CTRL_REG);
+		}
+	} else {
+		/* Disable the request IRQ once all data is written. */
+		val = readl(priv->base + LEDC_INT_CTRL_REG);
+		val &= ~LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN;
+		writel(val, priv->base + LEDC_INT_CTRL_REG);
+	}
+}
+
+static void sun50i_r329_ledc_start_xfer(struct sun50i_r329_ledc *priv,
+					int length)
+{
+	u32 val;
+
+	dev_dbg(priv->dev, "Updating %d LEDs\n", length);
+
+	val = readl(priv->base + LEDC_CTRL_REG);
+	val &= ~LEDC_CTRL_REG_DATA_LENGTH;
+	val |= length << 16 | LEDC_CTRL_REG_LEDC_EN;
+	writel(val, priv->base + LEDC_CTRL_REG);
+
+	if (length > LEDC_FIFO_DEPTH) {
+		int ret = sun50i_r329_ledc_dma_xfer(priv, length);
+
+		if (!ret)
+			return;
+
+		dev_warn(priv->dev, "Failed to set up DMA: %d\n", ret);
+	}
+
+	sun50i_r329_ledc_pio_xfer(priv, length);
+}
+
+static irqreturn_t sun50i_r329_ledc_irq(int irq, void *dev_id)
+{
+	struct sun50i_r329_ledc *priv = dev_id;
+	u32 val;
+
+	val = readl(priv->base + LEDC_INT_STS_REG);
+
+	if (val & LEDC_INT_STS_REG_TRANS_FINISH_INT) {
+		int next_length;
+
+		/* Start the next transfer if needed. */
+		spin_lock(&priv->lock);
+		next_length = priv->next_length;
+		if (next_length)
+			priv->next_length = 0;
+		else
+			priv->xfer_active = false;
+		spin_unlock(&priv->lock);
+
+		if (next_length)
+			sun50i_r329_ledc_start_xfer(priv, next_length);
+	} else if (val & LEDC_INT_STS_REG_FIFO_CPUREQ_INT) {
+		/* Continue the current transfer. */
+		sun50i_r329_ledc_pio_xfer(priv, 0);
+	}
+
+	writel(val, priv->base + LEDC_INT_STS_REG);
+
+	return IRQ_HANDLED;
+}
+
+static void sun50i_r329_ledc_brightness_set(struct led_classdev *cdev,
+					    enum led_brightness brightness)
+{
+	struct sun50i_r329_ledc *priv = dev_get_drvdata(cdev->dev->parent);
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct sun50i_r329_ledc_led *led = to_ledc_led(mc_cdev);
+	int addr = led - priv->leds;
+	unsigned long flags;
+	bool xfer_active;
+	int next_length;
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	priv->buffer[addr] = led->subled_info[0].brightness << 16 |
+			     led->subled_info[1].brightness <<  8 |
+			     led->subled_info[2].brightness;
+
+	dev_dbg(priv->dev, "LED %d -> #%06x\n", addr, priv->buffer[addr]);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	next_length = max(priv->next_length, addr + 1);
+	xfer_active = priv->xfer_active;
+	if (xfer_active)
+		priv->next_length = next_length;
+	else
+		priv->xfer_active = true;
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	if (!xfer_active)
+		sun50i_r329_ledc_start_xfer(priv, next_length);
+}
+
+static const char *const sun50i_r329_ledc_formats[] = {
+	"rgb",
+	"rbg",
+	"grb",
+	"gbr",
+	"brg",
+	"bgr",
+};
+
+static int sun50i_r329_ledc_parse_format(const struct device_node *np,
+					 struct sun50i_r329_ledc *priv)
+{
+	const char *format = "grb";
+	u32 i;
+
+	of_property_read_string(np, "allwinner,pixel-format", &format);
+
+	for (i = 0; i < ARRAY_SIZE(sun50i_r329_ledc_formats); ++i) {
+		if (!strcmp(format, sun50i_r329_ledc_formats[i])) {
+			priv->format = i;
+			return 0;
+		}
+	}
+
+	dev_err(priv->dev, "Bad pixel format '%s'\n", format);
+
+	return -EINVAL;
+}
+
+static void sun50i_r329_ledc_set_format(struct sun50i_r329_ledc *priv)
+{
+	u32 val;
+
+	val = readl(priv->base + LEDC_CTRL_REG);
+	val &= ~LEDC_CTRL_REG_RGB_MODE;
+	val |= priv->format << 6;
+	writel(val, priv->base + LEDC_CTRL_REG);
+}
+
+static const struct sun50i_r329_ledc_timing sun50i_r329_ledc_default_timing = {
+	.t0h_ns = 336,
+	.t0l_ns = 840,
+	.t1h_ns = 882,
+	.t1l_ns = 294,
+	.treset_ns = 300000,
+};
+
+static int sun50i_r329_ledc_parse_timing(const struct device_node *np,
+					 struct sun50i_r329_ledc *priv)
+{
+	struct sun50i_r329_ledc_timing *timing = &priv->timing;
+
+	*timing = sun50i_r329_ledc_default_timing;
+
+	of_property_read_u32(np, "allwinner,t0h-ns", &timing->t0h_ns);
+	of_property_read_u32(np, "allwinner,t0l-ns", &timing->t0l_ns);
+	of_property_read_u32(np, "allwinner,t1h-ns", &timing->t1h_ns);
+	of_property_read_u32(np, "allwinner,t1l-ns", &timing->t1l_ns);
+	of_property_read_u32(np, "allwinner,treset-ns", &timing->treset_ns);
+
+	return 0;
+}
+
+static void sun50i_r329_ledc_set_timing(struct sun50i_r329_ledc *priv)
+{
+	const struct sun50i_r329_ledc_timing *timing = &priv->timing;
+	unsigned long mod_freq = clk_get_rate(priv->mod_clk);
+	u32 cycle_ns = NSEC_PER_SEC / mod_freq;
+	u32 val;
+
+	val = (timing->t1h_ns / cycle_ns) << 21 |
+	      (timing->t1l_ns / cycle_ns) << 16 |
+	      (timing->t0h_ns / cycle_ns) <<  6 |
+	      (timing->t0l_ns / cycle_ns);
+	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
+
+	val = (timing->treset_ns / cycle_ns) << 16 |
+	      (priv->num_leds - 1);
+	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
+}
+
+static int sun50i_r329_ledc_resume(struct device *dev)
+{
+	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	ret = reset_control_deassert(priv->reset);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(priv->bus_clk);
+	if (ret)
+		goto err_assert_reset;
+
+	ret = clk_prepare_enable(priv->mod_clk);
+	if (ret)
+		goto err_disable_bus_clk;
+
+	sun50i_r329_ledc_set_format(priv);
+	sun50i_r329_ledc_set_timing(priv);
+
+	/* The trigger level must be at least the burst length. */
+	val = readl(priv->base + LEDC_DMA_CTRL_REG);
+	val &= ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
+	val |= LEDC_FIFO_DEPTH / 2;
+	writel(val, priv->base + LEDC_DMA_CTRL_REG);
+
+	val = LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
+	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
+	writel(val, priv->base + LEDC_INT_CTRL_REG);
+
+	return 0;
+
+err_disable_bus_clk:
+	clk_disable_unprepare(priv->bus_clk);
+err_assert_reset:
+	reset_control_assert(priv->reset);
+
+	return ret;
+}
+
+static int sun50i_r329_ledc_suspend(struct device *dev)
+{
+	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->mod_clk);
+	clk_disable_unprepare(priv->bus_clk);
+	reset_control_assert(priv->reset);
+
+	return 0;
+}
+
+static void sun50i_r329_ledc_dma_cleanup(void *data)
+{
+	struct sun50i_r329_ledc *priv = data;
+	struct device *dma_dev = dmaengine_get_dma_device(priv->dma_chan);
+
+	if (priv->buffer)
+		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
+			    priv->buffer, priv->dma_handle);
+	dma_release_channel(priv->dma_chan);
+}
+
+static int sun50i_r329_ledc_probe(struct platform_device *pdev)
+{
+	const struct device_node *np = pdev->dev.of_node;
+	struct dma_slave_config dma_cfg = {};
+	struct led_init_data init_data = {};
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	struct sun50i_r329_ledc *priv;
+	struct resource *mem;
+	int count, irq, ret;
+
+	count = of_get_available_child_count(np);
+	if (!count)
+		return -ENODEV;
+	if (count > LEDC_MAX_LEDS) {
+		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->num_leds = count;
+	spin_lock_init(&priv->lock);
+	dev_set_drvdata(dev, priv);
+
+	ret = sun50i_r329_ledc_parse_format(np, priv);
+	if (ret)
+		return ret;
+
+	ret = sun50i_r329_ledc_parse_timing(np, priv);
+	if (ret)
+		return ret;
+
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->bus_clk = devm_clk_get(dev, "bus");
+	if (IS_ERR(priv->bus_clk))
+		return PTR_ERR(priv->bus_clk);
+
+	priv->mod_clk = devm_clk_get(dev, "mod");
+	if (IS_ERR(priv->mod_clk))
+		return PTR_ERR(priv->mod_clk);
+
+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	priv->dma_chan = dma_request_chan(dev, "tx");
+	if (IS_ERR(priv->dma_chan))
+		return PTR_ERR(priv->dma_chan);
+
+	ret = devm_add_action_or_reset(dev, sun50i_r329_ledc_dma_cleanup, priv);
+	if (ret)
+		return ret;
+
+	dma_cfg.dst_addr	= mem->start + LEDC_DATA_REG;
+	dma_cfg.dst_addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dma_cfg.dst_maxburst	= LEDC_FIFO_DEPTH / 2;
+	ret = dmaengine_slave_config(priv->dma_chan, &dma_cfg);
+	if (ret)
+		return ret;
+
+	priv->buffer = dma_alloc_wc(dmaengine_get_dma_device(priv->dma_chan),
+				    LEDS_TO_BYTES(priv->num_leds),
+				    &priv->dma_handle, GFP_KERNEL);
+	if (!priv->buffer)
+		return -ENOMEM;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, sun50i_r329_ledc_irq,
+			       0, dev_name(dev), priv);
+	if (ret)
+		return ret;
+
+	ret = sun50i_r329_ledc_resume(dev);
+	if (ret)
+		return ret;
+
+	for_each_available_child_of_node(np, child) {
+		struct sun50i_r329_ledc_led *led;
+		struct led_classdev *cdev;
+		u32 addr, color;
+
+		ret = of_property_read_u32(child, "reg", &addr);
+		if (ret || addr >= count) {
+			dev_err(dev, "LED 'reg' values must be from 0 to %d\n",
+				priv->num_leds - 1);
+			ret = -EINVAL;
+			goto err_put_child;
+		}
+
+		ret = of_property_read_u32(child, "color", &color);
+		if (ret || color != LED_COLOR_ID_RGB) {
+			dev_err(dev, "LED 'color' must be LED_COLOR_ID_RGB\n");
+			ret = -EINVAL;
+			goto err_put_child;
+		}
+
+		led = &priv->leds[addr];
+
+		led->subled_info[0].color_index = LED_COLOR_ID_RED;
+		led->subled_info[0].channel = 0;
+		led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+		led->subled_info[1].channel = 1;
+		led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+		led->subled_info[2].channel = 2;
+
+		led->mc_cdev.num_colors = ARRAY_SIZE(led->subled_info);
+		led->mc_cdev.subled_info = led->subled_info;
+
+		cdev = &led->mc_cdev.led_cdev;
+		cdev->max_brightness = U8_MAX;
+		cdev->brightness_set = sun50i_r329_ledc_brightness_set;
+
+		init_data.fwnode = of_fwnode_handle(child);
+
+		ret = devm_led_classdev_multicolor_register_ext(dev,
+								&led->mc_cdev,
+								&init_data);
+		if (ret) {
+			dev_err(dev, "Failed to register LED %u: %d\n",
+				addr, ret);
+			goto err_put_child;
+		}
+	}
+
+	dev_info(dev, "Registered %d LEDs\n", priv->num_leds);
+
+	return 0;
+
+err_put_child:
+	of_node_put(child);
+	sun50i_r329_ledc_suspend(&pdev->dev);
+
+	return ret;
+}
+
+static int sun50i_r329_ledc_remove(struct platform_device *pdev)
+{
+	sun50i_r329_ledc_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static void sun50i_r329_ledc_shutdown(struct platform_device *pdev)
+{
+	sun50i_r329_ledc_suspend(&pdev->dev);
+}
+
+static const struct of_device_id sun50i_r329_ledc_of_match[] = {
+	{ .compatible = "allwinner,sun50i-r329-ledc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sun50i_r329_ledc_of_match);
+
+static SIMPLE_DEV_PM_OPS(sun50i_r329_ledc_pm,
+			 sun50i_r329_ledc_suspend, sun50i_r329_ledc_resume);
+
+static struct platform_driver sun50i_r329_ledc_driver = {
+	.probe		= sun50i_r329_ledc_probe,
+	.remove		= sun50i_r329_ledc_remove,
+	.shutdown	= sun50i_r329_ledc_shutdown,
+	.driver		= {
+		.name		= "sun50i-r329-ledc",
+		.of_match_table	= sun50i_r329_ledc_of_match,
+		.pm		= pm_ptr(&sun50i_r329_ledc_pm),
+	},
+};
+module_platform_driver(sun50i_r329_ledc_driver);
+
+MODULE_AUTHOR("Samuel Holland <samuel@sholland.org>");
+MODULE_DESCRIPTION("Allwinner R329 LED controller driver");
+MODULE_LICENSE("GPL");
-- 
2.32.0

