Return-Path: <linux-leds+bounces-4106-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956FA479A9
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 10:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406E63B2C74
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E94C21B192;
	Thu, 27 Feb 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IWq1xeX/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6D228CA5
	for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650335; cv=none; b=VAeJIFVQ19/Fko2YEEkC+IYNcnjBTqx/9ukFCuTg1FYwaRUb0Rw9dFOFNHw1iUAdILnDWyUxUfZ4v8v7CDMi4HsxE3XiF6Xw9QBh/0E/+8UE0+Tmcz+YsNLDUsQNTqv2+XM/x0A6ZZin/FBbS1lRqxJK5/wiaOAMN5oDJcvSAfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650335; c=relaxed/simple;
	bh=LVEnZcUngYqfe5dp9+WHbzV3vUZ1hd679ph7F71Gt4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rl59ZOkQeIoPiDoHxrkhBoI+Z8cD4Pe6Svlkytnyb69OSYpATUYPRCp0ruVDVBnPgnP2zX4XS6FLTcm0r1Mm+RFVfOmfw3LC+N4LC8hMHhx/LY/nzJH0yKgZ6rkiBC8l3jGa3m3J+0FrzobW8OPzGlMnpWkuxZDkph2DKIZ7ZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IWq1xeX/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbac134a19so104632066b.0
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740650331; x=1741255131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7J+E2Gx3hCnyd4BeJgCtnWWxfQu+1wq2ZqoJsA7+a4s=;
        b=IWq1xeX/dZ4dTZ1Tj+SXzPSiElfias0NKblQ+GqxaMq4ykvWcDfenelXoNYRzrnUkM
         fbk1CpnJrgxpGV43C8iXEz38bePTVhLZer0jgfo6ZLw1T1Sy8C2iaVciTpG+k8Rr7HZ2
         p/qW7q9e7ETLDWMrTrGmyfY44vb6qaGf30ydX4TJ/DHBB+Eo4uoYIrwTfKPeyBvTNbmQ
         Gihhj8iJL7kdfW9WW+Sg0iZm8Ux5zl9xV17ADsrk38oQj8TQDbH8KrVRJ1u55Uroanog
         2BWucD6sJ2qbOeGxOSrtHGHsEIYHcmbyjeYN2QudA+Y2bKGnqFWhiQb3a9Md9GzhLsEm
         hBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650331; x=1741255131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J+E2Gx3hCnyd4BeJgCtnWWxfQu+1wq2ZqoJsA7+a4s=;
        b=n5hfctVbY+JZBfOZhINMi4V4hPFSMfCxAQ9943Bdq5BZ+CwBkBQ1RJtMZRxjrjxZFi
         +quQb2E5MR2C8u6DYu/DkpD30njoCse1/icPAOnr/2hWkntOsTXFS2YRs156917UGy27
         ju5SEtqhCIk/9PAnlWyKODQqD2+TZeRCQ9AGgRvkO5uzvn1GmWHYLur7HK8LBXVeZ1zE
         VofgAUw0mRfw8uVolE+hDXiy9mS8FvjbTl49mURkWS+yazDac2QpJgM19JICubmC0ncF
         ouEgwPXqlEV8WbU/cP3eQaVzfqEY+e+3qtGl1N61lvqOM0bFVeQtty50e1QwlKcFuNRv
         EtPw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6y9Z9LS7u6dDGk6bSF5xJpZKqta9ZSL+TbjBDUCsPknyqTy2heKIZzlfc6TDZcRT+uDzAJ1Rx7E1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5tGw8HE3lz/fxsey1U0QYvyrmy7FfR3RNjYTbSJDrizd4aV/s
	CdIk9Q4K6VUxgqeqn3BO4l/xuPap/Uxpsm2foyxdOMQSsdD5yYMC16iHKbseb/4=
X-Gm-Gg: ASbGncthtpj6anFRUlsU0GVNF0yOLXVKgAN34AxPehqP0/n3FvzpVmOaRVYFWb1R0RG
	NC6gIrleKA+5jFph2+ntLaGBbht1+FprfL3h5YNX3e86E+pQZf2GAIwrA/p2aCa/dnrIqccBIgc
	4tOzyec5TSFC/EFEnZAf7mCbgRSKIlqZ0n3qreqOZR0awXh5W+R9I/Fw5zn2JH+8vHaGr6kKb3l
	QcIbR72lRN5sv2bgeJ968exCV5qWeqMtDvUa4qHnHlDStFnY8GirxCy6bvPZRbyo2ATI8Eg1BEj
	XiB5hFPYih7DWo36Ogya8idR3S8OG47tE46fXHUAcIiQGl6rtQ5UdrY77pyb0R+3nfZ4
