Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AE96C6681
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjCWL0x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbjCWL0s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:26:48 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88C72D14F;
        Thu, 23 Mar 2023 04:26:40 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 685231C0E49; Thu, 23 Mar 2023 12:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679570799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dKnyDRR+UFI5c7iPU0LdDPHC2ew5fS37GPbkWRHgQJU=;
        b=omovDMqTUJycuZnP/Lf3SVicxH6g23JkyR8zOBPTIlwa/OjYrGe/BSxbZ+2ymZK8KawbAG
        dR5PuZOuwADJaguAKG4saXk+z0fVMYeAdszt1ng9v+ESeF3knrswtCPyVaGZcbXEJ9Hv4U
        2c/DvjIMuyM4kvHGgu6K7rU2n5qRVR8=
Date:   Thu, 23 Mar 2023 12:26:38 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Message-ID: <ZBw3boAn8j8W8cy7@duo.ucw.cz>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com>
 <ZBw0wiFztPs/LP6r@duo.ucw.cz>
 <c85b376a-e5ff-a2e1-1bea-a9d436b8f42b@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CZ8azhMogOYmiGMG"
Content-Disposition: inline
In-Reply-To: <c85b376a-e5ff-a2e1-1bea-a9d436b8f42b@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CZ8azhMogOYmiGMG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2023-03-23 12:24:05, Hans de Goede wrote:
> Hi Pavel,
>=20
> On 3/23/23 12:15, Pavel Machek wrote:
> > Hi!
> >=20
> >> There are two LED controllers, LEDA indicator LED and LEDB flash LED f=
or
> >> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreove=
r,
> >> tps68470 provides four levels of power status for LEDB. If the
> >> properties called "ti,ledb-current" can be found, the current will be
> >> set according to the property values. These two LEDs can be controlled
> >> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> >=20
> > If the LED can have four different currents, should it have 4
> > brightness levels?
>=20
> No this was already discussed with an earlier version. This is in
> indicator LED output. The current setting is a one time boot configure
> thing after which the indicator LED is either on or off.

Current levels are exponential in that driver. That will result in
rather nice four level. Surely LED does not care if you set it during
boot or later?

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--CZ8azhMogOYmiGMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw3bgAKCRAw5/Bqldv6
8kTaAJ91LhhkQ7obPTe7PKmAmc9LOx1esgCfRHcdSXjjLZkeaOp8CMWz/110o9M=
=Zmej
-----END PGP SIGNATURE-----

--CZ8azhMogOYmiGMG--
