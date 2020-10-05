Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3446F283CC3
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 18:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgJEQs2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 12:48:28 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54155 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgJEQs1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 12:48:27 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mt7Ll-1kefAB3JdZ-00tSGa; Mon, 05 Oct 2020 18:48:18 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kPTep-0001BC-Fc; Mon, 05 Oct 2020 18:48:16 +0200
Date:   Mon, 5 Oct 2020 18:48:09 +0200
From:   Alexander Dahl <post@lespocky.de>
To:     ultracoolguy@tutanota.com
Cc:     Dan Murphy <dmurphy@ti.com>, Marek Behun <kabel@blackhole.sk>,
        Pavel <pavel@ucw.cz>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
Mail-Followup-To: ultracoolguy@tutanota.com, Dan Murphy <dmurphy@ti.com>,
        Marek Behun <kabel@blackhole.sk>, Pavel <pavel@ucw.cz>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
References: <MIiYgay--3-2@tutanota.com>
 <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
 <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
 <MItOR9Z--3-2@tutanota.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p4smv534jr5zd6uk"
Content-Disposition: inline
In-Reply-To: <MItOR9Z--3-2@tutanota.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 213f183a7948bc1bd4a9a459d13174ae
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:PpBe/CHBNNBcQvTXlr0+KYvqDdss0GqQg1KAeBeSyUgR0tgYBJs
 uTGO6H4NytUAZ79KBa2EnLOrthyScnL93qv6uuZNFQouip3LlWGfyXX7nEpF4vMJTw5tB2L
 ADBm6N6L1Qw8yLXd1cyGm6Iuujy3f4PxDTM/8ZMomEqDBUYOv6AUnTXk3M1BZHY/Qp2zfTp
 G3t6aBTmH1iG7zutOBWoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K7CYGi68NQw=:3GkiZFY6xP+kv5mdk5srHc
 IWTDBfkWwjawvAUfO8Tf1BmYl+04N7ZWrDdydTTqaY6YymRwrybFLaAOsKXZBCv3UDTBtGKdL
 W4jVSGTLui9EQQH0DgL0hlYicmRZpGO5evqW97OIjfP8GthGutJtVycRuhn5wwFY1QwZyhxX1
 OLXXxzjn6MKt6wQkFx1Qivw56prfLd+egS9o8bprSwK/EvurE9sjt3J5SK0Jw79t3yHJSgKyo
 k7UitXD7Uu9y9g1iLq3qhYHI3ymYFQ6hT3xsdiPUR6CsmpkkrjjxnWuJ6PM2hCkiM6+G9orwn
 tpt5pcY7sRnGLqnSDjLgnXdIwoCgP6hzBMmnTbzrAvESteBR6VhnmJG6kpUQKbWlcwEODj+mf
 lreiY1EPVDcpRo7O/RdbRmfNU4NPrKBZWpXuc8nBzWZ0JL1gdvTmYUqkyjo27E8i2GAe+V+cZ
 OxtNlSncXdjMi8hYFx9KzJp9D6MiqqFRDdbLR2yijzrackeEuY8W0JxyJbUIN46RqyR7/oBLS
 9PB91PRWTPjVcVzyQugSGgqtzGrCBrFRxMsnacSO18vaKvs9YKfvFlyGyiIZXsqwlUbgmSSP8
 BBDtzSx2C8njdq87ADpCN/fImMDor3V3XbixIBSvf+zJt+qwLIeSZN5E/8oVxpuqXzJN7uepQ
 bdW1u8lxP41Cqu0xSJ6Vih9BeE5jD4h1CB1Xjsi0/xcXhOnGvKf37AuHlkrWdRtKeZeW0UUWu
 v+obEczxYtjVpNl2XTKmSPOMK3AYKAJ0Jv7Uh2ztb1LrD0DSFVR4Fxf06jT7qu3WsqrNdrXqf
 exB+yLc9nZ855/K1lWXIFkbUS3t7VWrIcBTVGhPuvW86JBkDCJ5kdIWPd98r4uwkHN/f1nf
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--p4smv534jr5zd6uk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

On Mon, Oct 05, 2020 at 05:35:38PM +0200, ultracoolguy@tutanota.com wrote:
> Well, the major benefit I see is that it makes the driver slightly
> more readable. However I'm fine with whatever you guys decide.
>=20
> I'll attach the patch with the struct renaming removed just in case.

Note: your patch, especially the commit message, still needs a
Signed-off-by line.  Please read [1] (again?) and resend.

Greets
Alex

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> Oct 5, 2020, 14:41 by dmurphy@ti.com:
>=20
> > Gabriel
> >
> > On 10/5/20 9:38 AM, ultracoolguy@tutanota.com wrote:
> >
> >> I understand. So I should leave it like it was and do the rename in an=
other patch?
> >>
> >
> > You should do the fix in one patch and leave the structure name alone.
> >
> > The structure naming if fine and has no benefit and actually will make =
it more difficult for others to backport future fixes.
> >
> > Unless Pavel finds benefit in accepting the structure rename.
> >
> > Dan
> >
>=20

