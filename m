Return-Path: <linux-leds+bounces-5280-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505BB30593
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 22:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFD01D018D2
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 20:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BBF2FC01A;
	Thu, 21 Aug 2025 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4qGd/TI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886B2FC018;
	Thu, 21 Aug 2025 20:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807229; cv=none; b=JPx219xkxQHmj8pSNTV8ukCXv0bPKb3WJfROVQpBtEgS9YRa1VHOovPu9WZh/47e3iZVVva1uXgngwg91bgqFMuSt2A4Ip4f9AW17Mswz1hVyFIEOoGmx986ExCa7rikTiSrBk0Mt28AgVvFF8SmIN4Pgoczm1kYq/wIRnHPVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807229; c=relaxed/simple;
	bh=s4LoT5n040GO8mBDRhl3vBScJMZhpF+PUxxv6WBk2NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+6pFFsBo1tVJ7s9jmJ2DbpyZGM6lY/r/4mgwIc6bDbbBXXiG1i+UDR9032qgvLfm5VM+FoJcJ7DT83c3fJfRIpdusBAsz9jgHPocBw5o0hACEwSmBSa38TN38xaUyLRgrv7WVPn7UoD7pcgXVpT9Tct0UYrXstZGht40g96jRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4qGd/TI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A24C4CEEB;
	Thu, 21 Aug 2025 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755807229;
	bh=s4LoT5n040GO8mBDRhl3vBScJMZhpF+PUxxv6WBk2NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4qGd/TInaoV8wMobkvYQKcLgGlaSROXY1sGYIJ8Mp2sPVQrLTC/cr+RsdaqVbCsL
	 ZdNgyM67nVycmxa0XHiTBVAmAFjLX7N7VpHUWo8953WOeu7E1637nATfmTG87JqVXk
	 uCLhDPb0PfC3UTm99WADYILDQjQnhz44ANpJSRnM3s6/jGXtrXo1f8klirDofFjRDj
	 MizsCqehEeyygSbPHmswS7GmDEHIp0iku838IKzBfZRg5kFaX70lhbkP8vCP/wzGR4
	 0wJF9oNT1LVDUOmcLSZfZjEUT+D1Y/6u8KgfA6TsnwjEsT/SznDUtCIGuGCfHrXEDJ
	 /UZj86Y0AKrFA==
Date: Thu, 21 Aug 2025 21:13:44 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add fdhisi,
 titanmec, princeton, winrise, wxicore
Message-ID: <20250821-contour-debtor-9e3196a724b9@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-2-jefflessard3@gmail.com>
 <20250820-wired-deserve-421d76bdd1c9@spud>
 <6A80188C-5108-4DE0-9D69-F492FD7E6B8E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBKYytYB9If8rHvK"
Content-Disposition: inline
In-Reply-To: <6A80188C-5108-4DE0-9D69-F492FD7E6B8E@gmail.com>


--gBKYytYB9If8rHvK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 03:35:51PM -0400, Jean-Fran=E7ois Lessard wrote:
> Le 20 ao=FBt 2025 16 h 08 min 01 s HAE, Conor Dooley <conor@kernel.org> a=
 =E9crit=A0:
> >On Wed, Aug 20, 2025 at 12:31:14PM -0400, Jean-Fran=E7ois Lessard wrote:
> >> Add vendor prefixes:
> >> - fdhisi: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
> >> - titanmec: Shenzhen Titan Micro Electronics Co., Ltd.
> >> - princeton: Princeton Technology Corp.
> >> - winrise: Shenzhen Winrise Technology Co., Ltd.
> >> - wxicore: Wuxi i-Core Electronics Co., Ltd.
> >>=20
> >> The titanmec prefix is based on the company's domain name titanmec.com.
> >> The remaining prefixes are based on company names, as these manufactur=
ers either
> >> lack active .com domains or their .com domains are occupied by unrelat=
ed
> >> businesses.
> >>=20
> >> The fdhisi and titanmec prefixes were originally identified by Andreas=
 F=E4rber.
> >>=20
> >> CC: Andreas F=E4rber <afaerber@suse.de>
> >> Signed-off-by: Jean-Fran=E7ois Lessard <jefflessard3@gmail.com>
> >
> >Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your acknowledgement, I will include it in the v4 submission.
>=20
> >but some reason why all these are being added together would be nice.
>=20
> Do you mean repeating this cover letter v3 changelog note in this patch:
>=20
> v3:
> - Update vendor prefixes with documented rationale, in a single patch,
>   per maintainer feedback
>=20
> See https://lore.kernel.org/linux-devicetree/491ec8dd-8ca5-45bb-b5f4-dfd0=
8a10e8de@kernel.org/#t
>=20
> Or do you mean the relationship between these vendors being added here,
> such as replacing the fist line of the commit message to:

Ye, this. The relation between the vendors.

>=20
> Add vendor prefixes of chip manufacturers supported by the TM16xx 7-segme=
nt
> LED matrix display controllers driver:
> - fdhisi...
>=20
> >
> >> ---
> ...
>=20
> Best regards,
> Jean-Francois Lessard
>=20

--gBKYytYB9If8rHvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKd9+AAKCRB4tDGHoIJi
0oawAPjutDyPXVFQQwndSwRYNAjcjoQRbOfjt2m0woyD9CDSAP9scbZElO/+AT2H
knUNeoPzE+TlKap9gRIwJmVsIKiBDQ==
=Qlhc
-----END PGP SIGNATURE-----

--gBKYytYB9If8rHvK--

