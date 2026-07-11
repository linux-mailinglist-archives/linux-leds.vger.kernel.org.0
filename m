Return-Path: <linux-leds+bounces-9038-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dxc1IeeZUmqXRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9038-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:30:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA21742B21
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:30:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sholland.org header.s=fm3 header.b=DtGRIiBJ;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="b YKD5tc";
	dmarc=pass (policy=none) header.from=sholland.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9038-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9038-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42993041483
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD86828850E;
	Sat, 11 Jul 2026 19:29:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DA1F3BAC;
	Sat, 11 Jul 2026 19:28:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798140; cv=none; b=m2ygZV2ZtCGqhdmZbfLxXZG8vTXIiLYxND2Rjb0W+/ofov4NlW/ZxI1d2UMqo6E+vTth98MpUHtjoA+Gvk9NRAhD3zyWO+XxBHkEQFPK1O1ft8xvaWNfIcylmLI+DUMOm3JiSG8MaEysTtpTTzRy5kl3oDs40mt2zSHBtu1BjGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798140; c=relaxed/simple;
	bh=HLciZDx8hyas5RBe4DzIIMfTDURbKKE3g3ecqMu0y8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcZCB+ABSKV6GZ6Dc04z4OPilITX5cZGcZ/+9+I4jQf1OFs2pp6nYwIGSaKkqc2y6/g9qiQz9iZaVjSVcXYoYa6h233Tgw/IKOSLsovYCxSzp9rdd3sE7Yw4WFkYRC5GiJKq/3zlt93JO5QIoGjIfmJlBBmN1KuzI5SX378UdSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sholland.org; spf=pass smtp.mailfrom=sholland.org; dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b=DtGRIiBJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bYKD5tcS; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9BF947A00EC;
	Sat, 11 Jul 2026 15:28:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 11 Jul 2026 15:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783798137;
	 x=1783884537; bh=sQyfhM4HBZXS7G0CWkmLXHaoPqZDkQPG1aodBvdFp2U=; b=
	DtGRIiBJefa+f4AZv6LLO2FdWHayskJ57oZ/s4H6SqqSYPUKHcifAXhi0SbP0Bj9
	uH34ewPwgygF/5x6fi+ITi+fpe9HJyB8BhcKRoxZnP57T7+UNtYhu7IAx33/EzX5
	xG/8bAkDmNiwebHuvaKu+bryd0YrddMmFdgtA8l2ueosYprBK+l5agR8Q0o20DIK
	NTMdS5HV1OPPJZkBiRSAn3o9ZjmDvUCd8CmrvgImiiJReBgVZ2LdhytcDfULiPuS
	Hvz2LIzExw8X71/CiTJEFRVV+YAvErVF2oybYEdR6Z+wKkLCOk2a7votmSeTqDcR
	7LDsrHyag8y/Ekx1E1wqIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783798137; x=
	1783884537; bh=sQyfhM4HBZXS7G0CWkmLXHaoPqZDkQPG1aodBvdFp2U=; b=b
	YKD5tcSxavYA1y8PDaGxNP0ql+LACZSOoqgwsJbYXbbuQp1m4PtwpyK6cU5n7rcw
	4JKLRiju8lgC7IHJuM8Nwzh2adqxpmpzDK5OxtPxcHy79/Bq2CMCDgntaHeFDntr
	enUhlt6J5tm8AOYQxWcLHvqzPHxZoMms5ypyDBfCPATVjIIUUNJ+jJ1vvTNTiA/u
	Rl8KSWnfoxsvN+l35gHPwH+2TbdcRJDkUusvdRGfdkQX/j9rpB0sHcv9hoRMgtyw
	1ZFip7a5P7zsCX1T/vcNvOMLkV2fsj88aMb1LdPCbOHM0qZzDKaxvAliBvVdCH1G
	bMQEkqnMVoC2JXgAqzCWw==
X-ME-Sender: <xms:eZlSalCrJunofSLVpwRNC4lfXqtExV4WLzv6CrvQrBTVe0aGKzQusA>
    <xme:eZlSaqBwjrZsItJ2OrIKdrh8EwYOUfvhS3vwkWlY5eMujNe9JvmT-lzF9TQmKC0Vj
    xtS083yumvtKgoFbbdAjhuLy8S3Vbdn874U8ycMiFCrIszpj7-P7w>
