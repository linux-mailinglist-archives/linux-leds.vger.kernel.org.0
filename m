Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964AD2726C4
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 16:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIUOPp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 10:15:45 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:49049 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgIUOPo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 21 Sep 2020 10:15:44 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id E84AE1085E1;
        Mon, 21 Sep 2020 16:15:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Sl6LnqAsXrrp; Mon, 21 Sep 2020 16:15:40 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id D5B711080EF;
        Mon, 21 Sep 2020 16:15:40 +0200 (CEST)
Date:   Mon, 21 Sep 2020 16:15:40 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-leds@vger.kernel.org
Subject: Re: question about Network Space v2 LED driver
Message-ID: <20200921141540.GC4828@kw.sim.vm.gnt>
References: <20200918005258.44c0bfc6@blackhole.sk>
 <20200918134201.GF29951@kw.sim.vm.gnt>
 <20200918194315.61fd8f43@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline
In-Reply-To: <20200918194315.61fd8f43@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 07:43:15PM +0200, Marek Behun wrote:
> On Fri, 18 Sep 2020 15:42:01 +0200
> Simon Guinot <simon.guinot@sequanux.org> wrote:
>=20
> > On Fri, Sep 18, 2020 at 12:52:58AM +0200, Marek Behun wrote:
> > > Hi, =20
> >=20
> > Hi Marek,
> >=20
> > >=20
> > > the leds-ns2 kernel driver has allows 3 modes for a LED:
> > >   OFF, ON and blinking on SATA activity
> > >=20
> > > This third mode is activated via another sysfs file in the LED device
> > > sysfs directory: /sys/class/leds/<LED>/sata.
> > >=20
> > > Since we now support LED private HW triggers, it would be better if
> > > this was rewritten to use this new API. =20
> >=20
> > It sounds like a great idea.
> >=20
> > >=20
> > > The question is how many people use this mode and may complain if we
> > > change this sysfs ABI? =20
> >=20
> > Not a lot IMHO. This LED devices are found in some LaCie/Seagate NAS.
> > Most of them, such as the Seagate NAS 4-Bay (Marvell Armada 370 SoC)
> > are supported by the Debian distribution. For the users I have been in
> > contact with, I am pretty confident they should be able to deal with
> > this changes. They already dealt with worse.
> >=20
> > Another user is the Seagate NAS distribution. And this user will be
> > happy to switch to the new ABI.
> >=20
> > >=20
> > > Another question is whether the LED supports another HW blinking mode,
> > > or just SATA? How is this wired on the board? =20
> >=20
> > Three different LED modes are available: off, on and SATA activity
> > blinking. The LED modes are controlled through two GPIOs (command and
> > slow): each combination of values for the command/slow GPIOs corresponds
> > to a LED mode.
> >=20
> > For an example, have a look at the leds-ns2 DT node in the
> > armada-370-seagate-nas-4bay.dts file.
> >=20
> > The only hardware blinking mechanism for this LED device is SATA.
> > Basically the SATA blinking signal is built from the SATA pin activity
> > of the HDD. This signal is a little bit reworked by some electronic
> > components in order to produce a blinking rate OK for the human eye.
> >=20
> > Hope this helps.
> >=20
> > Simon
>=20
> I apologize, I accidentaly sent the question from my private e-mail :)
>=20
> Simon, thanks for the info.
>=20
> Another question: Is there only one disk on this device?

There are several NAS devices using the leds-ns2 driver. On most of them
the activity is wired to a single disk. But on some (such as the Network
Space v2 Max), the activity is wired to two disks.

>=20
> The reason why I am asking is this:
>   We already have disk-activity trigger. I would like to implement a
>   generic LED trigger offloading API, so that if user chooses
>   disk-activity and the LED can offload that to hardware, it wil.
>=20
>   But the disk-activity trigger blinks the LED on activity of any
>   disk, you can't choose one as in the netdev trigger.
>  =20
>   If it is possible to have only one disk on that device (which is
>   improbable if there are USB ports) than implementing offloading will
>   be trivial.
>=20
>   If not, than we would need to allow disk-activity trigger to select
>   the disk as well. This is probably good anyway.
>=20
> Are you willing to work on this with me? At least reviewing and testing
> patches?

Yes I'll review and test your patches.

Simon

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9otYwACgkQzyg/RDPm
szoEqxAAmlTx5sT3RHEMTpUQy5IN2Ui2irX8CvTnUQC9owGzrgr8U+HM7c7dca6J
iQ+pkH8sKOzErrLbqlbXJl+OkSvH7sBemegG2yyfDNd2tmvedw6XRft7MIRON5MT
nfNdMr4aWB1fq1RbXHIxVFgTVjDr/kZ7sp3uVidfGRMAxhXK7pgxeUgc3SzgjzTy
U8MHQbErruoTinNXO/RkTfp6J7BEllG1s7RYLnmo2tbGIeoboCarmwAkHC5WhvVm
tU/WXKYa+EzVIfswbwumcTbz3Nh4JQJQS8ckIJ4S2ZtlHfhvvaHsBbhai3Z5EFuB
KcZwRltYcCOwWFOAmw8HWMBAHqizb1j8ZUe7Pznd8d1Ndgiu74VeQDwW53OlXErH
SxKFbP2NovGOJKLSKjqrE3pQKGjLBq4H80y4EB+2EOmwjOV9OUmw8dEUuzQS+ezW
u/0QhdadLlIf4Ff/eZxepELMDAwSenmNIr7vYnTMY3Z0VYe0fEazUJ6raHU6H/90
5OUKBnTGDQAnd2NTPUBDzohddrWar7Nv8A6nymIY9FdSfvLo/TubeKs5xIBgr4uj
puw30pEAU62pXCUFu2SLmztckY3b3EfLzpgmtLzzVGtOBWQyAAN+c7bDnWsZsigO
48s49BX4/hFQl8H5pjjU2fUj2noUT7UFPjEfaFU+XYKyGn6lebM=
=fW2v
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
