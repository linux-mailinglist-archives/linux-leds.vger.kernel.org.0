Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2740D29A94E
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 11:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897650AbgJ0KPs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 06:15:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52354 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897644AbgJ0KPi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 06:15:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 704DC1C0B8B; Tue, 27 Oct 2020 11:15:35 +0100 (CET)
Date:   Tue, 27 Oct 2020 11:15:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505
 flash led controller
Message-ID: <20201027101535.GB13900@duo.ucw.cz>
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd>
 <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Please use upper-case "LED" everywhere.
> >
> > This should be 2nd in the series, after DT changes.
> Sure, will ack in next series patch.

Feel free to wait for dt ACKs before resending.

> > > +     help
> > > +       This option enables support for the RT4505 flash led controll=
er.
> >
> > Information where it is used would be welcome here.
> How about to add the below line for the extra information?
> Usually used to company with the camera device on smartphone/tablet
> products

Yes, that would help.

"It is commonly used in smartphones, such as Bell Packard T899" would
be even better.

> > > +     ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT4=
505_ENABLE_MASK, val);
> > > +
> > > +unlock:
> > > +     mutex_unlock(&priv->lock);
> > > +     return ret;
> > > +}
> >
> > Why is the locking needed? What will the /sys/class/leds interface
> > look like on system with your flash?
>=20
> The original thought is because there's still another way to control
> flash like as v4l2.
> But after reviewing the source code, led sysfs node will be protected
> by led_cdev->led_access.
> And V4L2 flash will also be protected by v4l2_fh_is_singular API.
> I think the whole locking in the source code code may be removed. Right?

Well, maybe you need it, I did not check..

What will the /sys/class/leds interface look like on system with your flash?

> > > +     *state =3D ((val & RT4505_FLASH_GET) =3D=3D RT4505_FLASH_GET) ?=
 true : false;
> >
> > No need for ? ... part.
> Do you mean this function is not needed? If yes, it can be removed.
> But if it removed, led sysfs flash_strobe show will be not supported.

I meant "replace line with: *state =3D (val & RT4505_FLASH_GET) =3D=3D RT45=
05_FLASH_GET;"

> > > +static bool rt4505_is_accessible_reg(struct device *dev, unsigned in=
t reg)
> > > +{
> > > +     if (reg =3D=3D RT4505_REG_RESET || (reg >=3D RT4505_REG_CONFIG =
 && reg <=3D RT4505_REG_FLAGS))
> > > +             return true;
> >
> > Make this two stagements.
> Like as the below one?? Or separate it into two if case.
> if (reg =3D=3D RT4505_REG_RESET ||
>        reg >=3D RT4505_REG_CONFIG  && reg <=3D RT4505_REG_FLAGS))

That would be fine, too... if you use just one space before "&&" :-).

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5fzRwAKCRAw5/Bqldv6
8k9iAJ0dDvz58HeSc0sCZNkyktZd9hdtUwCdETJwZxtAXjPYTStw/T/M6cOkQr8=
=uA/u
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
