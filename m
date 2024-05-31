Return-Path: <linux-leds+bounces-1741-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA68D6108
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093BF1F24AD3
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 11:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B671581F3;
	Fri, 31 May 2024 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="eNSQVIMw";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="oQXCzoNL"
X-Original-To: linux-leds@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B39157A6C;
	Fri, 31 May 2024 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717156528; cv=fail; b=UlNqtztWtQCokVGm17pG4fBbDPCyC/h6/o6lCQvIse7HgCo8DGQ9m+e6LTLqrhIrzwDWjstn+3MsYqPuAGazVpEzHRAwnvKtPhPo4M0icVl7TM9G28Ej8aWTng5lCJNWrp5stYAE4wLTiiAJZi1zmGudBvbI19rfko95GaldgCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717156528; c=relaxed/simple;
	bh=Bd3KZ+yFQSeCtmXYqYm3VH6yU8fRiWgc3mbKerK/UhU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mWRU5mLtfTdpmDaebTwZhg6gu1XiK7Xi4xtrctPrmnr4H0E9teCS/BvRnt21iy1ordXvhTketm0NgrnCRsl5uThaPu64D4+Wg8EY2+Rd1LOsf12aQaOLMlSZtUh6LyXZH5QT5Iw4/heEKUl9ZH+CiqTpWLUGndcJYW46aOcUujQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=eNSQVIMw; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=oQXCzoNL; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 07690480A2E;
	Fri, 31 May 2024 07:55:25 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1717156525;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=Bd3KZ+yFQSeCtmXYqYm3VH6yU8fRiWgc3mbKerK/UhU=;
 b=eNSQVIMwKba7IepHL2th/FwZ/XAvK4Mu2K78TT8lDkCvIFwzw8G4ziIpHBJoQ06JZynSD
 mYGz6Beg5VWZlUtCQ==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1717156525;
	cv=none; b=DQRufJH8RG0EtfdpGLg3OscZNCvXlRob9CHXc58/zcFeIqlGOpDzAUHSrhKzgsQmsVDK87Hux0UqZ07EdKjihtZiDGoaRTlQFlO8gg3bwRG0vVZcxS7oDd9Y489xspb4VXwMNxOH55KyZ4Y1qRx0m+ErY5w3aJWoROmZYagD8KI4Rj6BHqDM3yVw1hGKowvE32CCkOZlGR2gDR5nDU8cefH8T3wVfkRVNI8Pv+UAwc6l78HYJv1gdUDAVU59CLC3ME4B32hf0ReI3+VvoS7pHxHtiisnfCrpnzBIGo9h6VjHPmSuJRCtDSEuZ3cvYnPb67+hXMWYeg4lRhYehbV2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1717156525; c=relaxed/simple;
	bh=Bd3KZ+yFQSeCtmXYqYm3VH6yU8fRiWgc3mbKerK/UhU=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=Ur5FWX81IzOOX/7AMkWfZBbo2GA0zlTYHf2yG8vwwXWGmZSuqO0gYTCs8Bh6Nozz/2fmc7HsUnBvo2KzCo46io7xQ0HGWYSyXPoM55QEj4SnEa9UFMM8FOZDiEQfkHPJfIiT771Zc9ocfG9UvANIGpnWLd9ieLIcfMh2VeUy5nyzn2sE5MgWUr4GD3X38XNMjeygv++lCW/0FfmB7Ad+eY2BK1ZndT8o8L5yzsShmWtLhi3yGzQRm3Di7bOC/MYxCjbWZtHFdEORWoCuns4yBHj3sY7Ulf/kr21ULSgp41Ocpm+9OZY+EYEheTVkiIMIqlPS6dJZxMe+HxG91RAA5Q==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1717156525;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=Bd3KZ+yFQSeCtmXYqYm3VH6yU8fRiWgc3mbKerK/UhU=;
 b=oQXCzoNLpXEAKjmy4+GQ2r0RA7pkqKeTmXo0aLajKdOo1GGUQWVHGDlU5yRsTcSEhOM4L
 t21GgvxgsZ1MqO+V0D56TlmdvrjkHu+mOXDNJMcWhm/oAySHzBXRHUpqRnajW91DCBJrHn6
 j6cNAeuLQdwwNr7RUsTVpuWMUYavCpKBCxehQNjBS4aKwN79bN2etnnE1GXYKkBlGJyeI3Q
 lOzQcck1qtJChwy0pSOCz/2HWSVq7zBPNs6FX3By/s9NKLp2K7FgBjaLZnSTRJrzLQQvCM9
 o/Zyr1KLCDallirjgJzDCLLML1LsKGAiOQXnaOHv/Iwy3dqylbn3w+1/CWvw==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id B69D4280016;
	Fri, 31 May 2024 07:55:25 -0400 (EDT)
