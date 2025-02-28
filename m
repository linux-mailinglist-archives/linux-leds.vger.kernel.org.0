Return-Path: <linux-leds+bounces-4128-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C455A49831
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 12:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B33116513A
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 11:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8842825DAE8;
	Fri, 28 Feb 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0oGNT1oN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD312580CC
	for <linux-leds@vger.kernel.org>; Fri, 28 Feb 2025 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740741418; cv=none; b=fA5THLp2VgCyxqchH+Ts5Uw2WKxLFR1iR9w/A/ZZqYBihBqWnl7wJuYo4DqM5dWPTH4w4h1/5V4UpOB/R8/zJ5QsMw8zCreKSVGe1vXJhd3i5QT1NK7a9RQITiwgjUG0dg97kccsdQA3T+vvfx9lJFIsFO9I1Ah13Vk+htXPn3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740741418; c=relaxed/simple;
	bh=ckmai19NnoWl9ChlNFmTdwxMh3JznyiEUkRQGeJl1yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0otW5r9FFTyB6asDhCyWKzi4mxQTrq9HUlfRgnz8begYNPn24i5R2hUWk708mMg6nTyxqV0km0WLLWbd3Jjkcs3QyvKdck8tCGKkin+4mCn0OuXs2tgmBDs8MvS295tze6zjSXjMFlPzKPE6elCaSVeYBoadh+yPmWu5o58sdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0oGNT1oN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so2515921a12.1
        for <linux-leds@vger.kernel.org>; Fri, 28 Feb 2025 03:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740741414; x=1741346214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2pVqF4gjO3v3zc/y/ZXO1xr7qTw5W69z4gzxpYSp+8=;
        b=0oGNT1oN8lz4/ndtfjkmmUVNF3vwd/2AcPCRqePVIXjCjTpLYm91eHzd7oGbskHKia
         uhAMrLoEYxmgiU3sp7YnY5CduSye6NggHARo6hs4bmiIIgqzuFNpep8BQUvDZLS5P9YX
         klIwQcfmRR2Olbml4eAvHjAzf1kHa2R+COv3zBVEDsgeZrSzgpQrVwnxj+fppFATL6jQ
         xUVC/uxIxDa7dxTTnfIlMMriuFpF4HGARpHlFdlcG4udWvTtiDYNvRkbiF2BoPxKnMIc
         nwTwi1LW2ByAItN9NCMbfsr4CmJSVQuAtIq1rysogDFQRRY+x0A0DRdyNIv0LZOox748
         OTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740741414; x=1741346214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2pVqF4gjO3v3zc/y/ZXO1xr7qTw5W69z4gzxpYSp+8=;
        b=gltyUvEPnWhbtIxnaKvAX83sNxR1nsQoqXFJiQ1pMSnwhTZcZJLEVabCf9yHRJ8fd6
         y6j6dgd0owxUxm+3ogwQZXp2U/nnwQrcSu0v5c80ddra8JKMjE7x/ch/pa3DHdiL0QJT
         jTstSueqsYeWCrPhJJ+bnnwRxnIkpXaQpTLHqbiAy/lZsmThpf9cpB8kzDweLrVGmfqb
         cg5W2nIP+IkwJxZDuLV2tf/BFgIEVTFVb9onjlovIsalfs/kmBo/Q3vN71ZBM2Y/hx9h
         Bukob5qyQv7uZqkcNEXt/CEN9xTxST2sGkqkMxgsCJTxyjJavLRCzBNjAYilL85yK4Q9
         o7/g==
X-Forwarded-Encrypted: i=1; AJvYcCW2EabA3QK7BbhMtEdy44hoJOUWdSL+wpXwQWbMK3ncfFwTdbQSJsMqZ3DUZTYtIn0B6CBmqkxJjjpA@vger.kernel.org
X-Gm-Message-State: AOJu0YxQtmv6ZBE0d063ahI/M/fwwnbu4LOO5iJ18ZhWkabpyVV7IqYZ
	QGjnM7yLHpnZjEwZBaTBGiF/3omHAUgyQbXayfpIiXHd1+gd4J5x43BFsMkRpDk=
X-Gm-Gg: ASbGncsQ/Yg8BjsXJ8JSGjm9k3e33pKBpSkJ8znL3Kocjyj2FBwrD5/YCgOIScVy7YH
	/8Tft6ekUh4diJh/qhIa8PX7N2cX/iT8MCh5dWLkiSjuNPFdv8jPQA2ahffTxUyM7MevAJWrUap
	RXtfP7cNGwqDydjjIDHjEtswfWg+/DQso4YzXAywBfdk7jIBrPwrNoEE0IwNSksl1z5j5w3kHXQ
	vEdDe8owYYw2e6+XMhawBMnu4SHARk6DixI8HuKCbPN6t05niPpGfKvqXBjsKH/LMlW0927h+SY
	yfFLf9XkJLB//v3bIC76525CjYlpr1c0rF9Cqk4Z3k7QVlJq9iXu25SVCGz4WPhV