X-ME-Received: <xmr:eZlSaum-P-CwZfJx34po4w1NuXMn1DtsJbBbqoXG_-czFH9ziogRMlC3J_a4eNZ1WGl_b9OF7OANeAe1HMJo4AiO6V0bvw4dDz_Xi7hbVeLQ1QYEu9Y>
X-ME-Proxy-Cause: dmFkZTF7lhpQnvrAMFLxLb0daOkoaOYQzXccuEYQdztfmzjsHzGH8HPUpdI9YpTZNaW2Da
    4q6dTZSs9bj4mAximLJKFPC8tD0YJbxITx+xbra3gDqXUbzWy8egPcD4nRVlVBdOWloxxS
    fcxFGIeLetVaaHsseRkWcTBZnYnFIPBi+xE1XlXScmCWiI39fttCbsT/E27OI20gD13zcx
    KZ5XyCC/UXDbHQ7zW6Z8kqu5n1jTPC0NK0qhO082SbD7TlG2yrO4HPW0WGAL5CURMwgZyI
    UrG6I2lhg1cVzNtcBkhpTuN3LgrQyAjuvweDg6FIiAsva+et6S1gpouz/u4GxM9teBBje9
    00t9HTLEOWNPJLXl+gZX12Il1WPkA4UFY+rq9EJWPclHwCTCCvslLToYPP8zkWR3ZnVKUI
    ilzzUhKfx1tTSz2w9crIHtZOVLdLsFzCCFCJjRFhLXM/0WbdS8g7KjYlfzCNfRwhLbaekg
    x7wZwLDI4pm4k8aYkYg3USY2vvmWWFPM80b3e7WtWyDqZ4jTRSzK6NxZmlMQ2UrvzkYgho
    6Qz2l9G8hs0j1NmJb1+qqKNR1fQh4o+qP+5JQ4NKRdBJ/KKE6iE8dQNhqyE7AKvJKbaJ0F
    e2xJ0Z0+fHD7LxcK+aeDQCGqe04QSc+KDGYs6qGRMmU1UcPlxvsKtv3F+Twg
X-ME-Proxy: <xmx:eZlSaijrH9tIuulLx_iGVcXETm7fhNagGUMils6pZqN9J6484XAmhQ>
    <xmx:eZlSagjzquyrMsSwLYhl5gkGDJtXd_Pz6FI0S-j9oj1Dy1HopZtRSA>
    <xmx:eZlSasudSPR79H-mb6zVSRc-LAFqBDJOYEOI6frVH2-Ll5aqIz8ttw>
    <xmx:eZlSagvfSolEfNzhjC3BMofl1hUJO8gmxgTWYQmTbwIwScciwzjtVg>
    <xmx:eZlSamCojo6iqkD0k2DlakuOxfR4eNFkE2VjJmlwndwozHzCvZz6eIxj>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:56 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add LincStation E1
