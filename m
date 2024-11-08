Return-Path: <linux-leds+bounces-3359-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0E9C1E16
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 508FF2888E3
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB62D1F4268;
	Fri,  8 Nov 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWjwjNMf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C961EF0A6;
	Fri,  8 Nov 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072581; cv=none; b=avnm+yEq/uIGUnbOM5Fe44LAAuccyssrNpJmyq55yQzJbw5EwPxUhzAevKrNxqKZdfqPCWFjto+FN0Ki2XzSeBsONEPIuKfU0XTlgoV4XfegPJrEjeqElfYrMcOd6zNX/W8XwfcOdXNpur8gWdEJtB6CO4W9FW85QGylFvyQb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072581; c=relaxed/simple;
	bh=02cumqv7Pptd8Tkhcc6pofXSXkHGb+wYsFd9giydYr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifbepzR7CfaVeUWv5CYqgOVOvIS5USHrv49Qlt1HK18GmpUxVJl5JkmxRa39cv/Aw7x5Codef8TjOec8dvGwaupH2fUqBq13Y4j4KnYosZnnTeUDzB4GZfC4KHy1nZ7aQPGthmzDLwpDxqUdmdyEzJtQdTSZgn6Z08YMp7i+BpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWjwjNMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70F7C4CED6;
	Fri,  8 Nov 2024 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072581;
	bh=02cumqv7Pptd8Tkhcc6pofXSXkHGb+wYsFd9giydYr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWjwjNMfM53MoeZUD0FiH+R/36amSOCKTUXOFuBZ+72Ycl8Cbfn61KEiKAujBXgoW
	 E1VwEZnhqMzPRiIUsCKy8hZu4TCIqjKR03PQDB/lc9ozqgf+IDgkkRBgbRJG3Pm7La
	 JiBPgUA3Q6MjJ2oVOaSJhL2BIfybZmCkUu2ziaaZGhLhzvc5Mt4eDGdpLIk5fiCaCp
	 uUC8sNrpzs2ed5jJ36bQkPvtPJeZ72XpLuhBqQ66k4uQlEVyzKzAJdsA0aaEPqaAaP
	 pPhgEYf0iXu7U/5cMZBYlsCzkQdd8ttcNViH2Ks8PwCCE8WdaSdXvi+E79lEQ1Y/SB
	 +eDELQqLaLrzQ==
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
Subject: [PATCH leds v6 12/12] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Fri,  8 Nov 2024 14:28:45 +0100
Message-ID: <20241108132845.31005-13-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
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


