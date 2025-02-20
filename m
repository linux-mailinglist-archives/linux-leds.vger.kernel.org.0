Return-Path: <linux-leds+bounces-4043-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E5BA3E89B
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 00:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736CE1890D7B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 23:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21E326389E;
	Thu, 20 Feb 2025 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imkeMQ3Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E962B9AA;
	Thu, 20 Feb 2025 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094511; cv=none; b=YeHz4wafAAr7m6ZmJwt+QjsThOEasdsIgv54Q82z6KIkfAKG0eLlrrFYI3ET99HSai/IABWqwLrllGb3meq4wXbq2/3bA/0NQfjKcIJRQXTZ/li5ltaNm+Xe3D7MYuZfQV+N+LIqxkl0g/sjg54p6zEzUwmE6d/pBIVSEQ16/1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094511; c=relaxed/simple;
	bh=vDbFPgYLs3Dh+pLGeUj+/9uv1LsV9XAX1PMo5PrPSo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEzxrb/UShrtRdQKYAbSD/ywpIkue2Zm8gNuCo5mzBCFG54jXs5jEnl/21g9Gg2B/K+K239S6ck55AFZSBbFlOhOrGdJmHYiRnvlGkIjg7sw0qUS6d7FS8bnOEdhSEteT0qS2yRzfO+zIFPto7M942whEcuL0/KN4EEu7wZg0tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imkeMQ3Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5F1C4CED1;
	Thu, 20 Feb 2025 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740094510;
	bh=vDbFPgYLs3Dh+pLGeUj+/9uv1LsV9XAX1PMo5PrPSo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imkeMQ3YU/uAeUe9/68TodnpjTIj9uneAGUEnLJgHwYW+AftLota0iaaTrPVQOuhv
	 24xfoZ5YJsb5O9N1B11FIDDt8X3hUqTw8M1VxMTsSYatFb5ZTTRKT7zL/GqgIsqBpV
	 hKwKaqpEl1OgF3edaj8Q4ZDF3VEcDZ2GQnfRMK1XWgXjhWullVZ35juB0wBm8+zOw7
	 RSg7d6M23Zltrqbosj6xkBmiLbJfYuIVniJ5GkMr2YJfxFfh+GiNkg51RyiCcahICo
	 3unWLQOO2STR/7+5veS1cHwGWI0BX1p1HV2ed9JViHcDT7+VJ0hwJ0SmCTEjfxyrgx
	 w+2sBX4ojazqw==
Received: by venus (Postfix, from userid 1000)
	id 9CB681835EB; Fri, 21 Feb 2025 00:35:08 +0100 (CET)
Date: Fri, 21 Feb 2025 00:35:08 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Anjelique Melendez <quic_amelende@quicinc.com>, Kamal Wadhwa <quic_kamalw@quicinc.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
Message-ID: <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ib536mwduc7v4jwc"
Content-Disposition: inline
In-Reply-To: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>


--ib536mwduc7v4jwc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
MIME-Version: 1.0

Hello Abel,

On Thu, Feb 20, 2025 at 12:31:00PM +0200, Abel Vesa wrote:
> Currently, for the high resolution PWMs, the resolution, clock,
> pre-divider and exponent are being selected based on period. Basically,
> the implementation loops over each one of these and tries to find the
> closest (higher) period based on the following formula:
>=20
>                           period * refclk
> prediv_exp =3D log2 -------------------------------------
>                     NSEC_PER_SEC * pre_div * resolution
>=20
> Since the resolution is power of 2, the actual period resulting is
> usually higher than what the resolution allows. That's why the duty
> cycle requested needs to be capped to the maximum value allowed by the
> resolution (known as PWM size).
>=20
> Here is an example of how this can happen:
>=20
> For a requested period of 5000000, the best clock is 19.2MHz, the best
> prediv is 5, the best exponent is 6 and the best resolution is 256.
>=20
> Then, the pwm value is determined based on requested period and duty
> cycle, best prediv, best exponent and best clock, using the following
> formula:
>=20
>                             duty * refclk
> pwm_value =3D ----------------------------------------------
>                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
>=20
> So in this specific scenario:
>=20
> (5000000 * 19200000) / (1000000000 * 5 * (1 << 64)) =3D 300
>=20
> With a resolution of 8 bits, this pwm value obviously goes over.
>=20
> Therefore, the max pwm value allowed needs to be 255.
>=20
> If not, the PMIC internal logic will only value that is under the set PWM
> size, resulting in a wrapped around PWM value.
>=20
> This has been observed on Lenovo Thinkpad T14s Gen6 (LCD panel version)
> which uses one of the PMK8550 to control the LCD backlight.
>=20
> Fix the value of the PWM by capping to a max based on the chosen
> resolution (PWM size).
>=20
> Cc: stable@vger.kernel.org    # 6.4
> Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high reso=
lution PWM")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Note: This fix is blocking backlight support on Lenovo Thinkpad T14s
> Gen6 (LCD version), for which I have patches ready to send once this
> patch is agreed on (review) and merged.
> ---

