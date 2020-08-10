Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96372402A4
	for <lists+linux-leds@lfdr.de>; Mon, 10 Aug 2020 09:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgHJHeB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Aug 2020 03:34:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39516 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgHJHeB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Aug 2020 03:34:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E411D1C0BD7; Mon, 10 Aug 2020 09:33:59 +0200 (CEST)
Date:   Mon, 10 Aug 2020 09:33:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     truart@gmx.de
Cc:     linux-leds@vger.kernel.org
Subject: Re: led block trigger patch
Message-ID: <20200810073359.GA15023@amd>
References: <trinity-ff7f1644-b76d-424b-9a6f-8caaf9961ffe-1595962052162@3c-app-gmx-bap12>
 <50db75e2-d53c-ce8b-bd00-1099be0e2e74@ifi.lmu.de>
 <trinity-bc8857f4-cee1-4b95-a4fd-cc817119a95c-1597042087357@3c-app-gmx-bap76>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <trinity-bc8857f4-cee1-4b95-a4fd-cc817119a95c-1597042087357@3c-app-gmx-bap76>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Find out what is wrong with the patch, fix it, resubmit it.
>=20
> I would like to, but unfortunately, I've no skills in programming so I'm =
not able to do that.
>=20

You can learn, or find someone to do the work for you.

What was the point of me reviewing the old patch when you are not
going to fix it? That was not very constructive.

> > Oh. It appears to register trigger per block device. That's no-no.
>=20
> Hmm, why is that a no-no? It seems it works that way for CPUs already. I =
can see triggers from cpu0 to cpu39 on our servers with two CPUs, 10 cores =
and 2 threads per core. So we even have one trigger for every cpu thread.
>=20
> I've never seen a host with 40 nvme disks, so why is this problematic if =
having 40 cpu triggers is not? Or does "trigger per block device" mean sth.=
 else?

We made a mistake with cpu triggers. Not doing it again.=20

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8w+GYACgkQMOfwapXb+vJ67wCgh0fdanuK7TxYG/WphGrQc8Ix
jdwAn020qmcrA+9VNKYIVRCNZufNMsvE
=RVTA
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
