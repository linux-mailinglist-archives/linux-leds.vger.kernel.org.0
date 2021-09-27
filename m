Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47503419EE0
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 21:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbhI0TIa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 15:08:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52076 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235964AbhI0TIa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 15:08:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 33CB21C0B7F; Mon, 27 Sep 2021 21:06:51 +0200 (CEST)
Date:   Mon, 27 Sep 2021 21:06:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20210927190650.GA13992@duo.ucw.cz>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Would you mind reading and responding to the rest of the email?
>=20
> The patch you mentioned,
>   https://https://lkml.kernel.org/r/.kernel.org/all/20210915181601.99a68f=
5718be.I1a28b342d2d52cdeeeb81ecd6020c25cbf1dbfc0@changeid/
>=20
> would remove the lock from led_trigger_event().
> Are there any guarantees how many callbacks maybe invoked and what kind
> of locks may be acquired?

These kind of functions should not sleep other than that, there are no
restrictions AFAICT.

Other triggers are relying on that non-sleeping assumption.

> Leaving kworker usage aside there are still things like spinlock_t usage
> in input_leds_brightness_set(), nic78bx_brightness_set() (from a quick
> grep) which have the same problems.
>=20
> > I'm not applying this.
>=20
> I hope you reconsider. It is not all LED usage, just the CPU
> trigger.

What makes the CPU trigger special with RT? Other triggers will be
called from interesting places, too... Johanes pointed out other
problems with that rwlock, and we are getting rid of the rwlock.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVIWSgAKCRAw5/Bqldv6
8jkSAJ0fFbbdrj6pdsW4LFNWjL6BRxvK5gCgqsTT2UcFlguVtUa4pSVdTnTUQwM=
=ECi3
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
