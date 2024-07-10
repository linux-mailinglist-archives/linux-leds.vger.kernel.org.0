Return-Path: <linux-leds+bounces-2237-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CE92D35C
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 15:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3BA283F24
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 13:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C4E193067;
	Wed, 10 Jul 2024 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="s3pJ9YQz"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39435192B8F;
	Wed, 10 Jul 2024 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619394; cv=none; b=T8QvDrNUha8Xijq5feZtDTmqrDnRdtfMWF9YYcLjcoVUW9SoRHBeHcRPlu7Fze4c7GlxHLyLPzqv24QwopspKvibIucaKsU6xEecd2KIgd+8DPa0TOR5YBdGYQDG8N+G5yf7Xew+hkfMO7VJTt0q63qZynKo3+Q0Dxk4Oj1Eewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619394; c=relaxed/simple;
	bh=r+F/2KIaBzLyVXXF7GrQxs/ElB49C6RcPCOl+HwspH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ht8gegY0PLyRwAoaH0h2taZWut8vV8f72VQy5qkRjU4g16QrMlNh6O1jDEkmGV93ehSwYTHuNVMKxMyMr9/ePwFRYX5NbwQYLy8jEVQYQX1WJSDM8MOYOyuSRG6cQH0dx1gMUvTaxM5c2+Dq4eI6qFrqlRZfp0Dq+Jusg4kZ5HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=s3pJ9YQz; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 78CC088025;
	Wed, 10 Jul 2024 15:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720619390;
	bh=rd4U7AAXKGsH3PODWZxvkjHuRjt4mypiIDTO9ncI2LM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s3pJ9YQz61kH/L5aa6Claj18i83b1CazGcaOz3W/Jm3ut3G550mhGFpLp1Ky8s4yG
	 LVCcuQJan5dVHjZ0b5BS4xtGaP78vIamzk7k0NP+gbfvr/CSNDUz2nT9ILD6PuxnA1
	 cIFlk60uAuSJ1RboocHz3pGHKSjZnG0i7JgDTyxxggrVYS/JiR78OZeIyOzbEsf30U
	 bmLjpxlw+lR5FGjW6npJaE5zwQAmcjMMfryUZEhekOp7vvepsVJsMG6FIUxSbImUjM
	 f3yKWvXOfYiOePhiqPCekrqoYvYY1ISNYJG+JDWpYt7HKTE7JZToD9RXpAOKKatXZR
	 nX4NLlqxw6qWQ==
Date: Wed, 10 Jul 2024 15:49:37 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, Li Zetao <lizetao1@huawei.com>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 net-next] leds: trigger: netdev: Add support for
 tx_err and rx_err notification with LEDs
Message-ID: <20240710154937.0dbcbd0c@wsk>
In-Reply-To: <8c8ba30d-dbec-47db-ae8c-a734fb2468c0@lunn.ch>
References: <20240710100651.4059887-1-lukma@denx.de>
	<8c8ba30d-dbec-47db-ae8c-a734fb2468c0@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/70z+RmfJzPl5=n.1MdvKHZn";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/70z+RmfJzPl5=n.1MdvKHZn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> On Wed, Jul 10, 2024 at 12:06:51PM +0200, Lukasz Majewski wrote:
> > This patch provides support for enabling blinking of LEDs when RX
> > or TX errors are detected.
> >=20
> > Approach taken in this patch is similar to one for TX or RX data
> > transmission indication (i.e. TRIGGER_NETDEV_TX/RX attribute).
> >=20
> > One can inspect transmission errors with:
> > ip -s link show eth0
> >=20
> > Example LED configuration:
> > cd /sys/devices/platform/amba_pl@0/a001a000.leds/leds/
> > echo netdev > mode:blue/trigger && \
> > echo eth0 > mode:blue/device_name && \
> > echo 1 > mode:blue/tx_err =20
>=20
> When i look at the machines around me, they all have an error count of
> 0.=20

This is mostly true for ethernet. However, it happens on some low-level
drivers that errors field is not zero when e.g. the received frame is
malformed due to harsh work environment.

> Do you have a real customer use case for this?=20

Yes.

The problem is apparent mostly with can interfaces and transmission for
it.

> What sort of systems
> do you have which do have sufficient errors to justify an LED?

In my case it is an embedded industrial/automotive controller with 10+
RGB LEDs. It only has LEDs to communicate with user.

The way how and when they blink shows the status of the device.

With this patch one is able to spot if some transmission is failing
(among other things).

>=20
> There is no standardisation of LEDs. Every vendor implements something
> different. What i don't want is lots of different blink patterns,
> which nobody ever uses.

As you can assess from the code - this patch extends neatly the current
code, with use case valid for my customer.

>=20
> 	Andrew




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/70z+RmfJzPl5=n.1MdvKHZn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmaOkXEACgkQAR8vZIA0
zr0jLAf/XZ+qitmpuHL0G7qOdb9cqtFnbmKWcGmxPHRaoksiIj315x7N9uiINrEP
wh2rbqSseQq2ZZEGP/JopmsCJVGrDEW6LpJM5AZOlRRYWhmwLPW/AHgyrSNx6p4h
KBgZA4jjjOgdC6xztzNzTMbIDKXHOXDVTQHROHYr3XHivp07x+ZB682NY0Hu51aL
0kZdP35GOfrGlo/Sylbx0kwlJ8KSbWQaKNtDSjRnInGno4vnFgMnrxPVrYs7QNhe
BqXzt3/VoEQH7RRcfNEiTXgAvNnMgrUAqCIkUWsqsFMj9CQQWyeo7plyTdzPdh19
624Ompi6jxeJTUjC6rCqHZu8EShGAg==
=4gdM
-----END PGP SIGNATURE-----

--Sig_/70z+RmfJzPl5=n.1MdvKHZn--