> >From ee004d26bb2f91491141aa06f5518cc411711ff0 Mon Sep 17 00:00:00 2001
> From: Ultracoolguy <ultracoolguy@tutanota.com>
> Date: Fri, 2 Oct 2020 18:27:00 -0400
> Subject: [PATCH] leds:lm3697:Fix out-of-bound access
>=20
> If both led banks aren't used in device tree,
> an out-of-bounds condition in lm3697_init occurs
> because of the for loop assuming that all the banks are used.
> Fix it by adding a variable that contains the number of used banks.
> ---
>  drivers/leds/leds-lm3697.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 024983088d59..bd53450050b2 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -78,8 +78,9 @@ struct lm3697 {
>  	struct mutex lock;
> =20
>  	int bank_cfg;
> +	int num_banks;
> =20
> -	struct lm3697_led leds[];
> +	struct lm3697_led banks[];
>  };
> =20
>  static const struct reg_default lm3697_reg_defs[] =3D {
> @@ -180,8 +181,8 @@ static int lm3697_init(struct lm3697 *priv)
>  	if (ret)
>  		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
> =20
> -	for (i =3D 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
> -		led =3D &priv->leds[i];
> +	for (i =3D 0; i < priv->num_banks; i++) {
> +		led =3D &priv->banks[i];
>  		ret =3D ti_lmu_common_set_ramp(&led->lmu_data);
>  		if (ret)
>  			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
> @@ -228,7 +229,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  			goto child_out;
>  		}
> =20
> -		led =3D &priv->leds[i];
> +		led =3D &priv->banks[i];
> =20
>  		ret =3D ti_lmu_common_get_brt_res(&priv->client->dev,
>  						child, &led->lmu_data);
> @@ -307,16 +308,17 @@ static int lm3697_probe(struct i2c_client *client,
>  	int ret;
> =20
>  	count =3D device_get_child_node_count(&client->dev);
> -	if (!count) {
> -		dev_err(&client->dev, "LEDs are not defined in device tree!");
> -		return -ENODEV;
> +	if (!count || count > LM3697_MAX_CONTROL_BANKS) {
> +		return -EINVAL;
>  	}
> =20
> -	led =3D devm_kzalloc(&client->dev, struct_size(led, leds, count),
> +	led =3D devm_kzalloc(&client->dev, struct_size(led, banks, count),
>  			   GFP_KERNEL);
>  	if (!led)
>  		return -ENOMEM;
> =20
> +	led->num_banks =3D count;
> +
>  	mutex_init(&led->lock);
>  	i2c_set_clientdata(client, led);
> =20
> --=20
> 2.28.0
>=20


--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--p4smv534jr5zd6uk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl97TkQACgkQNK3NAHIh
XMZaKhAAiGx6VGY3ZACESbdVkHBTTJc0bUz7fa8eUhseCeQZMxYmoj5hc02diZTb
GBrYnoc13tXSO6gYCY/Jt5J/i5nwF94dwtSd/6a9/C+B6XiOgqqOhmFNoAMPQWGP
UTJrpaCT4mSBjlkIxNlBt1LLA5skVp2T+oL1WZV8EKiCXhgfZQS6n131y0ijE70D
wuzhfoGOMZK7KFtnEMvIUfpOWENxQZvB4oVEPwsvsvhRQ+9mwyjd+n8m2vueCUQw
PCFKTeUqLs+sas3x/QEFofxDDMOiVwHjAlwGAvKkLEEYZu/lrlelSd8MhToS0STe
Sh+LgzBOd7NoXa19XP8UBvLuJCjI9eQSjomv11Znw+SLQxTICn6p6tpVLYOhYtY0
M6i3rNq4EIYJmeQqfyzdBxe0n27BY4KwtWJ6lCCc/GwQXzK6k0gFDMmmQDNkTl21
xxj9YUrLFxYOO/kKhNQKfUpkfTzlZtX24WGaWCNxauKimhhBX7DR3mJUvuArFEBS
9I7VZNEiz12ndzw2bPmJ2vjkFmdgK7+UT1t0XzotD6BAukXo+EzMFs/0PVQ//xlo
+6RwIMDxlBS+Ezxon3pWif33AyUVkSvhExYg1kIoyTp9O0fJmpSb0XBihaNdXDAu
52RfeXkBd25f68ETPu0IkhTeC50Cp/FSw4ADJ88dyX6Cpthd1XY=
=dYJ2
-----END PGP SIGNATURE-----

--p4smv534jr5zd6uk--
