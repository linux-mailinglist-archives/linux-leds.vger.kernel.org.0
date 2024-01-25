Return-Path: <linux-leds+bounces-695-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069E83C6AE
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 16:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43832926FC
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 15:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7789745C9;
	Thu, 25 Jan 2024 15:32:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED87316F;
	Thu, 25 Jan 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.165.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196727; cv=none; b=eLOdyQysV9hgGE4aWPG8AKXeNg4cvMi0h63ksgajK0CTkwluAbdDYBw8r/JDRIKW5XM36wMt+EiL0hx6K0wXbj8rF+YgHH9LkB+qZqZUfpOmCUSMvYUtVYlhR6o38DMKkpBRGKUeRhWEDb93wf8B/ZjNn4DbUOuNToSVnM7hp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196727; c=relaxed/simple;
	bh=EmBtZVpm+2jJo0+oBnQB1a+nHfZMWJwr8ePwkRQqIvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWNBwtZ7mgALgCU/d+CF06PvlvuQ1gFFfHTbHNtMO7YBYgvnm9BK/jqKV/54eKtuuMiqNte4/keh96tQMyxsttk5iFVOU3DUvY4O3YOtotOGevZZ4bxpgfSRSSYC3YQI/guiQh36NRIEg69py3stCb3tExrP++82vjXjgyHQTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr; spf=pass smtp.mailfrom=skole.hr; arc=none smtp.client-ip=161.53.165.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skole.hr
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 104DF84F6E;
	Thu, 25 Jan 2024 16:31:56 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 25 Jan 2024 16:30:53 +0100
Subject: [PATCH v5 1/4] leds: introduce ExpressWire library
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240125-ktd2801-v5-1-e22da232a825@skole.hr>
References: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
In-Reply-To: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Karel Balej <balejk@matfyz.cz>, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6456;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=EmBtZVpm+2jJo0+oBnQB1a+nHfZMWJwr8ePwkRQqIvM=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlsn7DfN3tI6caY5seGs5+QL9PGrkwNvXOL0Sue
 VbwtyVxGSWJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZbJ+wwAKCRCaEZ6wQi2W
 4b2uEACQ+Al72XGNOC52NpzDW/JVVVe3UODtl272aLQfQSnnX3AHgIj34cZBt1PFFquUnRAJnDr
 itqposRDO5747+OdD4dCDEObOrr4EjJvtr1tLnAzo+2OaT6L4HVLWSnTY6GgWrdHx5fUK2JHV9U
 gMmNQeycJoPwo/7kY7WtGzlJJrTDldS9UtL9V5LnWG5cXsN9ZNb5suFyvEYj7nrHJTqVXg2djRs
 qd7m/1/fxkpJPV1qm2YUeYlTp4e/ZPVshYwtSHEWzrrAqsKIt5nDCsNivPN4JX094i6rTqdumZu
 7W874oq0MuNJ0bGQnoL067KGbkwoqfyo0XwgawcZHNp8ibEM/yoCvBpiTMzhCR1CP6fQoGWKPLT
 t0JGjAW/17synjXDVXXAv4VCZMCqmUgL58Rgo1q8ChRQWM2yTkHskjuLh84nwoc2DhMP059IO68
 1j2lM2i5wbMBvYxM4ZoCXS37vR7CUdMODqHLGTVuUGnaxeDl4CPiLRvaT9aPjErAoeTq190NQCz
 kHNP51PxX/ozV+ouyR7muDWwzHpEnLyFIZ0xtWVkyhOb1korptaga37qUphyBtrjF3GYeH1NLJE
 9YSEG0TPxhy1/BI9dFvQ4ZMem1nLdsSphyozRy4VKUdAkU23tEaPWMA4D6Hfvdx+Kpco6QbBACo
 D2tfRksekaUFlHQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1

The ExpressWire protocol is shared between at least KTD2692 and KTD2801
with slight differences such as timings and the former not having a
defined set of pulses for enabling the protocol (possibly because it
does not support PWM unlike KTD2801). Despite these differences the
ExpressWire handling code can be shared between the two, so in
preparation for adding KTD2801 support introduce a library implementing
this protocol.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS                      |  7 +++++
 drivers/leds/Kconfig             |  4 +++
 drivers/leds/Makefile            |  3 ++
 drivers/leds/leds-expresswire.c  | 68 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds-expresswire.h | 36 +++++++++++++++++++++
 5 files changed, 118 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a69..e1c83e0e837a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7979,6 +7979,13 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
 F:	fs/exfat/
 