Do you know if the pwm duty cycle to pwm value calculation is
correct otherwise?

I'm asking because the max value is only used for capping, so with
this patch the maximum brightness will be reached at around 80% duty
cycle (i.e. when the wrap over happens without this patch).

Locally I'm currently remapping the duty cycle range to the PWM
value range, which means the display brightness increases
step-by-step until reaching 100% "duty cycle":

		val =3D (duty * 255) / chan->period;
		chan->pwm_value =3D min(val, 255);

But for the backlight control the absolute numbers do not really
matter and I have zero knowledge about the chip. So it might be
that the controller really can only go up to ~80% duty cycle at
these settings?

Greetings,

-- Sebastian

>  drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index f3c9ef2bfa572f9ee86c8b8aa37deb8231965490..146cd9b447787bf170310321e=
939022dfb176e9f 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -529,7 +529,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, u=
int64_t duty)
>  	unsigned int clk_rate;
> =20
>  	if (chan->subtype =3D=3D LPG_SUBTYPE_HI_RES_PWM) {
> -		max =3D LPG_RESOLUTION_15BIT - 1;
> +		max =3D BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;
>  		clk_rate =3D lpg_clk_rates_hi_res[chan->clk_sel];
>  	} else {
>  		max =3D LPG_RESOLUTION_9BIT - 1;
>=20
> ---
> base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
>=20
> Best regards,
> --=20
> Abel Vesa <abel.vesa@linaro.org>
>=20

--ib536mwduc7v4jwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAme3vCgACgkQ2O7X88g7
+polIg/+Nt3NuaLC7/BjrWUxWjMjVFSgg3FpMxvr8NKnSN0K7EC7EPm8LHUh303U
IHd3crTl0J9+BiMSkVCoUerrFQl71M6YZuzIWuRMuizEoqTV0wimGmqfOWu7WAEY
hS4wYwLCpJONDTfEC/oGjDWkQYWivfXQbuTGbL2NifiDfg4CmEJBnStXWzSA6jtJ
Euu2192iAH/g/hdNmh6mJWuyPT1SxSPBaMYjj+li18+rjcpU3F4dHXiwXqJysO/4
NnqAKLRPagTI0f9tC4irutqMztCMzzG62LHF70v4X/pwu7IOCmnUl9vz558LCesn
THlxbIab98rPShtyuaMGlk1+nhEMLFa8lib7tI4pQyVvyo1lhz3C/lkrfWGrEYU/
Nhrb0+HUYs9CTttEvG8qwqN9eHhGXNpAInygOQkCn4vao5pdcDuqJnsTL3JokQUr
OoXnQh7bz9g1s0u3nScnqhkHPV/8mqgmCZ5HAHbyE0fFX9VYUdHfranS3/GZCjiD
l5xIh7YtL3kS0j4sxIJ5GQUpxSCz2HW4Jegt10Xi0Ne/u6n6WsPviSt96sZsNXpc
N7igwR6OrQ5q31jswifedrg26VWdvlM3jc6jVR19H4JjcezkgOy3DxTKe0zJDMGU
yTSWQWboaGoyVAC0Sp3B0rArGq3FZg9sRTbHNWTSSZX2zNOZz1c=
=3tgX
-----END PGP SIGNATURE-----

--ib536mwduc7v4jwc--

