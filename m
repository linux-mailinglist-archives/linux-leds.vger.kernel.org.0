Return-Path: <linux-leds+bounces-6773-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJSYLLLld2k9mQEAu9opvQ
	(envelope-from <linux-leds+bounces-6773-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 23:07:46 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC978DD54
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 23:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 888C6302A51A
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 22:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D632FFF82;
	Mon, 26 Jan 2026 22:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="AknZKhjt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0B302176
	for <linux-leds@vger.kernel.org>; Mon, 26 Jan 2026 22:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465170; cv=none; b=rXZF76ZlskGH0t53R2zvDvVgsHLUhATT8ldTNSuBxBKGueBt/BQQ0PRc6NidZQAOsMM2oStAvfbJE3c/U5yPJey1xzHSJtIBr3JphK+0zl09REwXCZLlK+MFNpnu5iR0E7wAhtm2AhQdSFCXTzdReE/oTrjvk9dSvfdC5Axmn94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465170; c=relaxed/simple;
	bh=WDtjRprqQlCfRp7q3H/feMqqdUeaQrstyPe0Cmhy42c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFD+VuctSDIi0A2dGFt9fK1nZnX1aKsKuTpriiAis9kgs8uGODCug4u4ofMqNCIm/SU1qsN5JrNmy/Ejk6zQExg10XNVdFaRPC1a45/EOt3m9mFzTI4Focle8RwNmMa1e0AoceBXSFroIs/hEAhl5FUnuBkvMmWuAUx3k3ETNsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=AknZKhjt; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 5A109240103
	for <linux-leds@vger.kernel.org>; Mon, 26 Jan 2026 23:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769465163; bh=sQgDSiHrabsqKjFsQ2ssHDWuOEHo++MGPU/6zXMP/YQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=AknZKhjtPgkjGQIIkaPWlqzNliGmvYqwbgyehIooqi3BGllNxAWZlsATL2+uiKnpg
	 NqEnhgT2IyULq0AFHFhtCqpOJfMlzt+epPBQJezWnZXID4UThvj/9KSRvBP8rz1Mvu
	 1hIjQWbyW065E5xjYeNtJzEPCKE7+5I036F0fuYnvXtFxRu90h4OpWyV2TaCVzndSu
	 QnokWGn46u6XmeeXTof758/AdIx+09QTO1FFZdzbIy+SLaROWWiP4ZoXm16+izT5U9
	 tlXL2vAbXMFoHvFFQHTvx7P1jx/sCfQ47mdDiG9WYcN4GGXtxEg1NU2CcWYyUuMkvM
	 i5x+xD0lPChUw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f0N08112fz9rxL;
	Mon, 26 Jan 2026 23:06:00 +0100 (CET)
Message-ID: <ce454969b83dbb0e3bb4ea78f682603cc328ceb9.camel@posteo.de>
Subject: Re: [PATCH RFC 0/4] leds: extend disk trigger
From: Markus Probst <markus.probst@posteo.de>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Jason Yan <yanaijie@huawei.com>,  "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Pavel Machek	 <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Ian Pilcher <arequipeno@gmail.com>
Date: Mon, 26 Jan 2026 22:06:02 +0000
In-Reply-To: <aXctPaaXFYemV20T@ryzen>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
	 <aXctPaaXFYemV20T@ryzen>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vIBodq2rbp0KWEXSdDUh"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6773-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:mid,posteo.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DC978DD54
X-Rspamd-Action: no action


--=-vIBodq2rbp0KWEXSdDUh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-01-26 at 10:00 +0100, Niklas Cassel wrote:
> Hello Markus,
>=20
> On Fri, Jan 23, 2026 at 07:05:03PM +0000, Markus Probst wrote:
> > Extend the disk trigger
> > - to allow configuration of the blinking delays
> >   and whether the led should be kept on, on idle.
> > - to allow an individual led to be mapped to an ata port
> >=20
> > I would also like to add another patch to this series, only leaving the=
 led
> > on with invert 1 if also at least one disk is present on the ata port.
> > The led would then not only indicate activity, but also if a disk is
> > present.
> > That is why it is an RFC.
> >=20
> > @Damien,Niclas: What would be the most straightforward way of telling
> > the led trigger if at least one disk is present on the ata port and
> > notifing it when this changes?
>=20
> Why do we want to have this in kernel space?
Because there are more than enough devices that could make use of it.

Just search the term "NAS device" and you see rarely any devices for
which this wouldn't be useful.

The only reason the leds work on those devices currently, is because
they get shipped with a custom modified kernel by the manufacturer.
This shouldn't be a requirement for running Linux properly on a NAS
device with disk leds.


> Sure, there is already the very simple ledtrig-disk driver.
>=20
> But I'm not a fan of making the driver more complex.
Do you mean the complexity it would introduce in libata or for the led
trigger itself?

At least with the current patches it looks fairly maintainable.
For instance the pattern led trigger is more complex in my opinion.

In the case of libata and the indication for a presence of a disk, I
would suggest that I implement it first and we can see after I have a
working version if it is acceptable or not.

I am still asking for guidance on checking if at least one disk is
present on a ata port.

> If we want something more complex than what is already there, then it
> is probably much better handled in user space, considering the amount
> of possible configuration options.
A userspace daemon by itself is possible, but I don't think it is the
best solution. Having an indicator for disk activity on a per-disk
basis seems like basic led functionality that should be present in the
kernel.

It is a very minor detail, but I would prefer to have "linux,default-
trigger" set on the led in the fwnode and having the functionality
automatically for every linux system on the hardware, instead of having
to deal with a userspace daemon.
If this is the easiest solution for nas manufacturer to do disk leds,
there is a good chance it getting adopted some day in the future by
those manufacturer and thus making it work out of the box when
switching away from their proprietary os.

>=20
> Basically the same argument as used in:
> https://lore.kernel.org/linux-nvme/20220227234258.24619-1-ematsumiya@suse=
.de/T/#u
If I understood it corretly, the argument there is that led code
shouldn't be present in a fast path.

This does not apply to this scenario.

Thanks
- Markus Probst

>=20
>=20
> Kind regards,
> Niklas

--=-vIBodq2rbp0KWEXSdDUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAml35TcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSe80P/1T6HKGKTekIYWkKd8wU
zOzFPLy2XSJ5xSSlj7w4BhR1gObj2M2Z5gEHFWP2VLmdPXVo1bQFRm3aqzSAVU7G
VnSBH0LEpmByCw0ON3ZtAhAyCtcjtGkc0zd4aLO9sU1iMu82HV0aI01/zR47Y3tv
Ww+uu/IIU3gcMiDO0ozngstSNyBYR1awgiruo0GcVDbjRe1kypI9IPB5ZdB/ND5H
/7Cvxfl2bcjmMYpbaNMNQBt0m3900L0WJx6NbaCuCzdtL63ncvkswGqzonE6u/Gd
M9UikZCbEtMQ14Wy1fQ6n3Pf75GRUeF94s4kYCT/l58DBNG4FTPEdwrrL9jz8NKL
najrcw5eXuQqwcdfSQbl2VTN3cUobnql1E3jW6Ry1RndWJf0gdsHU6k+urliTpP1
GmWEEq/SgKxBdclB4/DlPOS4gLTEdgcu29+In06mDo//N7/27fpt5CInmWMfodvP
YrhTZjsd0hrJ/aEqoK4F/M0g5I2f51BnZoS8xjlGGQK1yrdIVUJZhLJa1r/vgq5j
j4uFv3hBUFZRaNYfi5AF+sDJeX+YsTz2+BwgK46txgGcnkHKV65R0r5pbowrZHui
VKUlEaSuPn+a6UlWBDAnw4Slb04z3BBlrYqkhZJTtwAKAafI/Ai5SAZU51dszBKj
Uk3SvQeMthVUUuYhumVXmtDf
=Dw1T
-----END PGP SIGNATURE-----

--=-vIBodq2rbp0KWEXSdDUh--

