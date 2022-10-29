Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03DF6124E9
	for <lists+linux-leds@lfdr.de>; Sat, 29 Oct 2022 20:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJ2ScQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 Oct 2022 14:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiJ2ScP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 Oct 2022 14:32:15 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDB536BE7
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 11:32:13 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D31D81C0049; Sat, 29 Oct 2022 20:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1667068331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UmFGmbJEviSFcQG9H/9i6TZfSnn/vtzwhwvuO/9rSpU=;
        b=qiwkcV5MuLuRxgVBWyBp028Lt8rk7Sg3t5rcxgHH4C06FTB8VTr3FlUhkat6DcqJZOKfqK
        EHbzy6StPqo6ftBrJCJbKNUpj3VZawEDG5pprogAUj+eNotmvvRsvqlOMap7FwNAW3AJOX
        6awTJUEVnYLCV+ygKfhmF5YDS/ZZ5jc=
Date:   Sat, 29 Oct 2022 20:32:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Proposal: Add color_temperature support
Message-ID: <20221029183211.GA14351@duo.ucw.cz>
References: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
 <20221029165218.GA3337@duo.ucw.cz>
 <CABfF9mNcem--3Yf3wZ8Pgmvq3A4AgAj1tFN9bsQOqfJLtnqhkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <CABfF9mNcem--3Yf3wZ8Pgmvq3A4AgAj1tFN9bsQOqfJLtnqhkQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > On the device Logitech Litra Glow it is possible to set not only the
> > > brightness but also the color temperature (both via usb as well as via
> > > hardware).
> > > I am currently trying to add support for the device - and expose it
> > > via LED - into the kernel.
> > > So to support all device capabilities I am proposing to extend LEDs by
> > > color temperature:
> > > And initial patch for the headers:
> >
> > Internally, the litra glow is something like RGB LED, right? Can we
> > support it as a multicolor LED?
> The litra glow has 2 control dimensions - brightness and color temperatur=
e.
> Both dimensions can be controlled in something of a continuous range
> (not sure whether these are strictly linear or not).
> Thus mapping to RGB would look like more of a very sparse array.
> Also, not sure which exact RGB value you would map a color temperature
> to anyway.
> So at first glance supporting it as a multicolor LED does not seem a
> good match to me.

Hmm, and there are likely to be more lights like this, right? OTOH it
is not really an indicator LED -- using capslock trigger makes little
sense with this one.

I guess it makes sense to support this in LED subsystem. I believe it
should be only supported for "white" LEDs. I believe first step is
defining an userspace API in Documentation.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY11xqwAKCRAw5/Bqldv6
8oX9AJkBcjD6tpE9hpee4FIzkLiiC0i3qACghF+brbjUCu3BBVW0HIXbKURRe6w=
=V53v
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