X-Google-Smtp-Source: AGHT+IFTXvx9sVAleIQbxrWDO1hdHe2VsnE9cFb5TfDWeqjZ03pqpRDqZMOi3rz1Olpgdv0Y+Cne/A==
X-Received: by 2002:a05:6402:40cf:b0:5e4:d220:3333 with SMTP id 4fb4d7f45d1cf-5e4d6ac4a4dmr6299161a12.1.1740741413937;
        Fri, 28 Feb 2025 03:16:53 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf196e7035sm222799966b.140.2025.02.28.03.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 03:16:53 -0800 (PST)
Date: Fri, 28 Feb 2025 12:16:51 +0100
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
Message-ID: <6siwtqeeqmyg62mqlxpckhopkjzl24qvrjuk6p7ccysaeg7ltw@pnzzf5hjlu3i>
References: <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
 <Z7161SzdxhLITsW3@linaro.org>
 <5euqboshlfwweie7tlaffajzg3siiy6bm3j4evr572ko54gtbv@7lan3vizskt3>
 <Z8B2Bl/9uD3jPvQi@linaro.org>
 <j55de6bbipoavqx25w2s6qr7n6fv6w7bj3lrgyag4dlvvddbqv@shn22aqcqeci>
 <Z8CIY2OJUMqIOHGU@linaro.org>
 <Z8CTqdFafLY17C25@linaro.org>
 <Z8CbSvlG856oxQRw@linaro.org>
 <ioater5m23lhkmyik3hurozol6vtyx6ovac3phmvcphrmmprwb@igggmox3jz5m>
 <Z8F63fS/RDnF8+oU@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q67kilu5fjsok7m4"
Content-Disposition: inline
In-Reply-To: <Z8F63fS/RDnF8+oU@linaro.org>


--q67kilu5fjsok7m4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
MIME-Version: 1.0

Hello Abel,

On Fri, Feb 28, 2025 at 10:59:09AM +0200, Abel Vesa wrote:
> On 25-02-27 19:09:39, Uwe Kleine-K=C3=B6nig wrote:
> > On Thu, Feb 27, 2025 at 07:05:14PM +0200, Abel Vesa wrote:
> > > On 25-02-27 18:32:41, Abel Vesa wrote:
> > > > On 25-02-27 17:44:35, Abel Vesa wrote:
> > > > > On 25-02-27 16:25:06, Uwe Kleine-K=C3=B6nig wrote:
> > > > > > Hello Abel,
> > > > > >=20
> > > > > > On Thu, Feb 27, 2025 at 04:26:14PM +0200, Abel Vesa wrote:
> > > > > > > On 25-02-27 10:58:47, Uwe Kleine-K=C3=B6nig wrote:
> > > > > > > > Can you please enable CONFIG_PWM_DEBUG, enable pwm tracing (
> > > > > > > >=20
> > > > > > > > 	echo 1 > /sys/kernel/debug/tracing/events/pwm/enable
> > > > > > > >=20
> > > > > > > > ) then reproduce the problem and provide the output of
> > > > > > > >=20
> > > > > > > > 	cat /sys/kernel/debug/tracing/trace
> > > > > > > >=20
> > > > > > > > .
> > > > > > >=20
> > > > > > > $ cat trace
> > > > > > > # tracer: nop
> > > > > > > #
> > > > > > > # entries-in-buffer/entries-written: 13/13   #P:12
> > > > > > > #
> > > > > > > #                                _-----=3D> irqs-off/BH-disab=
led
> > > > > > > #                               / _----=3D> need-resched
> > > > > > > #                              | / _---=3D> hardirq/softirq
> > > > > > > #                              || / _--=3D> preempt-depth
> > > > > > > #                              ||| / _-=3D> migrate-disable
> > > > > > > #                              |||| /     delay
> > > > > > > #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> > > > > > > #              | |         |   |||||     |         |
> > > > > > >         modprobe-203     [000] .....     0.938668: pwm_get: p=
wmchip0.0: period=3D1066407 duty_cycle=3D533334 polarity=3D0 enabled=3D1 er=
r=3D0
> > > > > > >         modprobe-203     [000] .....     0.938775: pwm_apply:=
 pwmchip0.0: period=3D5000000 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=
