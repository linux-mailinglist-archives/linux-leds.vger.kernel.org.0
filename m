Return-Path: <linux-leds+bounces-7441-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMVcJmSbwWlNUAQAu9opvQ
	(envelope-from <linux-leds+bounces-7441-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:58:28 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4BB2FCBAB
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BE79301A79F
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC453E023A;
	Mon, 23 Mar 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhjQuV1r"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856313C552A;
	Mon, 23 Mar 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295902; cv=none; b=FGlmu14Fq3TgzglAGr2sSiz/NHROmTWH4X+RlSCgKdeULlYr6VP78G5u3813Ofg1xCdrm0fYL0ekF3tkOFEguGGy9QPrsR5ewmetbHzgONVXwjRZd8mutwwCRkxamKiJgCvPOBodUiv1UBtlWHln6kf6MkLK3vXoyT7xxB/B9ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295902; c=relaxed/simple;
	bh=kyAdyLIolc1pNRtfh868lkR+JbIUB6zZ7QrqvXFofdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc5fo/cSgni6DtvCOJVURq1xeb4CPDxL42dLEDU0ZSHt8qm94bKsPJFoD1SVaj67S6/pqNBAS96r1VAujaF3pR73D7KD64uzuoHvN+ObUW6wL7N/2jBDyXJr+48yn/JPboFgA0YIyU59Wns2vN7omPVJe1mS7kxYc/jPqE96aVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhjQuV1r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3FAC4CEF7;
	Mon, 23 Mar 2026 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295902;
	bh=kyAdyLIolc1pNRtfh868lkR+JbIUB6zZ7QrqvXFofdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhjQuV1rlQNkZRRUPQzUEHiGemWYvxwGUUwFprKqnvBZvIVTyWQFx/DOnFVIztija
	 MPlohAzCjzApu8WeTQ65I+ChX1qkWiXY+NloB3CFncACPeKUJ9gqzBaA2TFhUC7F+C
	 NpydNTsGaSMtNU4c8nF8vyTGUWBeM3DaxWktWG/AOE56ayJaWV86+Qew9HjiLxGE3O
	 oFKgs43bcPf7uU9PNgRmuAZ+JSQtjSEap6fY0IgEPbaCb8GVdrfbDqGGikWzJqpeIV
	 G3mOwk96C6MmV5G8nHEUJRfO2O3dtJ2tBzMu79ygfRL6PVYmWQdiwfk5xrU1bcv0WF
	 UGpTukMnf4SjA==
Date: Mon, 23 Mar 2026 19:58:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <55abcc68-747a-468a-abdf-b6340d658c4f@sirena.org.uk>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <acGWJf1AGXT1xduM@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O4OhYRZFw2wrFe70"
Content-Disposition: inline
In-Reply-To: <acGWJf1AGXT1xduM@google.com>
X-Cookie: This is a good time to punt work.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7441-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 5C4BB2FCBAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--O4OhYRZFw2wrFe70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 12:41:59PM -0700, Dmitry Torokhov wrote:
> On Mon, Mar 23, 2026 at 07:05:13PM +0000, Mark Brown wrote:

> > I think this is a worrying idea for core code like this, we have
> > specific firmware bindings for specific firmware interfaces with the
> > different interfaces having very different ideas of how things should be
> > modelled.  The chances that firmware agnostic code is going to do the
> > right thing seem low, and encouraging the use of generic APIs that might
> > happen to run OK raises the risk that we'll get firmware vendors relying
> > on them and leaving us with a conceptual mishmash to sort through.

> Firmware vendors can introduce incompatible DT bindings and have them in
> their devices too and we have to deal with that...=20

The case that's worrying me is mixing the ACPI and DT design models in
one system, and especially having that happen to actually work without
modification purely by luck rather than by design.

> I think if this pushes closer ACPI and OF schemas for at least some
> subsystems closer to each other it would not be a bad thing.

I think we shouldn't be encouraging people to just throw random stuff at
the wall and see if it happens to run OK with whatever OS they tried
booting.  The differences between ACPI and DT in areas like the
regulator bindings are fundamental conceptual ones.  There's some areas
where things are closer and it winds up being fine actually, especially
for leaf devices, but there's others where that's less likely.

--O4OhYRZFw2wrFe70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBm1UACgkQJNaLcl1U
h9Djrwf9Ffmb+F+09voA/X0mCKzR62vN4Kz++KKsVLf3+BEctfWovkX/itnqcwhx
s9V5mECd0QLrKeSG5E/NNmFrjJz3TliTHZSab+DpflQbDb+EVvqTnwCgVF1g+Fln
vujBPEAADK/0xJILG6Ofvj3jmTtI4d8vr0yaG2zf1sxs/hfSs/H5md5+Z4hhXsuS
+aIRYxppLQmblj8oBi94jqkz95GHs5/eG9Xe7BmVRgnnkqRWbS2RmRDhmnPRG/aj
4k5BAgW89+EZGjNjNhZ+ssjenO27Q4qisrmpQunxMoi6FzdOUc6AhVo0sOy1Qj8u
VJtMn/EIAQUKnKtotxHlw4yduM3PBA==
=chN5
-----END PGP SIGNATURE-----

--O4OhYRZFw2wrFe70--

