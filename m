Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A05F29F3BC
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 19:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgJ2SBJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 14:01:09 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34772 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgJ2SBJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 14:01:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DBEB21C0B7A; Thu, 29 Oct 2020 19:01:05 +0100 (CET)
Date:   Thu, 29 Oct 2020 19:01:05 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, dmurphy@ti.com, robh+dt@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, marek.behun@nic.cz,
        luka.perkov@sartura.hr, andy.shevchenko@gmail.com,
        robert.marko@sartura.hr
Subject: Re: [PATCH v7 0/6] Add support for the IEI WT61P803 PUZZLE MCU
Message-ID: <20201029180105.GD26053@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <20201025005916.64747-7-luka.kovacic@sartura.hr>
 <20201025005916.64747-6-luka.kovacic@sartura.hr>
 <20201025005916.64747-5-luka.kovacic@sartura.hr>
 <20201025005916.64747-4-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr>
 <20201025005916.64747-2-luka.kovacic@sartura.hr>
 <20201025005916.64747-1-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	(RO) Power status indicates the host platform power on meth=
od.
> +		Value mapping (bitwise list):
> +		0x80 - Null
> +		0x40 - Firmware flag
> +		0x20 - Power loss detection flag (powered off)
> +		0x10 - Power loss detection flag (AC mode)
> +		0x08 - Button power on
> +		0x04 - WOL power on
> +		0x02 - RTC alarm power on
> +		0x01 - AC recover power on

It would be nice to put this into standard place somewhere. Many
machines will want to expose this information.

If not, at least spell out WoL, as it is not that common of acronym.

> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_=
status
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	(RO) Host platform AC recovery status value

I can not tell what this is from documentation...

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5sDYQAKCRAw5/Bqldv6
8ug0AJsGzM9m7r1MuCXA0my9+QImUXXpnwCeO978DlwO+JbNb3vDy7HR7o99+7g=
=bm4J
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
