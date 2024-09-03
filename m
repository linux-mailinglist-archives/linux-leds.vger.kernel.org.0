Return-Path: <linux-leds+bounces-2586-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D09699FF
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6EB1C232B4
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFC61AD253;
	Tue,  3 Sep 2024 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhD7fsB/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A65F1AD256
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358811; cv=none; b=U6qJTwHp7cen8uxDfoG/ol3GxSGCd+fQSn0KTWeXhjqqeQo7/WnNIV76nzJoVwWSrOT0x5YdZfIw+lWPll5h5HQj2w9GvvsCCT6undFJl1cazhX4V6IanjSi1YiuKrHBgtdySnR6wjBn941jyux7JmSqRBAhQEs2q1yPCTc/OUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358811; c=relaxed/simple;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nu06XaYKXwaJOt3LsEC1QymbmppC1mPyoNIplJ/kEAulRlxawUvhMtpJolPCopfCcn5mETAQs/LjGri34SmAUQSIGxKN5xJRJOZY2VRjb3YJu5pK349UopYSHRiAVc1JopTL6FmkjOdhEvwFRAQJLdcyF1NiiPZp5xXDxr3PrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhD7fsB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D25C4CEC5;
	Tue,  3 Sep 2024 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358811;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhD7fsB/Q6fffnMSbbsw00/fnl2UTgpU4vS/mv0tvn0GRGtaa1huCExgeNEIydpvD
	 /rUCq7SuiUdCWAhvg84Hsjhdo764fMJdvk/opxd/pTH8Rt8LMbjWM83gFEyscEoILN
	 y1YGDLMuXVZIj3IXstmUTGzPMF9PicWlL8BkoCr1xCowBeFe291ChMtev4nYdBdBZD
	 mdNtwiFRzi8PDNSfqu+v2R8wnUzPZx5cdQlZRuBlQ2FJXQtpYe4iAcrNYlUS0cp5uI
	 +XAapcODIJ/K0CvCCRWbETgqKv9O551ps3l6iUhhISSaxvOYwL5ZttHZeEINGp97qJ
	 aZGKZEU6BXB1w==
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
Subject: [PATCH leds v2 11/11] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Tue,  3 Sep 2024 12:19:30 +0200
Message-ID: <20240903101930.16251-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
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


