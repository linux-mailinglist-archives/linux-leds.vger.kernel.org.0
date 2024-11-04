Return-Path: <linux-leds+bounces-3271-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360499BB9BC
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 17:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB5F283036
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 16:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DC21C07DF;
	Mon,  4 Nov 2024 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V7BFKuQF"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC79208A7;
	Mon,  4 Nov 2024 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730736169; cv=none; b=fpQmW89uHRCsp5WkNim0Fi59xGwVX36g9fC5Z9F90GgX2xkqAYv2VtpdL+/YFwmNya8RgBcsM1N4XqdViCbNqmMUsGM/9atN6ou3TYHxyBfABjeXaYwt2lwjmXE36tO1aab8Bj+Oh7341Zuk4ExZbfWxQPca0ytuko1do3KDfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730736169; c=relaxed/simple;
	bh=IMPSXRSZHiSKChDLZSD/EL+GNcEzzjv6djemSat7PcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ff7Hs5jWnGAWTheIjLbRiUqq+S4Ny9aaxkphobfxksGdaGmrtGrw9ujTSvYgA+B2GsMExbmhx1RpDpgWjHAbeYnArBJY2a/EiBCKgRXvtsWO8LWap3SBf5AEMFIONFJa5WoM9/DQEjMg7oSfa84pvGTofUtE8ojAJsluZ+vc58s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V7BFKuQF; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A61B1BF212;
	Mon,  4 Nov 2024 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730736165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVW8Eovr8XM+Wk5SgrmMG++7+hvu3mp1NJ851HHAgbQ=;
	b=V7BFKuQFb19JUly9CiSwu5oht+6XImDThA72JhlABUx3krc0uXVJxEb2TOwzR6GCPLzJT8
	0kf1fHR24ed1AhbpdyDhYhxVsPX5M6NDxqSKHgoqkUx5AnKbrcbWz8U4zcdmqZMhOeS/sY
	NWX0RpKkkxQO3oU4hGuWFeKFT4QvARW9oXmCBExe0eADehf2mqWiW5UbGCOXXJJq3M2teu
	PfWQCpS3CfHi/JsYe1abKbJMtghDsGoPCmwtmBI5l7j3PmeDaotqC+fx160Z9PsrcnDUvv
	pdSn1GPBPIYG25qk4IQrfGuZywH4sn+L8QIhbyBvcfszlDSTMyRz4TsLD3grXw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Lee Jones
 <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J?=
 =?utf-8?Q?=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Marek
 =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
In-Reply-To: <20241104141924.18816-13-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-13-kabel@kernel.org>
Date: Mon, 04 Nov 2024 17:02:44 +0100
Message-ID: <87bjyv9ecb.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Marek Beh=C3=BAn <kabel@kernel.org> writes:

> When global LED brightness is changed by pressing the front button on
> Turris Omnia, the MCU can produce an interrupt to the CPU. Add the
> description of this interrupt to the LED controller node.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

As the binding had been acked, and this change won't produce any
regression I can already get it.

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch=
/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> index 43202890c959..83fe00abd652 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> @@ -251,6 +251,7 @@ mcu: system-controller@2a {
>  			led-controller@2b {
>  				compatible =3D "cznic,turris-omnia-leds";
>  				reg =3D <0x2b>;
> +				interrupts-extended =3D <&mcu 11 IRQ_TYPE_NONE>;
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
>  				status =3D "okay";
> --=20
> 2.45.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

