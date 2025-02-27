Return-Path: <linux-leds+bounces-4120-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E0A4877C
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 19:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09AC16D59F
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 18:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182F21F5820;
	Thu, 27 Feb 2025 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U59ib/nN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA501EFF8A
	for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679788; cv=none; b=r5Z5l/iAKLNbiOhpco91uwZzfZPQe5imVWN8DijqsAv78WVtMAhoCRIzYVtuAtBcWAzv4kNuslzN+66Ce1x8NmED59Y6aQtMg49b+Njmha2kXIdIN5SxU5jdQP2cM44slrOCb854cT7H7fg/ww0TaiJLVH0JVFjZyGJ6Tlr52UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679788; c=relaxed/simple;
	bh=xdChzCxZLgxBax8Z0/iBsu5xox6O3W/RGdDinFxDb9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3peSLeJ8Lc7Md61aej+gFtid7u2mYXsLlgGS0c1W6ZEvzEtZV5cPCeCPHV41MVjzOYS6cMayecY59C6jEdR4MgzmjBlwjgrB378+kgFWd2pZQXYOpOIVEZ6UA+JqW+6A9f15xO5PXpL8sF32O3Rt5IYfoutg6ZYZT1lG0tfAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U59ib/nN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab78e6edb99so170290266b.2
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 10:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740679783; x=1741284583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfjpGp1L26OhdaNqt/gYg8OwWNQRpw6uVt+zy1eXaNU=;
        b=U59ib/nNARlrKFR8mHOnfDsq/hWYqQri9rMx4rJlDZLJhdTvv68qQQu6+By17g8eUx
         5MrNsm2krTGjM/10dLbBCdeXEl59o0PplSPigAIOpq2zpyzchVopxIO0XIz4NmT5UVDM
         IBXXpIEybBkMuOG5mT34UsCo8wSC71UdJgcdmMUF8CMpvdRzTTyazrbdWfbu8BGBmoA9
         WheLGhN9rbxsEt8GDKsYkezjJKt/UhIB1MkkVn2zq9ZkhHOu7dpnLpcNc4+ttY+rjoLa
         jiiH/JymZ7n006IChsJMobyNasIVSGpdiZkiCMaKpoU3bfjMRLfX0n5v3Azg57+QRmFu
         epPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679783; x=1741284583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfjpGp1L26OhdaNqt/gYg8OwWNQRpw6uVt+zy1eXaNU=;
        b=gOsnbqpMbJc0omoSsbke0X2cwWtT3UR3H2otUKAhzBGPbfv5G1SlNdKtJxyiBRpkQI
         jexDxLCbMF8dDJaraMX+FpKkJLAv+svDsO7W3I1mx5nGQdQ9HmfzJ6s7a7UxyJ8LuveD
         RWUzO5oMHocti/j6JcmUT8g+3eeOAn+CR3hM0v0yKSKKhRzgTfHrrLSCnwFycHaLKEgn
         d5FwEBw87ed58BOaH2xtO950kS+YcDNxNrWCp587agY2FR9jdd/q8RBFCuKVFZhuiN01
         YjDRzGSIl2L1VuvY9ej/IA649FWZp4Aj0fY437DjLiPh/ynhyWVB1V7abcKoefleuzg4
         d+FA==
X-Forwarded-Encrypted: i=1; AJvYcCU/TIY74RfH8FdSah6jQG4KCPCcoli5hBAkbhKPO3ZjSAI0GxNO+YwUruKf9FJV2h1sTQibAFzHNBuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxZDLe8xTmB9XVzwwQ3yP8H1m/ddsn1tTZyR1eFga4S//bi43
	NWHIDKJI/0gJd3lLzObp678vWxPWk/cjtDCVUjwrDJOm5lRAYJlB59TGbXRWYJA=
X-Gm-Gg: ASbGncuuiUfT+0IHyX7FsHOV99vUqmEIo+T42qqmb3//tT7DB46xboE6RnqW2ucZCKs
	J8+6ZziKzvz2crZhXSGh/9+Mt9f3F+xBquWapZx/MrrIrYC0TEWbCFp/sqLa/6MKzLUXXQAuQoc
	9A5s7MudRhU+tujsZmQoxYY6zri61tHG9DH/lW/Hq93hZt8XHv+yPHOybgzewalbG+d+lWHFNSt
	Ew0cdmRdhQdgfK9a8obdofIbr347aojlyENR8hT3q5Aw/jmActg9ATs3/sED2bBNTSCXIzoGWZl
	Ocp1mx/EDzkM2ALxK4HTO04QBpobX/eXk4XLuYPjx19iinuk1zi0ZjXZ8F5NZ0L8
X-Google-Smtp-Source: AGHT+IG5jhPAhA4gLbl+6jNfxZsQy6dhnuwfbakZ2ECzbDoT+qIk3FvugKFPtllN44+P1qWPzxitZQ==
X-Received: by 2002:a17:907:988:b0:abe:ff13:d0c4 with SMTP id a640c23a62f3a-abf261cd53cmr53791366b.32.1740679783111;
        Thu, 27 Feb 2025 10:09:43 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9a90sm159028166b.34.2025.02.27.10.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:09:41 -0800 (PST)
