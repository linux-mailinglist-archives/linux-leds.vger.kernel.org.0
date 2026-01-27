Return-Path: <linux-leds+bounces-6776-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJLgMIHfeGkGtwEAu9opvQ
	(envelope-from <linux-leds+bounces-6776-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 27 Jan 2026 16:53:37 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B219725F
	for <lists+linux-leds@lfdr.de>; Tue, 27 Jan 2026 16:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 041353096CAB
	for <lists+linux-leds@lfdr.de>; Tue, 27 Jan 2026 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D51303C86;
	Tue, 27 Jan 2026 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="YrDjqjod"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006552FFFAB
	for <linux-leds@vger.kernel.org>; Tue, 27 Jan 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528063; cv=none; b=A6lmNyUh2lwLBri6qHlfobVaElgZNkLvO0t8zs+JFil4CLbdC9MsOXtn5ygFTNjIc2ur5NwzrxtxJcK6sxbtBDitT+sv1FRQiWKMwhMFhp56fGc3ZwtX1OvtvWStPJ/CavPfBdlDvI9Keg3DSUVkJoORinsVjwbDa3eg16IG80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528063; c=relaxed/simple;
	bh=DQ2F9P8gXel5sqSxKC7vJrPwpNY2sFgwvFDvzLpmLHk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AnVlN3zQDZuASlRJW+A9s9pWSoEZdOFcfoh+wZOlpAlSidiDnuFNfcJkUlOIYdcGIBaa0GLOEKqYTjALgp3pEOpbR3LCcsbEh796a44UdkaXloSp7jTeAxugPOLj7OoAFjPIdKXTIzFod6K5SS3Hj1PrrvtwJYh+wVprm4Ort9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=YrDjqjod; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 50182240104
	for <linux-leds@vger.kernel.org>; Tue, 27 Jan 2026 16:34:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769528052; bh=DQ2F9P8gXel5sqSxKC7vJrPwpNY2sFgwvFDvzLpmLHk=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=YrDjqjodyTN2o1jhx3pYdrRv4p1dpea4aVqvN3P6yD10/jlRfBL1QgA0CAzwttAIU
	 VcsgjRBKH1nFKRVh0eTwW+uEYAjRbtD8+ZgC/29Q2QJHTeUtA2KE/xVE9l/t8A++NS
	 /ymidxlXfweavFOuK8QrjfYGxYqbiZ979htB+VC8aY+iryVkw3+TL8b3cgx1NrpOdl
	 ERP9wl6siAM200TuzFUBuHZc9jmcP2Ja2cm3pZuwBqkaqDNKLNlep4FQgmZ8XytzGe
	 anF6dqRRSK9T1i7kUVG3aqsitbAPw2W+TosT0doxaVZgXiPQsMDGeoR/gPE5xAVpyj
	 AnTiIOSvVQeuQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f0qFY3Lk8z9rxN;
	Tue, 27 Jan 2026 16:34:09 +0100 (CET)
Message-ID: <20f855baaa7c36010eab9997a2f43b4f62be726b.camel@posteo.de>
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
Date: Tue, 27 Jan 2026 15:34:11 +0000
In-Reply-To: <aXiGNZm12vLhQJ4Q@fedora>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
	 <aXctPaaXFYemV20T@ryzen>
	 <ce454969b83dbb0e3bb4ea78f682603cc328ceb9.camel@posteo.de>
	 <aXiGNZm12vLhQJ4Q@fedora>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-95wXs24+lMxxeIwklhSG"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6776-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:mid,posteo.de:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,die.net:url]
X-Rspamd-Queue-Id: 85B219725F
X-Rspamd-Action: no action


--=-95wXs24+lMxxeIwklhSG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-01-27 at 10:32 +0100, Niklas Cassel wrote:
> On Mon, Jan 26, 2026 at 10:06:02PM +0000, Markus Probst wrote:
> > On Mon, 2026-01-26 at 10:00 +0100, Niklas Cassel wrote:
> > >=20
> > > Why do we want to have this in kernel space?
> > Because there are more than enough devices that could make use of it.
> >=20
> > Just search the term "NAS device" and you see rarely any devices for
> > which this wouldn't be useful.
> >=20
> > The only reason the leds work on those devices currently, is because
> > they get shipped with a custom modified kernel by the manufacturer.
> > This shouldn't be a requirement for running Linux properly on a NAS
> > device with disk leds.
>=20
> I understand why you want the feature. I just don't understand why we
> should add this feature to the kernel, rather than implement it in
> user space.
>=20
> Having a user space implementation for your feature would also allow
> an upstream kernel, without the need for any custom kernel patches.
Only because it can be done in userspace, doesn't mean it should be.
>=20
> > > If we want something more complex than what is already there, then it
> > > is probably much better handled in user space, considering the amount
> > > of possible configuration options.
> > A userspace daemon by itself is possible, but I don't think it is the
> > best solution. Having an indicator for disk activity on a per-disk
> > basis seems like basic led functionality that should be present in the
> > kernel.
>=20
> There seems to be existing user space applications that handles this,
> I think both the daemon I linked to before, which uses /sys/block/<dev>/s=
tat
> which is thus per device and not per port, and e.g. this:
> https://linux.die.net/man/8/ledmon
> https://github.com/md-raid-utilities/ledmon
> https://github.com/md-raid-utilities/ledmon/blob/main/src/lib/ahci.c
As far as I can tell, this daemon doesn't actually use the LED
Subsystem, but instead leds directly connected to the storage
controller.
But yes, I would be capable of coding such daemon.

> > > Basically the same argument as used in:
> > > https://lore.kernel.org/linux-nvme/20220227234258.24619-1-ematsumiya@=
suse.de/T/#u
> > If I understood it corretly, the argument there is that led code
> > shouldn't be present in a fast path.
> >=20
> > This does not apply to this scenario.
>=20
> I think my main concern is that I don't think we should bloat the kernel
> for a complex feature that can just as well be implemented in user space.
It is still unclear to me if you worry about the complexity in
drivers/ata/libata-* or drivers/leds/trigger/ledtrig-disk.c

@Pavel,@Lee: I would like to know your opinion on this.

Thanks
- Markus Probst

>=20
>=20
> Kind regards,
> Niklas

--=-95wXs24+lMxxeIwklhSG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAml42uAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSj0QP/jBX+51lTUOAQlHdCXB1
cnq3yWDlRE7864F+m33J5Zi3YXSdntJ5rza26ByMmx8liyHJMD5UDdGfz9L93sHM
TSv4OClvl/xZ6gFRvaFPqBIL38erO9osMuwKsFVzdA3wwHWKeQWl2ZO3IWSiyRxn
xy1U+Zxr6LxQlMENbKfTPmCyo1l6visyMouSYqV2ysJ9p+D1n9I81rvrBZYm1ebt
EcPJiWGPzzgsA84NR13qKBjJFmelzJyiF48cYOGM5C1mlE3FjYjiVsyJe4h9FGsu
d1kbovKMCuY+QAvtRnbFCeth2o8g6ky3Ij8OPIROhrH2NnA+w/INS8Ok92P8Ewvm
CfGMkYVq8KXVhEaEaQRw9yWzLLKAquuLRFQ9oUUF3I3b6hEW4ALJkfWraWOPHA6/
i9gx32NO2Pjo6urNcVBGTIAHUQnKwgsmtpCCX2YsF9/j/Vkq6KWmvxuO9eH2tu49
fbEaehSqRlQnC7Q6ERVb2X4UaQYutytRAIJSloPLbmve44c7dE+kjSS460QY69FC
Z8hKNL3H8UPSZFqeKGg77X94FYK8Hepd6ccQ0zEYhtLihVNEBC/Jdf5EIY17K4bN
Es0E5bqHZMVAIr62ZxqmUdNI6gmnqxlV32OTp8s4BbpJiSoUbrp7JuUqI98rUdKr
ELLweuctc6nLul+zl/4Nl71I
=G8+8
-----END PGP SIGNATURE-----

--=-95wXs24+lMxxeIwklhSG--

