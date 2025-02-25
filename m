Return-Path: <linux-leds+bounces-4073-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458EA431BA
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 01:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D10F18993FC
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 00:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9672634;
	Tue, 25 Feb 2025 00:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPXkgjOx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AFC367;
	Tue, 25 Feb 2025 00:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740442143; cv=none; b=AUj4REcTiamOrye+0bWs9SpQhDUZJ6ZEueAkuJykQedbkIacNdJ+1BPz99PmTkJQZvOpZWTMWeI0HtHY07jSTZ0R2PrlUAZre3goYa9gkAfzGDKWmHdB5lBoL+wi9q+yjKMsQSrw+i0j5lyxO8iVhw3M3vqPQaA5l4yJTJSP/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740442143; c=relaxed/simple;
	bh=oBU8kgz+P91vV6zGeL/bMoDT+t3Cz6ynGLGqLfBWM94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPy9SGz6I0szfffG1YGMqQLFNwLt7UyW6NLBOjHsLotcAU0VaFtI2UN5Fkr3xVyrmiWvCN8nr210floRgmMEJcejtmy8e8eFsL6yh/z6B0zDEaCm5nNPANm7I2rNuhqyIBd5FuJc7wuP2QJPu/rdSPbXtN23e4jvRdzbIDhPDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPXkgjOx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BB2C4CED6;
	Tue, 25 Feb 2025 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740442143;
	bh=oBU8kgz+P91vV6zGeL/bMoDT+t3Cz6ynGLGqLfBWM94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPXkgjOx2PUI5cjyuUQFkDJpiVwzAmHXwyqFgJu2+2R7gERzeJ1O96qUSo5zumR2y
	 DwW6m0/5teuLXZV3C8WNnix9XSfYv6+JVhFTnu4wobgPCgyLnjn+QTEknwOqrJ0IXJ
	 YvxCSf53pGuvguTwt1HPa0uIyll09Rn9Lk10TBCDemWi5CfGBh/dJdhqxuHlCPvjtT
	 inpuJ9/EBjy6Ax8IQfEWV8cH4KqH6dgEhBiywTCwB96D0STPUW5by/YtoDYBbuxSGI
	 dhVsl6tKfaK5SlCGagR7aWbgoieATq+ac+GvJ8rquw93mAtNDtw8gtbM0TYu8qjmzE
	 hsupXIbgIEsQg==
Received: by venus (Postfix, from userid 1000)
	id D956018066D; Tue, 25 Feb 2025 01:09:00 +0100 (CET)
Date: Tue, 25 Feb 2025 01:09:00 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Anjelique Melendez <quic_amelende@quicinc.com>, Kamal Wadhwa <quic_kamalw@quicinc.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
Message-ID: <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
 <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
 <Z7zVgeM+7P7SLWIu@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="su4oqueo2btoztqk"
Content-Disposition: inline
In-Reply-To: <Z7zVgeM+7P7SLWIu@linaro.org>


--su4oqueo2btoztqk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
MIME-Version: 1.0

Hi,

On Mon, Feb 24, 2025 at 10:24:33PM +0200, Abel Vesa wrote:
> On 25-02-21 00:35:08, Sebastian Reichel wrote:
> > On Thu, Feb 20, 2025 at 12:31:00PM +0200, Abel Vesa wrote:
> > > Currently, for the high resolution PWMs, the resolution, clock,
> > > pre-divider and exponent are being selected based on period. Basicall=
y,
> > > the implementation loops over each one of these and tries to find the
> > > closest (higher) period based on the following formula:
> > >=20
> > >                           period * refclk
> > > prediv_exp =3D log2 -------------------------------------
> > >                     NSEC_PER_SEC * pre_div * resolution
> > >=20
> > > Since the resolution is power of 2, the actual period resulting is
> > > usually higher than what the resolution allows. That's why the duty
> > > cycle requested needs to be capped to the maximum value allowed by the
> > > resolution (known as PWM size).
> > >=20
> > > Here is an example of how this can happen:
> > >=20
> > > For a requested period of 5000000, the best clock is 19.2MHz, the best
> > > prediv is 5, the best exponent is 6 and the best resolution is 256.
> > >=20
> > > Then, the pwm value is determined based on requested period and duty
> > > cycle, best prediv, best exponent and best clock, using the following
> > > formula:
> > >=20
> > >                             duty * refclk
> > > pwm_value =3D ----------------------------------------------
> > >                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
> > >=20
> > > So in this specific scenario:
> > >=20
> > > (5000000 * 19200000) / (1000000000 * 5 * (1 << 64)) =3D 300
> > >=20
> > > With a resolution of 8 bits, this pwm value obviously goes over.
> > >=20
> > > Therefore, the max pwm value allowed needs to be 255.
> > >=20
> > > If not, the PMIC internal logic will only value that is under the set=
 PWM