Message-ID: <69d0c5f0b237990fd2c7cd88768aa2a70a5ee83a.camel@sapience.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
From: Genes Lists <lists@sapience.com>
To: Hans de Goede <hdegoede@redhat.com>, Linux regressions mailing list
	 <regressions@lists.linux.dev>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	 <lee@kernel.org>, Linux LEDs <linux-leds@vger.kernel.org>, Heiner Kallweit
	 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com,  johanneswueller@gmail.com, "Russell King (Oracle)"
 <linux@armlinux.org.uk>
Date: Fri, 31 May 2024 07:55:25 -0400
In-Reply-To: <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
	 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
	 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
	 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
	 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-Y2OqDd5dYDgI7spdeu7K"
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Y2OqDd5dYDgI7spdeu7K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-05-31 at 11:50 +0200, Hans de Goede wrote:
> Hi,
>=20
> ...

> I actually have been looking at a ledtrig-netdev lockdep warning
> yesterday
> which I believe is the same thing. I'll include the lockdep trace
> below.
>=20
> According to lockdep there indeed is a ABBA (ish) cyclic deadlock
> with
> the rtnl mutex vs led-triggers related locks. I believe that this
> problem
> may be a pre-existing problem but this now actually gets hit in
> kernels >=3D
> 6.9 because of commit 66601a29bb23 ("leds: class: If no default
> trigger is
> given, make hw_control trigger the default trigger"). Before that
> commit
> the "netdev" trigger would not be bound / set as phy LEDs trigger by
> default.
>=20
> +Cc Heiner Kallweit who authored that commit.
>=20
> The netdev trigger typically is not needed because the PHY LEDs are
> typically
> under hw-control and the netdev trigger even tries to leave things
> that way
> so setting it as the active trigger for the LED class device is
> basically
> a no-op. I guess the goal of that commit is correctly have the
> triggers
> file content reflect that the LED is controlled by a netdev and to
> allow
> changing the hw-control mode without the user first needing to set
> netdev
> as trigger before being able to change the mode.
>=20
> But there is a price to this, besides the locking problem this also
> causes the ledtrig-netdev module to load on pretty much everyones
> systems (when build as a module) even though 99.999% of our users
> likely does not need this at all...
>=20
> Given this price and the troubles this is causing I think it might be
> best
> to revert 66601a29bb23. There might still be a locking issue when
> setting
> the trigger to netdev manually (I'll check and follow up) but this
> should
> fix the regression users are hitting since typically users do not set
> the trigger manually.
>=20
> Gene, as the original reporter of this can you do "modinfo
> ledtrig_netdev"
> and if this shows that ledtrig_netdev is a module for you try
> blacklisting
> ledtrig_netdev ?=C2=A0 And if it is not a module can you try building a
> 6.9
> kernel with commit 66601a29bb23 reverted and see if that helps ?

Thank you - I've blacklisted ledtrig_netdev and will report back if
anything interesting happens.

best

gene

>=20
>=20
> Regards,
>=20
> Hans

--=20
Gene


--=-Y2OqDd5dYDgI7spdeu7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZlm6rQAKCRA5BdB0L6Ze
2ztQAP9qMQRR3zWotstYwUJgtGTnC8aBJ+98ER37vLWOQ8tUfwD/YXQxaCPd9Swg
ncFhq3xPmLoOpSikgJb3evYfVsGEzQU=
=tg5T
-----END PGP SIGNATURE-----

--=-Y2OqDd5dYDgI7spdeu7K--

