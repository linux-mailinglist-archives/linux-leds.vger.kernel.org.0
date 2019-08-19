Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4767A9271B
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 16:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfHSOip (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 10:38:45 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49710 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfHSOip (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 10:38:45 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D573480BA7; Mon, 19 Aug 2019 16:38:29 +0200 (CEST)
Date:   Mon, 19 Aug 2019 16:38:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Subject: Re: [PATCH v4 4/5] block: introduce LED block device activity trigger
Message-ID: <20190819143842.GA25401@amd>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd>
 <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-08-17 22:07:43, Jacek Anaszewski wrote:
> On 8/17/19 4:55 PM, Pavel Machek wrote:
> > On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
> >> This allows LEDs to be controlled by block device activity.
> >>
> >> We already have ledtrig-disk (LED disk activity trigger), but the lower
> >> level disk drivers need to utilize ledtrig_disk_activity() to make the
> >> LED blink.
> >>
> >> The LED block device trigger doesn't require the lower level drivers to
> >> have any instrumentation. The activity is collected by polling the disk
> >> stats.
> >>
> >> Example:
> >>
> >> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> >=20
> > Lets use one trigger "block" and have the device as a parameter,
> > please.
> >=20
> > We already have 1000 cpu triggers on 1000 cpu machines, and yes, its a
> > disaster we'll need to fix. Lets not repeat the same mistake here.
> >=20
> > I guess it may be slightly more work. Sorry about that.
>=20
> We should be able to list available block devices to set,
> so the problem would be not avoided anyway.

Should we? We need to list triggers, but we may not list all the devices...

> And Greg already proposed
> a solution for trigger file PAGE_SIZE overflow, so this should not pose
> a big problem in the future once that is implemented.

Which still leaves us with pretty big/ugly triggers file... and we do
not have the fix in the tree yet.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1atHIACgkQMOfwapXb+vJUHgCgkeT3UaFwfpz7+MSgycx3Oc4s
Oc8An3rmb4OVTm//ScEzJqndWpDtv96c
=dfr0
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
