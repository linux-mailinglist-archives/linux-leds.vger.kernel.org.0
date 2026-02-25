Return-Path: <linux-leds+bounces-7027-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJbgBwQin2mPZAQAu9opvQ
	(envelope-from <linux-leds+bounces-7027-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:23:32 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A919A886
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 711DB3105C9D
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86FC3D7D7F;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9N2+hL9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE43D5240;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035718; cv=none; b=r0tdIp/x5euMyycao/0KvyWh0bAE8j9E02/Zog7uSJplQ01VYWdcIVcABqZNxOMQ1c5+d/JBmEfpv7dyjRxZk9qmPrg7soZr5gUSiblMeTVhXIm54tVAKxbL7rzlNuwfa0opUlGPS6OcZtFhjBYQSWMPeEZW7/Q1XNEXaOxra/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035718; c=relaxed/simple;
	bh=qwfoHVa3sWupH63/IoctrrdImGNaTAv1X9ueQgmMOqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHS+bVBdKVHtaFECLZyI2c1C95KL3/9xcWfvtJnYEj6GE71Dg1ce4OneFEqMBDT/YqtjyQwCtbw3GRlJFMXKkjss4JNae6gnpGf4v7otViqdJ15dFRlCLQTwPk5eIXNdIj1YatxJbngmcKu/QwTX2Y5RPmP9V48oAlTquordp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9N2+hL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389A8C2BC86;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=qwfoHVa3sWupH63/IoctrrdImGNaTAv1X9ueQgmMOqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9N2+hL9WjFxPRqfQTBg2AlB5lzy4SE4FK5WNbQjRYETFVMVNgijeeNPyFBHZt2sd
	 PWWni/t1rMrHoRCX9cMzQBjY8XWPZno1obpzfQ84Ek+NY/AthbGhDc858/VrwZKCJv
	 cE5n8MKAPfbacUrUoUhGREfR6tqAq0tyd/V+wZ9MpM0wEnDtuUjJQWJT2jYwGVgRMP
	 I6SW+0d+VSoyRpe+0grA4PRQrR4NYHcoAG5F6GaA5BKfFhzaKO8gSuF6yQcl23yQHR
	 fnF/cGsmaq4spo6it2AcSenE9cUjQOdNb+MqFRzjDKRPAOx1eE4DnCvnOiayPfaYeJ
	 TCjYk3vfANDiA==
Received: by wens.tw (Postfix, from userid 1000)
	id B957D5FF08; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
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
Subject: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Thu, 26 Feb 2026 00:08:26 +0800
Message-ID: <20260225160828.1687643-4-wens@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7027-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.2:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: BA4A919A886
X-Rspamd-Action: no action

The Avaota A1 board features 4 RGB LEDs in a string connected to the
SoC's LED controller.

Enable the LED controller and add device nodes for them. The timings
were copied from the downstream vendor DTS. The design does not specify
what these LEDs are for, nor are there any markings on the board for
them, so just use them as indicators.

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


