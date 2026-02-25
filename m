Return-Path: <linux-leds+bounces-7026-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NRLBmgfn2lcZAQAu9opvQ
	(envelope-from <linux-leds+bounces-7026-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:12:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 741BF19A503
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F019930910BE
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D348D3D7D70;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rR1fiPxf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E563D3D1B;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035718; cv=none; b=PPSP21TlwpCWYKOwRCvvmpwpXqt7BcMYp9h+uF38MRCQ+5tpLXuPiIoB/Grp2L8K5zNhIb1K08J/I2HSaXqxv8z4pR8u/SnrcSN6fnjcPSRdzzVyKHxjF7DzSsYgZNqJu6/tZeTR0ysy5byRKlvBo2jHc26aohuqnoQDmDwiABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035718; c=relaxed/simple;
	bh=eLvucCb55GuE8Q5tfT8jNQeAspRn+aiAF7vdpEhbIZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWSQO9buIBSJ5lXIQvcb82ieTWayNpjFxaCxguN7bFKRFQYn9MSZ/uZ6dFp1eAwCXCyolF3IMs0eBZnoPmwVZxCLb5MMh8SvmXVL+y9UOudcgAwldtdkUffaHs3t6hyt4/f1QXhlzpJazoKVJcZpiKrDr3KY2xB7QBAmaS4e8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rR1fiPxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3497FC4AF0C;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=eLvucCb55GuE8Q5tfT8jNQeAspRn+aiAF7vdpEhbIZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rR1fiPxfb8dTk5Vty4dou+2INGLQKdOCV9FO+iERkK+ZoqQo6BcoJ9H5z0qx9L8el
	 9L1wpXPhloRfG7BKm7swbMZC6b5fGq6hCzVzkhI1XUTaA1ggKuTQPjYekfXH+0wOaY
	 PKFdIHUot6jzHKRRnywfhFELKgJzqevmVstGREgwqDsUkMrQ3A9r36mKzRyNvtaGdE
	 kS8kOO4V6+RbEUCj8lCW3lWCqNf1xFZBcqWXzG+Ho2lzsZknF1PfMKMj397+FXgXcX
	 MQ5AlIvMgN25VPdaGL5sKzxg1TE3Q6DfYpCAFvZpfqIw7rxWKc+yu5ktSi4yTkwrgt
	 cCtMwOnDAmP0Q==
Received: by wens.tw (Postfix, from userid 1000)
	id AFD005FF06; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Thu, 26 Feb 2026 00:08:25 +0800
Message-ID: <20260225160828.1687643-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225160828.1687643-1-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7026-lists,linux-leds=lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.30.163.192:email];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.30.136.104:email,0.30.169.56:email]
X-Rspamd-Queue-Id: 741BF19A503
X-Rspamd-Action: no action

The A523 SoC family features an LED controller that is identical to the
one found on previous SoCs.

Add a device node for it, and one of the possible pinmux settings. This
setting is used on the Avaota A1.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 09bd149bbf51..b8263e2872af 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ledc_ph_pin: ledc-ph-pin {
+				pins = "PH19";
+				function = "ledc";
+				allwinner,pinmux = <5>;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ledc: led-controller@2008000 {
+			compatible = "allwinner,sun55i-a523-ledc",
+				     "allwinner,sun50i-a100-ledc";
+			reg = <0x02008000 0x400>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_LEDC>;
+			dmas = <&dma 42>;
+			dma-names = "tx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ths1: thermal-sensor@2009400 {
 			compatible = "allwinner,sun55i-a523-ths1";
 			reg = <0x02009400 0x400>;
-- 
2.47.3