=3D0
> > > > > > >         modprobe-203     [000] .....     0.938821: pwm_get: p=
wmchip0.0: period=3D4266537 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=3D0
> > > > > > >         modprobe-203     [000] .....     0.938936: pwm_apply:=
 pwmchip0.0: period=3D4266537 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=
=3D0
> > > > > > >         modprobe-203     [000] .....     0.938982: pwm_get: p=
wmchip0.0: period=3D4266537 duty_cycle=3D0 polarity=3D0 enabled=3D1 err=3D0
> > > > > > >         modprobe-203     [000] .....     0.939274: pwm_apply:=
 pwmchip0.0: period=3D5000000 duty_cycle=3D921458 polarity=3D0 enabled=3D1 =
err=3D0
> > > > > > >         modprobe-203     [000] .....     0.939320: pwm_get: p=
wmchip0.0: period=3D4266537 duty_cycle=3D921355 polarity=3D0 enabled=3D1 er=
r=3D0
> > > > > > >         modprobe-203     [000] .....     0.939434: pwm_apply:=
 pwmchip0.0: period=3D4266537 duty_cycle=3D921355 polarity=3D0 enabled=3D1 =
err=3D0
> > > > > > >         modprobe-203     [000] .....     0.939480: pwm_get: p=
wmchip0.0: period=3D4266537 duty_cycle=3D921355 polarity=3D0 enabled=3D1 er=
r=3D0
> > > > > > >  systemd-backlig-724     [006] .....     9.079538: pwm_apply:=
 pwmchip0.0: period=3D5000000 duty_cycle=3D5000000 polarity=3D0 enabled=3D1=
 err=3D0
> > > > > > >  systemd-backlig-724     [006] .....     9.079585: pwm_get: p=
wmchip0.0: period=3D4266537 duty_cycle=3D4266537 polarity=3D0 enabled=3D1 e=
rr=3D0
> > > > > > >  systemd-backlig-724     [006] .....     9.079698: pwm_apply:=
 pwmchip0.0: period=3D4266537 duty_cycle=3D4266537 polarity=3D0 enabled=3D1=
 err=3D0
> > > > > > >  systemd-backlig-724     [006] .....     9.079750: pwm_get: p=
wmchip0.0: period=3D4266537 duty_cycle=3D4266537 polarity=3D0 enabled=3D1 e=
rr=3D0
> > > > > > > $
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > I didn't take a deeper dive in this driver combination, but=
 here is a
> > > > > > > > description about what *should* happen:
> > > > > > > >=20
> > > > > > > > You're talking about period in MHz, the PWM abstraction uses
> > > > > > > > nanoseconds. So your summary translated to the PWM wording =
is (to the
> > > > > > > > best of my understanding):
> > > > > > > >=20
> > > > > > > >   1. PWM backlight driver requests PWM with .period =3D 200=
 ns and
> > > > > > > >      .duty_cycle =3D 200 ns.
> > > > > > > >=20
> > > > > > > >   2. leds-qcom-lpg cannot pick 200 ns exactly and then choo=
ses .period =3D
> > > > > > > >      1000000000 / 4.26666 MHz =3D 234.375 ns
> > > > > > > >     =20
> > > > > > > >   3. leds-qcom-lpg then determines setting for requested .d=
uty_cycle
> > > > > > > >      based on .period =3D 200 ns which then ends up with so=
mething bogus.
> > > > > >=20
> > > > > > The trace looks better than what I expected. 2. is fine here be=
cause it
> > > > > > seems when Sebastian wrote "driver requests PWM with 5 MHz peri=
od" that
> > > > > > meant period =3D 5000000 ns. That was then rounded down to 4266=
537 ns. And
> > > > > > the request for period =3D 5000000 ns + duty_cycle =3D 5000000 =
ns was
> > > > > > serviced by configuring period =3D 4266537 ns + duty_cycle =3D =
4266537 ns.
> > > > > > So that's a 100 % relative duty configuration as intended.
> > > > > >=20
> > > > > > So just from the traces I don't spot a problem. Do these logs n=
ot match
> > > > > > what actually happens on the signal?
> > > > >=20
> > > > > What I do not get is why do we expect 2 pwm_get() and 2 pwm_apply=
()
> > > > > calls each time ?
> > > >=20
> > > > OK, so the second pwm_apply() is due to CONFIG_PWM_DEBUG.
> >=20
> > ack. This is done just for the tests implemented in CONFIG_PWM_DEBUG, as
> > are the two pwm_get()s.
> >=20
> > > > But still, the first pwm_apply() requests duty cycle of 5MHz:
> >=20
> > 5 ms, yes. But it cannot give you 5 ms and so you get 4.266 ns.
> >=20
> > > > systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchi=
p0.0: period=3D5000000 duty_cycle=3D5000000 polarity=3D0 enabled=3D1 err=3D0
> > > >=20
> > > > So since the period is 4.26MHz, due to the knobs selected by the
> > > > provider, this duty cycle will result in a PWM value that is above =
the
> > > > selected resolution, as I already mentioned.
> >=20
> > "above the selected resolution"? Do you mean you don't get the exact
> > value that you requested?
>=20
> I think I understand your point now.
>=20
> You expectation is that the provider would remap the entire range of the
> period to whatever the HW can do.

