Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBBD229397
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 10:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgGVIed (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 04:34:33 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46944 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgGVIed (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 04:34:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id h19so1543930ljg.13;
        Wed, 22 Jul 2020 01:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a320Kl5LlLOAYjeoIoCSr52bpOgO1xg6oWW0y+XyzMw=;
        b=RW1QO2AgljyDHzHWSrSy+PzOsrEwS//NpMR/UWp20giKm3iN/75GmdEpAtwGJg0GV2
         uHoabgJtLA9ajOttFxUoPv9BtSAoHDJE/RdjEPvT29Qj23c1/9Q63cbSMabCg620zvM6
         rOtq+mp7+o5pqVX9AehRGhxtuF8cEVZp5qSLy/yWilBTLxrhDQe9W8Xi6ACUOx2olD5k
         kVicebcX1KEuXl9uWsjHSq7PWOReXlbfmgufXQk4C6c8PZtGFq0zVlUH6xgWajZLrjyZ
         5pOoUV6UDPTzXUqvoxoBuynPaZv57p6CdxNqiwEeCSI9fHLax87pL1vlLWjcsUaKSgLp
         v8zw==
X-Gm-Message-State: AOAM531BK8oQ2k7QGi8tzYUK3w2O88X+Lz7tJMBc5BDlwE1jGnGYf4rw
        TV8iYuV3hunhpqzh01hcRbRSBwZY
X-Google-Smtp-Source: ABdhPJyZVBEFI0bvjliXucRioA69zALGxm9a2TuCL16DZpKu64loQwYwFw8ndfYgVc8LlaM47TwOeA==
X-Received: by 2002:a2e:9d86:: with SMTP id c6mr14184500ljj.418.1595406870872;
        Wed, 22 Jul 2020 01:34:30 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id c27sm7530646lfm.56.2020.07.22.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 01:34:29 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jyACn-0005S2-4r; Wed, 22 Jul 2020 10:34:25 +0200
Date:   Wed, 22 Jul 2020 10:34:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Johan Hovold <johan@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        kernel@pengutronix.de, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200722083425.GF3634@localhost>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
 <20200714071355.GY3453@localhost>
 <20200721194815.mmkqccrkbgrly4xz@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline
In-Reply-To: <20200721194815.mmkqccrkbgrly4xz@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 09:48:15PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Johan,
>=20
> On Tue, Jul 14, 2020 at 09:13:55AM +0200, Johan Hovold wrote:
> > On Tue, Jul 07, 2020 at 06:59:58PM +0200, Uwe Kleine-K=F6nig wrote:
> > > +	while (firstrun ||
> > > +	       icount.rx !=3D trigger_data->rx ||
> > > +	       icount.tx !=3D trigger_data->tx) {
> > > +
> > > +		led_set_brightness(trigger_data->led_cdev, LED_ON);
> > > +
> > > +		msleep(100);
> > > +
> > > +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> > > +
> > > +		trigger_data->rx =3D icount.rx;
> > > +		trigger_data->tx =3D icount.tx;
> > > +		firstrun =3D false;
> > > +
> > > +		ret =3D tty_get_icount(trigger_data->tty, &icount);
> > > +		if (ret)
> > > +			return;
> > > +	}
> >=20
> > Haven't looked at the latest proposal in detail, but this looks broken
> > as you can potentially loop indefinitely in a worker thread, and with no
> > way to stop the trigger (delayed work).
>=20
> I don't think that potentially looping indefinitely is a problem, but
> indeed it should drop the lock during each iteration. Will think about
> how to adapt.

You musn't queue work that can run for long on the global shared
workqueue as it affects flushing:

	* system_wq is the one used by schedule[_delayed]_work[_on]().
	* Multi-CPU multi-threaded.  There are users which expect relatively
	* short queue flush time.  Don't queue works which can run for too
	* long.

Work that potentially run indefinitely is an absolute no-no. :)

Johan

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCXxf6DgAKCRALxc3C7H1l
CAKdAPwMLuzL36R91UerEvnH4zUtKfNS5jRfm18tpgXYHJMHygEArxfQACvPs6nx
njUDzVBzoW1/YxY47dCsqRZ4zne/JAQ=
=E/KR
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
