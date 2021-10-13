Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6760142B9EA
	for <lists+linux-leds@lfdr.de>; Wed, 13 Oct 2021 10:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238813AbhJMIKq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 04:10:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41198 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238741AbhJMIKm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 04:10:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EE0231C0BAF; Wed, 13 Oct 2021 10:08:38 +0200 (CEST)
Date:   Wed, 13 Oct 2021 10:08:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20211013080838.GA10864@amd>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
 <20210927193424.glrddglskpohbosn@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <20210927193424.glrddglskpohbosn@linutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> - The idle loop (x86 or ARM makes no difference) is always invoked with
>   disabled interrupts and so sleeping is a no no on PREEMPT_RT. So a
>   spinlock_t can not be acquired in this context.

Ok, I have reviewed code, and your patch seems like a way forward. Can
you resubmit it with fixed changelog?

Thanks,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmFmlAUACgkQMOfwapXb+vKhkwCgvrBa+7g+VplIRUdh6d6giDrA
6nIAnjTcNeyyZ8Ah/WhVOtHCD2DVy7Ys
=vPLp
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