If I understand you correctly, that's right. For a given hardware there
is a set of possible periods P. .apply() should pick=20
max{ p =E2=88=88 P | p =E2=89=A4 state->period }.

And similar for duty_cycle: After choosing a possible period p =E2=88=88 P,
there is a set D(p) of duty_cycles that the hardware can implement in
combination to period p. .apply() should pick
max{ d =E2=88=88 D(p) | d =E2=89=A4 state->duty_cycle }.

> So in this case, when 5ms is requested as duty cycle from consumer, the=
=20
> provider will select the max value.

Yes.

> What the current implementation of the leds-qcom-lpg does is that will
> expect a duty cycle request of up to 4.26ms. And according to you, even
> if the consumer requests 5ms, the leds-qcom-lpg driver should write the
> value of 255 (which is what the selected resolution allows (1 << 8) ) and
> not compute a higher value.

If the period is 4.26 ms, duty_cycle cannot be bigger than 4.26 ms. So
yes, that's what the driver should do.

> I think this is wrong though. The fact that the pwm generic framework
> reports 5ms when it is actually 4.26ms should be considered wrong.

After pwm_apply_might_sleep(mypwm, { .period =3D 5000000, .duty_cycle =3D
5000000, .enabled =3D true }), pwm_get_state() gives you 5000000 and
pwm_get_state_hw() gives you 4266537. You could argue that the
functions's names and semantic are not optimal. Changing that is hard,
see my failed attempt in 01ccf903edd6 ("pwm: Let pwm_get_state() return
the last implemented state") + 40a6b9a00930 ("Revert "pwm: Let
pwm_get_state() return the last implemented state"")

So I don't see how the PWM framework is wrong here. Depending on what
value you want to get, pick pwm_get_state() or pwm_get_state_hw().

> For cases where the exact value of the duty cycle matters, this would
> not even make sense.

What is "this"? pwm_get_state() returning the last requested value? If
you're interested in the last requested value, it does make sense.
=20
> Correct me if I'm wrong, but the pwm API should behave more like:
> The consumer should ask for the closest period the HW can actually do
> and then use that closest period from there on for every duty cycle
> request.

You can do that today using pwm_round_waveform_might_sleep() (however
that needs some glue in the leds-qcom-lpg driver).

And note that most in-kernel users don't care about exactness a lot. So
the fire-and-forget approach is fine and it shouldn't be made more
complicated for those.

> This way, if the consumer initially wants 5ms but the provider
> can do only 4.26ms instead, at least the consumer would be able to
> correct its duty cycle requests based on what the HW says it can do.

I agree that the consumer should be able to make an informed choice, and
that was my focus when designing the waveform API. But I intend to not
force that on (e.g.) the leds-pwm driver if that doesn't care about
getting 4.26 ms or 5 ms.

> > > On top of that, the duty cycle in debugfs is also reported as 5000000=
ns
> > > when in fact it is 4266666ns, as the trace shows.
> >=20
> > Yes. Consider that a relict from the times when there was no
> > pwm_get_state_hw(). Both values are interesting in different situations.
> > So just telling the real parameters isn't the optimal way forward
> > either.
> >=20
> > Something like the patch I showed in
> > https://lore.kernel.org/all/7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2sw=
toffhec@zs4w4tuh6qvm/
>=20
> And this patchset only adds the info of actual value that the HW is actua=
lly doing.

"only"? Yes, that's the intention of that patch. What should it do more?

> So basically, the already existing state in this case will represent the
> "desired" state.