X-Google-Smtp-Source: AGHT+IEQc8GL4ZFIAPYJAnXnctlA/znV6Ay89JUxzHHTfb6XQ9a7TyalDh4OWbGea9chE40xcXbTeA==
X-Received: by 2002:a17:907:7fa5:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-abed0cbe7d6mr1025749966b.14.1740650331153;
        Thu, 27 Feb 2025 01:58:51 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bc8800sm876857a12.48.2025.02.27.01.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:58:49 -0800 (PST)
Date: Thu, 27 Feb 2025 10:58:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, 
	Kamal Wadhwa <quic_kamalw@quicinc.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
Message-ID: <5euqboshlfwweie7tlaffajzg3siiy6bm3j4evr572ko54gtbv@7lan3vizskt3>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
 <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
 <Z7zVgeM+7P7SLWIu@linaro.org>
 <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
 <Z7161SzdxhLITsW3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nr5ltixjdluytq45"
Content-Disposition: inline
In-Reply-To: <Z7161SzdxhLITsW3@linaro.org>


--nr5ltixjdluytq45
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
MIME-Version: 1.0

Hello,

I was dragged into the discussion by the patch that Abel Vesa created in
reply to this mail, i.e.
https://lore.kernel.org/linux-pwm/20250226-pwm-bl-read-back-period-from-hw-=
v1-1-ccd1df656b23@linaro.org/

On Tue, Feb 25, 2025 at 10:09:57AM +0200, Abel Vesa wrote:
> On 25-02-25 01:09:00, Sebastian Reichel wrote:
> > On Mon, Feb 24, 2025 at 10:24:33PM +0200, Abel Vesa wrote:
> > > On 25-02-21 00:35:08, Sebastian Reichel wrote:
> > > > On Thu, Feb 20, 2025 at 12:31:00PM +0200, Abel Vesa wrote:
> > > > > Currently, for the high resolution PWMs, the resolution, clock,
> > > > > pre-divider and exponent are being selected based on period. Basi=
cally,
> > > > > the implementation loops over each one of these and tries to find=
 the
> > > > > closest (higher) period based on the following formula:
> > > > >=20
> > > > >                           period * refclk
> > > > > prediv_exp =3D log2 -------------------------------------
> > > > >                     NSEC_PER_SEC * pre_div * resolution
> > > > >=20
> > > > > Since the resolution is power of 2, the actual period resulting is
> > > > > usually higher than what the resolution allows. That's why the du=
ty
> > > > > cycle requested needs to be capped to the maximum value allowed b=
y the
> > > > > resolution (known as PWM size).
> > > > >=20
> > > > > Here is an example of how this can happen:
> > > > >=20
> > > > > For a requested period of 5000000, the best clock is 19.2MHz, the=
 best
> > > > > prediv is 5, the best exponent is 6 and the best resolution is 25=
6.
> > > > >=20
> > > > > Then, the pwm value is determined based on requested period and d=
uty
> > > > > cycle, best prediv, best exponent and best clock, using the follo=
wing
> > > > > formula:
> > > > >=20
> > > > >                             duty * refclk
> > > > > pwm_value =3D ----------------------------------------------
> > > > >                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
> > > > >=20
> > > > > So in this specific scenario:
> > > > >=20
> > > > > (5000000 * 19200000) / (1000000000 * 5 * (1 << 64)) =3D 300
> > > > >=20
> > > > > With a resolution of 8 bits, this pwm value obviously goes over.
> > > > >=20
> > > > > Therefore, the max pwm value allowed needs to be 255.
> > > > >=20
> > > > > If not, the PMIC internal logic will only value that is under the=
 set PWM
> > > > > size, resulting in a wrapped around PWM value.
> > > > >=20
> > > > > This has been observed on Lenovo Thinkpad T14s Gen6 (LCD panel ve=
rsion)
> > > > > which uses one of the PMK8550 to control the LCD backlight.
> > > > >=20
> > > > > Fix the value of the PWM by capping to a max based on the chosen
> > > > > resolution (PWM size).
> > > > >=20
> > > > > Cc: stable@vger.kernel.org    # 6.4
> > > > > Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for h=
igh resolution PWM")
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > > Note: This fix is blocking backlight support on Lenovo Thinkpad T=
14s
> > > > > Gen6 (LCD version), for which I have patches ready to send once t=
his
> > > > > patch is agreed on (review) and merged.
> > > > > ---
> > > >=20
> > > > Do you know if the pwm duty cycle to pwm value calculation is
> > > > correct otherwise?
> > >=20
> > > Sorry for the late reply.
> >=20
> > No worries, I understand this takes time.
> >=20
> > > Here is my understanding of the calculation of the pwm value currently
> > > implemented.
> > >=20
> > > First, find the best pre_div, refclk, resolution and prediv_exp by lo=
oping
> > > through all refclk, resolution and prediv possible values, for the
> > > following formula:
> > >=20
> > >                          period * refclk
> > > prediv_exp =3D log2 -------------------------------------
> > >                     NSEC_PER_SEC * pre_div * (1 << resolution)
> > >=20
> > >=20
> > > So in DT we set the period to 50000000. For this, as I mentioned in t=
he
> > > commit message the best refclk is 19.2MHz, the best prediv is 5, the =
best
> > > exponent is 6 and the best resolution is 255.
> > >=20
> > > So if you use these to compute the period following this formula:
> > >=20
> > >=20
> > >                 NSEC_PER_SEC * prediv * (1 << resolution)
> > > best_period =3D -------------------------------------------
> > >                              refclk
> > >=20
> > > So in our case:
> > >=20
> > > (1000000000 * 5 * (1 << 8) * (1 << 6)) / 19200000 =3D 4266666.6666...
> > >=20
> > > So here is where the things go wrong. Bjorn helped me figure this out=
 today
