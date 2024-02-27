Return-Path: <linux-leds+bounces-1030-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296A86A185
	for <lists+linux-leds@lfdr.de>; Tue, 27 Feb 2024 22:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F9628E219
	for <lists+linux-leds@lfdr.de>; Tue, 27 Feb 2024 21:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B5714F998;
	Tue, 27 Feb 2024 21:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="VT8BiIwW"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91F14F96B
	for <linux-leds@vger.kernel.org>; Tue, 27 Feb 2024 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709068972; cv=none; b=Zu8Bn/EbF+f+KpWU3NOuzL8jrFMO6sJ1aQM28vuGWDKujvJtqiMKynaUmLs2oCNH2Kn6pKwYrPDRr6gshoPY2U2qGFxdYYnUXts2vPS4Evnftqnkl7Bo6yEwKielBFaUIBTSRhWl9xQOP0iJRnIu0TMRyhSziZrgCbS6xR6lk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709068972; c=relaxed/simple;
	bh=VZaJSLBAvjIIjiBkUk207ZF5DNLe5yVrF+Vh/8Da/yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGg28jhvheBDciCE/+iiirpuj6KjNWAc2c6N057xeJy85iYelOnot9xsequZ4dGFfoCMYJ66PrxgDnG3Yu29lYvO0qSHYmz68FErJHSflHfF5Xaq7oCazM8BEYUlzoSssgWq55SVeyhaXLzLwhneee/HllqzPg5N7lCuwAQcizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=VT8BiIwW; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E72852C05E7;
	Wed, 28 Feb 2024 10:22:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709068966;
	bh=3gVimorvGq76t5HgY8x6KoiKr8dAvSvtX0ygiIDP6To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VT8BiIwWMqGHBPBvp7nGS5j8sIWMEtYSUijWWSDfg+LjY6N2ul8KQnVS1Lh4EEqzQ
	 v06ALVAHcWXBwyuYmOnH3SN00os7rZrlnDYGY4YdKo22rxUzOl/35Jfdfthp7e2qj7
	 QZLgNsmQ4ZV6l448JAsQfhkm80IJphryAjzHATsmUYw3fCQpdM1Cy6IDBR6oXaDVpB
	 w++cThZC1uTq3GxetQndkAtrfNfNbf3WnJs5RFnLY8vaWdgAVWL4R4FriTTDGgPVwL
	 C3kj1pXRFoHRDvrtcc+kbrby0IK9tY56kNdEQx/BJjkTuKPvhrFWAGYJXHxb56pVcF
	 CE6OSCKDOYG1Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65de52a60004>; Wed, 28 Feb 2024 10:22:46 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6DEE713EDA8;
	Wed, 28 Feb 2024 10:22:46 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 6B9E0280AFE; Wed, 28 Feb 2024 10:22:46 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andy@kernel.org,
	geert@linux-m68k.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	ojeda@kernel.org,
	tzimmermann@suse.de,
	javierm@redhat.com,
	robin@protonic.nl,
	lee@kernel.org,
	pavel@ucw.cz
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 4/4] ARM: dts: marvell: Indicate USB activity on x530
Date: Wed, 28 Feb 2024 10:22:44 +1300
Message-ID: <20240227212244.262710-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227212244.262710-1-chris.packham@alliedtelesis.co.nz>
References: <20240227212244.262710-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65de52a6 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=k7vzHIieQBIA:10 a=f9q4IQp7et2z0Ui1RocA:9 a=3ZKOabzyN94A:10 a=zZCYzV9kfG8A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Use the dot on the 7 segment LED block to indicate USB access on the
x530.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Change in v2:
    - New

 arch/arm/boot/dts/marvell/armada-385-atl-x530.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts b/arch/arm=
/boot/dts/marvell/armada-385-atl-x530.dts
index f55a3dc6b6de..94ae9f4ebe1c 100644
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


