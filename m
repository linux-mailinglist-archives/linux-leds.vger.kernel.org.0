Return-Path: <linux-leds+bounces-1845-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 438BC8FEF70
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 16:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0773B2A349
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 14:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B14B197A89;
	Thu,  6 Jun 2024 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="gBXE4GSm";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="PXeQp2Zc"
X-Original-To: linux-leds@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A9196434;
	Thu,  6 Jun 2024 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683960; cv=fail; b=U6oV3x38fnr4ThP37cJ756B9FY3zLCrU4bpG2IN9pilBJao+05mlbF1Gu0cWwvy0bzqRz7f7amh0BAWDM46pSCEKoyAU0Rxb79BFb5VlC2YzRkCRK4IEaln3pCCGNt1vZG7jnzM0BuaWEmk1J+hiakqZYaxvmjJoplnyBIJdkMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683960; c=relaxed/simple;
	bh=mC5zzZnXp2icJU9R1Ck47Zcb5SXm4+9y/G4oy4zw/4o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iOfnxiUahlx7EltkrT9zVud5JykEyYY+pPaJQzSa2xRX4/r3EofizAPPdNXliHYe74YoAVjous4THUbbbz0/arepYSBBAqNEPyrLK5vURSPrYoU4yufKc7QB/QHhss/Srup6Ln5uPrQh89E3ISbWdzPqzA9+B6Rkm9aawoUrv4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=gBXE4GSm; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=PXeQp2Zc; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id B5F954809ED;
	Thu, 06 Jun 2024 10:25:50 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1717683950;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=rVcMiogOXnpri50rMG2S8WWLl7pdPRC8qsfAqNvpxeI=;
 b=gBXE4GSmtTnOlS1wQResZR16bqNMNofUVdIKy0cA015CUEl7vykJxVY9zZ/vBcwDLf1SK
 JlJZ5+LvlfYFDFRDA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1717683950;
	cv=none; b=jax5C4gXTO68gBl3s40G8JD+wDJ8CzyTh3YnFkYB0Ll3PGH7FuSydEK6h9x5S1cr/YFlkNjg6PT9B5xnOd58ey8US0SPtO8QyVBGoyd1jQDcVNdwtwpq1avp6IvqarTPRkFBJWsOZJvik4fwVJajqJp3y0rcaltNbTjRQs9ESkyxRx/rtsZ1JcCQS7G8NE0D0Gb7ImOAYkg9x/Z2TONTv17aMU34AQwDCuBD8iAc3JXqr2x5TLolm7pDtC0QUBZN51JbkUwDN5IZm/c3cM8CNHTlRb0od1iVktm9LWA6PHe6l3bwn+2IKo8wv7GN7y/mrSz7vVv2194Yq73fnXpp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1717683950; c=relaxed/simple;
	bh=mC5zzZnXp2icJU9R1Ck47Zcb5SXm4+9y/G4oy4zw/4o=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=JGvqGmU9asc8J8lwdIzlh9/zMm0yAnEpf8ctF/tqNcTcoYbdWOJczGJ1fHytycmDIask/pyBtXJOFSdoZrU8Un+bYFwuP1OaHggwBEYTZIOtM9aXHqJMwyksO53vLPMBM9bJ8w8wqVutoSYAkwtgUfisFZPLKBaxIpgj4LcfJlM6T/oJmwXFzgoHFiuxh/HFMZOXF1tnf4J9PwrE0OewGrTxtGpzEATSPAAl+lcsK2UrjJCojaJfUPjb+h9lyfn36ZggzjZZHDhY6b3S0oebXohmtUgApMlXd2G6e8k0wZ9OcIElah7ZfUIdF/qiFbO/WZgkd9gQuUhFkMQAC4M82A==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1717683950;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=rVcMiogOXnpri50rMG2S8WWLl7pdPRC8qsfAqNvpxeI=;
 b=PXeQp2ZcP6zC6Lmhh7bHKNRDdASx4o0610zv96A9sXId+Z0wqg8mt6uRp3351jLNZ4Myr
 Apz1NRg6KjIFOfiJxiWUpgUgDmDxpMQEbtcRmenSEhbWGNqko4+F9v00c6yEGfNTdcSqxdh
 uoU/IhGCnm2vYWN9Jw3v6LxCUEY+iO+MKQoHdvROhVlDIpaNULEeBkjW6L5Ma9COR+NRFg0
 KIUvqxK+IzETZrKidd811TYV8a0sGvdIhzFJxiMb9AYiuRNDuu3Vnm1dq/OdqPR+C144kTK
 0yoWjat66uXlMUGZy/v2M3GlCFLcUgD90pvd17UOEAUQJAx9bAMaiMdRsSLw==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 8C747280074;
	Thu, 06 Jun 2024 10:25:50 -0400 (EDT)
