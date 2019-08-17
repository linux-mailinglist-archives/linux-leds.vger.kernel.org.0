Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B72910EE
	for <lists+linux-leds@lfdr.de>; Sat, 17 Aug 2019 16:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfHQOzM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Aug 2019 10:55:12 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39480 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfHQOzL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Aug 2019 10:55:11 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 654A1811A5; Sat, 17 Aug 2019 16:54:56 +0200 (CEST)
Date:   Sat, 17 Aug 2019 16:55:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Subject: Re: [PATCH v4 4/5] block: introduce LED block device activity trigger
Message-ID: <20190817145509.GA18381@amd>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
> This allows LEDs to be controlled by block device activity.
>=20
> We already have ledtrig-disk (LED disk activity trigger), but the lower
> level disk drivers need to utilize ledtrig_disk_activity() to make the
> LED blink.
>=20
> The LED block device trigger doesn't require the lower level drivers to
> have any instrumentation. The activity is collected by polling the disk
> stats.
>=20
> Example:
>=20
> echo block-nvme0n1 > /sys/class/leds/diy/trigger

Lets use one trigger "block" and have the device as a parameter,
please.

We already have 1000 cpu triggers on 1000 cpu machines, and yes, its a
disaster we'll need to fix. Lets not repeat the same mistake here.

I guess it may be slightly more work. Sorry about that.

								Pavel

> +++ b/include/linux/leds.h
> +#else
> +
> +struct ledtrig_blk {
> +};
> +

Is the empty struct neccessary?

> +static inline void ledtrig_blk_enable(struct gendisk *disk)
> +{
> +}
> +
> +static inline void ledtrig_blk_disable(struct gendisk *disk)
> +{
> +}
> +
> +static inline int ledtrig_blk_register(struct gendisk *disk)
> +{
> +	return 0;
> +}
> +
> +static inline void ledtrig_blk_unregister(struct gendisk *disk)
> +{
> +}

Normally we put such empty functions on single lines...

Best regards,
									     Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1YFU0ACgkQMOfwapXb+vIGPQCglZkw8NZthvlINOkCpWU1QMNO
MMgAn3a+ksIdc1KjC9wzh3owNpIMKsXc
=mrgh
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
