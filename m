Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F9137136C
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 12:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhECKMa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 06:12:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37388 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbhECKM3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 06:12:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8CE631C0B79; Mon,  3 May 2021 12:11:35 +0200 (CEST)
Date:   Mon, 3 May 2021 12:11:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hannes Reinecke <hare@suse.de>
Cc:     Enzo Matsumiya <ematsumiya@suse.de>, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] leds: trigger: implement block trigger
Message-ID: <20210503101134.GB6621@amd>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-3-ematsumiya@suse.de>
 <7e8da9ec-b3e3-0329-d54c-bb44c4064f0d@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
In-Reply-To: <7e8da9ec-b3e3-0329-d54c-bb44c4064f0d@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Please trim the emails you are responding to.

> >+MODULE_AUTHOR("Enzo Matsumiya <ematsumiya@suse.de>");
> >+MODULE_DESCRIPTION("LED block trigger");
> >+MODULE_LICENSE("GPL v2");
> >+
> >
> As already commented on, this for_each_blk() construct is not a good idea.
> Infact, I guess it would be better if you could invert the logic:
> Not having the block trigger enumerating all devices, but rather let the
> devices register with the block trigger.
> That would have the benefit that one could choose which block device shou=
ld
> be handled by the LED trigger subsystem, _and_ you would avoid the need f=
or
> a for_each_blk() construct.
> Thing is, I don't think that all block devices should be handled by the L=
ED
> trigger; eg for things like 'loop' or 'ramdisk' it is very
> >questionable.

> Downside is that you would need to modify the drivers, but realistically
> there are only very few drivers which should be modified; I would go for
> nvme-pci and the sd driver for starters. Maybe floppy, but arguably that =
can
> omitted as one has a very good audio indicator for floppy accesses
> :-)

And we already have disk activity trigger. Maybe NVMe and SD needs to
be modified to use it?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCPzFYACgkQMOfwapXb+vKPawCfdpv2CRk6cfP28YKt4NNUlih1
NR0An0FymyfhKdJOnOcBYoWFhbxfIiFw
=3zg8
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
