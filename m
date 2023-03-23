Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 894636C66BD
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCWLgY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjCWLgX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:36:23 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F49DB;
        Thu, 23 Mar 2023 04:36:22 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7E8861C0E49; Thu, 23 Mar 2023 12:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679571381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l8tBsK/aglzJoKR8FwDU2Igf64c14NEzl7wVBJGWz6A=;
        b=ROEdL/wKEFxeoGKvAk/lEPkY88O/hkRKhS6n1Y9JGFcMLHbD9GzJIQ4CPDicDhSmr2kZA1
        +uOUmlt6kHoaMk2n53AwonDym87V6/N10nG/2ttaxyMn0vzwVGz+nWXmXtG0Wc/GwjA/iK
        X5m3nV8SsTri+DvDKsxbfRSK43DjcLs=
Date:   Thu, 23 Mar 2023 12:36:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Message-ID: <ZBw5tSKcw5WELpJ+@duo.ucw.cz>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com>
 <ZBw0wiFztPs/LP6r@duo.ucw.cz>
 <c85b376a-e5ff-a2e1-1bea-a9d436b8f42b@redhat.com>
 <ZBw3boAn8j8W8cy7@duo.ucw.cz>
 <1a90d0b8-d82d-a31d-3977-43caed9c7a57@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="w2Bcjxvd4LtyCTiT"
Content-Disposition: inline
In-Reply-To: <1a90d0b8-d82d-a31d-3977-43caed9c7a57@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--w2Bcjxvd4LtyCTiT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2023-03-23 12:29:29, Hans de Goede wrote:
> Hi,
>=20
> On 3/23/23 12:26, Pavel Machek wrote:
> > On Thu 2023-03-23 12:24:05, Hans de Goede wrote:
> >> Hi Pavel,
> >>
> >> On 3/23/23 12:15, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>> There are two LED controllers, LEDA indicator LED and LEDB flash LED=
 for
> >>>> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreo=
ver,
> >>>> tps68470 provides four levels of power status for LEDB. If the
> >>>> properties called "ti,ledb-current" can be found, the current will be
> >>>> set according to the property values. These two LEDs can be controll=
ed
> >>>> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> >>>
> >>> If the LED can have four different currents, should it have 4
> >>> brightness levels?
> >>
> >> No this was already discussed with an earlier version. This is in
> >> indicator LED output. The current setting is a one time boot configure
> >> thing after which the indicator LED is either on or off.
> >=20
> > Current levels are exponential in that driver. That will result in
> > rather nice four level. Surely LED does not care if you set it during
> > boot or later?
>=20
> Well for one there is no guarantee the LED can continuously handle
> the maximum configurable LED current and as you rightly point out
> elsewhere in the thread we don't want to be blowing up hw.

hw can support 16mA -> you expose 0, 2mA, 4mA, 8mA, 16mA levels.

hw can support 4mA -> you expose 0, 2mA, 4mA.

Triggers will work with these.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--w2Bcjxvd4LtyCTiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw5tQAKCRAw5/Bqldv6
8kz0AJ9G2Qaj9yA7/8OXsex3T2Ii80RdVwCghRxhemYHg7DoFm9Q9EGQe+wqvDk=
=li/m
-----END PGP SIGNATURE-----

--w2Bcjxvd4LtyCTiT--