> > > size, resulting in a wrapped around PWM value.
> > >=20
> > > This has been observed on Lenovo Thinkpad T14s Gen6 (LCD panel versio=
n)
> > > which uses one of the PMK8550 to control the LCD backlight.
> > >=20
> > > Fix the value of the PWM by capping to a max based on the chosen
> > > resolution (PWM size).
> > >=20
> > > Cc: stable@vger.kernel.org    # 6.4
> > > Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high =
resolution PWM")
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > Note: This fix is blocking backlight support on Lenovo Thinkpad T14s
> > > Gen6 (LCD version), for which I have patches ready to send once this
> > > patch is agreed on (review) and merged.
> > > ---
> >=20
> > Do you know if the pwm duty cycle to pwm value calculation is
> > correct otherwise?
>=20
> Sorry for the late reply.

No worries, I understand this takes time.

> Here is my understanding of the calculation of the pwm value currently
> implemented.
>=20
> First, find the best pre_div, refclk, resolution and prediv_exp by looping
> through all refclk, resolution and prediv possible values, for the
> following formula:
>=20
>                          period * refclk
> prediv_exp =3D log2 -------------------------------------
>                     NSEC_PER_SEC * pre_div * (1 << resolution)
>=20
>=20
> So in DT we set the period to 50000000. For this, as I mentioned in the
> commit message the best refclk is 19.2MHz, the best prediv is 5, the best
> exponent is 6 and the best resolution is 255.
>=20
> So if you use these to compute the period following this formula:
>=20
>=20
>                 NSEC_PER_SEC * prediv * (1 << resolution)
> best_period =3D -------------------------------------------
>                              refclk
>=20
> So in our case:
>=20
> (1000000000 * 5 * (1 << 8) * (1 << 6)) / 19200000 =3D 4266666.6666...
>=20
> So here is where the things go wrong. Bjorn helped me figure this out tod=
ay
> (off-list). Basically, the pwm framework will allow values up to 5000000,
> as specified in the DT, but for then pwm value will go over 255
> when computing the actual pwm value by the following formula:
>=20
>                             duty * refclk
> pwm_value =3D ----------------------------------------------
>                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
>=20
>=20
> So here is how the value 300 is reached (I messed up this next formula in
> the commit message):
>=20
> (5000000 * 19200000) / (1000000000 * 5 * (1 << 8)) =3D 300
>=20
> But if we were to use the best_period determined:
>=20
> (4266666 * 19200000) / (1000000000 * 5 * (1 << 8)) =3D 255
>=20
> So I guess the process of determining the best parameters is correct.
> What I think is missing is we need to divide the requested period (500000=
0)
> to the resolution (255) and make sure the duty cycle is a multiple of the
> result.

Let me try to summarize that:

1. PWM backlight driver requests PWM with 5 MHz period
2. leds-qcom-lpg uses 4.2666 MHz period instead due to HW limits
3. PWM backlight driver is unaware and requests a duty cycle
   expecting the period to be 5 MHz, so the duty cycle can
   exceed 100%

Then the question is: Why is the PWM backlight driver not aware of
the reduced period? It runs pwm_get_state(), so leds-qcom-lpg can
actually report back that it is using 4.2 MHz instead of 5 MHz.

I guess that also means the bug could be avoided by requesting a
period of 4266666 in DT in the first place. Might be an option to
unblock the T14s upstreaming.

