Return-Path: <linux-leds+bounces-2678-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F3978001
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 14:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46E41F223C1
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 12:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C341DA0E1;
	Fri, 13 Sep 2024 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t20rxUl9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB481D932C;
	Fri, 13 Sep 2024 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230712; cv=none; b=PCOnB71XnCnFe/iGpeygUN0PJG3i7j4WJv74WJkV6T/2jzAUJa+qrTJnCE/AMl+Fe8ll68UZNrIislIYcUOo8vYR7+096GJyawTbYUeAJtz3DhUopQ8ch3KfJ3wwvEK6GM0LJTLSD/sdat12+xFNTvCwlaqLz7NCIeIU2Y01F4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230712; c=relaxed/simple;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzugFVwCG1F6x+EpwFjibHpSuvhjSRapdo74sVxsGOAEfaxW8Qh2/P/AORRmuiTO9t0MLxYu4h73YUwlvjQgPYhvu8BRyTP0BGzAQy4DyYr+RR8LJuuAGuRTSubHQJY09+xAqITw6dplPCMBjKRFUFvztin/mFQCvMscUn8L4qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t20rxUl9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5C2C4AF0B;
	Fri, 13 Sep 2024 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230711;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=t20rxUl98iOlGiz0BL79OVk/wy4qcf9gWzFWBrT0ZR/CUdRmHMBBdTmnOQmcq9dsv
	 NmrOpqvl+cLusyC8XIG6IM5dTQxbHxfbPOFSl48wPKd1jwnnH0w+gGmR65nwv9945u
	 Y3mHdyQxEAonHp2G3SvmkD9SIlvkTnA2fiyGN4iM+V8BaWQa9BSg0LzPIenucqF56n
	 EXqOCHvYqVSB8PNwIxy5+qCfuDYh/F23c36cvvpF4HK/XIWr1en5zKy9hW18ZHLJag
	 EJlD7cXNiWmLgj3WY394PnvjZLrpwWMR98vrYcvm+JKSqQiNGJAJEL4uCvV4q1SsVW
	 s3qqJu+X0Fzfg==
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
Subject: [PATCH leds v3 11/11] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Fri, 13 Sep 2024 14:31:03 +0200
Message-ID: <20240913123103.21226-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
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


