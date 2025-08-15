Return-Path: <linux-leds+bounces-5226-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1180B27FB2
	for <lists+linux-leds@lfdr.de>; Fri, 15 Aug 2025 14:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E54A2759B
	for <lists+linux-leds@lfdr.de>; Fri, 15 Aug 2025 12:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49137278157;
	Fri, 15 Aug 2025 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="obpPn8MQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0691A9FB0
	for <linux-leds@vger.kernel.org>; Fri, 15 Aug 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755259646; cv=none; b=C0F0g6Z6rAHD7S5rNeEbDDyzylhi4iCSDAsfUCmYRGjUSxS4/fQni3TwT5ojpDb6N+wCoaXlWevL5j/CkykOetm+xGHdbo79CpJ14xtHev3+2gMazuamckTuUKphhquQsm/X9bA8ZQ/8tTrVaWUM0PKtemgyZtAqp9wU48ScYOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755259646; c=relaxed/simple;
	bh=d7mLkx2zmfajtsD8tZE+IyUM91Hth/Nqpv1oIfjVVHE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=rZmKcxOQNV6/vm/jAAjfGbzhfj6/WkyspngcL72kiEN0t+PKJdxyxTujEP4Bbmps1QPEIlOhUK0TjXI8bAjg4vJM1khyt0QzZFRLRtiJuawzm8ss44cWRi3rdWDen40zDYx/vSPEgnbyIxTK0MoFAHtgP1wZ8Gkg6paGvEkWRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=obpPn8MQ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755259632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S1snjcKnr5T+gZaU0t/7csMoaxio2O5nUXuj8A3C7QA=;
	b=obpPn8MQaE6sEdep1Ia26ok2jP1igFkswh5NXhZgsIanDEcTwThXpGlEMMPSaTT+CGYP/t
	/M+yOmjHMlDJbTfcTKnZKuntmX8kH707C+2MHeoi/kkI2KECDn7E/bJaXxQ9Ivbv2w5Eyr
	JnDtDhjtP7iu5QIpL5TxkJ3cjuR/ZiY6wqtRwKtza77rNlliSC4PErDNS1IjBLPdmcu+e0
	8wNP7N3rWxVHBPRR1J+PuFQe9tuO2NcDq7SFRYCVs0NaC2X1In0rLqbOyfN4XDWq3Ar/CP
	ZRTBl6G3hY8XCXXzoiHvnIhk7T7DMIU7eFRLvRNs2fYjEiWBZVJUke/+tPvDGQ==
Content-Type: multipart/signed;
 boundary=8624ee546faf8c26b2a96c7cf02ab2c1b94682b15dc888f8a0edb7954318;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 15 Aug 2025 14:06:49 +0200
Message-Id: <DC2ZLORG11W0.1CS78L6F2OV4Q@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: "Jacek Anaszewski" <jacek.anaszewski@gmail.com>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: leds: Clearly mark label property as
 deprecated
References: <20250815104805.405009-1-didi.debian@cknow.org>
 <b30905fa-6bd1-47dd-8371-f609d418387b@kernel.org>
In-Reply-To: <b30905fa-6bd1-47dd-8371-f609d418387b@kernel.org>
X-Migadu-Flow: FLOW_OUT

--8624ee546faf8c26b2a96c7cf02ab2c1b94682b15dc888f8a0edb7954318
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 15, 2025 at 1:00 PM CEST, Krzysztof Kozlowski wrote:
> On 15/08/2025 12:47, Diederik de Haas wrote:
>> The text description already mentioned the label property was
>> deprecated, but using the 'deprecated' property makes is clearer and
>> more explicit.
>>=20
>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>> ---
>>  Documentation/devicetree/bindings/leds/common.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>
> Please first read previous discussions:

[I reversed the order of the links so the oldest is first]

> https://lore.kernel.org/all/20221122111124.6828-1-cniedermaier@dh-electro=
nics.com/

Rob: "They ['function' and 'label'] serve 2 different purposes."

> https://lore.kernel.org/all/20240509110545.49889-1-linux@fw-web.de/

Krzysztof: "I don't think there was conclusion to make it deprecated on
last attempt"

I agree.
What I don't understand: Why wasn't the text updated to correct the
incorrect statement about deprecation (that's how I interpret it now)?
Or some other conclusion being made and that that will be reflected in
the text and/or a deprecated property.

Otherwise the confusion remains and then it's just a matter of time
before a 4th person comes along proposing the same patch.
And possibly even more harmful: people use it incorrectly.

There's also this line:
"function-enumerator has no effect when this property is present."

if that is true, and I would assume so as that's what the binding says,
then I messed up even bigger then I already think I did in commit
1631cbdb8089 ("arm64: dts: rockchip: Improve LED config for NanoPi R5S")
resulting in commit
912b1f2a796e ("arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S=
")

... but I'd have expected that to be pointed out in the review.

I can understand that function-enumerator is used in an automatically
generated label when a label doesn't exist, but I'm inclined to think
the same "They serve 2 different purposes" applies here too.

Cheers,
  Diederik

--8624ee546faf8c26b2a96c7cf02ab2c1b94682b15dc888f8a0edb7954318
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJ8i5gAKCRDXblvOeH7b
blHPAP47IybHAz/ehXhdDv8uUzgLK6trTHIF4sa580pxeE3YkQD+IT7PvgXPS4r7
s6gjTNa7I7J78T4OjK79J1SWdXcrgQg=
=JWsI
-----END PGP SIGNATURE-----

--8624ee546faf8c26b2a96c7cf02ab2c1b94682b15dc888f8a0edb7954318--

