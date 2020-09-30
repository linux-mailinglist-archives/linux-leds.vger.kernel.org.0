Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B0127F595
	for <lists+linux-leds@lfdr.de>; Thu,  1 Oct 2020 00:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731944AbgI3W6X (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 18:58:23 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:36785 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731925AbgI3W6X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 18:58:23 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MS43X-1jzvgu1kiJ-00TUaQ; Thu, 01 Oct 2020 00:58:03 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kNl2t-00062K-Cz; Thu, 01 Oct 2020 00:58:01 +0200
Date:   Thu, 1 Oct 2020 00:57:58 +0200
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: Re: [PATCH v5 1/3] leds: pwm: Remove platform_data support
Message-ID: <20200930225757.wqz5x4th5ywfeduv@falbala.internal.home.lespocky.de>
Mail-Followup-To: Pavel Machek <pavel@ucw.cz>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
References: <20200919053145.7564-1-post@lespocky.de>
 <20200919053145.7564-2-post@lespocky.de>
 <20200919094418.GC12294@duo.ucw.cz>
 <11962635.BNa8PrgvAO@ada>
 <20200930172441.GI27760@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yyt47db2zqsrg6sc"
Content-Disposition: inline
In-Reply-To: <20200930172441.GI27760@duo.ucw.cz>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 9f5b2199e4483c1fbb1603fea470fc05
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:BbHs86uXUlbtpHhm3N6xgNNBJ9jn1cuANeBXAoc43eRN+FfZ/pl
 xlgt+1HGwWRwqAyv8vPzIVe4EHeKciFA8cSC2k3a5TIyEP1mSgxphLGOhMckxpr2lwXIrop
 VcRhpIquFnd0igPfmjvRWa0nlvgDIDf9A3hXHm0eyJp/X9RUgSpkKKB6O/Rv3rJ8pyp+Yz+
 1PU2xDQWLZ4fseTz6PMhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+g/Ed80ychI=:5/vUrYqICbytgufhV/8ABl
 zhAfAA8rlFarFaf4+GP+20m5ezDKn+0HwJgAi5Mp6GISK8pHLVmtQjrcLnDgVe1tsDFJh6Cf1
 qpgVzZQLICs3VOmu3tBELlBS/LvBmbIdlZEdr2wDutIILkypialwdjOpleo0L3+myXxQ5yt7M
 RUyqnxE7o1GAx205olStgUYEQH3WpTQDYBTwY7VUP3630TWWmgCIH3dL+2IBMv9UJTRVYJUkI
 f35t6IzVqpShnL1kOi+csuq9ZUDk+gMXLUs7xW2Da3wELslgSJXUHtmL40TJYGZqeSAJMNWg1
 TMaNIWYYTGlJrwKspACymXOesEyTpxlVCYOom8GADQsK08qP90+SvljiEz7xO4mO2iT7TcbKm
 B+HoBwBQlCOoNpbJAquUGp0R6K8MMo2LCS/K/dGrVn+WWfLzvvONu+RQUXlwJ1La4AZaZXg+I
 bXyxz+dYk128ArKPv2B79eLmky3H550U6yQuarlGHGNebwxQDXFAJD1tb8KM7ulv+pCb3Pgq7
 laOC9rFTL2A4I0fxNi1rYP3d1UcQzLkXnWCIgwPVqX00rj/65ysbtXYOxcR6q7r43tdLynf60
 XWCbwkM+qwfmgyAcaWwevD9zGPwnolJ78wmRN1hciss/K1p6sLDEuW7cz73riMngUWz6624YH
 INxE1eP96QKU+6evU6TnF+jh1nHTcmsk3SEhIMsm7fGCBefIWpknNh0luCJ/ArvbzaSrV+8Uj
 rf4TBQJxM/LR5VT2Yx7vn7RC8MHQypINe3GgkL7EgTsB3hcuCbox5J7tBxFyBF3RLqydcQDPt
 EYs8e1diX9CvjNgDCVAEy+PZLs8oDypZIBfoeFMfnRvNHfCLYQUP0dfFlpX8nq1m3WRENQM
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yyt47db2zqsrg6sc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Wed, Sep 30, 2020 at 07:24:41PM +0200, Pavel Machek wrote:
> Hi!
>=20
> > > > +__attribute__((nonnull))
> > > >=20
> > > >  static int led_pwm_add(struct device *dev, struct led_pwm_priv *pr=
iv,
> > > > =20
> > > >  		       struct led_pwm *led, struct fwnode_handle *fwnode)
> > > > =20
> > > >  {
> > >=20
> > > This normally goes elsewhere -- right? I'd expect:
> > >=20
> > >=20
> > >   static int led_pwm_add(struct device *dev, struct led_pwm_priv *pri=
v,
> > >   		       struct led_pwm *led, struct fwnode_handle *fwnode)
> > > 	  __attribute__((nonnull))
> >=20
> > I found both variants in kernel code.  I can live with both variants an=
d have=20
> > no strong preference.
> >=20
> > My initial intention to add it was to get a compiler warning in case so=
meone=20
> > does not pass a fwnode here, e.g. when using that old platform_data app=
roach=20
> > (which is supposed to be removed with this patch).  You might call it a=
 self=20
> > check on my own changes.  I can also drop that attribute if you don't w=
ant=20
> > that kind of stuff in linux-leds.
>=20
> I'm okay with it at the second place :-).

Should have tried this before, but I actually did now. O:-)

If I move the attribute behind, I get this on a W=3D1 build:

    CC      drivers/leds/leds-pwm.o
  /home/alex/src/linux/leds/drivers/leds/leds-pwm.c:58:1: error: attributes=
 should be specified before the declarator in a function definition
   static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
   ^~~~~~

Because it won't build then, I'll keep it where it is.  Meanwhile I
worked on all the DT remarks by Rob and I will send v6 soon.

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--yyt47db2zqsrg6sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl91DXAACgkQNK3NAHIh
XMbnyA/8C5bD2L1pLqdwj6Of8uEyInGIK9CDLliDYd1SJ3oDuwkteuAORXEkZWod
43jAPGXfVJq7nOnCGWifWKvIJ2u4u3sW/HFHfDjOM72VCC2KVZb5y9zYEo8yhIBG
iQRs1DCsgw/aZRX/Zd0aIwLY1T3XIM+t+HRQoDetKAodgzdrYgRTPYwPgSo8eXUW
u+MVnhwRtmvHAwkWfLG620RoRRqp0k9ycxYoTJjhKWIztoUx/QlAzZMrO7B9rXgL
YsuKQo/98Hwf1QiJH55hGon+ZmwhbwVyR7O/ogMcCyHWBMX2cMZc+nX1EdzymeXK
RZh5rIKR5iY7Y439g6UKz7Dm249zJkngzArlkHxw0DJpYLyFdD5WPWXTf2znmwMY
Kpyjbi2yR4qpHUFfP4vE3x7fCJ/3oBOHWG03Cd8mjZI7v43CbdVDW1gqVTrt+SSE
aN8fzPedHXmjXfsiVtkE49pvvWLSPiINCNBEYE3e3M/iokFoeY+UMJbX2qu3GgSV
6pR+Nophk0nK3YMLTBf99KGxrCWdF6lzu4poBlzNEfGuI1FWKNo1hTHOYAboWzGB
+Q8SLJ+2vDGl/p1g9usJVZjT43lSgOwHuSc1GaHhvSLGQaQ2dm9StWLBLCBOk94M
FkdBxvaOurmxD10fDTPBM8xEyFYGJalizYXifNjOL9CqAJJc6x0=
=lkEV
-----END PGP SIGNATURE-----

--yyt47db2zqsrg6sc--
