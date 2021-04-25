Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DD536A98B
	for <lists+linux-leds@lfdr.de>; Sun, 25 Apr 2021 23:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhDYVjA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 17:39:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52002 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYVjA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 17:39:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E38CD1C0B77; Sun, 25 Apr 2021 23:38:18 +0200 (CEST)
Date:   Sun, 25 Apr 2021 23:38:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: pattern: Switch to using the new API
 kobj_to_dev()
Message-ID: <20210425213817.GG10996@amd>
References: <1616380636-7613-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Content-Disposition: inline
In-Reply-To: <1616380636-7613-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-03-22 10:37:16, Tian Tao wrote:
> Switch to using the new API kobj_to_dev() to fix the below warnning:
> ./drivers/leds/trigger/ledtrig-pattern.c:336:60-61: WARNING opportunity
> for kobj_to_dev()

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF4UkACgkQMOfwapXb+vI6qwCgs8sO5g7lPj/w/OAq6GeGo4IS
3mAAnj3tBcNnqX3w6vk+e15aGaTmVdT6
=tORm
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
