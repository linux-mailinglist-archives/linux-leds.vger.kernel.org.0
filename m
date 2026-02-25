Return-Path: <linux-leds+bounces-7028-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMx4HWAin2mcZAQAu9opvQ
	(envelope-from <linux-leds+bounces-7028-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:25:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CFC19A8DF
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF3DF31C5045
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D04A3D9031;
	Wed, 25 Feb 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtGqL61f"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838C3D6470
	for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036105; cv=none; b=F5TtoI+8fu4MFvy6j9DVu21Op2lfkpD9iNNQNsUvORBDbZZaXG01xksGl+5tTQb29V9Q3pirCMIQZ2IwHBLMB+y5XgM63ozwoZRFFupyfz05r5keDbX4Tfkxj/EbpNT0VqmuG4F5X5WX/lyt3WpPBNKBmcouc3VyXWAReB0itGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036105; c=relaxed/simple;
	bh=wmdB0fl1vrEWsur3Dkdc9CY49UgOrg4GQj69XI3kpwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EW3KlF9polPgWiSXMUKk4d9sQgEh0qCq3xUJcrrYEsY4mjjkIqEZa0ctfZ9a+I4VbYv5zH/0wfjE8aNJu9C6JW8C0kcSYF9d87q8eo4RqSEOxsATc4/92GP6AJt7yd/Zqoeg1eFd3WFjSgtxgoIGOa0d7KgVPqALoUq3u1lJBS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtGqL61f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E0AC4AF09
	for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772036105;
	bh=wmdB0fl1vrEWsur3Dkdc9CY49UgOrg4GQj69XI3kpwc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CtGqL61fxVrE+IXAyMneaKwr20DmBCGNDLKv/rBnm8j20N8r1Fhl/045ySrWPgM3Y
	 o6+7C6BbuBOB9NO1ZfILeqNNrog63quE/WBz1qWCYGq/NC8iHk+AVuKfG5JGreZ+9j
	 rgyj+CkcUKkJkxTXyk1P9hYe1RP9fFRIVJQnj7W8hPIOEi1P9EItbSPDQd/1/4eJSX
	 ltyy/xfS7VtrSpOIcuOe8XLa2ztqskTsF/W9/HFwtBDmcy0e1cWLYn3S57IhGxCWYC
	 YLdYzPFQFpA8ZTEb6mp7gp8pl56tReNLU1d9Z55XrSD2qBhdcrIpCoduSc2qrKNTPo
	 uls41fxL4ddlQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-385c2f88618so58521801fa.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 08:15:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtxADZNGzFVv1aV5SfgDYfBAHqgTSc0/Afp0hkFBw79mmdOPbrCCCM0saok7hcGngFyvj8ljxgYi2P@vger.kernel.org
X-Gm-Message-State: AOJu0YyE19vCVKUeV7If1gn6x3VHVmCkkxunmOVqF2ydqEd6HD8KzJ+p
	aO+MeH8D7K+CxsWtyiRpIsfeuc152jwQ2qr2IzZuzxMizfghDguHYOd+Krz3oeJApwz+q2zTNeD
	Jy9wvt4jvYfqchg8uvt3tSXa1v/1g7vg=
X-Received: by 2002:a05:651c:220a:b0:385:ceb0:c330 with SMTP id
 38308e7fff4ca-389a5d18923mr54259111fa.10.1772036103445; Wed, 25 Feb 2026
 08:15:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225160828.1687643-1-wens@kernel.org> <20260225160828.1687643-3-wens@kernel.org>
In-Reply-To: <20260225160828.1687643-3-wens@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Feb 2026 00:14:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
X-Gm-Features: AaiRm53ZqutIuvlJ6sHtPgGw3ES5VmzyMvxfSoLIDy0kWkD4Sx0Tz9nprYnh_c0
Message-ID: <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7028-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.30.169.56:email,mail.gmail.com:mid,0.30.136.104:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.30.163.192:email]
X-Rspamd-Queue-Id: E4CFC19A8DF
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:08=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> The A523 SoC family features an LED controller that is identical to the
> one found on previous SoCs.
>
> Add a device node for it, and one of the possible pinmux settings. This
> setting is used on the Avaota A1.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 09bd149bbf51..b8263e2872af 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
>                                 bias-disable;
>                         };
>
> +                       /omit-if-no-ref/
> +                       ledc_ph_pin: ledc-ph-pin {
> +                               pins =3D "PH19";
> +                               function =3D "ledc";
> +                               allwinner,pinmux =3D <5>;
> +                       };
> +
>                         mmc0_pins: mmc0-pins {
>                                 pins =3D "PF0" ,"PF1", "PF2", "PF3", "PF4=
", "PF5";
>                                 allwinner,pinmux =3D <2>;
> @@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               ledc: led-controller@2008000 {
> +                       compatible =3D "allwinner,sun55i-a523-ledc",
> +                                    "allwinner,sun50i-a100-ledc";
> +                       reg =3D <0x02008000 0x400>;
> +                       interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
> +                       clock-names =3D "bus", "mod";
> +                       resets =3D <&ccu RST_BUS_LEDC>;
> +                       dmas =3D <&dma 42>;
> +                       dma-names =3D "tx";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 ths1: thermal-sensor@2009400 {

I Forgot to rebase this patch before the thermal sensor one in my tree.
I can fix this when applying, so please still review the patch.

ChenYu

>                         compatible =3D "allwinner,sun55i-a523-ths1";
>                         reg =3D <0x02009400 0x400>;
> --
> 2.47.3
>