> > > (off-list). Basically, the pwm framework will allow values up to 5000=
000,
> > > as specified in the DT, but for then pwm value will go over 255
> > > when computing the actual pwm value by the following formula:
> > >=20
> > >                             duty * refclk
> > > pwm_value =3D ----------------------------------------------
> > >                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
> > >=20
> > >=20
> > > So here is how the value 300 is reached (I messed up this next formul=
a in
> > > the commit message):
> > >=20
> > > (5000000 * 19200000) / (1000000000 * 5 * (1 << 8)) =3D 300
> > >=20
> > > But if we were to use the best_period determined:
> > >=20
> > > (4266666 * 19200000) / (1000000000 * 5 * (1 << 8)) =3D 255
> > >=20
> > > So I guess the process of determining the best parameters is correct.
> > > What I think is missing is we need to divide the requested period (50=
00000)
> > > to the resolution (255) and make sure the duty cycle is a multiple of=
 the
> > > result.
> >=20
> > Let me try to summarize that:
> >=20
> > 1. PWM backlight driver requests PWM with 5 MHz period
> > 2. leds-qcom-lpg uses 4.2666 MHz period instead due to HW limits
> > 3. PWM backlight driver is unaware and requests a duty cycle
> >    expecting the period to be 5 MHz, so the duty cycle can
> >    exceed 100%

Can you please enable CONFIG_PWM_DEBUG, enable pwm tracing (

	echo 1 > /sys/kernel/debug/tracing/events/pwm/enable

) then reproduce the problem and provide the output of

	cat /sys/kernel/debug/tracing/trace

=2E

I didn't take a deeper dive in this driver combination, but here is a
description about what *should* happen:

You're talking about period in MHz, the PWM abstraction uses
nanoseconds. So your summary translated to the PWM wording is (to the
best of my understanding):

  1. PWM backlight driver requests PWM with .period =3D 200 ns and
     .duty_cycle =3D 200 ns.

  2. leds-qcom-lpg cannot pick 200 ns exactly and then chooses .period =3D
     1000000000 / 4.26666 MHz =3D 234.375 ns
    =20
  3. leds-qcom-lpg then determines setting for requested .duty_cycle
     based on .period =3D 200 ns which then ends up with something bogus.

Right?

There is a problem in 2. already: The PWM hardware driver is supposed to
pick the highest period (in ns) not bigger than the requested value. So
it must not pick 234.375 ns. (Enabling CONFIG_PWM_DEBUG on that is
supposed to wail about that.) It should instead pick (say) 187 ns. In
the next step the hw driver should pick the highest duty_cycle (again in
ns) not exceeding the requested value (and physics). That will be (I
guess) also 187 ns in the constructed example. So you should get your
requested 100 % relative duty cycle at least.

So the problem about now knowing the resulting PWM waveform is somewhat
real. I think if leds-qcom-lpg behaved as expected from a PWM driver, it
would be a tad better than your report suggests. I might miss something
though.

Best regards
Uwe

--nr5ltixjdluytq45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfAN1MACgkQj4D7WH0S
/k45xggAmjCO7S6izDGu36XMPBoWEbbqAZQ3btsQbUN0DsvuwPpdUaciOU0Ib+9n
8QYWArwEkOauEobGAy2QFrmIph1pgeXAmlctNrRx14EzY3qgW0RfWDEsLhjkfDvH
mV9pCebZCXpNGElgjIHQDJaZsQ5ue/l88Vh8OF4u57EdVzwKdjjC1UJjmVQlOI+z
In5wsgH6S1+sN0ERqJzwBobR3e2x4u++guYJqRFtqxjrrx6oT3dgPnDoQZbOfDlv
ksgcXuSnkihLrYtuzCHdb8ffLMQ2kLv0pZpfrqA6bmK6pG9dh6EbV3zKPVptYssU
hKtqFsPkEzDhxSJ8X7OVAxdzWNN4Yw==
=+raP
-----END PGP SIGNATURE-----

--nr5ltixjdluytq45--

