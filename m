Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0BD419823
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 17:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbhI0Pqa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 11:46:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35636 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbhI0Pqa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 11:46:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6E5D21C0B7A; Mon, 27 Sep 2021 17:44:51 +0200 (CEST)
Date:   Mon, 27 Sep 2021 17:44:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        johannes.berg@intel.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20210927154451.GA17112@duo.ucw.cz>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <87wnn2av6h.ffs@tglx>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-09-27 17:35:02, Thomas Gleixner wrote:
> Pavel,
>=20
> On Mon, Sep 27 2021 at 16:23, Pavel Machek wrote:
> >
> >> The CPU trigger is invoked on ARM from CPU-idle. That trigger later
> >> invokes led_trigger_event() which acquires a read lock in an IRQ-off
> >> section. The problematic part on PREEMPT_RT is that this lock is turned
> >> into a sleeping lock and must not be acquired with disabled interrupts.
> >>=20
> >> The problem continues as that the LED driver underneath must not acqui=
re
> >> any sleeping locks itself.
> >>=20
> >> Disable the CPU trigger on PREEMPT_RT.
> >
> > I know locking with leds is problematic, but I believe you'll hit
> > similar problem elsewhere... Disabling triggers is not solution.
>=20
> Disabling stuff which is not working well with RT is very much a
> solution in order to make progress.
>=20
> We have surely more essential problems to solve than making leds blink
> and if anyone cares enough about them, then this can be worked on in
> parallel. That has been disabled on RT for ever and so far nobody
> complained or cared enough about it.

Would you mind reading and responding to the rest of the email?

I'm not applying this.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVHm8wAKCRAw5/Bqldv6
8mh9AJ4isoGzeo9/2ZlppxWei3SDG7SsjACggn5kQQUjHouzpkDO1QsNq8pH3g4=
=SoI1
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
