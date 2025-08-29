Return-Path: <linux-leds+bounces-5328-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D0B3C416
	for <lists+linux-leds@lfdr.de>; Fri, 29 Aug 2025 23:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84761A64814
	for <lists+linux-leds@lfdr.de>; Fri, 29 Aug 2025 21:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5763327B32D;
	Fri, 29 Aug 2025 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="MSPyfQ2h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE722D781;
	Fri, 29 Aug 2025 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756501739; cv=none; b=mZoNs2XYORZ2IAKDdUzoFWPvfut6YVR0q3DoAF1WZiOliTgjoCtB7WLjuBsiFcEfAufP/lpjfGIq6SGbYStr/+9e1yLH+AgvWTtretdOoWCan0Udlz3cV8cUHIuwsdvgKwHlNYAW5WgTrY109690LsHXq88zJlbOdoqH0PbMiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756501739; c=relaxed/simple;
	bh=/g7uhxTJwTuv6kJjIciNp687E586ETI/5wgGWb0iAv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ia8tEbebpoqiKkxXL3Rle9X+iBxv0N0VFKHqJYGJgS93fdqM5DUFFhDqcLdxbup6swwwcqa55TG97jtg65vfN+dVR3yIm+smt/Bv70qUktAV4TTPJ1eU+fvdpxX+7lJhKrCOTv3zcrnRcBozUeRzywAFBxXSFc4h3MEZZoa5erc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=MSPyfQ2h; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=vdUcNBNCDhTlcLQRDxjszAS5UV0iteX6t45svXjmwJ0=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756501725; v=1; x=1756933725;
 b=MSPyfQ2hC19gOl9TRHQgp63BfHIogUu1ATIHtAv18crMl+0fXRJujP7RDJGzKRSjr11skeGf
 Cp0Zr7Hn/o80EgHP30hcbpoWhHSceJlOYybmWQI34zzF9WaIDhqpuzOwHDPk/evEOwuNUFkKAyi
 4xt7ZEBN10ZJD5WWkGRFpwVzewvZVSqW5Mz2oZ/Td+gC6K8NZYbVTMwnrY2D4ChxtxYVVYk9L5D
 2sLYuOsOBhtKlBRuRa5Os8MwVYFUcMejRjpClvCVVqgsIXc3zmpA5lxczv77Iq4YPFP+kx2gQMq
 amQmassObkerGSV0F0hDbEQVhEufBMWDNTKn5HzgwX3CQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 33cf7737; Fri, 29 Aug 2025 23:08:45 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Fri, 29 Aug 2025 23:08:30 +0200
Subject: [PATCH] leds: expresswire: Fix chip state breakage
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-expresswire-fix-v1-1-f8c8c6ad6c5f@dujemihanovic.xyz>
X-B4-Tracking: v=1; b=H4sIAM0WsmgC/x2MQQqAIBBFrxKzTjAlqa4SLUynmo2FAyVId29o+
 f7jvwqMmZBhaipkvInpTAJd20A4fNpRURQGo02vBzMqLFdG5ocyqo2Kcs7GbrXBGu9BXmJl/ov
 z8r4fozBghmEAAAA=
X-Change-ID: 20250829-expresswire-fix-663d1b3c32aa
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4326;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=/g7uhxTJwTuv6kJjIciNp687E586ETI/5wgGWb0iAv0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmbxO7G3uw9tihHzZH/kE7YvSspbVv2Tmd6GK3Uefrpt
 QkSB59O7ShlYRDjYpAVU2TJ/e94jfezyNbt2csMYOawMoEMYeDiFICJPD3ByHCqsXmJo9bXfOEv
 1/7NnMZ3aOv6E1a5i69ae4nVuMyYJLqCkeGy35c3/VMMe3yPdxncknt5lHlVcL/kq5vVpoI2Soa
 C/fwA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

It is possible to put the hardware state of the KTD2801 chip in an
unknown state by rapidly changing the brightness for a short period of
time (for example, with a brightness slider). When this happens, the
brightness is stuck on max and cannot be changed until the chip is power
cycled.

Fix this by disabling interrupts while the chip is being programmed.
While at it, make expresswire_power_off() use fsleep() and also unexport
some functions meant to be internal.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/leds/leds-expresswire.c  | 24 +++++++++++++++++-------
 include/linux/leds-expresswire.h |  3 ---
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-expresswire.c b/drivers/leds/leds-expresswire.c
index bb69be228a6d3c7a8f2abc7fa75bd473d4c7c79c..25c6b159a6ee93210bf8239388b5cdc434872240 100644
--- a/drivers/leds/leds-expresswire.c
+++ b/drivers/leds/leds-expresswire.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/irqflags.h>
 #include <linux/types.h>
 
 #include <linux/leds-expresswire.h>
@@ -16,37 +17,41 @@
 void expresswire_power_off(struct expresswire_common_props *props)
 {
 	gpiod_set_value_cansleep(props->ctrl_gpio, 0);
-	usleep_range(props->timing.poweroff_us, props->timing.poweroff_us * 2);
+	fsleep(props->timing.poweroff_us);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_power_off, "EXPRESSWIRE");
 
 void expresswire_enable(struct expresswire_common_props *props)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
+
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.detect_delay_us);
 	gpiod_set_value(props->ctrl_gpio, 0);
 	udelay(props->timing.detect_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
+
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_enable, "EXPRESSWIRE");
 
-void expresswire_start(struct expresswire_common_props *props)
+static void expresswire_start(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.data_start_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_start, "EXPRESSWIRE");
 
-void expresswire_end(struct expresswire_common_props *props)
+static void expresswire_end(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 0);
 	udelay(props->timing.end_of_data_low_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.end_of_data_high_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_end, "EXPRESSWIRE");
 
-void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
+static void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 {
 	if (bit) {
 		gpiod_set_value(props->ctrl_gpio, 0);
@@ -60,13 +65,18 @@ void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 		udelay(props->timing.short_bitset_us);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, "EXPRESSWIRE");
 
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
+
 	expresswire_start(props);
 	for (int i = 7; i >= 0; i--)
 		expresswire_set_bit(props, val & BIT(i));
 	expresswire_end(props);
+
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_write_u8, "EXPRESSWIRE");
diff --git a/include/linux/leds-expresswire.h b/include/linux/leds-expresswire.h
index a422921f4159f2f51e40f50ad5c9d89d9070511a..7f8c4795f69fa0337bd3b201279652c8e353c6d4 100644
--- a/include/linux/leds-expresswire.h
+++ b/include/linux/leds-expresswire.h
@@ -30,9 +30,6 @@ struct expresswire_common_props {
 
 void expresswire_power_off(struct expresswire_common_props *props);
 void expresswire_enable(struct expresswire_common_props *props);
-void expresswire_start(struct expresswire_common_props *props);
-void expresswire_end(struct expresswire_common_props *props);
-void expresswire_set_bit(struct expresswire_common_props *props, bool bit);
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val);
 
 #endif /* _LEDS_EXPRESSWIRE_H */

---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250829-expresswire-fix-663d1b3c32aa

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


