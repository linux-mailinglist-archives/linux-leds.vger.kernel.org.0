Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1265322794
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 10:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhBWJNh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 04:13:37 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52734 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhBWJNa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 04:13:30 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C96211C0B7F; Tue, 23 Feb 2021 10:12:30 +0100 (CET)
Date:   Tue, 23 Feb 2021 10:12:30 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] leds: trigger: audio: Add an activate callback to
 ensure the initial brightness is set
Message-ID: <20210223091230.GI9750@amd>
References: <20210221115208.105203-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline
In-Reply-To: <20210221115208.105203-1-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Some 2-in-1s with a detachable (USB) keyboard(dock) have mute-LEDs in
> the speaker- and/or mic-mute keys on the keyboard.
>=20
> Examples of this are the Lenovo Thinkpad10 tablet (with its USB kbd-dock)
> and the HP x2 10 series.
>=20
> The detachable nature of these keyboards means that the keyboard and
> thus the mute LEDs may show up after the user (or userspace restoring
> old mixer settings) has muted the speaker and/or mic.
>=20
> Current LED-class devices with a default_trigger of "audio-mute" or
> "audio-micmute" initialize the brightness member of led_classdev with
> ledtrig_audio_get() before registering the LED.
>=20
> This makes the software state after attaching the keyboard match the
> actual audio mute state, e.g. cat /sys/class/leds/foo/brightness will
> show the right value.

Makes sense.

> +++ b/drivers/leds/trigger/ledtrig-audio.c
> @@ -6,10 +6,33 @@
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include "../leds.h"
> =20
> -static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
>  static enum led_brightness audio_state[NUM_AUDIO_LEDS];
> =20
> +static int ledtrig_audio_mute_activate(struct led_classdev *led_cdev)
> +{
> +	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MUTE]);
> +	return 0;
> +}

Is mute_activate called from atomic context?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xv4ACgkQMOfwapXb+vJeMgCfUzGgsQwaCEMPA+s1EZUQHoFW
ER4AnA39Cz2oUVyYsHn6mWg9YnddR0Il
=R0dI
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--
