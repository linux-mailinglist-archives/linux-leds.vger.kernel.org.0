Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1129495E
	for <lists+linux-leds@lfdr.de>; Wed, 21 Oct 2020 10:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436952AbgJUIdj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 04:33:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41634 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395270AbgJUIdi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 04:33:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B410F1C0B77; Wed, 21 Oct 2020 10:33:34 +0200 (CEST)
Date:   Wed, 21 Oct 2020 10:33:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201021083334.GA29124@duo.ucw.cz>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz>
 <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008123214.2a5de507@nic.cz>
 <DM6PR12MB38989BFE9D1967C69E397A6BAF070@DM6PR12MB3898.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB38989BFE9D1967C69E397A6BAF070@DM6PR12MB3898.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > But why you consider it as function enumerator?
> > > For example card48, card56 are two different devices of same type.
> > > Both have 'status' LED.
> >=20
> > OK this is a fair point.
> >=20
> > I was thinking such because in my mind I had this idea that for an ethe=
rnet
> > switch with interfaces lan0 - lan4 it would make sense to use the
> > LED_FUNCTION_LAN function with function enumerator. But thinking about
> > this now again makes me wonder if instead the lan0 - lan4 should be
> > devicenames instead, since normally they are network interface names.
> >=20
> > Vadim, the reason why Pavel and I think that mlxreg (or mlxregN) is not
> > valid devicename part (although mlxreg has to stay since many users
> > already depend on it, as you say), is that the mlxreg name is not expos=
ed
> > anywhere else in Linux from userspace point of view.
> >=20
> > Devicename eth0 is okay, because it is network interface name.
> > Devicename sda would be okay, because everyone knows it is a block devi=
ce
> > and you can access it via /dev/sda.
> > Devicename hci0 would be okay because it is bluetooth interface accessi=
ble
> > via hcitool.
> > Devicenames mtd0, kbd0, mouse0 would be okay, I think.
> >=20
> > But mlxreg is not accessible via anything else in the system. Unless yo=
ur
> > systems also have something like /dev/mlxreg, that is.
> >=20
> > Do the LEDs on these cards only indicate status of the cards themselves=
 as a
> > whole? Or are there LEDs on these cards dedicated to their peripherals?=
 For
> > example if there is an ethernet port with LEDs on one of these cards, t=
he
> > devicename part for these LEDs should be of the device of that ethernet
> > port, not mlxreg...
>=20
> Hi Marek,
>=20
> Each line card must have 'status' LED, indicating status of line card its=
elf.
> User can set non-green in case some there are some alarms on different de=
vices,
> equipped on this line card. It can be set blink during line card initiali=
zation.
>=20
> Line card could be equipped with UID LED. User can set this LED in order =
to
> find physical location of line card. Sometimes it's hard to see the stick=
er on
> chassis.
>=20
> Line card also equipped with per port LED, but those LEDs are handled by =
FW.
>=20
> So, the device in this case is 'line card'.
>=20
> In my previous reply I suggest name 'fru' stands for the filed replaceabl=
e unit.
> This is not something, that is exposed in '/dev', but it describes any re=
placeable
> unit within the system.

So.. you'd use the LED to locate right PCI card, or the LED would
indicate that whole card is failing, etc...?

Could we use pci00:1b.0 as the device name? (same as lspci). Probably
replace : with _...

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX4/yXgAKCRAw5/Bqldv6
8tO2AJ0dQkN+4Nun8eXL1VNMf0FOLZTezwCdGMTiAfqOutpUHZ68wpRM+h8TzEs=
=jxm2
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
