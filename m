Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DF223A3CA
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 14:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHCMEz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 08:04:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35418 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgHCMEq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 08:04:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D9E0F1C0BD4; Mon,  3 Aug 2020 14:04:43 +0200 (CEST)
Date:   Mon, 3 Aug 2020 14:04:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: turris-omnia: fixes needed was Re: We have multicolor, but should we
 turn it into RGB?
Message-ID: <20200803120443.23rsjhxnl4f3xuox@duo.ucw.cz>
References: <20200727084500.GA15237@amd>
 <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
 <20200727105226.GA17807@amd>
 <20200727132144.2ba06aea@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sri4gp3tgjjdhwah"
Content-Disposition: inline
In-Reply-To: <20200727132144.2ba06aea@dellmb.labs.office.nic.cz>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sri4gp3tgjjdhwah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +++ b/drivers/leds/leds-turris-omnia.c
> > @@ -94,15 +94,15 @@ static int omnia_led_register(struct i2c_client
> > *client, struct omnia_led *led, dev_warn(dev,
> >  			 "Node %pOF: must contain 'reg' property
> > with values between 0 and %i\n", np, OMNIA_BOARD_LEDS - 1);
> > -		return 0;
> > +		return 0; /* FIXME: should return 0/errrno */
> >  	}
> > =20
> >  	ret =3D of_property_read_u32(np, "color", &color);
> > -	if (ret || color !=3D LED_COLOR_ID_MULTI) {
> > +	if (ret || color !=3D LED_COLOR_ID_RGB) {
> >  		dev_warn(dev,
> > -			 "Node %pOF: must contain 'color' property
> > with value LED_COLOR_ID_MULTI\n",
> > +			 "Node %pOF: must contain 'color' property
> > with value LED_COLOR_ID_RGB\n", np);
> > -		return 0;
> > +		return 0; /* FIXME: should return 0/errrno */
> >  	}
> > =20
> >  	led->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> > @@ -145,7 +145,7 @@ static int omnia_led_register(struct i2c_client
> > *client, struct omnia_led *led, return ret;
> >  	}
> > =20
> > -	return 1;
> > +	return 1; /* FIXME: should return 0/errrno */
> >  }
> > =20
> >  /*

> Yes, if you want to have RGB as a special case of multicolor so that in
> the future we can work on color curves or something, this could work

Ok, let's do that.

Could you review return value of omnia_led_register() [see the patch
above]? AFAICT it is buggy.

I'd like to push the driver to Linus in few days...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sri4gp3tgjjdhwah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXyf9WwAKCRAw5/Bqldv6
8lRwAJoClnXBGwSXJ1T9+rW56nQnHk+mywCeLnXBY9pFO54JMPg9R0/PcymWo/w=
=DdBK
-----END PGP SIGNATURE-----

--sri4gp3tgjjdhwah--
