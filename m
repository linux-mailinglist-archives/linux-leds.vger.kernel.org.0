Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6448459B3A5
	for <lists+linux-leds@lfdr.de>; Sun, 21 Aug 2022 13:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiHUL4d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Aug 2022 07:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiHUL4d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Aug 2022 07:56:33 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3142B13EBB
        for <linux-leds@vger.kernel.org>; Sun, 21 Aug 2022 04:56:31 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 757281C0005; Sun, 21 Aug 2022 13:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1661082989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pwZjwHzhHzPEJW7yD0f1MC4sSUHR4h1hSBxUfHMOw30=;
        b=bbVqbpfkJ3A47Yx+y25KodbIVCMFbwq1ZquUO/d174JnUgTUm9RYIuoN2qs0+q8gq4yb32
        OIXkDXNesdCydoVwn33lPyFN6R77Q/IQ601+uN8rH9ocwVjc5XregTkLCGi+veuSpo1/aa
        ukAL2WemNjBBe5P53sRP8abuw7hNurc=
Date:   Sun, 21 Aug 2022 13:56:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Joseph Strauss <jstrauss16@proton.me>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Implementing missing BlinkM LED features
Message-ID: <20220821115628.GA7663@duo.ucw.cz>
References: <20220820230337.wp7gaxzzz4qi56eb@libretux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20220820230337.wp7gaxzzz4qi56eb@libretux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_GREY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The BlinkM LED is a programmable full-color RGB LED with use cases includ=
ing industrial design, hobbyist projects, automotive lighting, and wearable=
s. The device is programmable in that specific commands can be send over I2=
C, including scripts, for more complicated lighting effects. The datasheet =
can be found here: https://static1.squarespace.com/static/5c155684f407b4100=
552994c/t/5c2d20ca0e2e7292108eadf8/1546461407535/BlinkM_datasheet.pdf
>=20
> After glancing through the source code for the existing driver, leds-blin=
km.c, I noticed a TODO for implementing several of the device's key feature=
s, including setting the time adjust, fade speed, and writing and reading s=
cript lines. I would be happy to try implementing and contributing those fe=
atures, but I wanted to hear some of your thoughts on it before I get start=
ed and if you think it would be worth everyone's time.
>=20

Take a look at pattern trigger. If you can implement that with hw
acceleration...

Actually first step may be rgb-aware pattern trigger, then same
interface with hw acceleration.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYwIdbAAKCRAw5/Bqldv6
8tspAJ9e1rWNtt/XJQs3vn/CbI4cQFODtgCeKTuVk/6n9a3s/LkOZgcImuiGKDM=
=nQnf
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