Date: Thu, 27 Feb 2025 19:09:39 +0100
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
Message-ID: <ioater5m23lhkmyik3hurozol6vtyx6ovac3phmvcphrmmprwb@igggmox3jz5m>
References: <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
 <Z7zVgeM+7P7SLWIu@linaro.org>
 <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
 <Z7161SzdxhLITsW3@linaro.org>
 <5euqboshlfwweie7tlaffajzg3siiy6bm3j4evr572ko54gtbv@7lan3vizskt3>
 <Z8B2Bl/9uD3jPvQi@linaro.org>
 <j55de6bbipoavqx25w2s6qr7n6fv6w7bj3lrgyag4dlvvddbqv@shn22aqcqeci>
 <Z8CIY2OJUMqIOHGU@linaro.org>
 <Z8CTqdFafLY17C25@linaro.org>
 <Z8CbSvlG856oxQRw@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="coiu4r2gfvk33wam"
Content-Disposition: inline
In-Reply-To: <Z8CbSvlG856oxQRw@linaro.org>


--coiu4r2gfvk33wam
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
MIME-Version: 1.0

Hello,

On Thu, Feb 27, 2025 at 07:05:14PM +0200, Abel Vesa wrote:
> On 25-02-27 18:32:41, Abel Vesa wrote:
> > On 25-02-27 17:44:35, Abel Vesa wrote:
> > > On 25-02-27 16:25:06, Uwe Kleine-K=F6nig wrote:
> > > > Hello Abel,
> > > >=20
> > > > On Thu, Feb 27, 2025 at 04:26:14PM +0200, Abel Vesa wrote:
> > > > > On 25-02-27 10:58:47, Uwe Kleine-K=F6nig wrote:
> > > > > > Can you please enable CONFIG_PWM_DEBUG, enable pwm tracing (
> > > > > >=20
> > > > > > 	echo 1 > /sys/kernel/debug/tracing/events/pwm/enable
> > > > > >=20
> > > > > > ) then reproduce the problem and provide the output of
> > > > > >=20
> > > > > > 	cat /sys/kernel/debug/tracing/trace
> > > > > >=20
> > > > > > .
> > > > >=20
> > > > > $ cat trace
> > > > > # tracer: nop
> > > > > #
> > > > > # entries-in-buffer/entries-written: 13/13   #P:12
> > > > > #
> > > > > #                                _-----=3D> irqs-off/BH-disabled
> > > > > #                               / _----=3D> need-resched
> > > > > #                              | / _---=3D> hardirq/softirq
> > > > > #                              || / _--=3D> preempt-depth
> > > > > #                              ||| / _-=3D> migrate-disable
> > > > > #                              |||| /     delay
> > > > > #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> > > > > #              | |         |   |||||     |         |
> > > > >         modprobe-203     [000] .....     0.938668: pwm_get: pwmch=
ip0.0: period=3D1066407 duty_cycle=3D533334 polarity=3D0 enabled=3D1 err=3D0
> > > > >         modprobe-203     [000] .....     0.938775: pwm_apply: pwm=
chip0.0: period=3D5000000 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=3D0
> > > > >         modprobe-203     [000] .....     0.938821: pwm_get: pwmch=
ip0.0: period=3D4266537 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=3D0
> > > > >         modprobe-203     [000] .....     0.938936: pwm_apply: pwm=
chip0.0: period=3D4266537 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=3D0
> > > > >         modprobe-203     [000] .....     0.938982: pwm_get: pwmch=
ip0.0: period=3D4266537 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=3D0
> > > > >         modprobe-203     [000] .....     0.939274: pwm_apply: pwm=
chip0.0: period=3D5000000 duty_cycle=3D921458 polarity=3D0 enabled=3D1 err=
=3D0
> > > > >         modprobe-203     [000] .....     0.939320: pwm_get: pwmch=
ip0.0: period=3D4266537 duty_cycle=3D921355 polarity=3D0 enabled=3D1 err=3D0
> > > > >         modprobe-203     [000] .....     0.939434: pwm_apply: pwm=
chip0.0: period=3D4266537 duty_cycle=3D921355 polarity=3D0 enabled=3D1 err=
=3D0
> > > > >         modprobe-203     [000] .....     0.939480: pwm_get: pwmch=
ip0.0: period=3D4266537 duty_cycle=3D921355 polarity=3D0 enabled=3D1 err=3D0
> > > > >  systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwm=
chip0.0: period=3D5000000 duty_cycle=3D5000000 polarity=3D0 enabled=3D1 err=
=3D0
> > > > >  systemd-backlig-724     [006] .....     9.079585: pwm_get: pwmch=
ip0.0: period=3D4266537 duty_cycle=3D4266537 polarity=3D0 enabled=3D1 err=
=3D0
> > > > >  systemd-backlig-724     [006] .....     9.079698: pwm_apply: pwm=
chip0.0: period=3D4266537 duty_cycle=3D4266537 polarity=3D0 enabled=3D1 err=
=3D0
> > > > >  systemd-backlig-724     [006] .....     9.079750: pwm_get: pwmch=
ip0.0: period=3D4266537 duty_cycle=3D4266537 polarity=3D0 enabled=3D1 err=
=3D0
> > > > > $
> > > > >=20
> > > > > >=20
> > > > > > I didn't take a deeper dive in this driver combination, but her=
e is a
> > > > > > description about what *should* happen:
> > > > > >=20
> > > > > > You're talking about period in MHz, the PWM abstraction uses
> > > > > > nanoseconds. So your summary translated to the PWM wording is (=
to the
> > > > > > best of my understanding):
> > > > > >=20
> > > > > >   1. PWM backlight driver requests PWM with .period =3D 200 ns =
and
> > > > > >      .duty_cycle =3D 200 ns.
> > > > > >=20
> > > > > >   2. leds-qcom-lpg cannot pick 200 ns exactly and then chooses =
=2Eperiod =3D
> > > > > >      1000000000 / 4.26666 MHz =3D 234.375 ns
> > > > > >     =20
> > > > > >   3. leds-qcom-lpg then determines setting for requested .duty_=
cycle
> > > > > >      based on .period =3D 200 ns which then ends up with someth=
ing bogus.
> > > >=20
> > > > The trace looks better than what I expected. 2. is fine here becaus=
e it
> > > > seems when Sebastian wrote "driver requests PWM with 5 MHz period" =
that
> > > > meant period =3D 5000000 ns. That was then rounded down to 4266537 =
ns. And
> > > > the request for period =3D 5000000 ns + duty_cycle =3D 5000000 ns w=
as
> > > > serviced by configuring period =3D 4266537 ns + duty_cycle =3D 4266=
537 ns.
> > > > So that's a 100 % relative duty configuration as intended.
> > > >=20
> > > > So just from the traces I don't spot a problem. Do these logs not m=
atch
> > > > what actually happens on the signal?
> > >=20
> > > What I do not get is why do we expect 2 pwm_get() and 2 pwm_apply()
> > > calls each time ?
> >=20
> > OK, so the second pwm_apply() is due to CONFIG_PWM_DEBUG.

