Return-Path: <linux-leds+bounces-4810-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51DADB5F6
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 17:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C61117266A
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 15:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2131D281532;
	Mon, 16 Jun 2025 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFLmI7Gt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566C204598;
	Mon, 16 Jun 2025 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089372; cv=none; b=ALeuKntEPL9fpn0oHBTRryx8iQFbVrm5zIz4uAYqx04OsGj2NIu7SVc4bpO4GvbLYcNcwOC90K6g3z1DggxlbPsbmxmNqxAURjJp4Hm0Bci8o99y2pU2pjrTHur2U2t0jLg42SHoXHB2AO7kpoTXDQmKf2lSxyvAgAU/D4JD5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089372; c=relaxed/simple;
	bh=mU9OiM+dHlMf0GU4b6MoZCfCh5ifOCRbrJW8aAHtwiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl1n7IkICvZnMLNbxCwyrUiUG6jwXBMui27xM1FF5W4INpOBFn363VWvBSgxLKU+a29NTBEMk9us6Tp+sAMyfA7c6G+ym3dQnBeNEJFNdEWK8SmAqe02E5aDHEzqPKxjm9wxQ93emMVYP6IvlhBrW5cdzJ3Lcc1ES9nNiMhujeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFLmI7Gt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169E3C4CEEA;
	Mon, 16 Jun 2025 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089371;
	bh=mU9OiM+dHlMf0GU4b6MoZCfCh5ifOCRbrJW8aAHtwiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFLmI7GtWXXDglXZGPuNxz4yAZL+J5ooAr54qvYj668rrw5ZODze6YcSIj3vgWg2H
	 f3qEqpSWP6ZDKP5jEL0VG0Pmo5JUNkORRSVglCACvr1r2Z/9q+/8cH1uK/cm9NdrJ5
	 tNj4jN86ZDroNBWoptk0iKWe91UJVu5HnizjY7rrUoHXOmChHsTOADQAgguy8Wrdku
	 /a+rCH4mWzLYGs4NDJ1WbhzzPWwSGH3EeF1fA1pHn/GE1RG51aPAriSeZXn2dk4oqM
	 zFOm6g1tFh9yj8jRvw5dsgE8DloQPWFh2tIEYxmogoa3qVtkATCVD2jWZ/4SmhpTRC
	 DQSWNNAFG1Cew==
Date: Mon, 16 Jun 2025 16:56:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Johan Adolfsson <Johan.Adolfsson@axis.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Kernel <Kernel@axis.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Message-ID: <20250616-thigh-ferocity-c8e1d7ee18bb@spud>
References: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
 <20250616-led-fix-v6-2-b9df5b63505d@axis.com>
 <20250616-zealous-scariness-48b47a0818a5@spud>
 <PAWPR02MB9281AC0A179DC8526EA074599B70A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wUXNKxRpr2I5cHcX"
Content-Disposition: inline
In-Reply-To: <PAWPR02MB9281AC0A179DC8526EA074599B70A@PAWPR02MB9281.eurprd02.prod.outlook.com>


--wUXNKxRpr2I5cHcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 03:45:29PM +0000, Johan Adolfsson wrote:
>=20
> ________________________________
> From: Conor Dooley
> Sent: Monday, June 16, 2025 17:03
> To: Johan Adolfsson
> Cc: Lee Jones; Pavel Machek; Rob Herring; Krzysztof Kozlowski; Conor Dool=
ey; Andrew Davis; Jacek Anaszewski; linux-leds@vger.kernel.org; linux-kerne=
l@vger.kernel.org; devicetree@vger.kernel.org; Kernel
> Subject: Re: [PATCH v6 2/2] dt-bindings: leds: lp50xx: Document child reg=
, fix example
>=20
> On Mon, Jun 16, 2025 at 01:25:35PM +0200, Johan Adolfsson wrote:
> > The led child reg node is the index within the bank, document that
> > and update the example accordingly.
> >
> > Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> > ---
> >  .../devicetree/bindings/leds/leds-lp50xx.yaml       | 21 +++++++++++++=
+-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/=
Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> > index 402c25424525..cb450aed718c 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> > @@ -81,7 +81,14 @@ patternProperties:
> >
> >>          properties:
> >>            reg:
> >> -            maxItems: 1
> >> +            items:
> >> +              - minimum: 0
> >> +                maximum: 2
> >> +
> >> +            description:
> >> +              This property denotes the index within the LED bank.
>=20
> >> +              The value will act as the index in the multi_index file=
 to give
> >> +              consistent result independent of devicetree processing =
order.
> >
> >This looks like commentary on the particulars of the driver
> >implementation in linux, which shouldn't be in a binding.
>=20
> Just trying to explain what the reg value actually does (and why).
> Before my patch the bindings were there but no code that handled it.
> If the weird reverse processing order wasn't a thing there would not have=
 been a problem.

That's all driver implementation detail that another OS might not care
about if implemented differently, and is therefore not permitted in the
binding. The text about "index within the LED bank" should be sufficient
to describe how the hardware is configured, no?

> >>          required:
> >>            - reg
> >> @@ -138,18 +145,18 @@ examples:
> >>                  color =3D <LED_COLOR_ID_RGB>;
> >>                  function =3D LED_FUNCTION_STANDBY;
> >>
> >> -                led@3 {
> >> -                    reg =3D <0x3>;
> >> +                led@0 {
> >> +                    reg =3D <0x0>;
> >
> >Do you have any explanation for why these numbers, outside the range you
> >said is valid, were in the binding's example?
>=20
> No idea, the driver hasn't handled the reg property on the led child unti=
l my patch, but
> the property was introduced by this commit:
> commit 3eb229f203c2bc42efbfbafba7f83c8deeca80c9
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Date:   Tue Jun 7 09:52:46 2022 +0200
>=20
>     dt-bindings: leds: lp50xx: correct reg/unit addresses in example
>=20
>     The multi-led node defined address/size cells, so it is intended to h=
ave
>     children with unit addresses.
>=20
>     The second multi-led's reg property defined three LED indexes within =
one
>     reg item, which is not correct - these are three separate items.
>=20
>     Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>     Reviewed-by: Rob Herring <robh@kernel.org>
>     Signed-off-by: Rob Herring <robh@kernel.org>
>     Link: https://lore.kernel.org/r/20220607075247.58048-1-krzysztof.kozl=
owski@linaro.org

Right, so random shite that Krzysztof put in, based on the reg property
in the multi-led parent, to satisfy the tooling. It's worth mentioning
in your commit message that these values you're replacing were
speculative.

> >Additionally, can you mention in the commit message what the source was
> >for the 0-2 range?
> The LED driver chip has banks with 3 outputs each, this is how I have int=
erpreted what the code does.

Please put that in the commit message.


--wUXNKxRpr2I5cHcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA+lgAKCRB4tDGHoIJi
0uBqAQC6/qehwQDwN6OxrgFJHBmMI4FCK5/pb/+LlXstjA2fYgEAyI9i4wtYZAH7
of3GwsDrXzesv2wcVL6D7Hv+92hvIQQ=
=nq9/
-----END PGP SIGNATURE-----

--wUXNKxRpr2I5cHcX--

