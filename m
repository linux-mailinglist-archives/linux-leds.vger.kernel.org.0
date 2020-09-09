Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4C9263754
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 22:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgIIU3b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 16:29:31 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56439 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgIIU3a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 16:29:30 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.100.135]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MvsN5-1kZHze0Ukh-00syox; Wed, 09 Sep 2020 22:29:17 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kG6iL-0006c9-3z; Wed, 09 Sep 2020 22:29:10 +0200
Date:   Wed, 9 Sep 2020 22:29:07 +0200
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v3 1/2] leds: pwm: Allow automatic labels for DT based
 devices
Message-ID: <20200909202907.3z425uujvu532qxs@falbala.internal.home.lespocky.de>
Mail-Followup-To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Alexander Dahl <ada@thorsis.com>
References: <20200907043459.2961-1-post@lespocky.de>
 <20200907043459.2961-2-post@lespocky.de>
 <20200909090736.GE10891@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7j5jbnrxqkkhowne"
Content-Disposition: inline
In-Reply-To: <20200909090736.GE10891@amd>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: b1198b667d2db641cccf5b3ffa27e5f4
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:q4ciz/d7HvNF3MJSK7E5yv7MFCQV5/j7h6HGs5KycUOVhx1SbuO
 UUn4zs0YM+nLSybDQxt4AEZTZbXN7sAQQRNP5PYjATuIM8uT53Zt8UH4R63nWzEzHZFAClQ
 4Ah0sIr8r+XEYfVK13cxJdj8XvIz13AsMssJRvBC9hK7REOP4/K7s76ZF0KIQlT+vOz7Xwa
 B1SX13XGwZzvqDMJekFNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oTm1+CY9ogc=:Rq4LASjrd37j7HRcX8zjk0
 FWAkcTO/eLT3JO0F6+0QvJ3gViLfPGB5rejBMT47SgXNpp9691EBy4QTbMj0Up2QVkMM4F8EV
 w1yWawXYLjRUyl91iZ6eb3mjyEVKG/bJHyFsLPNXp2o+iawUo0FdgTwCZVy/souTgOt+YqgYA
 yF6eRarp1Uoh0DUSOopH3c33ltmBNJyX8qYoOwAEi5UaJUg6EUO6ZcRSOI+4Z9m6vbdwGU0SU
 ppvWbr9F3cSnVXhgV+xQWM3oq4B1/dFVk1F3JOKULGp4OkqgJp0qpz7JSJUKWIH2Tkq5pf7s+
 YhOso5jwShrjcZsko6PfNZv1ErZSseZD2eHvKQIYXyJwpiLQfvM8wD9zVuNHx1BI0naH9vf/8
 rRlFYUOnakyKV73GZYw8R4YPNpFvMdxsncOluht45AiG+GISec/qo29xUtEUfjWJGhTvmS/o/
 CSVWM/glvSHBTn/xvaFmOItmLHztfyY8TrT5ahOxxJwQUPmdNTe4hHGEVZ+LfiD9CZn0KMTRs
 q3UITI7D2UGl0HRrYWn31r9U9/aadEBIJ0+JY/n/a+z8rFRY09/0UQqdLFuv7Cjk0ZTtcV2EL
 IwkJFhr33TklJFc/LHoWa8DPE42zz6UA+fZFAsJwpN3Ekke3NAdoiPnPMwIQh2HZ4bzlIU5tc
 OSBEO6/Go48OhV5GUFXudoMmNSPBBaq1wIpkrWdiqXko2KMk6WuXgkLLEWZh1JPfifOShBtFH
 mxkeE6tjPdsJ5Pnm+EJRlEWPZjh6sfrX077P/dwf9raktZT7Q9MoYupzPOrrrfLKi2347dTvn
 Zw5o2f7eMqM8GchS+AEuj7Gn4epbtkZ1148Xjir5iHZXM9zdst9CvXRTmp29PlGsJjp6EO7
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7j5jbnrxqkkhowne
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

On Wed, Sep 09, 2020 at 11:07:36AM +0200, Pavel Machek wrote:
> Hi!
>=20
> >  	pwm_init_state(led_data->pwm, &led_data->pwmstate);
> > =20
> > -	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> > +	if (fwnode) {
> > +		init_data.fwnode =3D fwnode;
> > +		ret =3D devm_led_classdev_register_ext(dev, &led_data->cdev,
> > +						     &init_data);
> > +	} else {
> > +		ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> > +	}
>=20
> Can you always use _ext version, even with null fwnode?=20

I did not try on real hardware, but from reading the code I would say
the following would happen: led_classdev_register_ext() calls
led_compose_name(parent, init_data, composed_name) which itself calls
led_parse_fwnode_props(dev, fwnode, &props); that returns early due to
fwnode=3D=3DNULL without changing props, thus this stays as initialized
with {}, so led_compose_name() would return -EINVAL which would let
led_classdev_register_ext() fail, too.

> If not, can you fix the core to accept that? Having that conditional
> in driver is ugly.

It is ugly, although the approach is inspired by the leds-gpio driver.
I'll see if I can come up with a change to led-core, but I'm also open
for suggestions. ;-)

fyi: Peter Ujfalusi answered and would give his Ack to the changed
dual license for the yaml file.  You can expect that for v4.

Stay tuned
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--7j5jbnrxqkkhowne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl9ZOwwACgkQNK3NAHIh
XMZYxA/+IulUzC5gR42kuynkDbBaM43uqyoJJZiKNJJQUR3qM6Z0v/UgTOG1CcY8
uouSnoSC5hMO9bNfxTsdyBPDueqp0yttdBRkPYJs+mIIXfgpx2fDfYpp+G7XnaA0
/aCZ7jNscqYM7stsZXTw9pHCKB/u6uhM7dPpxf4F5GRlqOBbZvBCkoSzX1Tv/lcG
F+P+ssx16KlQycmXmhd2d1o15VCGPljnHV+GGWLMhkOLmN8P5e0vk6fOHrD54nRn
6XS+0rZFFJ3UtXm2z7lNydQWg3wRliQmky3LMMdxgEyGvxsahwqc49YGJtUeN0ue
tjmmN0GSCHUAPAKbxjTnGSFiGDhjjgxqP9RbDsdhc2eCO2Ppge8zCiWMK1rzch8B
e7We5jikLTk19FMhTY15CSmigvKg84hHSCYsUCT/EIS9knA4X6hdoWR3MPRptFQg
ebcagIHr5Jx0cMQ/JY8sSwK6x3T6FAQWT2SQ95NnowxXF2eBOP+zISxKMY5VWZVg
WuRrcbi6n8visLtYqaZP5Y8/5WMd/HkdYPzM8MtczQEBsYEyraIpLNxQDqW2r7OT
qdS0cKywuIkanCybA2vMHsQ+Sd8z7eBvpmQ0bZspQQY/PKl0+vfa4jyzcTe2hcDh
Li4UpqovWXuLyVtzKReBc2mkFoI31u2cW+5jolv+HhP8F0/3OOQ=
=5bMy
-----END PGP SIGNATURE-----

--7j5jbnrxqkkhowne--
