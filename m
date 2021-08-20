Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858BB3F281B
	for <lists+linux-leds@lfdr.de>; Fri, 20 Aug 2021 10:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhHTIHK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Aug 2021 04:07:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38010 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhHTIHK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Aug 2021 04:07:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C2AF31C0B80; Fri, 20 Aug 2021 10:06:31 +0200 (CEST)
Date:   Fri, 20 Aug 2021 10:06:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: pending patches
Message-ID: <20210820080631.GA22757@amd>
References: <BN9PR12MB538114BC3CA171DD31E420A6AFFD9@BN9PR12MB5381.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <BN9PR12MB538114BC3CA171DD31E420A6AFFD9@BN9PR12MB5381.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I have two pending patches:
> https://patches.linaro.org/patch/432324/ from 2021-05-07

I don't understand this one. Are these normal single-color LEDs, or is
it some kind of weird red/orange/amber/green combination exposed as
single LED?

> https://patches.linaro.org/patch/403538/ from 2021-03-16, which has been =
re-sent.

In this case, I don't think i2c bus number is suitable way to identify
add-on card. Having some way of identifying add-on cards makes sense
(as we'll probably have other vendors having "fault" or "activity"
light on their cards), but those boards will not neccessarily have i2c
on them.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEfYoYACgkQMOfwapXb+vIodACff8AL9el4wMIIxOffcjoe5KXr
Cp0AoINLeCXD1W8oVF0d1bA/Sxa3ssEY
=21N9
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
