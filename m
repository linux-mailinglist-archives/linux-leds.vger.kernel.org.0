Return-Path: <linux-leds+bounces-6782-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKeWGxYzeml+4gEAu9opvQ
	(envelope-from <linux-leds+bounces-6782-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 17:02:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A7A4F79
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 17:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF4AB304ABD5
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 15:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF8930BF60;
	Wed, 28 Jan 2026 15:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="fxW3ezFZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68724301012
	for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615069; cv=none; b=So/g4FGQjm2EELMRlSI/FDvyecya9R2kKfZhMsmVQ7NE5h3TBC+y2guNCeeIAqPguIl9C1lcTzeTZOrlnQiGvFkNxi/KSRV3EYSbqMCpJ6xkhs/athcrZpSt5/oL/pfpqSsiWau9FMt0h+IHXOak9/2a/7DTJ74PY9V9VCPQRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615069; c=relaxed/simple;
	bh=BD3at9pjwcauOnkQ9bbwkuD9iYFLAFoZUI6i5XrE3eo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R5cb/2ewuPqkRe/st0viMoHywBHQw6mFXLcSXibwD1K17SdtddlGSzNff1O0XRHz2kL71K8WeNy/JKDSrRoOQQtsn5TU1UBXIeFOODl49NMYiZ3T1Tbt6MuYVU8q06XCbK/zWfSAE7ZVgn6fNmGzNgD4nWRysxze6ZM/nig1yfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=fxW3ezFZ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9AE1F240101
	for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 16:44:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769615060; bh=BD3at9pjwcauOnkQ9bbwkuD9iYFLAFoZUI6i5XrE3eo=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=fxW3ezFZiXgu/hUWecf1YYWjh8IrOEe7Ldko2XR6uJwIUGNBDGTescpuZWFQ14fy1
	 qG8vE2adzo0cexwaiBBno+u2XUGfdMR/MYm/82/QGhF+0ANazhASHlM2agnVTxw9ze
	 UJlaXUEU/pLHk/27L4CiGg5hCLtTcqjAD8X0smEmZ38bATG1fHAWHIpHi3gQBCPFGI
	 2Ew8cD7mwhL9wo0GhvOXnWFpmUhdwMyBvJrQfZ8/ArFm6r+wjTyIw5sbwadbICtY0i
	 +BrxojuI56vF8NIbbqZc0g7mh09QqdLAZnpoOwwZSidvhTs0bMpZ0kVvE7Y+ja+sUY
	 weLyjLLftysVg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f1RQn6TJRz9rxG;
	Wed, 28 Jan 2026 16:44:17 +0100 (CET)
Message-ID: <c34fb5404e7033fe719b0072ea8a87a1caa2bf80.camel@posteo.de>
Subject: Re: [PATCH RFC 0/4] leds: extend disk trigger
From: Markus Probst <markus.probst@posteo.de>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, John
 Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>, "James
 E.J. Bottomley"	 <James.Bottomley@hansenpartnership.com>, "Martin K.
 Petersen"	 <martin.petersen@oracle.com>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Ian Pilcher <arequipeno@gmail.com>
Date: Wed, 28 Jan 2026 15:44:19 +0000
In-Reply-To: <2382dee0-983f-4c69-af7b-a7a48cad23aa@kernel.org>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
	 <aXctPaaXFYemV20T@ryzen>
	 <ce454969b83dbb0e3bb4ea78f682603cc328ceb9.camel@posteo.de>
	 <aXiGNZm12vLhQJ4Q@fedora>
	 <20f855baaa7c36010eab9997a2f43b4f62be726b.camel@posteo.de>
	 <2382dee0-983f-4c69-af7b-a7a48cad23aa@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8gSyxWODBlgM20tLx8kB"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6782-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[die.net:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B98A7A4F79
X-Rspamd-Action: no action


--=-8gSyxWODBlgM20tLx8kB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-28 at 15:34 +0900, Damien Le Moal wrote:
> On 1/28/26 12:34 AM, Markus Probst wrote:
> > > Having a user space implementation for your feature would also allow
> > > an upstream kernel, without the need for any custom kernel patches.
> > Only because it can be done in userspace, doesn't mean it should be.
>=20
> Yes it should. Maintaining userspace is far easier than forcing kernel ch=
anges
> onto users to get blinking LEDs. So unless you have a very strong argumen=
t for
> doing it in the kernel, userspace is probably the right approach. That wi=
ll
> apply to any block device, and not just ATA devices. E.g. NAS with M.2 NV=
Me
> storage can work with the same.
>=20
> > > There seems to be existing user space applications that handles this,
> > > I think both the daemon I linked to before, which uses /sys/block/<de=
v>/stat
> > > which is thus per device and not per port, and e.g. this:
> > > https://linux.die.net/man/8/ledmon
> > > https://github.com/md-raid-utilities/ledmon
> > > https://github.com/md-raid-utilities/ledmon/blob/main/src/lib/ahci.c
> > As far as I can tell, this daemon doesn't actually use the LED
> > Subsystem, but instead leds directly connected to the storage
> > controller.
> > But yes, I would be capable of coding such daemon.
>=20
> Then let's try.
I will give it a try.

@Ian: I will notify you, once there is a working version.

> That will allow checking if anything is missing in the kernel
> interface to do that nicely.
There is.

I noticed for leds, that the fwnode path isn't exposed in sysfs.
"/sys/class/leds/<name>/device/firmware_node/path" exists, but points
to the parent device.

Something similar with scsi and ata exists. scsi doesn't expose the
firmware_node and there is no symlink (or other connection that I am
ware of) between scsi_* and ata_* in sysfs. This means, I cannot map a
fwnode path to a block device.

If I want to distribute a pre-defined config for such led userspace
daemon alongside the ACPI Overlay for a specific NAS model, I need an
identifier that is equal across all devices with that specific NAS
model.

This is less of an issue for leds, but given that leds could be renamed
on name collisions the issue still exists.

Thanks
- Markus Probst

>=20
> > > I think my main concern is that I don't think we should bloat the ker=
nel
> > > for a complex feature that can just as well be implemented in user sp=
ace.
> > It is still unclear to me if you worry about the complexity in
> > drivers/ata/libata-* or drivers/leds/trigger/ledtrig-disk.c
>=20
> It is not so much about complexity but rather the fact that controlling
> blinking LEDs in the hot IO path is not desirable. While SATA HDDs will b=
e less
> sensible to the delays caused by the calls to the LED control functions
> compared to fast NVMe SSDs, we do also need to think about much faster SA=
TA
> SSDs. So instead of risking performance regressions, let's try to do this=
 in
> userspace first.
>=20

--=-8gSyxWODBlgM20tLx8kB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAml6LsUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSm8oQAKRQAKBP5x2x0oS19ZAZ
qx7X1N3zE1DJgE+75+3c8VsHQ6dz8upFCHvT9QqnXfuuNIzTl478k5X5JhoSbuGT
52pCq/rq1QW0V50nnytA2/LwYm7Jo9ivA0HIFkk0sJtru5+iBtKIFqAdHHm7JVMK
C39Tf8SCpsR7nawefFUV4zQgKIPTFjw9u+VmIXSBdLS/wORLuoMpvJuIQVOmmUSX
nVMz4FyaYbrp/ES6c+6y3psXg/LKgaqzLsb9otBjFQ0eWt2FLFxO5JhgF18E6LCY
q1giueWwPl7FXkf/BBBWq5kL12n3TlwnRVc6qiAxJN6PpI6iVTM5rARO13RUGroR
Q9sAmwICpEQ9vebkLN8K6v9z3qzPCNeLwKHkY1KNxMV/gvQRILmZr7qYNUU/dtai
+Xw3Gd6gdzuTLraK/A1GKTJ0PESENgzqrE96pXInH1KSHPzw+o6ciuSCNHxxB9Ny
jD5KUAXE8crXz3vohEC6nVF8fKfuGhd3x4bhTC3ivTLjkuaVJ+SnQRxVf4MLCzRD
hSRR7NrIpqoOeC/Xy87bDKVFP6MWAcN76TPPdpGNHsUMyCC2SE/OTAoYBfhri25H
bZe6Rszr8IoBiJKCxK3rj83v7TmrADodq3/xV1Xo16pSwxoKm7yxG3cB4/j2ow+Q
HntdSem3a9aiC5zCvDh1YymF
=ue8/
-----END PGP SIGNATURE-----

--=-8gSyxWODBlgM20tLx8kB--

