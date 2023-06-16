Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64584733648
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jun 2023 18:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344162AbjFPQlf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jun 2023 12:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjFPQle (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Jun 2023 12:41:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292A71707
        for <linux-leds@vger.kernel.org>; Fri, 16 Jun 2023 09:41:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qACVe-0007RG-0w; Fri, 16 Jun 2023 18:41:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qACVb-007rTD-Jq; Fri, 16 Jun 2023 18:41:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qACVb-00EopP-1G; Fri, 16 Jun 2023 18:41:11 +0200
Date:   Fri, 16 Jun 2023 18:41:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Artur Weber <aweber.kernel@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-pwm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] video: backlight: lp855x: get PWM for PWM mode
 during probe
Message-ID: <20230616164110.euw6n7mmubmav63l@pengutronix.de>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
 <20230429104534.28943-3-aweber.kernel@gmail.com>
 <20230614083953.e4kkweddjz7wztby@pengutronix.de>
 <23f9f004-3e20-67b0-bddc-ab9700968c53@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4mqeubzcqronq6sk"
Content-Disposition: inline
In-Reply-To: <23f9f004-3e20-67b0-bddc-ab9700968c53@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4mqeubzcqronq6sk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 16, 2023 at 05:29:08PM +0200, Artur Weber wrote:
> On 14/06/2023 10:39, Uwe Kleine-K=F6nig wrote:
> > On Sat, Apr 29, 2023 at 12:45:32PM +0200, Artur Weber wrote:
> >> Also deprecate the pwm-period DT property, as it is now redundant
> >> (pwms property already contains period value).
> >>
> >> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> >> ---
> >>  drivers/video/backlight/lp855x_bl.c | 48 ++++++++++++++++-------------
> >>  1 file changed, 26 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backl=
ight/lp855x_bl.c
> >> index 81012bf29baf..21eb4943ed56 100644
> >> --- a/drivers/video/backlight/lp855x_bl.c
> >> +++ b/drivers/video/backlight/lp855x_bl.c
> >> ...
> >> @@ -472,11 +456,31 @@ static int lp855x_probe(struct i2c_client *cl)
> >>  	lp->enable =3D devm_regulator_get_optional(dev, "enable");
> >>  	if (IS_ERR(lp->enable)) {
> >>  		ret =3D PTR_ERR(lp->enable);
> >> -		if (ret =3D=3D -ENODEV) {
> >> +		if (ret =3D=3D -ENODEV)
> >>  			lp->enable =3D NULL;
> >> -		} else {
> >> +		else
> >>  			return dev_err_probe(dev, ret, "getting enable regulator\n");
> >> -		}
> >> +	}
> >> +
> >> +	lp->pwm =3D devm_pwm_get(lp->dev, lp->chipname);
> >> +	if (IS_ERR(lp->pwm)) {
> >> +		ret =3D PTR_ERR(lp->pwm);
> >> +		if (ret =3D=3D -ENODEV || ret =3D=3D -EINVAL)
> >=20
> > Why would you ignore EINVAL?
>=20
> EINVAL is returned when the pwms property is not found in the DT node
> for the backlight. Not sure if there's a better way of separately
> detecting whether it's present (especially when taking into
> consideration non-DT platforms that might use the driver). Would be nice
> to have something like devm_regulator_get_optional but for PWMs...

Ah, that is because of_pwm_get() calls of_property_match_string(np,
"pwm-names", con_id) which returns -EINVAL if there is no pwm-names
property. This is different for clocks. I wonder if pwm should adapt
accordingly? Thierry?

> Still, someone who's setting up the driver could check the debug
> messages to see if the backlight was set up in PWM mode or register mode.
>=20
> > ...
> >> +		pwm_init_state(lp->pwm, &pwmstate);
> >> +		/* Legacy platform data compatibility */
> >> +		if (lp->pdata->period_ns > 0)
> >> +			pwmstate.period =3D lp->pdata->period_ns;
> >> +		pwm_apply_state(lp->pwm, &pwmstate);
> >=20
> > This is a change in behaviour. Before lp855x_probe() didn't modify the
> > state the bootloader left the backlight in. Now you're disabling it (I
> > think). Is this intended?
>=20
> I didn't really consider the implication of this in this way, as on the
> device I was testing this on (Exynos4212-based tablet) the PWM state
> would get reset during PWM chip initialization in the kernel anyways,

Which chip driver is in use here? That's a patch opportunity.

> meaning that the state from the bootloader would be lost regardless of
> this change. Either way, there's no guarantee that this would be the
> same on other devices, though I'd assume that in most cases it's not
> noticeable anyways as brightness is usually set somewhere in userspace
> (or even earlier, in the driver, if the init-brt property is set).
> Nonetheless, that's an oversight on my part.
>=20
> As for the reasoning for this change in behavior - the previous behavior
> was to silently fail if, while setting the brightness, the PWM could not

This sounds wrong.

> be set up. This seemed rather confusing to me (I encountered this while
> I was initially working on the tablet, I added a "pwm" property instead
> of "pwms" and was wondering why the backlight didn't work...)
>=20
> Of course, that could be fixed by adding error detection in the
> brightness set function, but since I was already working on it, it made
> more sense to me for the PWM to be set up during the probing process,
> given that this way we could 1. warn about errors early, and 2. catch
> deferred probes and defer the backlight's probe if we're still waiting
> for the PWM. That's why it's done the way it is in this patch.
>=20
> If this is undesired behavior, let me know and I'll submit another patch
> to revert it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4mqeubzcqronq6sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSMkKYACgkQj4D7WH0S
/k5aIgf/SKGaRvfH39P++n5jjD+2vTiF6VAra1GFSjVbAemXWn/xObeuAuXttlyq
CE+cFGFp+1eFFOLONWN81+8U63juiEjRTcL9N5WKbvZp8M4Pd5UkT416BdpWwS7L
I95v5E6qX4+Khs9cm1j7VzR3u388P+I2RVJVQdW/PMZqVmgroxJDunEjCP5doSFf
ZdWVdbFE2ouPLTk+iphxV3XDjNyFREESRjP9IVK7qu/GE1l6e6NGUNkw0yWySot/
JvnVTvEMx8xv1AbKAHIRa1QtyXaUpx4C2k6GR9evEVRnHH1JB5G9TtuxKXsrU1lo
Zgdg1fCGFoWkoczbrHsYFpyUXw2V2g==
=eNSY
-----END PGP SIGNATURE-----

--4mqeubzcqronq6sk--
