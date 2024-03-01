Return-Path: <linux-leds+bounces-1081-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E3586D911
	for <lists+linux-leds@lfdr.de>; Fri,  1 Mar 2024 02:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8D91F23C06
	for <lists+linux-leds@lfdr.de>; Fri,  1 Mar 2024 01:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44671381B9;
	Fri,  1 Mar 2024 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2wusa/eb"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09E2CCA4
	for <linux-leds@vger.kernel.org>; Fri,  1 Mar 2024 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257336; cv=none; b=FyiKNpnj8fGWI0LKJ0+ZF62AXD6CWIz/PuoAxT50poD4puv1sTxenYYZljab5HogY53kdQdA7O2sNTA0x1I3JzevuwWc4ANKbeJ4XzYkKaSr4MlLAyBKmgC8T5KvlishZAuN9oeJKzlysBGStR7ke1P9qlt27iLkF81EXm9Efis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257336; c=relaxed/simple;
	bh=T3tc55CjSPYJyIAovpoXkdcFIV0zyYFo6IMzOwHWL8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uem42vLF0apPMII9Q+jAVV4X3+7IuPuBrE17tOK+YTHytjKinxCX4hpKfBHbXOwmOLZV0Sjgvs4J6sqzhWo9k/BeVsatnbHD+KoDyuyanRMlDDw6ILQMb8erPX9szlfDzH0Lyx4Uukk1sMPmJFQv6J4bdXTQtgTZ3rxP4qDP7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2wusa/eb; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 798782C072D;
	Fri,  1 Mar 2024 14:42:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709257330;
	bh=vRjZk3VBvyhAZ+OC2mXTW8QEEJfhOQc/xglfRGmeFco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2wusa/ebssKuW+lliQHpTr0usxdeNBmkOeXeHg6sBrG/Ub7VZA1ZnvUE4xjTrUrT6
	 S2Qg4HDcbvM+z74ERWKjjC19KtKOHCb6CnmIMuk4RGlWHKpp1XuszHnWNhas0I9Y+8
	 gIV30TOToLZDXNo2cM+l0PGirEoQ8QarHGIbbFC73EAK/iRktN4PbWYNa1w1Nrj+fo
	 VG5Zg5XpSGATbsX9UkOTIOkZqc6g3CI1t+igS4x6T8y9TX3IjjQHluulnoTiZrY/3f
	 2tbDos/CgdmuPXPVayOA/JgBYNsvEFgTQN1kSgW3z3VFlObrIV3/Eh5fvnl0MdZiBa
	 /GtZvHJjNW2bQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65e132720004>; Fri, 01 Mar 2024 14:42:10 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1D5D113EE85;
	Fri,  1 Mar 2024 14:42:10 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 18EC72807C4; Fri,  1 Mar 2024 14:42:10 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andy@kernel.org,
	geert@linux-m68k.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	pavel@ucw.cz,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 4/4] ARM: dts: marvell: Indicate USB activity on x530
Date: Fri,  1 Mar 2024 14:42:03 +1300
Message-ID: <20240301014203.2033844-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301014203.2033844-1-chris.packham@alliedtelesis.co.nz>
References: <20240301014203.2033844-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65e13272 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=K6JAEmCyrfEA:10 a=syfxfRYH0sAgbFgdTt0A:9 a=3ZKOabzyN94A:10 a=zZCYzV9kfG8A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Use the dot on the 7-segment LED block to indicate USB access on the
x530.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - None
    Changes in v2:
    - New

 arch/arm/boot/dts/marvell/armada-385-atl-x530.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts b/arch/arm=
/boot/dts/marvell/armada-385-atl-x530.dts
index 60c2abf572b6..a53dd17d11b4 100644
--- a/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts
@@ -54,6 +54,15 @@ &led_7seg_gpio 4 GPIO_ACTIVE_LOW
 				 &led_7seg_gpio 5 GPIO_ACTIVE_LOW
 				 &led_7seg_gpio 6 GPIO_ACTIVE_LOW>;
 	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		led-0 {
+			label =3D "usb";
+			gpios =3D  <&led_7seg_gpio 7 GPIO_ACTIVE_LOW>;
+			linux,default-trigger =3D "usb-host";
+		};
+	};
 };
=20
 &pciec {
--=20
2.43.2