+EXPRESSWIRE PROTOCOL LIBRARY
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/leds-expresswire.c
+F:	include/linux/leds-expresswire.h
+
 EXT2 FILE SYSTEM
 M:	Jan Kara <jack@suse.com>
 L:	linux-ext4@vger.kernel.org
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d721b254e1e4..64bb2de237e9 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -186,6 +186,10 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
+config LEDS_EXPRESSWIRE
+	bool
+	depends on GPIOLIB
+
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS_MULTICOLOR
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index ce07dc295ff0..effdfc6f1e95 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -91,6 +91,9 @@ obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
 
+# Kinetic ExpressWire Protocol
+obj-$(CONFIG_LEDS_EXPRESSWIRE)		+= leds-expresswire.o
+
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-expresswire.c b/drivers/leds/leds-expresswire.c
new file mode 100644
index 000000000000..89e147b0e019
--- /dev/null
+++ b/drivers/leds/leds-expresswire.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Shared library for Kinetic's ExpressWire protocol.
+ * This protocol works by pulsing the ExpressWire IC's control GPIO.
+ * ktd2692 and ktd2801 are known to use this protocol.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds-expresswire.h>
+
+void expresswire_power_off(struct expresswire_common_props *props)
+{
+	gpiod_set_value_cansleep(props->ctrl_gpio, 0);
+	usleep_range(props->timing.poweroff_us, props->timing.poweroff_us * 2);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_power_off, EXPRESSWIRE);
+
+void expresswire_enable(struct expresswire_common_props *props)
+{
+	gpiod_set_value(props->ctrl_gpio, 1);
+	udelay(props->timing.detect_delay_us);
+	gpiod_set_value(props->ctrl_gpio, 0);
+	udelay(props->timing.detect_us);
+	gpiod_set_value(props->ctrl_gpio, 1);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_enable, EXPRESSWIRE);
+
+void expresswire_start(struct expresswire_common_props *props)
+{
+	gpiod_set_value(props->ctrl_gpio, 1);
+	udelay(props->timing.data_start_us);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_start, EXPRESSWIRE);
+
+void expresswire_end(struct expresswire_common_props *props)
+{
+	gpiod_set_value(props->ctrl_gpio, 0);
+	udelay(props->timing.end_of_data_low_us);
+	gpiod_set_value(props->ctrl_gpio, 1);
+	udelay(props->timing.end_of_data_high_us);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_end, EXPRESSWIRE);
+
+void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
+{
+	if (bit) {
+		gpiod_set_value(props->ctrl_gpio, 0);
+		udelay(props->timing.short_bitset_us);
+		gpiod_set_value(props->ctrl_gpio, 1);
+		udelay(props->timing.long_bitset_us);
+	} else {
+		gpiod_set_value(props->ctrl_gpio, 0);
+		udelay(props->timing.long_bitset_us);
+		gpiod_set_value(props->ctrl_gpio, 1);
+		udelay(props->timing.short_bitset_us);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, EXPRESSWIRE);
+
+void expresswire_write_u8(struct expresswire_common_props *props, u8 val)
+{
+	expresswire_start(props);
+	for (int i = 7; i >= 0; i--)
+		expresswire_set_bit(props, val & BIT(i));
+	expresswire_end(props);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_write_u8, EXPRESSWIRE);
diff --git a/include/linux/leds-expresswire.h b/include/linux/leds-expresswire.h
new file mode 100644
index 000000000000..3c61902ccac8
--- /dev/null
+++ b/include/linux/leds-expresswire.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Shared library for Kinetic's ExpressWire protocol.
+ * This protocol works by pulsing the ExpressWire IC's control GPIO.
+ * ktd2692 and ktd2801 are known to use this protocol.
+ */
+
+#ifndef _LEDS_EXPRESSWIRE_H
+#define _LEDS_EXPRESSWIRE_H
+
+#include <linux/gpio/consumer.h>
+
+struct expresswire_timing {
+	unsigned long poweroff_us;
+	unsigned long detect_delay_us;
+	unsigned long detect_us;
+	unsigned long data_start_us;
+	unsigned long end_of_data_low_us;
+	unsigned long end_of_data_high_us;
+	unsigned long short_bitset_us;
+	unsigned long long_bitset_us;
+};
+
+struct expresswire_common_props {
+	struct gpio_desc *ctrl_gpio;
+	struct expresswire_timing timing;
+};
+
+void expresswire_power_off(struct expresswire_common_props *props);
+void expresswire_enable(struct expresswire_common_props *props);
+void expresswire_start(struct expresswire_common_props *props);
+void expresswire_end(struct expresswire_common_props *props);
+void expresswire_set_bit(struct expresswire_common_props *props, bool bit);
+void expresswire_write_u8(struct expresswire_common_props *props, u8 val);
+
+#endif /* _LEDS_EXPRESSWIRE_H */

-- 
2.43.0



