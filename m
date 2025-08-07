Return-Path: <linux-leds+bounces-5201-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB7DB1D584
	for <lists+linux-leds@lfdr.de>; Thu,  7 Aug 2025 12:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8EE188306B
	for <lists+linux-leds@lfdr.de>; Thu,  7 Aug 2025 10:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22EB229B2E;
	Thu,  7 Aug 2025 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UMnhxlT2"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365712E7F;
	Thu,  7 Aug 2025 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561373; cv=none; b=ES0VEwjuiYd2RwX0iG4P6KVzRwDBX9llPo8E0V2mF0AxYo86If9itpyvB945++Nf+PyBXfwxCLVUjjZLS5XVNwqYhlATEWwl0psaDuDAwnvzxj6NXDcVPu0aENJ1jxXZCD2P8JZpD2Tu+Zo+7sRqcqhZ2fGXq+/fAz4XkgpbIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561373; c=relaxed/simple;
	bh=V1nydN8gNugZAMNzR2LP9TE59bgTN1UQV6hiBgznw40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/1N/1Nu7NV8XaWHKM13WJLEBH3EBBHVQN7msv3pVwFi7eqaZ3t/+6q7XgxdlaKMo1AlRnTHzxyDqzgjcF72afpbbUO/idM2OtbVyl+4KXEcRagK8Uiq7pSONcnpZMqKh61Fi8aGCgM52s63GZHRokMQB19BbOJJu/+Ir7t1pF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UMnhxlT2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lJQ8t6Wg5SpMe7LvBgmK2KLgjKo0GUwMiAaC0qTb9SQ=; b=UMnhxlT2HczqXK7idPMzlrhtqS
	BW1Y8yUJ2Ea17ppOxN1cZku1MiCcGJgw2VpLlpmofmvgPZZSASO7APlIND1OoQIW3nCaL7hqmNEmF
	AnJyZV2EN4CQ1vu4SJ7ATWn97l0nRXSx09dYZnucaqtb7ZN6bPM3Y5i8ISwulaRvziHhKxfw5AKuG
	Ke2Okxrtxj0Gi0ZLA4cIkgHB1FmtGKioF/nNr1nWE6r28aonV5HzdlFSg6pMBAXIKZfGR26u3q3H9
	ZBYDOOtujciuPjI1FcGp/qZumnqR83GilVFXu4i0esSJAYUVcxco6f2xMA9MG/RCHxMB02eqCZOO7
	I6Oo5CCQ==;
Received: from i53875a15.versanet.de ([83.135.90.21] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ujxYo-0007HP-VI; Thu, 07 Aug 2025 12:09:23 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
Date: Thu, 07 Aug 2025 12:09:22 +0200
Message-ID: <2598568.Sgy9Pd6rRy@diego>
In-Reply-To: <20250113002346.297481-1-marex@denx.de>
References: <20250113002346.297481-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 13. Januar 2025, 01:23:37 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Marek Vasut:
> Document netdev trigger specific netdev-trigger-mode property which
> is used to configure the netdev trigger mode flags. Those mode flags
> define events on which the LED acts upon when the hardware offload is
> enabled. This is traditionally configured via sysfs, but that depends
> on udev rules which are available either too late or never in case of
> non-Linux systems.
>=20
> For each LED with linux,default-trigger =3D "netdev" described in DT, this
> optional netdev-trigger-mode property supplies the default configuration
> of the PHY LED mode via DT. This property should be set to a subset of
> TRIGGER_NETDEV_* flags.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

while this is already half a year old, neither me nor b4 have found a
newer thread, so I hope this is still the most recent one to reply to.


> ---
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Christian Marangi <ansuelsmth@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documen=
tation/devicetree/bindings/leds/common.yaml
> index 3e8319e443392..1f1148fdf20c0 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -233,6 +233,12 @@ properties:
>        Maximum timeout in microseconds after which the flash LED is turne=
d off.
>        Required for flash LED nodes with configurable timeout.
> =20
> +  # Requires netdev trigger
> +  netdev-trigger-mode:
> +    description:
> +      The netdev LED trigger default mode flags, use TRIGGER_NETDEV_ * f=
lags.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +

as DT is supposed to be a hardware description, I think throwing arbitary
binary values around is not very readable - especially as the above would
be a combination of setting-bits for the TRIGGER_NETDEV_* things.

Instead I'd think using boolean dt props would reflect the binary "or"
way better and also keep all the bitwise nastiness out of the dt.

Also "netdev" is a Linux thing, and therefore also set in the
"linux,default-trigger" property, so I'd think any added netdev-props
should probably also have a linux,* prefix.


So in sum, I think the following might look better?

  linux,netdev-trigger-link:
    description:
      LED is lit on established link
    type: boolean

  linux,netdev-trigger-link-10:
    description:
      LED is lit on established link with 10MBit
    type: boolean

  linux,netdev-trigger-link-100:
    description:
      LED is lit on established link with 100MBit
    type: boolean

[...]

  linux,netdev-trigger-link-tx:
    description:
      LED is triggered when sending data
    type: boolean

  linux,netdev-trigger-link-rx:
    description:
      LED is triggered when receiving data
    type: boolean

[...]

for each element of the led_trigger_netdev_modes enum [0], with the node
then looking something like:

               leds {
                       #address-cells =3D <1>;
                       #size-cells =3D <0>;

                       /* Network LED on the front panel */
                       led@0 {
                               reg =3D <0>;
                               color =3D <LED_COLOR_ID_AMBER>;
                               function =3D LED_FUNCTION_LAN;
                               linux,default-trigger =3D "netdev";
                               linux,netdev-trigger-rx;
                               linux,netdev-trigger-tx;
                       };


Heiko


[0] https://elixir.bootlin.com/linux/v6.16/source/include/linux/leds.h#L603



