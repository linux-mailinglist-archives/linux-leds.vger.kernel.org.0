Return-Path: <linux-leds+bounces-5255-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCAB2DA30
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 12:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 550411C4679D
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 10:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E552E2DF0;
	Wed, 20 Aug 2025 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="O8I9Ir9g"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C22E2DDD
	for <linux-leds@vger.kernel.org>; Wed, 20 Aug 2025 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686275; cv=none; b=cglvMv5qFgpOGXixqbsm8a/XirfcqqkPRJcPMx6WAVYy+A9bXTR7ua2xLaRwf/Au1YXgiSSjg7rcr7Gjh8cHitAehc11nHdfQ/hdICBhVU3pCnnr59xfYhb2lto5qYd53BHPmIG8+YaySMHEVCZfveXHXcCcuuFFvhFDzpO7Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686275; c=relaxed/simple;
	bh=3CpKgxRpCYawooW49w6wb+ri8TL4dLwEPi6doAWrbfs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=KdoqWEDZ2AM9pyoN8vK6mOEGVa6DUu+4JAvuLswaagwPaAJjrjMfAjOteWm2jMAB9drFPvBFX/1XUhrSOcK2Bj3S/ETyezyS1/XS5QfvTknto0ZecBAJ6XKKPbTTUEtAKo6vTvF8svzjsrTxIac6nZtF5XhLb9XXYV3etivvD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=O8I9Ir9g; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755686270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LR7oamsLXiIEp2PWmQM+Y8/7Bo4DrxhgzvH8C2oVFno=;
	b=O8I9Ir9gH5qd+hA7zlVyuHursR2TU0TquTG3CH6W8Da655CBQGQf8IJ2gZBBp4lhxqSmnU
	kgaViDUqKxtRmX+ltQ/vfSkdZAPaJEOymgYqztV0eySs+IwF32Lh03GE00qA6oSYtEzXtp
	KBqrHFG5g3PjXCWryY/KuaEnheFpVCgB5mcQlyMDDSLOvNIilKorJQ67Scmr1ouP6ShJVF
	mn/zsHP5dzEjvz2wKEa8fRSTh4gI8D/b5P08Sqvxk1nV6jc82QP1VPYZnTUZyhonA9tGBm
	YDHIDf9NkD5srFSy0dckRleBON/Y5c1BPvqTQ9vQWpVa7gUnlq7en9Et5hCBJg==
Content-Type: multipart/signed;
 boundary=1d9ff9570717d375168b9ca28d86c87a4db6edce1af1be67cd4ffe114401;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 20 Aug 2025 12:37:38 +0200
Message-Id: <DC76U4GVR0O2.1HXLEPCF8BG02@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jacek Anaszewski"
 <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: leds: Clearly mark label property as
 deprecated
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250815104805.405009-1-didi.debian@cknow.org>
 <b30905fa-6bd1-47dd-8371-f609d418387b@kernel.org>
 <DC2ZLORG11W0.1CS78L6F2OV4Q@cknow.org>
 <20250820-hairy-economic-wildebeest-ba25a1@kuoka>
In-Reply-To: <20250820-hairy-economic-wildebeest-ba25a1@kuoka>
X-Migadu-Flow: FLOW_OUT

--1d9ff9570717d375168b9ca28d86c87a4db6edce1af1be67cd4ffe114401
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Aug 20, 2025 at 10:14 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Aug 15, 2025 at 02:06:49PM +0200, Diederik de Haas wrote:
>> On Fri Aug 15, 2025 at 1:00 PM CEST, Krzysztof Kozlowski wrote:
>> > On 15/08/2025 12:47, Diederik de Haas wrote:
>> >> The text description already mentioned the label property was
>> >> deprecated, but using the 'deprecated' property makes is clearer and
>> >> more explicit.
>> >>=20
>> >> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>> >> ---
>> >>  Documentation/devicetree/bindings/leds/common.yaml | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>=20
>> >
>> > Please first read previous discussions:
>>=20
>> [I reversed the order of the links so the oldest is first]
>>=20
>> > https://lore.kernel.org/all/20221122111124.6828-1-cniedermaier@dh-elec=
tronics.com/
>>=20
>> Rob: "They ['function' and 'label'] serve 2 different purposes."
>>=20
>> > https://lore.kernel.org/all/20240509110545.49889-1-linux@fw-web.de/
>>=20
>> Krzysztof: "I don't think there was conclusion to make it deprecated on
>> last attempt"
>>=20
>> I agree.
>> What I don't understand: Why wasn't the text updated to correct the
>> incorrect statement about deprecation (that's how I interpret it now)?
>> Or some other conclusion being made and that that will be reflected in
>> the text and/or a deprecated property.
>>=20
>> Otherwise the confusion remains and then it's just a matter of time
>> before a 4th person comes along proposing the same patch.
>> And possibly even more harmful: people use it incorrectly.
>
> Whatever change you want to do here, I expect to address one way or
> another these previous discussions. If the code is confusing, refine the
> description. But not in a way which ignored previous feedbacks.

I'm not going to make a change.

I thought I would be making (more) explicit what the binding says.
Apparently I read/interpreted it incorrectly. What I described above is
how I currently interpret the *confusion* text/discussion. Is that
correct? I have no idea. That I'm at least the 3rd person proposing this
change indicates I'm not the only one who is confused.

IMO it's up to a/the maintainer to make a decision and that should then
be reflected in the binding, which should fix any confusion.

I hadn't looked at the code yet, but *I*IUC the code should follow the
binding, not the other way around. That's how I have interpreted
(mostly your) comments related to various binding patches ever since I
started actively following upstream(ing) work. Which (again) may be an
incorrect interpretation.

Regards,
  Diederik

--1d9ff9570717d375168b9ca28d86c87a4db6edce1af1be67cd4ffe114401
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaKWldwAKCRDXblvOeH7b
btBmAQD1JHjz6wVqq6gTPmRfqgFiNxJqJCcz46DN0b+ZxQsbxAEArC+y6rxDn6tN
msQRrdwHK3Ic9gU5uPGEpj5/vERYRwU=
=tljW
-----END PGP SIGNATURE-----

--1d9ff9570717d375168b9ca28d86c87a4db6edce1af1be67cd4ffe114401--

