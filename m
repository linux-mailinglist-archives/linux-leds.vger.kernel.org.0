Return-Path: <linux-leds+bounces-7055-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AG3J+2spWn4EAAAu9opvQ
	(envelope-from <linux-leds+bounces-7055-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 02 Mar 2026 16:29:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD871DBDB5
	for <lists+linux-leds@lfdr.de>; Mon, 02 Mar 2026 16:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B71BF305E311
	for <lists+linux-leds@lfdr.de>; Mon,  2 Mar 2026 15:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DE1410D38;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWhlvzvu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BF3FFAD6;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465258; cv=none; b=Sgfo6Nl61NAdj1DKgrbINC+PwOt9xCUSxYAdRCI6Vgo7A5uPxILXtwnm+Cu3fPhknmZGOGSPITANgPXS7hxpqqwFGuMO8apO+JHF2ifAhsC1BchYT8Zzu7uFq7B8lssknNx6vxegueOXTgLItIzPAAD4vAlPozvRQLEkSsO1WOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465258; c=relaxed/simple;
	bh=BkdGVxBjkFgDtxop+akQ0p2oSsG6DQYEaX74MCiqCWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBhx3ZnAAQGWE1fMdr94lGSuO5P1gpHCE2YyuM9ckwB/Ij9UJh/qkrPNe9AL1820iwK9NFJx/jYzTGOVs0Ew7rVt+OW1KiGb3bs1QElALLpEWQlqSmBUu8i0chQmgfLdWHIqpwzLhW8zdNU0vso/sko7n4eQES87XrtlxIAAKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWhlvzvu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E86C2BCB1;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465258;
	bh=BkdGVxBjkFgDtxop+akQ0p2oSsG6DQYEaX74MCiqCWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WWhlvzvuUZ0UgddDD2pZBOqxOURA6GrBn6uAITw94P/t8FR/PLO7De/F8ntbcp9KV
	 iLzEEuVKxFqRpaYkz0X/5Z93rsS15JaEAF0IM1q/xfeqoVDjn0gdAc+iN03vzKzfbx
	 26YjEtvA1k+jvZLTd4DYVhjG7N4mAtoas5EqTZijTiXhiJAsxipixoo/FIgtvSFu+o
	 KVkFY+7tk6nt9iUbPiAsmcYZAqvXUeKgnFtIA+WFW/ToMb3prpBuMY7WXWKlxu+QzC
	 ugmfSfAFvBrZcXmVxNMCjl+0LVFrRby0OFEo5coI0sD0qoQh2YcVNqGUYQgSSqIywJ
	 Vx+Ze4F5E3rWA==
Received: by wens.tw (Postfix, from userid 1000)
	id 4CF485FF08; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Mon,  2 Mar 2026 23:27:22 +0800
Message-ID: <20260302152724.3197587-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DBD871DBDB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-7055-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.2:email,0.0.0.3:email]
X-Rspamd-Action: no action

The Avaota A1 board features 4 RGB LEDs in a string connected to the
SoC's LED controller.

Enable the LED controller and add device nodes for them. The timings
were copied from the downstream vendor DTS. The design does not specify
what these LEDs are for, nor are there any markings on the board for
them, so just use them as indicators.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 054d0357c139..7c24121de88f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -6,6 +6,7 @@
 #include "sun55i-a523.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Avaota A1";
@@ -99,6 +100,46 @@ &gpu {
 	status = "okay";
 };
 
+&ledc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ledc_ph_pin>;
+	allwinner,pixel-format = "grb";
+	allwinner,t0l-ns = <800>;
+	allwinner,t0h-ns = <300>;
+	allwinner,t1l-ns = <320>;
+	allwinner,t1h-ns = <800>;
+	allwinner,treset-ns = <84>;
+	status = "okay";
+
+	multi-led@0 {
+		reg = <0x0>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <0>;
+	};
+
+	multi-led@1 {
+		reg = <0x1>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+	};
+
+	multi-led@2 {
+		reg = <0x2>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <2>;
+	};
+
+	multi-led@3 {
+		reg = <0x3>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <3>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.47.3