ack. This is done just for the tests implemented in CONFIG_PWM_DEBUG, as
are the two pwm_get()s.

> > But still, the first pwm_apply() requests duty cycle of 5MHz:

5 ms, yes. But it cannot give you 5 ms and so you get 4.266 ns.

> > systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchip0.0=
: period=3D5000000 duty_cycle=3D5000000 polarity=3D0 enabled=3D1 err=3D0
> >=20
> > So since the period is 4.26MHz, due to the knobs selected by the
> > provider, this duty cycle will result in a PWM value that is above the
> > selected resolution, as I already mentioned.

"above the selected resolution"? Do you mean you don't get the exact
value that you requested?

> On top of that, the duty cycle in debugfs is also reported as 5000000ns
> when in fact it is 4266666ns, as the trace shows.

Yes. Consider that a relict from the times when there was no
pwm_get_state_hw(). Both values are interesting in different situations.
So just telling the real parameters isn't the optimal way forward
either.

Something like the patch I showed in
https://lore.kernel.org/all/7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoff=
hec@zs4w4tuh6qvm/
would make you a bit luckier I guess. Feel free to polish that one a bit
(e.g.  by checking the return value of pwm_get_state_hw() and acting
sensible in reply to it) and send a proper patch. (A Suggested-by for me
is enough for such a patch, grab authorship yourself.)

> > > Need to dig a bit further.
> > >=20
> > > But meanwhile, if the first pwm_apply() call goes all the way to the
> > > provider, then the duty cycle value, when translated to the actual PWM
> > > value that gets written to reg, will overflow.

No it will not. The .duty_cycle value (also 5000000 ns) will reach the
lowlevel PWM driver together with .period =3D 5000000 ns. Both are rounded
down to 4266666ns. I see no overflow.=20

Best regards
Uwe

--coiu4r2gfvk33wam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfAqmEACgkQj4D7WH0S
/k59Lwf/c53g1pFJpL0c/xEQriO8AL4IHT0MyM5FXUa7J9I1fDnHwffLa/y4ul2C
XbhoexOvuSO4NCktkZ8qWHGofl0MFX5NeNkgI4z972nPSpoQwXb1qyrhX9igA9nS
OlUyWmqG0kBTOUgnm8rb14NHtHl50p5PR2kxs2pqNnm5m4QYsvc/HWkQCjKWx6WO
Z6TiBcVTByGFdJ3EFIhE0kydakv0cKthMTFbgUGRlR3k3u35DUoWyOicT3uvaUMB
zyhZTK9kFV7HbXW+XceARMrE3+19oMa65csNYv9X6Ta+MXOzrwV86U8wPmfIi+E0
UaCwkC2Gd7Es8lxpkY/unI0K++ytTQ==
=IqCH
-----END PGP SIGNATURE-----

--coiu4r2gfvk33wam--

