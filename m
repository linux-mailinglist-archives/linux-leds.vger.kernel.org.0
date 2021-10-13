Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA5142BAB8
	for <lists+linux-leds@lfdr.de>; Wed, 13 Oct 2021 10:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhJMIol (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 04:44:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44868 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhJMIol (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 04:44:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E14DD1C0B80; Wed, 13 Oct 2021 10:42:37 +0200 (CEST)
Date:   Wed, 13 Oct 2021 10:42:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20211013084237.GA13150@amd>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
 <20210927193424.glrddglskpohbosn@linutronix.de>
 <20211013080838.GA10864@amd>
 <20211013083900.g4pqwpov62cm2zsw@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20211013083900.g4pqwpov62cm2zsw@linutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-10-13 10:39:00, Sebastian Andrzej Siewior wrote:
> On 2021-10-13 10:08:38 [+0200], Pavel Machek wrote:
> > Hi!
> Hi,
>=20
> > > - The idle loop (x86 or ARM makes no difference) is always invoked wi=
th
> > >   disabled interrupts and so sleeping is a no no on PREEMPT_RT. So a
> > >   spinlock_t can not be acquired in this context.
> >=20
> > Ok, I have reviewed code, and your patch seems like a way forward. Can
> > you resubmit it with fixed changelog?
>=20
> Could you please point me what to needs to be fixed in the changelog?
> I mentioned the read lock which is acquired with disabled interrupts
> and this does not work on PREEMPT_RT.

The read lock is gone in linux-next now (it was problematic for other
reasons and it was not the main problem).

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmFmm/0ACgkQMOfwapXb+vLpVwCgm/trdV4q/R+64L0Ge3LbfaCo
4xEAnAlDCmFSrzQXjS+ixfjk7JORRD0f
=gi7W
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
