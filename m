Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B28F29A93F
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 11:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409930AbgJ0KLq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 06:11:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51800 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409833AbgJ0KLq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 06:11:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4EF7A1C0B7F; Tue, 27 Oct 2020 11:11:42 +0100 (CET)
Date:   Tue, 27 Oct 2020 11:11:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505
 flash led controller
Message-ID: <20201027101142.GA13900@duo.ucw.cz>
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd>
 <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
 <CADiBU3_HBVa5hNv8VZcdS+pQJYBH6od-8Q7st2126AeBt1zThg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <CADiBU3_HBVa5hNv8VZcdS+pQJYBH6od-8Q7st2126AeBt1zThg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>   Continue the last mail, I'm confused about the rule 80-characters-per-l=
ine.
> I check some information about submitting changes.
> https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-Kernel-Depr=
ecates-80-Col
> Could you help to explain the current rule about this limit? still 80
> characters per line? or it has been changed to 100.

Please see Documentation/process/coding-style.rst .

										Pavel
--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5fyXgAKCRAw5/Bqldv6
8q0+AJ4zw8OcibZx+HWW21z+TirQu49c9ACgt8LsFzTDWG7RdgVjcnOax6ZQ6fE=
=jJZx
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
