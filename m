Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3ED42A3390
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 20:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKBTDi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 14:03:38 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57624 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgKBTDi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 14:03:38 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F0D0B1C0B87; Mon,  2 Nov 2020 20:03:35 +0100 (CET)
Date:   Mon, 2 Nov 2020 20:03:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH v7 0/6] Add support for the IEI WT61P803 PUZZLE MCU
Message-ID: <20201102190335.GA25451@duo.ucw.cz>
References: <20201025005916.64747-7-luka.kovacic@sartura.hr>
 <20201025005916.64747-6-luka.kovacic@sartura.hr>
 <20201025005916.64747-5-luka.kovacic@sartura.hr>
 <20201025005916.64747-4-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr>
 <20201025005916.64747-2-luka.kovacic@sartura.hr>
 <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201029180105.GD26053@duo.ucw.cz>
 <CADZsf3YE3d=dtMVVYHL91Z1WFcpNN4vyJJ6RG7VnJ2V-DqE+wQ@mail.gmail.com>
 <7821443b-ddbc-fc92-b990-14d116dda853@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <7821443b-ddbc-fc92-b990-14d116dda853@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-11-02 12:29:59, Dan Murphy wrote:
> Hello
>=20
> On 11/1/20 3:56 AM, Luka Kovacic wrote:
> > Hello Pavel,
> >=20
> > On Thu, Oct 29, 2020 at 7:01 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > Hi!
> > >=20
> > > > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzz=
le_core/power_status
> > > > +Date:                September 2020
> > > > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > > > +Description: (RO) Power status indicates the host platform power o=
n method.
> > > > +             Value mapping (bitwise list):
> > > > +             0x80 - Null
> > > > +             0x40 - Firmware flag
> > > > +             0x20 - Power loss detection flag (powered off)
> > > > +             0x10 - Power loss detection flag (AC mode)
> > > > +             0x08 - Button power on
> > > > +             0x04 - WOL power on
> > > > +             0x02 - RTC alarm power on
> > > > +             0x01 - AC recover power on
> > > It would be nice to put this into standard place somewhere. Many
> > > machines will want to expose this information.
> > As this is specific to this microcontroller and to how it encodes
> > these values, I don't see a need to change this.
> > This isn't used anywhere else.
> >=20
> > > If not, at least spell out WoL, as it is not that common of acronym.
> > Okay.
>=20
> WoL is a very common acronym especially in the networking space

WoL is common. WOL is not. Better spell it out.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX6BYBwAKCRAw5/Bqldv6
8sjnAKCUSNiPSE6OIQ2U4at27L1yoVX4DwCgl35ROsO5x6s+XOAG/+2PV7h6rbc=
=+bW+
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