Message-ID: <d47dcc8b4e429c676db7ad6daf8024a97f725582.camel@sapience.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
From: Genes Lists <lists@sapience.com>
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Hans de
 Goede <hdegoede@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Pavel
 Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Linux LEDs
 <linux-leds@vger.kernel.org>,  Heiner Kallweit <hkallweit1@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, 
 edumazet@google.com, pabeni@redhat.com, johanneswueller@gmail.com, "Russell
 King (Oracle)" <linux@armlinux.org.uk>
Date: Thu, 06 Jun 2024 10:25:49 -0400
In-Reply-To: <20240606063902.776794d4@kernel.org>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
	 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
	 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
	 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
	 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
	 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
	 <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
	 <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
	 <20240606063902.776794d4@kernel.org>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-dCYAK6fKUZBbP2EluySH"
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-dCYAK6fKUZBbP2EluySH
Content-Type: multipart/alternative; boundary="=-4jp6JUlsMS0E8HXI4hn3"

--=-4jp6JUlsMS0E8HXI4hn3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-06 at 06:39 -0700, Jakub Kicinski wrote:
> On Thu, 6 Jun 2024 15:12:54 +0200 Andrew Lunn wrote:
> > > So it has been almost a week and no reply from Heiner. Since this
> > > is
> > > causing real issues for users out there I think a revert of
> > > 66601a29bb23
> > > should be submitted to Linus and then backported to the stable
> > > kernels.
> > > to fix the immediate issue at hand.=C2=A0=20
> >=20
> > Agreed.
>=20
> Please submit..

I assume this deadlock is unrelated to the filesystem stalls reported
here:

=C2=A0
=C2=A0https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811=
.camel@sapience.com/

but thought it best to ask.

thank you.

--=20
Gene


--=-4jp6JUlsMS0E8HXI4hn3
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
</style></head><body><div>On Thu, 2024-06-06 at 06:39 -0700, Jakub Kicinski=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div>On Thu, 6 Jun 2024 15:12:54 +0=
200 Andrew Lunn wrote:<br></div><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div>So it has been almost a week and no reply from Heiner. Sinc=
e this is<br></div><div>causing real issues for users out there I think a r=
evert of 66601a29bb23<br></div><div>should be submitted to Linus and then b=
ackported to the stable kernels.<br></div><div>to fix the immediate issue a=
t hand.&nbsp; <br></div></blockquote><div><br></div><div>Agreed.<br></div><=
/blockquote><div><br></div><div>Please submit..<br></div></blockquote><div>=
<br></div><div>I assume this deadlock is unrelated to the filesystem stalls=
 reported here:</div><div><br></div><div>&nbsp; &nbsp;<a href=3D"https://lo=
re.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811.camel@sapience.=
com/">https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811=
.camel@sapience.com/</a></div><div><br></div><div>but thought it best to as=
k.</div><div><br></div><div>thank you.</div><div><br></div><div><span><pre>=
-- <br></pre><div><span style=3D"background-color: inherit;">Gene</span></d=
iv><div><br></div></span></div></body></html>

--=-4jp6JUlsMS0E8HXI4hn3--

--=-dCYAK6fKUZBbP2EluySH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZmHG7QAKCRA5BdB0L6Ze
25htAP0UvLjW80ObvibjGLL4OKpLvqrtJkkWUoyEsPV7K9YkCQD9FsS4R5lHcbRQ
YKutNthSR6D0eGBP41WSQeY4zXTntQs=
=y8qy
-----END PGP SIGNATURE-----

--=-dCYAK6fKUZBbP2EluySH--

