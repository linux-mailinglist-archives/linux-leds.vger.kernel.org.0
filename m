Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238B017A38F
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2020 12:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgCELCB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Mar 2020 06:02:01 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:52142 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgCELCB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Mar 2020 06:02:01 -0500
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 8EC30C3EBA; Thu,  5 Mar 2020 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583406118; bh=A09JhYuXQtiWQSwwySPckNq277KWrsZWySE9b6TpTII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=s2zqd62WGhhJRbiNUaAzO6lQNDZOaLkJJUiU00RDzoE9Y+OzY5aLO/K9MwPLQ/Tqa
         1yw3gKTr+znjBMyIK6RxrMsQLVHYo8ymWDjSWXYvOK1qvIfKfGjPWLwkTRnPR1JFiv
         2c2uwTcTx3D/ixkwLEEfdF0Wtb8w4UYa5UYEzXXI=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (unknown [10.0.11.2])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id B467FC3EB1;
        Thu,  5 Mar 2020 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583406115; bh=A09JhYuXQtiWQSwwySPckNq277KWrsZWySE9b6TpTII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=C5aupyJy9waLsz9CE+dvC8yOrj0oT4kfsSm3Wgx1idF/b/gGbxoeO7dBlVkBZ9Mt5
         tt3q0+x5URr9RgEtcJoTMwpeAyJaWb9tph9pLAyE0c7KhozHGC0bG09+opJtRk9aCU
         0HfCq09ytnu3/pTyFoAyKs+e5gX1tBCto+p7BqnI=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
Date:   Thu, 05 Mar 2020 12:01:49 +0100
Message-ID: <11515555.O9o76ZdvQC@g550jk>
In-Reply-To: <7742f98c-fd96-7f0e-c33c-fbac61a4881c@ti.com>
References: <20200227185015.212479-1-luca@z3ntu.xyz> <7742f98c-fd96-7f0e-c33c-fbac61a4881c@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5372931.DvuYhMxLoT"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--nextPart5372931.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 27. Februar 2020 20:50:40 CET Dan Murphy wrote:
> Luca
> 
> On 2/27/20 12:50 PM, Luca Weiss wrote:
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> > 
> > This device is controller by two GPIO lines, one for enabling the LED
> > and the second one for switching between torch and flash mode.
> > 
> > The device will automatically switch to torch mode after being in flash
> > mode for about 250-300ms, so after that time the driver will turn the
> > LED off again automatically.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> 
> You seem to be missing the devictree bindings doc for the GPIOs.

As written in the initial email:

> I will also write dt bindings for the driver once I have "strobe"
> working.

I was hoping to get some guidance on the code by posting the WIP patch - the 
issues I see are documented in the initial email.

Regards
Luca
--nextPart5372931.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEObrSLwgs2pG6FY/6cthDuJ1N11YFAl5g3B0ACgkQcthDuJ1N
11buvA/+NFLsy6B/FPSdwuK2kinJ9IlHsLxP9npxN6SnuDnNP4VchYVswpz8pYog
YXOMiFpMXIIVSR1mplUUhsWQ2AbuUdKk3sR4Y6lYz2+c07Yozp3Qr3pds5XKd4+9
XSheq/jsrQKO8gPGmoGiivutBHv+LJ8YZ/KjC6NVV0nxR4V5yI0NUWcrJvhd6N8Z
JA3C6wFlg/SYg3b7fCbb0yj3YM6V1HLWwFgrXWZeM0X8//YMeOeTE5eHOcexw92E
1DKrYa02kfIfbwkfqnOM1Q2DNmBNnhgsOs1prRwiBTUjGkeXciuHqELjFIPjN2z6
LDAfWsZlk4UP6XKiRnc4535+TKJub3Mx6YWdpIEhNrk8rxovdIyrHOIjJdH8IP1C
0ZCOsBVxi9o7zyAYqm4uxWJl66WJKU4nVBo7Haq7aR0yU+sIhFkTpB+cpsuSnFDg
/7ram8GZjlU+A+GRRaj7RK9PoDNc6Ic/iodUBqRGD7o7WdRJtmXrw6tB8AQzs5Ih
9A7A1/ayYr/hktPyzn1U/lhJDttqZ6gcMxCQodLcOeZVJ1VLCd75xxpBtZxLjGXg
uKwv5rcr/s4d2ngeJtjoW5kpy09Fim6yKi7LJZ+awPP+pxgpvGDhsLDXBy9kXYIu
ud5ZjRhMRDgSoeJJN+RPMxUxp+R6CoL0ENHIny9+jXwoviE2doE=
=VJcI
-----END PGP SIGNATURE-----

--nextPart5372931.DvuYhMxLoT--



