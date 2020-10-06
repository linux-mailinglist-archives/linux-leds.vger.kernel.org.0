Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46772850C1
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 19:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFR02 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 13:26:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55150 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFR02 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 13:26:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 08C401C0B8B; Tue,  6 Oct 2020 19:26:26 +0200 (CEST)
Date:   Tue, 6 Oct 2020 19:26:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <kabel@blackhole.sk>
Cc:     Dan Murphy <dmurphy@ti.com>, ultracoolguy@tutanota.com,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201006172610.GA1836@duo.ucw.cz>
References: <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
 <MItOR9Z--3-2@tutanota.com>
 <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
 <MItjEho--3-2@tutanota.com>
 <20201005173227.GA6431@duo.ucw.cz>
 <20201006093356.6d25b280@blackhole.sk>
 <MIxm3uX--3-2@tutanota.com>
 <144aa75a-4369-cd81-d7dc-2354a9afd7c5@ti.com>
 <20201006164101.2c3fa0d7@blackhole.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20201006164101.2c3fa0d7@blackhole.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >> By the way I just realized that the DT binding in this driver seems
> > >> incorrect to me.
> > >>
> > >> The controller logically supports 3 LED strings, each having
> > >> configurable control bank. =20
> >=20
> > There are two control banks. You can connect the HVLED outputs to eithe=
r=20
> > control bank A or B there is no individual control of the LED strings.
> >=20
> >=20
> > >> But the DT binding supports 2 DT nodes, one for each control bank
> > >> (identified by the `reg` property) and then `led-sources` says which
> > >> string should be controlled by given bank.
> > >>
> > >> But taking in mind that DT should describe how devices are connected=
 to
> > >> each other, I think the child nodes in the binding should instead
> > >> describe the 3 supported LED strings... =20
> >=20
> > The outputs in this case are virtual outputs which are the banks (A and=
 B).
> >=20
> > Since the device is bank controlled the actual current sinks are not=20
> > defined thus making the the banks the actual outputs.
> >=20
> > This is why the 'reg' property defines the control bank either A or B=
=20
> > and the led-sources indicates the strings associated with the control b=
ank.

> Dan, I looked at the datasheet, I understand this.
>=20
> Nonetheless, device tree should describe how devices are connected to
> each other. The chip has 3 pins for 3 LED strings.

Well, device tree is not a device schematics...

> If this controller should be able to support 3 LED strings via 3
> outputs, the device tree binding nodes should, in my opinion, describe
> each pin connected string. The nodes should maybe even be called
> 'led-string@N' where N is from [0, 1, 2].
>=20
> The fact that the device is bank controlled and there are only two
> banks (and it is configurable by which bank each LED string is
> controlled) is more relevant to the driver, not as much to device tree
> binding.

Seems to me like two independend LEDs, and I'd describe it as
such. The fact that it goes over 3 wires is just a implementation
detail. Lets keep it simple...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3yosgAKCRAw5/Bqldv6
8sF6AJ9djAsB19pw03xFkkLaSd7uT/tGFQCgoXaT2KSu0s7VLgQyScGaV1t+698=
=4/S2
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
