Return-Path: <linux-leds+bounces-2569-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FF09687B5
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14F92837E9
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8C319E998;
	Mon,  2 Sep 2024 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncGJVafg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F319E991
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280896; cv=none; b=WuweIcxTn8f9sKi31woYm1auZyRewUJF5t70hfKDGK80JyMdM2hxTSkL1refrngbRyu+n6mRrper68YytZk6rAZLs6wCQfNMLiJO3pW33AHzRJTmo+6BcQHmApkYZFgy0rIQdV16qzTRpofaNBHE85o6RLxN5q9Pu3hacqZle5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280896; c=relaxed/simple;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbbsi0bThLH9OwQ/6jtb/eclSNrEeR+m5YDP4ZqYpDPTGpAgw4QiMx84xKQchHAa2B4DJLI/Sgg/7E3Dtnq6+4q7UvQd2xiiWec7MjigRWTed15/2+0AtP486xs0p4YNMSOm8lYIikSkKT1zjt8vbRYi4v7vm5LPR9qhLAB4PnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncGJVafg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B17C4CEC8;
	Mon,  2 Sep 2024 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280896;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ncGJVafgq3pAFr4frXFxnmwzS09xLKQfsQrJpDNwLKC1RPI+aD26idsLYqyaSYj0A
	 D1wjMiXwiQ4jQFVkZDDIx5nJEpC0gtAlCFtWvbH10xV3Afu6Wh2bOjjJP7PKRIyCXG
	 lef7Q2AHmKouj0UPFJLW0EEX403QvukTwpNd+AVyx7E7ysVpZ/kO2qRNGDQd5W+xeP
	 YlUEsMIr+FxQ/XM7RsY9ClVAW2R7PYhMr5A+QWcSK8+iikFEahDrM36SQaEKHUIM5G
	 FAOIzWWe+3Iu4vjKppxdk3DhPakl/dDp12+shp9K5ctNo9IAGVUREZD3g80Yj735FG
	 lnAS1xFUIxLig==
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
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 8/8] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Mon,  2 Sep 2024 14:41:04 +0200
Message-ID: <20240902124104.14297-9-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902124104.14297-1-kabel@kernel.org>
References: <20240902124104.14297-1-kabel@kernel.org>
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
2.44.2


