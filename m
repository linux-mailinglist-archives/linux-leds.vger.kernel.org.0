Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344682F3FAD
	for <lists+linux-leds@lfdr.de>; Wed, 13 Jan 2021 01:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394631AbhALWbG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Jan 2021 17:31:06 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33584 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393234AbhALWa6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jan 2021 17:30:58 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C02F91C0B79; Tue, 12 Jan 2021 23:30:15 +0100 (CET)
Date:   Tue, 12 Jan 2021 23:30:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Dan Murphy <dmurphy@ti.com>,
        linux-ide@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: 5.11 new lockdep warning related to led-class code (also may
 involve ata / piix controller)
Message-ID: <20210112223015.GB28214@duo.ucw.cz>
References: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline
In-Reply-To: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Booting a 5.11-rc2 kernel with lockdep enabled inside a virtualbox vm (wh=
ich still
> emulates good old piix ATA controllers) I get the below lockdep splat ear=
ly on during boot:
>=20
> This seems to be led-class related but also seems to have a (P)ATA
> part to it. To the best of my knowledge this is a new problem in
> 5.11 .

This is on my for-next branch:

commit 9a5ad5c5b2d25508996f10ee6b428d5df91d9160 (HEAD -> for-next, origin/f=
or-next)

    leds: trigger: fix potential deadlock with libata
   =20
    We have the following potential deadlock condition:
   =20
     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
     WARNING: possible irq lock inversion dependency detected
     5.10.0-rc2+ #25 Not tainted
     --------------------------------------------------------
     swapper/3/0 just changed the state of lock:
     ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x=
27/0x200
     but this lock took another, HARDIRQ-READ-unsafe lock in the past:
      (&trig->leddev_list_lock){.+.?}-{2:2}

If I'm not mistaken, that should fix your issue.

Best regards,

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX/4i9wAKCRAw5/Bqldv6
8jJLAKDBeFjI4ElXoU+bJaEZ869cE7QQNgCgm40OMHnRKot5PDQHviQcJIaObdo=
=XLEt
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
