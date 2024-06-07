Return-Path: <linux-leds+bounces-1861-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691990021E
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 13:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C1301F22FFF
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 11:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B9A18734D;
	Fri,  7 Jun 2024 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="22HMwv2Z";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="ZWSVITiv"
X-Original-To: linux-leds@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1B188CA3;
	Fri,  7 Jun 2024 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759682; cv=fail; b=b9JIdWtdCTjgjIqdEtF9h7ApREs7793aIkvow3GPdNMtYiP5wmYgRAD2QNwGTwsELXG0wY2wRWcB6k5nDwdUhHZWbEt6B/uYj9nXo4JqzJ1xcSB04haRVlx06ZtJ2uUvpc5qtYfe+Pml8D26VY27CgUQ/7GTvwxb606CN1qDahE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759682; c=relaxed/simple;
	bh=dblTa42IpvIitENUZN1OtllmqNragMIUFkjFKngjdJw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njfB0pEHtpCga8KAdYPYkratJ1w8g65upngEOfBE/8hpAflyTrrbnyZiXmjpNduJpmMkxw9f7LGI+uEBk/gA8ZTUJ9SFc9XJIxeqDjcY/aHZ9N1AtLvdFosLmZc81hc4VikhqsZQGf4EKLCrokQPoPk+jUaGUeW+XApge1Q0jGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=22HMwv2Z; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=ZWSVITiv; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id C0BF84809FC;
	Fri, 07 Jun 2024 07:27:59 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1717759679;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=dtKkTMu2YNJ6SulUcAidCrEhbZlElQTGzjsPqxwR8OM=;
 b=22HMwv2ZL4xIuzqF57wghSJZVnyvXN3ElD1nKVLZfx+8W39gUV7HsxczWMo/PMJTkb+Nc
 eT8YSR+A4FUoyvkCA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1717759679;
	cv=none; b=Sf99og6UuUcfz35Ve2/nRPMuDiUfv4XvQiHejCkiBot6inS9l4AfhlRRE61Jv7Z2nS482qLcJh3ehfGkwH8Al7bSIfjXwr8dSTnw/DOwAEG8IQ9qXxQb+cxqvYJsOss/GqROwcPZk1EiwCbfqr2mYjzBGDw+/PoOVuSOtLrxb+zF+9l0/OQ2ectqWVsWJGToira1Y4Wn80RHf6PIMKEUx5jotZ8nBZB/URaU54sXWGPe9d11tH2+pvXrVnmn2uv/P9t0O54NNYLkKrTDaCGktscHgE1QwtjqnWeCdVYgkcFPKmuhKLSTvBwRaqlImHrc+IPjFow950spv6WSlYgcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1717759679; c=relaxed/simple;
	bh=dblTa42IpvIitENUZN1OtllmqNragMIUFkjFKngjdJw=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=fwTmNMSHxmTqBhMipqczrFKZCiLfb2z+75UpqJUNajT/MnIhRkD20chGAKYbL+QHox0Xfplpox8LQKzO1ZyMh8MJ6iByxdRJ/g+HSC5pax87PHeF5kaFtwGCtC+cT2Ijne57WVRozG30c09NqM5gHmI/1pB60zD5SyHLVLAKch3EOTHnnf08TfLqrOpSLX/m68nzqjlwK66jt9R8oOsiiclVHxeFHnVcBiAPbF7H5qz5k7A99VedZsjMehGRb1viFYjmz5f+EiMe+Z3YcN7ovy2MTNokFEYY128y1va8YWIiYR5jVZuv/uJh7iHJm2+g+sd/ULGRNlWw0robuOQU/w==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1717759679;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=dtKkTMu2YNJ6SulUcAidCrEhbZlElQTGzjsPqxwR8OM=;
 b=ZWSVITivfNPC/BYgdMRxk5sK+/mObojyf6bExfFhsxhN+Efs5jb8IDlPl8qXpeud06gd1
 ZGHQig3fw08+Wj5qQB2xsLai+Y/mpLkN7qXlzO1swbO64pjxyQMzxBj1A/QVXdEsssjE92j
 VVQV+35KJ7BrI5j3qSS6W60eoB2z8VOHwwtYM8FocqjGSFwBnU1X/tQJKVAGDaPgyr4bCH3
 /8C8soWWUuDDR/HPpIHoYl86UiM2kVAN1HNqa2Hfh3oAEbxAxPUHuiOTBqaSJkdHNfMiHyS
 S2V87yta9FDnwFCdtkgE4ngTMhODgThDmd89TqEufKePOdPvcH0IsqKvzGUA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 8331128001B;
	Fri, 07 Jun 2024 07:27:59 -0400 (EDT)
