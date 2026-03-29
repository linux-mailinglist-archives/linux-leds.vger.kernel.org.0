Return-Path: <linux-leds+bounces-7548-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HviLxSvyGlPowUAu9opvQ
	(envelope-from <linux-leds+bounces-7548-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63903350AAA
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56744301A513
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F4280A58;
	Sun, 29 Mar 2026 04:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR/Qxndl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF421A9FAA
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759698; cv=none; b=VUT39FkeoiZLjIypiM/uY5R8NucQYa0J3ts/Disqt1K81gAnoEn2b3KwYj28Zn2btRX4bcf+6Vtgpkthtr4T06nyJoltJ2XyQ0U7Q9tnlkoaCCZ8d6QCVVAggyry96u7Kt8Jmh3wpvl5xNRlI8uyDMPe3OQriS3ptDDoGRj7BR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759698; c=relaxed/simple;
	bh=cwtQPbv3nwjbv2cB/O7Hw+lGpUV3DovZ0aVRo4yVFIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPsHE1e4kAxH7IwzAraSXKK2XJfydGOHPJaKgA3pFLx3HdUwDHThED8XQ4PayD2psf4mjPGh/zvPNroZhz04rvrcYmwzdcfD/j2EDiomrZzguG/TrzxiDQVFk/sJi480yx8H2YVADm34yeJISBq/uBS9CtvJfva+pyvF6x/a9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR/Qxndl; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c763c294cccso2335192a12.1
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759695; x=1775364495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usJaOiTgkcVVvPc4UcNFR6ZaC/shaAHQEtJKypuF1Vo=;
        b=QR/QxndlIoRBH8cDdGt7N/xk23St7bg7yepOmB7Jv1DPozP7IAOXLm41XbDv3MnijC
         6GB4NgVCG+FICAZBky6tF+RN9MDR+VvBT2EUA5/JrsyWPMQm2gKpuk0wsFTsuzKEwboU
         gxN6pmP4eetw6Qwru5QXOH1RynwypMNgsKVzIRx4uAygOeMcelUidGwSWDwWMyb3LEGU
         u4M9gjw/fCc/pTpkv39qaUPcXliNK6e6d1w7Oj3EoWwMosQsf4FrmBEig1Iqlyrp0SJi
         znri8SyJKW/7y/fI+VnItLAjlciCq0kDeOY84JJ+oLcACCs0M5ZAKfwAWoLXYjXYY486
         qeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759695; x=1775364495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=usJaOiTgkcVVvPc4UcNFR6ZaC/shaAHQEtJKypuF1Vo=;
        b=JKz0S4xsl1aTo5zgfIErjWAinxvLnXeBKz5OOhU8bkgvdRpYx1FZ/VKHY1Sx6hLK8X
         9t8fcXXsDkjA2q7iFtomLB+p4mU7N62VZyb4CBgEt6OyAev7yqBV6cbrvRoyZfyodgH4
         8vZWAmRS/fZmGNk30rLe5Omtddkl83HxgzqGK+YDUwrkp2grFjykOmj1F6RI9NfXpzTg
         ZVs1HyhR1mAjxffhamqWadDNiF2JkzFMKULf3fSI3Y0aCKRKcXnQZEIhaPjI6f0RgKpx
         0kY7jMVSrW8T6iyTmk3W/Dy4zET7j4YWlcM7g54XsgQIpxum624LjNZo3ZgWqo9syxOQ
         /rrA==
X-Forwarded-Encrypted: i=1; AJvYcCWh4kW1L8K86mSoyqXhyl8ybZCXJgMUYqnBS/3WOAYH30cw/dn1+BPDtfDMFN30/RH1n86JtsbOrJv7@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYqW9EzEHeL3X8a38GpKMfEGCqsPUJxDYjBovtvEaqPwIusmZ
	AqPExdHdR6DSjiDDFgHB1JtZK3K5UZIbAWpB/D+nDsnRQbPvTrcY79Od
X-Gm-Gg: ATEYQzzdPuENEFXnJAbwxAcrCgRJaBkpuX80G1z3+TBifb3/+qS1S04y8p+s1hNlnoI
	SruOczjQ9BgCJRM1+p4fjLtt1hhyIt9pZXjWUuH/tnY4VthjPxS4gCRYydIpv3PDoSpk3+NsQKW
	pfYoumJkm6AN2c7OHP8Meri/P5RVLmQS4xyroGBzsScPVkTHR8ewrK77H4Sj5k6Omw/Dp1274Q9
	PQfBUGEK2QYfsvNeSSTIV/y8JueoEGJ73P6ZrqSndftQCG7J2N9nIPk2opIYCIZiby/CZgKdWK9
	GIeUV8yoPbCCrklCyTO9vLRbpz8LlkALHKUb42PUPyEXsUw33xWLPiLTL3G6Z6xtlZsKA6Wlgfe
	afOVM+Ak9+5ez7TN2PSpm8FES6Y/0XDGOSGxWjwCDdxh3GvqKiflVgluZCl6IstpzlCbTg8df0H
	5bDDBZsysLs+jw3MTsQ+517PY5aVnz
X-Received: by 2002:a05:6300:218e:b0:39b:bee4:2958 with SMTP id adf61e73a8af0-39c87c46ca0mr7507196637.61.1774759695446;
        Sat, 28 Mar 2026 21:48:15 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:15 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:56 +0000
Subject: [PATCH v2 1/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-1-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, kernel test robot <lkp@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=17049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=cwtQPbv3nwjbv2cB/O7Hw+lGpUV3DovZ0aVRo4yVFIA=;
 b=4X7513aNm5COB1jcMz6mf8j/S7+wP64tJVT6t89Src6GQqBJtXrGpfTYeGdpJtemBULzVPiYK
 HXH81s39Jt5CnepRKH6XWrUKZOOeY3BXGe0WZFxwtXPOLMkHUqdoij0
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7548-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63903350AAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SM6125's SMMU uses 36bit VAs, which is a good indicator that we
should increase (dma-)ranges - and by extension #address- and
 #size-cells to prevent things from getting lost in translation
(both literally and figuratively). Do so.

Fixes: 7bb7c90e0ac1 ("arm64: dts: qcom: Add Redmi Note 8T")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 153 ++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 75 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index c84911a98fce..a1a296f90f44 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -374,22 +374,23 @@ smem: smem {
 	};
 
 	soc@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x00 0x00 0x00 0xffffffff>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
 		compatible = "simple-bus";
 
 		tcsr_mutex: hwlock@340000 {
 			compatible = "qcom,tcsr-mutex";
-			reg = <0x00340000 0x20000>;
+			reg = <0x0 0x00340000 0x0 0x20000>;
 			#hwlock-cells = <1>;
 		};
 
 		tlmm: pinctrl@500000 {
 			compatible = "qcom,sm6125-tlmm";
-			reg = <0x00500000 0x400000>,
-			      <0x00900000 0x400000>,
-			      <0x00d00000 0x400000>;
+			reg = <0x0 0x00500000 0x0 0x400000>,
+			      <0x0 0x00900000 0x0 0x400000>,
+			      <0x0 0x00d00000 0x0 0x400000>;
 			reg-names = "west", "south", "east";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
@@ -672,7 +673,7 @@ qup_uart4_default: qup-uart4-default-state {
 
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6125";
-			reg = <0x01400000 0x1f0000>;
+			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -682,7 +683,7 @@ gcc: clock-controller@1400000 {
 
 		hsusb_phy1: phy@1613000 {
 			compatible = "qcom,msm8996-qusb2-phy";
-			reg = <0x01613000 0x180>;
+			reg = <0x0 0x01613000 0x0 0x180>;
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
@@ -695,18 +696,18 @@ hsusb_phy1: phy@1613000 {
 
 		rng: rng@1b53000 {
 			compatible = "qcom,prng-ee";
-			reg = <0x01b53000 0x1000>;
+			reg = <0x0 0x01b53000 0x0 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
 		};
 
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x01c40000 0x1100>,
-			      <0x01e00000 0x2000000>,
-			      <0x03e00000 0x100000>,
-			      <0x03f00000 0xa0000>,
-			      <0x01c0a000 0x26000>;
+			reg = <0x0 0x01c40000 0x0 0x1100>,
+			      <0x0 0x01e00000 0x0 0x2000000>,
+			      <0x0 0x03e00000 0x0 0x100000>,
+			      <0x0 0x03f00000 0x0 0xa0000>,
+			      <0x0 0x01c0a000 0x0 0x26000>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
 			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
@@ -720,12 +721,13 @@ spmi_bus: spmi@1c40000 {
 
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram";
-			reg = <0x045f0000 0x7000>;
+			reg = <0x0 0x045f0000 0x0 0x7000>;
 		};
 
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x04744000 0x1000>, <0x04745000 0x1000>;
+			reg = <0x0 0x04744000 0x0 0x1000>,
+			      <0x0 0x04745000 0x0 0x1000>;
 			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
@@ -752,7 +754,7 @@ sdhc_1: mmc@4744000 {
 
 		sdhc_2: mmc@4784000 {
 			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x04784000 0x1000>;
+			reg = <0x0 0x04784000 0x0 0x1000>;
 			reg-names = "hc";
 
 			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
@@ -780,7 +782,8 @@ sdhc_2: mmc@4784000 {
 
 		ufs_mem_hc: ufshc@4804000 {
 			compatible = "qcom,sm6125-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0x04804000 0x3000>, <0x04810000 0x8000>;
+			reg = <0x0 0x04804000 0x0 0x3000>,
+			      <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -825,7 +828,7 @@ ufs_mem_hc: ufshc@4804000 {
 
 		ufs_mem_phy: phy@4807000 {
 			compatible = "qcom,sm6125-qmp-ufs-phy";
-			reg = <0x04807000 0xdb8>;
+			reg = <0x0 0x04807000 0x0 0xdb8>;
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
@@ -846,7 +849,7 @@ ufs_mem_phy: phy@4807000 {
 
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,sm6125-gpi-dma", "qcom,sdm845-gpi-dma";
-			reg = <0x04a00000 0x60000>;
+			reg = <0x0 0x04a00000 0x0 0x60000>;
 			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
@@ -864,19 +867,19 @@ gpi_dma0: dma-controller@4a00000 {
 
 		qupv3_id_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
-			reg = <0x04ac0000 0x2000>;
+			reg = <0x0 0x04ac0000 0x0 0x2000>;
 			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
 			clock-names = "m-ahb", "s-ahb";
 			iommus = <&apps_smmu 0x123 0x0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			ranges;
 			status = "disabled";
 
 			i2c0: i2c@4a80000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04a80000 0x4000>;
+				reg = <0x0 0x04a80000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
@@ -893,7 +896,7 @@ i2c0: i2c@4a80000 {
 
 			spi0: spi@4a80000 {
 				compatible = "qcom,geni-spi";
-				reg = <0x04a80000 0x4000>;
+				reg = <0x0 0x04a80000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
@@ -910,7 +913,7 @@ spi0: spi@4a80000 {
 
 			i2c1: i2c@4a84000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04a84000 0x4000>;
+				reg = <0x0 0x04a84000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
@@ -927,7 +930,7 @@ i2c1: i2c@4a84000 {
 
 			i2c2: i2c@4a88000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04a88000 0x4000>;
+				reg = <0x0 0x04a88000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
@@ -944,7 +947,7 @@ i2c2: i2c@4a88000 {
 
 			spi2: spi@4a88000 {
 				compatible = "qcom,geni-spi";
-				reg = <0x04a88000 0x4000>;
+				reg = <0x0 0x04a88000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
@@ -961,7 +964,7 @@ spi2: spi@4a88000 {
 
 			i2c3: i2c@4a8c000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04a8c000 0x4000>;
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
@@ -978,7 +981,7 @@ i2c3: i2c@4a8c000 {
 
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04a90000 0x4000>;
+				reg = <0x0 0x04a90000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
@@ -995,7 +998,7 @@ i2c4: i2c@4a90000 {
 
 			uart4: serial@4a90000 {
 				compatible = "qcom,geni-debug-uart";
-				reg = <0x04a90000 0x4000>;
+				reg = <0x0 0x04a90000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
@@ -1007,7 +1010,7 @@ uart4: serial@4a90000 {
 
 		gpi_dma1: dma-controller@4c00000 {
 			compatible = "qcom,sm6125-gpi-dma", "qcom,sdm845-gpi-dma";
-			reg = <0x04c00000 0x60000>;
+			reg = <0x0 0x04c00000 0x0 0x60000>;
 			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
@@ -1025,19 +1028,19 @@ gpi_dma1: dma-controller@4c00000 {
 
 		qupv3_id_1: geniqup@4cc0000 {
 			compatible = "qcom,geni-se-qup";
-			reg = <0x04cc0000 0x2000>;
+			reg = <0x0 0x04cc0000 0x0 0x2000>;
 			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
 			clock-names = "m-ahb", "s-ahb";
 			iommus = <&apps_smmu 0x143 0x0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			ranges;
 			status = "disabled";
 
 			i2c5: i2c@4c80000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04c80000 0x4000>;
+				reg = <0x0 0x04c80000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
@@ -1054,7 +1057,7 @@ i2c5: i2c@4c80000 {
 
 			spi5: spi@4c80000 {
 				compatible = "qcom,geni-spi";
-				reg = <0x04c80000 0x4000>;
+				reg = <0x0 0x04c80000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
@@ -1071,7 +1074,7 @@ spi5: spi@4c80000 {
 
 			i2c6: i2c@4c84000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04c84000 0x4000>;
+				reg = <0x0 0x04c84000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -1088,7 +1091,7 @@ i2c6: i2c@4c84000 {
 
 			spi6: spi@4c84000 {
 				compatible = "qcom,geni-spi";
-				reg = <0x04c84000 0x4000>;
+				reg = <0x0 0x04c84000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -1105,7 +1108,7 @@ spi6: spi@4c84000 {
 
 			i2c7: i2c@4c88000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04c88000 0x4000>;
+				reg = <0x0 0x04c88000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
@@ -1122,7 +1125,7 @@ i2c7: i2c@4c88000 {
 
 			i2c8: i2c@4c8c000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04c8c000 0x4000>;
+				reg = <0x0 0x04c8c000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
@@ -1139,7 +1142,7 @@ i2c8: i2c@4c8c000 {
 
 			spi8: spi@4c8c000 {
 				compatible = "qcom,geni-spi";
-				reg = <0x04c8c000 0x4000>;
+				reg = <0x0 0x04c8c000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
@@ -1156,7 +1159,7 @@ spi8: spi@4c8c000 {
 
 			i2c9: i2c@4c90000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0x04c90000 0x4000>;
+				reg = <0x0 0x04c90000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
@@ -1173,7 +1176,7 @@ i2c9: i2c@4c90000 {
 
 			spi9: spi@4c90000 {
 				compatible = "qcom,geni-spi";
-				reg = <0x04c90000 0x4000>;
+				reg = <0x0 0x04c90000 0x0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
@@ -1191,9 +1194,9 @@ spi9: spi@4c90000 {
 
 		usb3: usb@4ef8800 {
 			compatible = "qcom,sm6125-dwc3", "qcom,dwc3";
-			reg = <0x04ef8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			reg = <0x0 0x04ef8800 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
@@ -1228,7 +1231,7 @@ usb3: usb@4ef8800 {
 
 			usb3_dwc3: usb@4e00000 {
 				compatible = "snps,dwc3";
-				reg = <0x04e00000 0xcd00>;
+				reg = <0x0 0x04e00000 0x0 0xcd00>;
 				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x100 0x0>;
 				phys = <&hsusb_phy1>;
@@ -1244,12 +1247,12 @@ usb3_dwc3: usb@4e00000 {
 
 		sram@4690000 {
 			compatible = "qcom,rpm-stats";
-			reg = <0x04690000 0x10000>;
+			reg = <0x0 0x04690000 0x0 0x10000>;
 		};
 
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,sm6125-mdss";
-			reg = <0x05e00000 0x1000>;
+			reg = <0x0 0x05e00000 0x0 0x1000>;
 			reg-names = "mdss";
 
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
@@ -1269,16 +1272,16 @@ mdss: display-subsystem@5e00000 {
 
 			iommus = <&apps_smmu 0x400 0x0>;
 
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			ranges;
 
 			status = "disabled";
 
 			mdss_mdp: display-controller@5e01000 {
 				compatible = "qcom,sm6125-dpu";
-				reg = <0x05e01000 0x83208>,
-				      <0x05eb0000 0x3000>;
+				reg = <0x0 0x05e01000 0x0 0x83208>,
+				      <0x0 0x05eb0000 0x0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				interrupt-parent = <&mdss>;
@@ -1348,7 +1351,7 @@ opp-400000000 {
 
 			mdss_dsi0: dsi@5e94000 {
 				compatible = "qcom,sm6125-dsi-ctrl", "qcom,mdss-dsi-ctrl";
-				reg = <0x05e94000 0x400>;
+				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
@@ -1417,9 +1420,9 @@ opp-187500000 {
 
 			mdss_dsi0_phy: phy@5e94400 {
 				compatible = "qcom,sm6125-dsi-phy-14nm";
-				reg = <0x05e94400 0x100>,
-				      <0x05e94500 0x300>,
-				      <0x05e94800 0x188>;
+				reg = <0x0 0x05e94400 0x0 0x100>,
+				      <0x0 0x05e94500 0x0 0x300>,
+				      <0x0 0x05e94800 0x0 0x188>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
@@ -1441,7 +1444,7 @@ mdss_dsi0_phy: phy@5e94400 {
 
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,sm6125-dispcc";
-			reg = <0x05f00000 0x20000>;
+			reg = <0x0 0x05f00000 0x0 0x20000>;
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
@@ -1470,7 +1473,7 @@ dispcc: clock-controller@5f00000 {
 
 		apps_smmu: iommu@c600000 {
 			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
-			reg = <0x0c600000 0x80000>;
+			reg = <0x0 0x0c600000 0x0 0x80000>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
@@ -1544,74 +1547,74 @@ apps_smmu: iommu@c600000 {
 		apcs_glb: mailbox@f111000 {
 			compatible = "qcom,sm6125-apcs-hmss-global",
 				     "qcom,msm8994-apcs-kpss-global";
-			reg = <0x0f111000 0x1000>;
+			reg = <0x0 0x0f111000 0x0 0x1000>;
 
 			#mbox-cells = <1>;
 		};
 
 		timer@f120000 {
 			compatible = "arm,armv7-timer-mem";
-			#address-cells = <1>;
+			#address-cells = <2>;
 			#size-cells = <1>;
-			ranges;
-			reg = <0x0f120000 0x1000>;
+			reg = <0x0 0x0f120000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x0 0x0 0x20000000>;
 			clock-frequency = <19200000>;
 
 			frame@f121000 {
 				frame-number = <0>;
 				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f121000 0x1000>,
-				      <0x0f122000 0x1000>;
+				reg = <0x0 0x0f121000 0x1000>,
+				      <0x0 0x0f122000 0x1000>;
 			};
 
 			frame@f123000 {
 				frame-number = <1>;
 				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f123000 0x1000>;
+				reg = <0x0 0x0f123000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f124000 {
 				frame-number = <2>;
 				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f124000 0x1000>;
+				reg = <0x0 0x0f124000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f125000 {
 				frame-number = <3>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f125000 0x1000>;
+				reg = <0x0 0x0f125000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f126000 {
 				frame-number = <4>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f126000 0x1000>;
+				reg = <0x0 0x0f126000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f127000 {
 				frame-number = <5>;
 				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f127000 0x1000>;
+				reg = <0x0 0x0f127000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f128000 {
 				frame-number = <6>;
 				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0f128000 0x1000>;
+				reg = <0x0 0x0f128000 0x1000>;
 				status = "disabled";
 			};
 		};
 
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
-			reg = <0x0f200000 0x20000>,
-			      <0x0f300000 0x100000>;
+			reg = <0x0 0x0f200000 0x0 0x20000>,
+			      <0x0 0x0f300000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.53.0


