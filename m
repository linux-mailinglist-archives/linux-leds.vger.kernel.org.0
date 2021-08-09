Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C033E4BE0
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 20:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhHISLl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 14:11:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55214 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhHISLl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Aug 2021 14:11:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7818F1C0B77; Mon,  9 Aug 2021 20:11:18 +0200 (CEST)
Date:   Mon, 9 Aug 2021 20:11:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Phil Sutter <phil@nwl.cc>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Add invert attribute to ledtrig-audio
Message-ID: <20210809181118.GA16184@duo.ucw.cz>
References: <20210809122910.11580-1-phil@nwl.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20210809122910.11580-1-phil@nwl.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Inverting micmute LED used to be possible via a mixer setting, but
> conversion to LEDs class (probably) killed it. Re-establish the old
> functionality via sysfs attribute in audio LED triggers.

So we have both invert and inverted attributes. Fun :-).

See sysfs-class-led and sysfs-class-led-trigger-oneshot.

We definitely want this documented. We probably want this for most
triggers, maybe it should get one implementation in library somewhere?

Otherwise it makes sense.

> +static ssize_t do_invert_store(enum led_audio type,
> +			       const char *buf, size_t size)
> +{
> +	unsigned long state;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	led_invert[type] =3D !!state;
> +	ledtrig_audio_set(type, audio_state[type]);

Accepting 42 as valid value sounds wrong. Anyway, this should do what
oneshot trigger does.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYRFvxgAKCRAw5/Bqldv6
8gdcAKCZpTIkUkGymc3B8Li/TN91XOrUcwCggaWrNpchM8iKb3W5hZLMgcN8bXw=
=qJ55
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
