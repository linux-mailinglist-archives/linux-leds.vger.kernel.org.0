Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01092145F9
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jul 2020 14:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgGDM7E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jul 2020 08:59:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48092 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgGDM7D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Jul 2020 08:59:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F22FD1C0BD2; Sat,  4 Jul 2020 14:59:00 +0200 (CEST)
Date:   Sat, 4 Jul 2020 14:59:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200704125900.GA20503@amd>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Some criticism to this approach to HW triggers:
> - every hw trigger for each LED has to be registered via current trigger
>   API. This will grow code size and memory footprint once this API is
>   widely used
> - one HW trigger can only master one LED device (via private_led
>   member). So if I have, for example an ethernet switch with 8 ports,
>   and each port has 2 LEDs, and each LED has 10 possible HW triggering
>   mechanisms, with your proposed API one would need to register 8*2*10
>   =3D 160 triggers

Well, code is simple, and so far I have seen 2 HW triggering
mechanisms, not 10. Maybe we should have a function to regiter a hw
trigger for a LED, so that internal implementation can be changed
more easily.

Ondrej: You already have code using this, right? Can we get an example?

> I too have been thinking about an API for HW LED triggers, and I
> tinkered with it a little. Some time ago I sent some emails, with
> subjects:
>   "RFC: LED hw triggering API"
>   "about my trigger-sources work"

Perhaps it is time to send them one more time, so Ondrej can say if it
works for him/looks okay for him?

> My current thoughts about how HW LED triggers could work nicely is as
> such:
>   - these members (maybe with different names) shall be added to struct
>     led_classdev:
>       available_hw_triggers()
>         - shall return a NULL terminated list of HW trigger names
>           available for this LED
>       set_hw_trigger()
>         - sets HW trigger for this LED. The LED triggering API shall
>           call this method after previous LED trigger is unset. If
>           called with NULL parameter, unsets HW trigger
>       current_hw_trigger
>         - name of the currently set HW LED trigger for this LED
>   - the driver registering the LED cdev informs abouth the LED being
>     capable of HW triggering - members available_hw_triggers and
>     set_hw_trigger must be set
>   - SW LED trigger and HW LED trigger are mutualy exclusive on one LED
>   - the trigger file in sysfs (/sys/class/leds/LED/trigger) shall first
>     list the available SW triggers, and then available hw triggers for
>     this LED, prefixed with "hw:"
>     When written, if the written trigger name starts with "hw:",
>     instead of setting SW trigger, a HW trigger is set via
>     set_hw_trigger() method

This does not sound bad, either.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8AfRQACgkQMOfwapXb+vIOgQCfU+rjWFzjMDjVUO2Au4O9+KFz
J+IAoI1wY8zexgdpp1vEpFRsp/FcM/bI
=mY9m
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
