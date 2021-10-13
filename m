Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352F242C85C
	for <lists+linux-leds@lfdr.de>; Wed, 13 Oct 2021 20:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhJMSK3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 14:10:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36142 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhJMSK2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 14:10:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A834A1C0B79; Wed, 13 Oct 2021 20:08:23 +0200 (CEST)
Date:   Wed, 13 Oct 2021 20:08:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20211013180823.GA2391@duo.ucw.cz>
References: <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
 <20210927193424.glrddglskpohbosn@linutronix.de>
 <20211013080838.GA10864@amd>
 <20211013083900.g4pqwpov62cm2zsw@linutronix.de>
 <20211013084237.GA13150@amd>
 <20211013093719.tur5427notjy6rbq@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20211013093719.tur5427notjy6rbq@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-10-13 11:37:19, Sebastian Andrzej Siewior wrote:
> The CPU trigger is invoked on ARM from CPU-idle. That trigger later
> invokes led_trigger_event() which may invoke the callback of the actual d=
river.
> That driver can acquire a spinlock_t which is okay on kernel without
> PREEMPT_RT. On a PREEMPT_RT enabled kernel this lock is turned into a
> sleeping lock and must not be acquired with disabled interrupts.
>=20
> Disable the CPU trigger on PREEMPT_RT.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link:
https://lkml.kernel.org/r/20210924111501.m57cwwn7ahiyxxdd@linutronix.de

Thanks, applied.
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYWcglwAKCRAw5/Bqldv6
8rlJAJ9lHQsAGc/IhWMnfk/zSJAP2RSfdwCdHqHbgqCsu0YmCAdVXbdnTwo1gl4=
=AJ7p
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