Yes, pwm->state tracks the state that was last passed to
pwm_apply_might_sleep() (most of the time).
=20
> > would make you a bit luckier I guess. Feel free to polish that one a bit
> > (e.g.  by checking the return value of pwm_get_state_hw() and acting
> > sensible in reply to it) and send a proper patch. (A Suggested-by for me
> > is enough for such a patch, grab authorship yourself.)
> >=20
> > > > > Need to dig a bit further.
> > > > >=20
> > > > > But meanwhile, if the first pwm_apply() call goes all the way to =
the
> > > > > provider, then the duty cycle value, when translated to the actua=
l PWM
> > > > > value that gets written to reg, will overflow.
> >=20
> > No it will not. The .duty_cycle value (also 5000000 ns) will reach the
> > lowlevel PWM driver together with .period =3D 5000000 ns. Both are roun=
ded
> > down to 4266666ns. I see no overflow.=20
>=20
> Again, the consumer is being lied to. It expects 5ms and gets 4.26ms
> instead.

I see what you mean, but I don't agree. The semantic of
pwm_apply_might_sleep() is: "Configure the state that is nearest to the
passed state" (for some metric that defines "nearest"). The function
returning 0 means: The hardware now has this nearest state.

The semantic of pwm_get_state() is approximately: "What state was
requested before?" So it will give you .period =3D 5000000 ns and
=2Eduty_cycle =3D 5000000 ns.

The semantic of pwm_get_state_hs() is: "What state is the hardware in?"
So it will give you .period =3D 4266666 ns and .duty_cycle =3D 4266666 ns.

So there are no lies, just wrong expectations about the semantic of
these functions.

And if you think that pwm_apply_might_sleep() should fail when 5000000
ns is requested and it can only do 4266537 ns: Where should the line
drawn that decides between "4977777 ns is still ok" and "4977777 ns is
too far from 5000000 ns"?

> Imagine a device that is controlled via PWM and needs exact duty cycle
> values in ms, what would the consumer driver do in this case?

Traditionally it would need some hardware specific extra information.
Today it could work out the needed details with the waveform API
functions (though this is hard because there are only two supported
lowlevel drivers and no helper functions yet).

> And to make things worse, when the consumer is asking for duty cycle of
> 4ms while the period requested is 5ms (which would be 80%), the period
> the provider will do is actually 4.26ms while the duty cycle would be
> ~3.41ms, which if the pwm step (reg value) doesn't allow, it will probably
> result in an actual value that is even further than what the consumer
> is expecting.

Where does ~3.41 ms come from? (I guess that's 0.8 * 4.26 ms.) Note that
if you request .period =3D 5 ms and .duty_cycle =3D 4 ms, you get .period =
=3D
4.26 ms and the biggest duty_cycle not bigger than 4 ms that is possible
with .period =3D 4.26 ms. So most likely not a 80% relative duty_cycle.

> So I'm thinking maybe the pwm should probably even ask the provider
> for what duty cycle it will provide based on provider's provided period
> and then decide if the resulting duty cycle is what it really wants.

Look into the waveform functions. The basic building blocks for what you
want should be there.

> IIRC, this is more in line with what the CCF (common clocks framework)
> currently does.

It does? There is clk_round_rate() but that is really hard to use
because there are virtually no promises in that function. Consider you
want a clock to run at 666666 Hz and clk_round_rate(yourclk, 666666)
gives you 500000 Hz. What would you do? Even: What is the rate above
666666 Hz that is as good as 500000 Hz for your usecase? Is it 833332 Hz
or 888888 Hz? And do you want 666666 Hz or 666666.666666667 Hz and how
does that influence your search for the right clkrate? And it has the
same problem as the pwm waveform functions: Just because
clk_round_rate(yourclk, 666666) returned 500000 200 ms ago, it doesn't
mean that if I ask for 666666 now the world didn't change.

Best regards
Uwe

--q67kilu5fjsok7m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfBmyEACgkQj4D7WH0S
/k5NqAf/WApytnmHkQ66Co0aOUfhi42qw8eidGd2qhphO8rfJy+Ze2E9cYJMvVlw
XfJGUdb5jIlCEp4FVPkr93dyOjIiczbx7x8dreARGUuvtfTb7dMF3+C4J1yJ8m+j
42w1ZGCNNbUrU27vCCspiWkwsMuBz2ktAULCb9n+GtbfqUZtPto6jL7x40D14gqa
GoAZ8Ak3OQrQr/hgvXCwq80p6diyz8oM3hlc+QeNQWRJ4ftEiyCBWQuKMEPRyst+
7+1hS2S0ifHTf60mofwC9c5hUczTz8QAyXFllObCSbfpBP36KYiJo6NFhLlUzgEd
bJuDM96lGOSmfyxKmbNRnqZR6/BGWg==
=tLsR
-----END PGP SIGNATURE-----

--q67kilu5fjsok7m4--