Message-ID: <71291bd2c1f84bba5c982e8dd43f7ef9788d47da.camel@sapience.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
From: Genes Lists <lists@sapience.com>
To: Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Pavel
 Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Linux LEDs
 <linux-leds@vger.kernel.org>,  Heiner Kallweit <hkallweit1@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, 
 edumazet@google.com, pabeni@redhat.com, johanneswueller@gmail.com, "Russell
 King (Oracle)" <linux@armlinux.org.uk>
Date: Fri, 07 Jun 2024 07:27:58 -0400
In-Reply-To: <dfb48278-8b7b-401d-ae8e-579d80e3c258@redhat.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
	 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
	 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
	 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
	 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
	 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
	 <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
	 <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
	 <20240606063902.776794d4@kernel.org>
	 <d47dcc8b4e429c676db7ad6daf8024a97f725582.camel@sapience.com>
	 <dfb48278-8b7b-401d-ae8e-579d80e3c258@redhat.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-a3IqHdecIs3K0XjA7nu8"
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-a3IqHdecIs3K0XjA7nu8
Content-Type: multipart/alternative; boundary="=-TaTTrkvOW/DIEU0kB5mr"

--=-TaTTrkvOW/DIEU0kB5mr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-06-07 at 12:22 +0200, Hans de Goede wrote:
> Hi Gene,

...

> >=20
> > =C2=A0
> > =C2=A0https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045e=
b811.camel@sapience.com/
> > =C2=A0<
> > https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811.c=
amel@sapience.com/
> > >
>=20
> Right that one is unrelated, but the revert which I just submitted
> should
> fix your other report:
>=20
> https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.came=
l@sapience.com/

Very much appreciated thank you.

>=20
> I believe you have already worked around that one by blacklisting
> the ledtrig-netdev module.

Correct.

>=20

Thank you very much.




--=20
Gene


--=-TaTTrkvOW/DIEU0kB5mr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Fri, 2024-06-07 at 12:22 +0200, Hans de Goede =
wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-le=
ft:2px #729fcf solid;padding-left:1ex"><div>Hi Gene,</div></blockquote><div=
><br></div><div>...</div><div><br></div><blockquote type=3D"cite" style=3D"=
margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><div><br></div><div>&nbsp; &nbsp;<a href=3D"https://lore=
.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811.camel@sapience.co=
m/">https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811.c=
amel@sapience.com/</a>&nbsp;&lt;<a href=3D"https://lore.kernel.org/lkml/da8=
710eddca32677cf3c195000416121045eb811.camel@sapience.com/">https://lore.ker=
nel.org/lkml/da8710eddca32677cf3c195000416121045eb811.camel@sapience.com/</=
a>&gt;<br></div></blockquote><div><br></div><div>Right that one is unrelate=
d, but the revert which I just submitted should<br></div><div>fix your othe=
r report:<br></div><div><br></div><div><a href=3D"https://lore.kernel.org/a=
ll/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/">https://lo=
re.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.c=
om/</a><br></div></blockquote><div><br></div><div><div>Very much appreciate=
d thank you.</div></div><div><br></div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><br>=
</div><div>I believe you have already worked around that one by blacklistin=
g<br></div><div>the ledtrig-netdev module.<br></div></blockquote><div><br><=
/div><div>Correct.</div><div><br></div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><br>=
</div></blockquote><div><br></div><div>Thank you very much.</div><div><br><=
/div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex"></blockquote><div><br></div>=
<div><span><pre>-- <br></pre><div><span style=3D"background-color: inherit;=
">Gene</span></div><div><br></div></span></div></body></html>

--=-TaTTrkvOW/DIEU0kB5mr--

--=-a3IqHdecIs3K0XjA7nu8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZmLuvgAKCRA5BdB0L6Ze
22s0AQCqSuX6runmqFR2UrYKTI9hxgqERghwlmSQSF3i7Bo9rAEAttms+bDx9oEw
Xzir1YPVCMN5ynSvijRjr1Znn8pA6AE=
=dp6J
-----END PGP SIGNATURE-----

--=-a3IqHdecIs3K0XjA7nu8--

