Return-Path: <linux-leds+bounces-3268-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 196779BB78B
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EED0B25A97
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 14:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE2C1442F6;
	Mon,  4 Nov 2024 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJRmrsJO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AEE13A257;
	Mon,  4 Nov 2024 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730021; cv=none; b=syok2oxzrTLvwbmF+tn9FmwTci4oTq2yTrFxj5/TvGl/YOhu4EpoZIucRBj/UCaAGgWh9oa/UjkztfH9LY/Mh9bMtJozfkGztpN9HYGr/psjdR9WturGcV6PraGHDRve0vVxZAnLWGha7lhKf2UmA3MpUo9OorbnRSU58K/TbP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730021; c=relaxed/simple;
	bh=02cumqv7Pptd8Tkhcc6pofXSXkHGb+wYsFd9giydYr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YENNs6c+NcAJumb2bythQj4D1WXdj75Vdy9qcCKHmGU3Cjdbm9Ahm6V/sWUKf0J6TVsAwlvFPoROM/AX/H03OnLAG8vBkorto8wvWmSYszKvb4KAkToodtKEAnrPrC5dQrT5uwfGDKqT6isEFsyETUV/WH3EvlDRA3wP6JLA2fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJRmrsJO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C424C4CEDB;
	Mon,  4 Nov 2024 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730730021;
	bh=02cumqv7Pptd8Tkhcc6pofXSXkHGb+wYsFd9giydYr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJRmrsJOR9MTLMeiDc3UdRBlUA6b8l9lBH5W129vD3MOgCD+YrhKDsJbP69La44ki
	 GTJrs2jdcMVPryBJOZxP8fUcCndSyjO3hhp6UAbhJ0mbP1o6f5ReM9k+II1udOf4TA
	 Maanwxq/pGBPWz2mDBIPt6l76rhrDLwVCYe0iftXy6C0k7CMpDcPG7MAN9SyI1Fp8A
	 5l4VQujSQ2bC0gLJp9kFzpBD8v4YegsYSjjuN4zYRs9NhwXgv6AG9+QrLrTB1G1ZA1
	 SKaJCzqzlVgkvW1Pv9deMWBsXSAfWTe3Up91paYIHzAwsnmq9sj4zHg8JDTIaDJNDD
	 7OrPhW0FBMm6g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Mon,  4 Nov 2024 15:19:24 +0100
Message-ID: <20241104141924.18816-13-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When global LED brightness is changed by pressing the front button on
Turris Omnia, the MCU can produce an interrupt to the CPU. Add the
description of this interrupt to the LED controller node.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 43202890c959..83fe00abd652 100644
--- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
@@ -251,6 +251,7 @@ mcu: system-controller@2a {
 			led-controller@2b {
 				compatible = "cznic,turris-omnia-leds";
 				reg = <0x2b>;
+				interrupts-extended = <&mcu 11 IRQ_TYPE_NONE>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "okay";
-- 
2.45.2