Greetings,

-- Sebastian

> Something like this:
>=20
> step =3D period / (1 << resolution)
>=20
> So:=20
>=20
> 5000000 / ((1 << 8) - 1) =3D 19607
>=20
> and then:
>=20
> pwm_value =3D duty / step;
>=20
> Hope this makes sense.
>=20
> Will try this out and respin the patch.
>=20
> >=20
> > I'm asking because the max value is only used for capping, so with
> > this patch the maximum brightness will be reached at around 80% duty
> > cycle (i.e. when the wrap over happens without this patch).
> >=20
> > Locally I'm currently remapping the duty cycle range to the PWM
> > value range, which means the display brightness increases
> > step-by-step until reaching 100% "duty cycle":
> >=20
> > 		val =3D (duty * 255) / chan->period;
> > 		chan->pwm_value =3D min(val, 255);
> >=20
> > But for the backlight control the absolute numbers do not really
> > matter and I have zero knowledge about the chip. So it might be
> > that the controller really can only go up to ~80% duty cycle at
> > these settings?
> >=20
> > Greetings,
> >=20
> > -- Sebastian
> >=20
> > >  drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds=
-qcom-lpg.c
> > > index f3c9ef2bfa572f9ee86c8b8aa37deb8231965490..146cd9b447787bf170310=
321e939022dfb176e9f 100644
> > > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > > @@ -529,7 +529,7 @@ static void lpg_calc_duty(struct lpg_channel *cha=
n, uint64_t duty)
> > >  	unsigned int clk_rate;
> > > =20
> > >  	if (chan->subtype =3D=3D LPG_SUBTYPE_HI_RES_PWM) {
> > > -		max =3D LPG_RESOLUTION_15BIT - 1;
> > > +		max =3D BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) -=
 1;
> > >  		clk_rate =3D lpg_clk_rates_hi_res[chan->clk_sel];
> > >  	} else {
> > >  		max =3D LPG_RESOLUTION_9BIT - 1;
> > >=20
> > > ---
> > > base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> > > change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
> > >=20
> > > Best regards,
> > > --=20
> > > Abel Vesa <abel.vesa@linaro.org>
> > >=20
>=20
>=20

--su4oqueo2btoztqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAme9ChYACgkQ2O7X88g7
+ppnDg//fHupdEHAByjfHwaHWlNK4AdjRJEknvKHKRSUYqr7hHKPV/IDNbilQrxq
Zj6/DAFBQMSkH6MGo2VN6vIBfFvtF/JhWfphLzyS6NMQMd+eCpNKcVy+aq7QuZTU
gzR7j6EmMAaIsS8q3OE/c1I57OIQk1nDKnDNuaf8vHy6jmCNcZNCVyB1qHSsNfg1
WYhbGrf1usl6YVCigauZ2Eqzc04PQfb6CIs/EAnPf6VdcKgH+AJJcfG2rdcWiYn9
6q+6m+CFLzA1Gbu8571VFU+XVHayX72zgUuJ5Ls0gwQv8iHt7DX7lJ2f1t+4WZTr
XuUZSiilZVikOGN/MXoHVsXQSwXYLSbsiUL8FcQR7Dn8y7rm/IZHCUqpcyLYtVm5
4llWJlxB+XXhEaaRc5QO2mDcwu1F3Sqc4+sQhjtx7P0T8SthFZqnNsFpKC3wTV7m
UZ/8opM3kwD6pXQeLgl3+aZ5FTkIf/3EQXbBHqNERXuALEstn1MJBAekJAXKcgrM
lXJb3uVAn8ULjCfZDiETqsWoANYzA1duqf/T8/gP3792b29F8Kkj1uD2LYi3vwHc
RNze6w+c934fzJqK+2sGM0P+WSzIbwNCtkICxFKgVSj6c34d5x9KRza1ZdlnfnKo
DsDjvP0+bfOpKMeJ9gK/01dUjGs9h5THTx1nGfuq8capZIwT6+E=
=Lo0P
-----END PGP SIGNATURE-----

--su4oqueo2btoztqk--

