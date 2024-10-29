Return-Path: <linux-leds+bounces-3194-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 534669B4B89
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AFA01F23D69
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD5D206962;
	Tue, 29 Oct 2024 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jipdGpCV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DB205132;
	Tue, 29 Oct 2024 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210240; cv=none; b=Qw0LD5d+30P/4EwfkOvGXTJ7T027cussGneVku1pASDtjCET3USR7oXXmbWMxJCF2eHO+MOmw8X7n1OPpDTP+34GXUnKafeHYJfPDXsz0Oc/yZQrTtV1ivrhF9nCuY7PHxFJxtZ+PwkI+FgaRXo6SrwQStmahMgIrLsYvBqenZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210240; c=relaxed/simple;
	bh=02cumqv7Pptd8Tkhcc6pofXSXkHGb+wYsFd9giydYr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJ0QEkP7Q1SMDR674F09wgBwjEOn6/viGmn4otZkBgqJUuRiddTqWy2Gw4RV+ZSWQH/sYw3oPvu0f+3wEhixH0anu1oYx2+/Jv8OMKAoWPkA5hXJMuP+6hE4YZEJcR1ql28D8Lwnw2zk4yDkjCOWY3YTd5khzZhqJFLE/fTIqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jipdGpCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B24C4CEE6;
	Tue, 29 Oct 2024 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210239;
	bh=02cumqv7Pptd8Tkhcc6pofXSXkHGb+wYsFd9giydYr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jipdGpCV0QP8ceDBVUoVQzTgnZTZm720UFG4wqfXHR2qoB9vMgq/0GW1ovrO5gPG+
	 0Z+fiTDqXFbl4SYbeoFoj5IZ+1IhZbHw5D9hXcB6emzLafCapBDThWVoWvuMqiE2xS
	 XIKBVnOjUecFMtoqjsYdkMOPtGq5lG8YYN37tueUaPLyiiLxbxxi4sS2XVp2VO8Ug3
	 p/yZUmvfS7cONnO596N2L7Xjfs+yd8jJ+IlB5+wrvgFGuyn/g0NaUU7jFGJg/seFaR
	 6VkkNFFqFMsTOA1jY+qjqzR+0WVsRW/b8nKG/4PSDENRHkwF9OrJ09Uo/jbzrj2uEi
	 WP9Hh2AGh5AjA==
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
Subject: [PATCH leds v4 12/12] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Tue, 29 Oct 2024 14:56:21 +0100
Message-ID: <20241029135621.12546-13-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
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