Date: Sat, 11 Jul 2026 14:28:28 -0500
Message-ID: <20260711192842.845048-5-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sholland.org,none];
	R_DKIM_ALLOW(-0.20)[sholland.org:s=fm3,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9038-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:samuel@sholland.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[sholland.org:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sholland.org:from_mime,sholland.org:email,sholland.org:mid,sholland.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEA21742B21

LincStation E1 is an entry-level NAS device powered by the RK3568B2 SoC
with two 3.5" HDD slots (behind a SATA port multiplier) and two m.2 2280
slots for SSDs (each PCIe 3.0 x1). Other major features include:
 - 4 GiB DRAM / 64 GB eMMC
 - RTL8125 2.5 Gb Ethernet
 - Fn-Link 6222B-SRC Wi-Fi 5 / Bluetooth module
 - 1 USB 5 Gbps + 2 USB high speed ports
 - HDMI output

Each HDD slot provides a GPIO input for disk presence detection and an
output for power control. Since the disks are behind a port multiplier,
there is no way to describe them in the devicetree, so the disk power
is enabled at all times by GPIO hogs, and the detection inputs are used
only as LED triggers.

The board contains several pairs of amber/white LEDs for power, disk,
m.2 slot, and network status. These are configured to use triggers when
possible. The PWM fan uses a relatively aggressive fan curve to keep
the hard disks within a safe temperature range. It may benefit from
further tuning.

The pinhole reset button is multiplexed between the SoC reset pin and
an ADC input. The mux is configured here to drive the SoC reset pin, as
this works reliably without polling by software. The adc-keys
description is included for use by a devicetree overlay if desired.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3568-lincstation-e1.dts    | 1004 +++++++++++++++++
 2 files changed, 1005 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2..d0d675892196 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -146,6 +146,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r66s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r68s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-hinlink-h66k.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-hinlink-h68k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-lincstation-e1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-lubancat-2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts b/arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts
new file mode 100644
index 000000000000..ad81b892b00c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts
@@ -0,0 +1,1004 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+
+#include "rk3568.dtsi"
+
+/ {
+	model = "LincPlus LincStation E1";
+	compatible = "techvision,tvd8322r", "rockchip,rk3568";
+
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc1;
+		rtc0 = &hym8563;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	/* This device is only available when reset-button-mux is driven high */
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 5>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+		status = "disabled";
+
+		button-reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_leds &sata1_detect &sata2_detect>;
+
+		led-2 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio1 RK_PA2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio1 RK_PA3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = "m1";
+			gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-5 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "m1";
+			gpios = <&gpio1 RK_PA5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-6 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = "m2";
+			gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-7 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "m2";
+			gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-8 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = "s1";
+			gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "disk-activity";
+		};
+
+		led-9 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "s1";
+			gpios = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "gpio";
+			trigger-sources = <&gpio1 RK_PD6 GPIO_ACTIVE_LOW>;
+		};
+
+		led-a {
+			color = <LED_COLOR_ID_WHITE>;
+			function = "s2";
+			gpios = <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "disk-activity";
+		};
+
+		led-b {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "s2";
+			gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "gpio";
+			trigger-sources = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC6 IRQ_TYPE_EDGE_RISING>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 20 50 90 130 170 210 225 240 255>;
+		fan-supply = <&vcc12v0_sys>;
+		fan-stop-to-start-percent = <8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan_tach>;
+		pulses-per-revolution = <2>;
+		pwms = <&pwm0 0 50000 0>;
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_AMBER>;
+			default-state = "off";
+			function = LED_FUNCTION_STANDBY;
+			max-brightness = <255>;
+			pwms = <&pwm4 0 25000 0>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_WHITE>;
+			default-brightness = <127>;
+			default-state = "on";
+			function = LED_FUNCTION_POWER;
+			max-brightness = <255>;
+			pwms = <&pwm5 0 25000 0>;
+		};
+	};
+
+	dc_12v: regulator-dc-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_12v";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc12v0_sys: regulator-vcc12v0-sys {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc12v0_sys_en>;
+		regulator-name = "vcc12v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc3v3_lan: regulator-vcc3v3-lan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc3v3_lan_en>;
+		regulator-name = "vcc3v3_lan";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_pcie: regulator-vcc3v3-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc3v3_pcie_en>;
+		off-on-delay-us = <500000>;
+		regulator-name = "vcc3v3_pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc3v3_sys: regulator-vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_sata: regulator-vcc5v0-sata {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio2 RK_PA2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_sata_en>;
+		regulator-name = "vcc5v0_sata";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_usb: regulator-vcc5v0-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_usb_host: regulator-vcc5v0-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_usb_host_en>;
+		regulator-name = "vcc5v0_usb_host";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb>;
+	};
+
+	vcc5v0_usb_otg: regulator-vcc5v0-usb-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_usb_otg_en>;
+		regulator-name = "vcc5v0_usb_otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb>;
+	};
+
+	vcc_wl: regulator-vcc-wl {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_wl_en>;
+		regulator-name = "vcc_wl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vccio_wl: regulator-vccio-wl {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vccio_wl_en>;
+		regulator-name = "vccio_wl";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk809 1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&combphy0 {
+	status = "okay";
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&combphy2 {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+/*
+ * The fan pulls hot air from the CPU and m.2 slot heat sinks and blows it
+ * across the hard disks. To keep the disks from overheating (below 50 °C),
+ * their ambient air, and thus the CPU heat sink, must be kept quite cool.
+ */
+&cpu_thermal {
+	trips {
+		sys_fan1: sys-fan1 {
+			hysteresis = <2000>;
+			temperature = <25000>;
+			type = "active";
+		};
+
+		sys_fan2: sys-fan2 {
+			hysteresis = <2000>;
+			temperature = <35000>;
+			type = "active";
+		};
+
+		sys_fan3: sys-fan3 {
+			hysteresis = <2000>;
+			temperature = <45000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			cooling-device = <&fan 1 3>;
+			trip = <&sys_fan1>;
+		};
+
+		map2 {
+			cooling-device = <&fan 4 5>;
+			trip = <&sys_fan2>;
+		};
+
+		map3 {
+			cooling-device = <&fan 6 THERMAL_NO_LIMIT>;
+			trip = <&sys_fan3>;
+		};
+	};
+};
+
+&gpio1 {
+	/* ata1.01 is the slot labeled HDD2 */
+	sata1-power-control-hog {
+		gpio-hog;
+		gpios = <RK_PD7 GPIO_ACTIVE_LOW>;
+		line-name = "sata1-power-control";
+		output-high;
+	};
+};
+
+&gpio2 {
+	/* ata1.02 is the slot labeled HDD1 */
+	sata2-power-control-hog {
+		gpio-hog;
+		gpios = <RK_PA0 GPIO_ACTIVE_LOW>;
+		line-name = "sata2-power-control";
+		output-high;
+	};
+};
+
+&gpio4 {
+	/* low = SoC reset, high = saradc input */
+	reset-button-mux-hog {
+		gpio-hog;
+		gpios = <RK_PB7 GPIO_ACTIVE_HIGH>;
+		line-name = "reset-button-mux";
+		output-low;
+	};
+
+	sata-pm-reset-hog {
+		gpio-hog;
+		gpios = <RK_PD2 GPIO_ACTIVE_LOW>;
+		line-name = "sata-pm-reset";
+		output-low;
+	};
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&hdmi {
+	avdd-0v9-supply = <&vdda0v9_image>;
+	avdd-1v8-supply = <&vcca1v8_image>;
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	vdd_cpu: regulator@40 {
+		compatible = "silergy,syr827";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		#clock-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>;
+		system-power-controller;
+		vcc1-supply = <&vcc3v3_sys>;
+		vcc2-supply = <&vcc3v3_sys>;
+		vcc3-supply = <&vcc3v3_sys>;
+		vcc4-supply = <&vcc3v3_sys>;
+		vcc5-supply = <&vcc3v3_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc3v3_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc3v3_sys>;
+		wakeup-source;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-name = "vdd_logic";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_gpu: DCDC_REG2 {
+				regulator-name = "vdd_gpu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_npu: DCDC_REG4 {
+				regulator-name = "vdd_npu";
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG5 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdda0v9_image: LDO_REG1 {
+				regulator-name = "vdda0v9_image";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-name = "vdda_0v9";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-name = "vdda0v9_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-name = "vccio_acodec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-name = "vcc3v3_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG7 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG8 {
+				regulator-name = "vcca1v8_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_image: LDO_REG9 {
+				regulator-name = "vcca1v8_image";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		#clock-cells = <0>;
+		clock-output-names = "rtcic_32kout";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+		wakeup-source;
+	};
+};
+
+&i2s0_8ch {
+	status = "okay";
+};
+
+&pcie2x1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2x1_rst>;
+	reset-gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_lan>;
+	status = "okay";
+};
+
+&pcie30phy {
+	data-lanes = <1 2>;
+	status = "okay";
+};
+
+&pcie3x1 {
+	reset-gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
+	status = "okay";
+};
+
+&pcie3x2 {
+	num-lanes = <1>;
+	reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_device_wake_h: bt-device-wake-h {
+			rockchip,pins = <2 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_enable_h: bt-enable-h {
+			rockchip,pins = <2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_host_wake_h: bt-host-wake-h {
+			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	gpio-leds {
+		gpio_leds: gpio-leds {
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	pcie {
+		pcie2x1_rst: pcie2x1-rst {
+			rockchip,pins = <3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc3v3_lan_en: vcc3v3-lan-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc3v3_pcie_en: vcc3v3-pcie-en {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	pwm-fan {
+		fan_tach: fan-tach {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc12v0_sys_en: vcc12v0-sys-en {
+			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sata {
+		sata1_detect: sata1-detect {
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		sata2_detect: sata2-detect {
+			rockchip,pins = <1 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vcc5v0_sata_en: vcc5v0-sata-en {
+			rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		vcc5v0_usb_host_en: vcc5v0-usb-host-en {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc5v0_usb_otg_en: vcc5v0-usb-otg-en {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wlan {
+		vcc_wl_en: vcc-wl-en {
+			rockchip,pins = <0 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vccio_wl_en: vccio-wl-en {
+			rockchip,pins = <0 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_host_wake_h: wifi-host-wake-h {
+			rockchip,pins = <2 RK_PB2 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc3v3_pmu>;
+	pmuio2-supply = <&vcc3v3_pmu>;
+	vccio1-supply = <&vccio_acodec>;
+	vccio2-supply = <&vcc_1v8>;
+	vccio3-supply = <&vccio_sd>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_1v8>;
+	vccio7-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&pwm5 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcca_1v8>;
+	status = "disabled";
+};
+
+&sata1 {
+	target-supply = <&vcc5v0_sata>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	status = "okay";
+};
+
+&sdmmc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	max-frequency = <208000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_clk &sdmmc1_cmd>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_wl>;
+	vqmmc-supply = <&vccio_wl>;
+	status = "okay";
+
+	rtl8822cs: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_h>;
+	};
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <0>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart1 {
+	dma-names = "tx", "rx";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1m0_xfer &uart1m0_ctsn &uart1m0_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		device-wake-gpios = <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio2 RK_PC0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_device_wake_h &bt_enable_h &bt_host_wake_h>;
+	};
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	dr_mode = "host";
+	extcon = <&usb2phy0>;
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	phy-supply = <&vcc5v0_usb_otg>;
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.54.0


