Return-Path: <linux-leds+bounces-3034-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4BA9980F1
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 10:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255821F2979B
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 08:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420A91C8FC7;
	Thu, 10 Oct 2024 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zXn9E3Ts"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939A1C8FBD;
	Thu, 10 Oct 2024 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549853; cv=none; b=c+1MZIG30g3kmQzDxE2OEHJmU0euBT8lri4UVvWQOp8Wgvc5aUGgJM6zrEFaL+7bpCG3q8IiCcA4NFhIUXCIXE+oWo1BQvTThpeFmCaBwNbKveqKgNLf5FEWIYR3I5wxOU5BhioLJErzVW8YZnwNqqLfrTuB/S3MC3oxl1wZmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549853; c=relaxed/simple;
	bh=5xx2sKzgepURMFfqi6aRbYvWqvkElOhXxFhGT/E+q+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVeSRC73AniRwhbox6G2LjFokMLsxspxy3PJJgp6vvqwM8GMpDZOSZ2JhBzE7M6VGPu2Wp5fmlfP04rHIFcX4QQDI6xR53E1zb7McQ10ivbVSadQkYClI1f8wfMQT5TptccGDlhtIcJ0j6uypIVPkdatCAuZlwlh0okhOyXNtxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zXn9E3Ts; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X3jEBg7jkWA7DJfKHTHDAHOsaQY1XgeC8tjq7OWdZlU=; b=zXn9E3Ts7NQKLnjeXJiEsx2ul/
	dZCiWwsGQMqRgAhhq1yIzEO8CTeSMxPg0uOHnFblF+mhyqAj8NFRpA/frSOMrs3imqPQmIKIOrhLT
	HEYjhZs50SANJigpHE9r2b0jJd0JuNdbm0/M3J5e6AGOFBSTd4dhZb9xEEybJwwFpXAT/QxB3L+B1
	Vi5CYXEGyQzfX145sJV3bUMax+A4HJZ3+o/ZngJyzyh3YPGTJbBGGwWVTvBxRFMyBNAxQF2xWtcgv
	WlLs7BRqTihufLcltVbn0GoHTNvgfiJJyspa/ceQ8icFfG5uazGgARhKY8M0I16L0Yx4hArCwD0SF
	yxnhk/ew==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1syom5-0001Th-N1; Thu, 10 Oct 2024 10:43:57 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Date: Thu, 10 Oct 2024 10:43:56 +0200
Message-ID: <4386529.ejJDZkT8p0@diego>
In-Reply-To: <20241010083738.GE661995@google.com>
References:
 <20241007205315.2477060-1-heiko@sntech.de> <23688435.6Emhk5qWAg@diego>
 <20241010083738.GE661995@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 10. Oktober 2024, 10:37:38 CEST schrieb Lee Jones:
> On Wed, 09 Oct 2024, Heiko St=FCbner wrote:
>=20
> > Hi Lee,
> >=20
> > Am Mittwoch, 9. Oktober 2024, 16:48:36 CEST schrieb Lee Jones:
> > > On Mon, 07 Oct 2024, Heiko Stuebner wrote:
> > >=20
> > > > Document the "rc-feedback" trigger which is used to control LEDs by
> > > > remote control device activity. This is an existing trigger used in
> > > > existing DTs, document it so validation of those DTs would pass.
> > > >=20
> > > > It was originally introduced into the Linux kernel in 2013 with
> > > > commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc k=
eypresses")
> > > >=20
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > > changes in v2:
> > > > - put the entry in the correct position and comment above it (Pavel)
> > > >=20
> > > >  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/D=
ocumentation/devicetree/bindings/leds/common.yaml
> > > > index bf9a101e4d42..9cd89f30fa7c 100644
> > > > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > > > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > > > @@ -118,6 +118,8 @@ properties:
> > > >              # No trigger assigned to the LED. This is the default =
mode
> > > >              # if trigger is absent
> > > >            - none
> > > > +            # LED indicates remote control feedback
> > > > +          - rc-feedback
> > >=20
> > > Is 'rc' a recognised and well known abbreviation for remote control?
> > >=20
> > > How about we people some (look-up) time and say:
> > >=20
> > >   - remote-control-feedback
> >=20
> > The issue being that this exact trigger rc-feedback is in the kernel for
> > 11 years already - see the commit link in the description, and used in
> > a number of boards in the wild since then.
> >=20
> > So the naming-ship has sailed for a while now, and this change
> > "simply" documents the status quo. And judging from Rob's Ack
> > it looks like he's okay with the naming too.
>=20
> This is why it's important for people to document things when they're
> introduced. :(

I fully agree with you on that :-) .





