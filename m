Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA399441AF6
	for <lists+linux-leds@lfdr.de>; Mon,  1 Nov 2021 12:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhKAMCB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Nov 2021 08:02:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53900 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhKAMCA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Nov 2021 08:02:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 86DEE1C0B76; Mon,  1 Nov 2021 12:59:14 +0100 (CET)
Date:   Mon, 1 Nov 2021 12:59:10 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: Don't emit brightness set error message if LED
 supports hw triggers only
Message-ID: <20211101115910.GA2571@duo.ucw.cz>
References: <f80b57aa-a542-1d6b-50d9-6de0520f2871@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <f80b57aa-a542-1d6b-50d9-6de0520f2871@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> Working on a driver for specific network LEDs that support HW triggers
> only I got error "Setting an LED's brightness failed" when switching
> to a different trigger. This is caused by call
> led_set_brightness(led_cdev, LED_OFF) in led_trigger_set() because
> both brigthness_set callbacks are not implemented. Let's suppress
> the error message in that case.

Hmm... do we have such LEDs in tree? LED supporting only hardware
triggers is kind of unusual/interesting/and I'm not really sure if we
should have them in LED subsystem.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYX/WjgAKCRAw5/Bqldv6
8mllAJ94E7Nxw3EnWZcmH8pYpXJnZbLnlwCcCQ33jw6Y9Csb07oUHAoCOHPDfug=
=fbcp
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
