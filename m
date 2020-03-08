Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB117D3BB
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 13:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgCHMhW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 08:37:22 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:43180 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgCHMhW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Mar 2020 08:37:22 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id DA4DFC30A6; Sun,  8 Mar 2020 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583671040; bh=V/sp+rwiY8+wZNF9tnn3Q8hWJ9LkHC1Us1gJNHYj3Gg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=j5pcoIXdoip+mtNKOwtomv2dG4M7gdn0tayTUWXOKfQ3WkSLoGkxiGpwjupwf3mLr
         GSD8v907xldhw0goFZ+fqNHrWr1+dHkmEUzKAeQlqqu82xlGVRHvzbQYdgvtZS4P5s
         DD64g9jWyLDk8AYSrRls8uUFJVEQlx4l3DneqonM=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0EA69C2FFB;
        Sun,  8 Mar 2020 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583671039; bh=V/sp+rwiY8+wZNF9tnn3Q8hWJ9LkHC1Us1gJNHYj3Gg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=T7ro+Dq9yW09rNmIIM8tm6MKlFr/E9S3pdA5n4JCK9KZInmLKBEVo7AIUq7/Q6JQK
         IHbPNRE5eO+lJi43cimI3Dik6ljqvt1W6bXB+V5Ti872Tt/IVPUlfmpYl7qVnENhlj
         kJOBWW3CA3TWtKztegJl92nRCywk6nQ5nMbj3vYo=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
Date:   Sun, 08 Mar 2020 13:37:18 +0100
Message-ID: <3287383.iIbC2pHGDl@g550jk>
In-Reply-To: <20200308121132.GB29321@duo.ucw.cz>
References: <20200227185015.212479-1-luca@z3ntu.xyz> <20200308121132.GB29321@duo.ucw.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Sonntag, 8. M=E4rz 2020 13:11:32 CET Pavel Machek wrote:
> Hi!
>=20
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> >=20
> > This device is controller by two GPIO lines, one for enabling the LED
> > and the second one for switching between torch and flash mode.
> >=20
> > The device will automatically switch to torch mode after being in flash
> > mode for about 250-300ms, so after that time the driver will turn the
> > LED off again automatically.
> >=20
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>=20
> Cc: ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
> Jacek Anaszewski
>=20
> Strange entry in cc list...?

You mean the '~postmarketos/upstreaming@lists.sr.ht' entry with a tilde and=
 a=20
slash character? Both are valid characters in email addresses and you can v=
iew=20
the archive of that mailing list here:

https://lists.sr.ht/~postmarketos/upstreaming

See also https://man.sr.ht/lists.sr.ht/#listssrht-manual

> And btw if you get the dt parts, and simple LED-only driver w/o the
> strobe functinality, you may be able to get it merged rather quickly.
>=20

I'm not really interested in having a torch-only driver merged if a full=20
driver with torch & strobe is already working. For the PinePhone we maintai=
n a=20
separate kernel repository anyways so it doesn't matter much when exactly t=
he=20
driver is going to get merged.

> Best regards,
> 							=09
Pavel

Regards
Luca


