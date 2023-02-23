Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1B86A10F4
	for <lists+linux-leds@lfdr.de>; Thu, 23 Feb 2023 21:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjBWUAY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Feb 2023 15:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjBWUAX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2023 15:00:23 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E6B5DCD6
        for <linux-leds@vger.kernel.org>; Thu, 23 Feb 2023 12:00:19 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E6A1F1C0DED; Thu, 23 Feb 2023 21:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1677182416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vv9wJqOaPcnY4eoO4/g/NGyiP68RrORmLMvQiJmbJZc=;
        b=dA0QQVxNKCY5KpcsyPbllSFKO3UdahKF08BslsGOATUSbR9EQXQIHSHAsP3YXmDmPCENW3
        H0Aiu+Z8E/gb5kOn+i/GwD1SrZmwYWKJ8xV+e+BbYlRzDu2YZL78wooxuT3HcTY0giG+0k
        9HQVnSfty9WEfY9miTe0TtNLCGNHMsA=
Date:   Thu, 23 Feb 2023 21:00:16 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: Add knob to blink only for tx or only
 for rx
Message-ID: <Y/fF0FUzrv5xRloV@duo.ucw.cz>
References: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
 <Y/eDeEi1tekYodGW@ada.ifak-system.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6TPbUcMGQllCzDpA"
Content-Disposition: inline
In-Reply-To: <Y/eDeEi1tekYodGW@ada.ifak-system.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6TPbUcMGQllCzDpA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2023-02-23 16:17:12, Alexander Dahl wrote:
> Hei hei,
>=20
> Am Thu, Feb 24, 2022 at 04:56:55PM +0100 schrieb Uwe Kleine-K=F6nig:
> > The newly introduced "triggerevent" attribute allows to restrict
> > blinking to TX or RX only.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> This patch has not been merged, has it?
>=20
> What's the state of it?  Fell through the cracks or denied?
>=20
> I'd have a usecase for it. O:-)

My notes say:

> But... I don't think sysfs interface is acceptable due to "one value per =
file" sysfs rule.
>
> Separate "blink for tx" and "blink for rx" files containing booleans shou=
ld be acceptable.
>
> Best regards,
>                                                                          =
     Pavel


=2E..and that's still relevant:

> > +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> > @@ -4,3 +4,12 @@ KernelVersion:	5.10
> >  Contact:	linux-leds@vger.kernel.org
> >  Description:
> >  		Specifies the tty device name of the triggering tty
> > +
> > +What:		/sys/class/leds/<led>/triggerevent
> > +Date:		Feb 2022
> > +KernelVersion:	5.18
> > +Contact:	linux-leds@vger.kernel.org
> > +Description:
> > +		Can contain "tx', "rx" (to only blink on transfers
> > +		in the specified direction) or "both" (to blink for
> > +		both directions.)

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--6TPbUcMGQllCzDpA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY/fF0AAKCRAw5/Bqldv6
8s2yAKCkPP9GjaGse72B5d74nlWJwaMTmQCgvR2nPHY2qrPPc3udcHqjsl4xLZs=
=p/qU
-----END PGP SIGNATURE-----

--6TPbUcMGQllCzDpA--
