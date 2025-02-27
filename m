Return-Path: <linux-leds+bounces-4112-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18BFA48364
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 16:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2353E7A870E
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 15:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C83B26B95D;
	Thu, 27 Feb 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtoEvgtt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEC232792
	for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740671081; cv=none; b=La1hWYV56uflGXriyJL0oyOhts9T2FZVih0KRzQBb8A/FjIN7aM/GH3tC1lIv//OuF/343Aj1CBq6nUIai0j98ujvO2OZ28MJakn+nB9SysMC6fxg6nayt3b8pGmp8nzejzJqaD6+OOqnOyFnGKVdCen5bEwuRgIEcJ2MCy40WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740671081; c=relaxed/simple;
	bh=cmwlWgUGiBrxzsSi0XMsM6LX8XwWPXdEMltCjcZNrhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTpudXdxSII2p9+R9XzSsOEy6PX/ikjfFCISBrhHZh//3V7ZnOG6k8RTVn0kz48ABpwZCjWJim+/nAjip1bvsmpozqUnEB0+3eMc0peNd35ONZK31QzAt/QLnR3y8L7+972J7Drlb5ZMcHevpWxcVfFaoWoJYU4rWLbs9z66maI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtoEvgtt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb81285d33so217600666b.0
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 07:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740671078; x=1741275878; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rdmeu/qUg5UZArZwBy9tn4KHSIQpe0IPJEdQzsJhtnE=;
        b=UtoEvgttIDDtwvp5W7t/F6Xfh0UCahrcyQIXbHwRF6UFL1QJsUYh2FePUiHMucozxF
         fep38u9LeM9cjRgVJIlqrd8z56d4vIrhfYBsoLVdHRdAolnAz4DBuGJsfBXpb2QNjZls
         oI00rGwc+0gUixFODCRQBWMrjz150D67eUWAN7UxNP2Bii5P6pWHNcwPlgTmHqIv8/E2
         FzwlxN9s6SUhK9pX+jnGAT0p5iE6F5UDzb6OLa2c+wkdUjENKVSY5PAwM5JArl5B/3z9
         iDDWiZ1My9H8YZ95prlWJkIM6K2QYpjGCl20imBQQ53XNiKG0bu4W3k/TEFlotlxHxo7
         aKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740671078; x=1741275878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdmeu/qUg5UZArZwBy9tn4KHSIQpe0IPJEdQzsJhtnE=;
        b=fk+v73ypXo4YLZ+pHZ5Kk6z4wOcaVxg7iUwH2JgP0EFcrvCk1M7eW9/tzdF3wsiHqT
         i6VoUQq8e5upVoO/DA5f9GMgxjbQQRbfXPVvLicweZeKxP2rZaCLLe96xzK0GTxILeCG
         f4KmfW/603mjbIWRRxzTr0+FtzAswlnCP6v4dEYX4ZItLhoAJOaP1pPfWLvQHo8bU23E
         EWM7+vcs/lpJm1RBMdI/P4LBO/KNdG9Ya8OQbGGRDls/fbJlUvsKa5oFZJyCqIMU8Eo1
         wcu4ERCfzUOqRlwXf2B1xerzjNDFBHlGj5RokjIzQQ2EhrSMGTitEGMyZru/CQvivWOA
         KGYA==
X-Forwarded-Encrypted: i=1; AJvYcCUpiGaa4+q3+w4BAHo1C+d1V88foocElJR5eo0phtn3XoWrxYJPYh1xIiruUvpIG4Qr8tz+dNTQw1F1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjyf7Oj6iyRF0LTdzqef9seeZ+EobVfe0nfMy4Od45FAtQyZHq
	DZw2hzwSw5ochpjNPed36TU8XYMQJC2ZKB5jbm0/0HEr4yNEa3AzD5wDYMxTbxM=
X-Gm-Gg: ASbGncts4qwvvE7gqxeFowyl9ofoLlyYYWFIYk4AnuADzboHQ6qXMzHngEBr13h6CNR
	eSkx0hoxBRZl6pyi3tlGBLd6jjANKhk/NJH2Tq8Pw5wheTUl8ES2BaryFZrvXxowWfoGk0fu3Uj
	ounpnyyHhRenwCFjlyinaK/kuzSGZifYKWPLCAVV+XOOaiadB+J/9g2a8bQCzJ+Ss5Iv51Akz/C
	BJ+cFf57rQnCnPcg3b9XmlXmmB+0nkt6eDfrFXlCo6DrhFrumGwraCpnDEtgpJmTTy1BnWfehAx
	flrN5Bup5JYC0VzSuP6EEas=
X-Google-Smtp-Source: AGHT+IFPlvCas/g5XVwHNkkiLI/oKN1mfrZ2+ELWC+zipz3ozWe8GTuEuVMg9ijMVFp68LOxNM0W1A==
X-Received: by 2002:a17:906:6a19:b0:abb:6e95:b272 with SMTP id a640c23a62f3a-abc09a8091emr2789728166b.30.1740671077777;
        Thu, 27 Feb 2025 07:44:37 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755e0asm138697266b.133.2025.02.27.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:44:37 -0800 (PST)
Date: Thu, 27 Feb 2025 17:44:35 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Kamal Wadhwa <quic_kamalw@quicinc.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
Message-ID: <Z8CIY2OJUMqIOHGU@linaro.org>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
 <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
 <Z7zVgeM+7P7SLWIu@linaro.org>
 <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
 <Z7161SzdxhLITsW3@linaro.org>
 <5euqboshlfwweie7tlaffajzg3siiy6bm3j4evr572ko54gtbv@7lan3vizskt3>
 <Z8B2Bl/9uD3jPvQi@linaro.org>
 <j55de6bbipoavqx25w2s6qr7n6fv6w7bj3lrgyag4dlvvddbqv@shn22aqcqeci>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <j55de6bbipoavqx25w2s6qr7n6fv6w7bj3lrgyag4dlvvddbqv@shn22aqcqeci>

On 25-02-27 16:25:06, Uwe Kleine-König wrote:
> Hello Abel,
> 
> On Thu, Feb 27, 2025 at 04:26:14PM +0200, Abel Vesa wrote:
> > On 25-02-27 10:58:47, Uwe Kleine-König wrote:
> > > Can you please enable CONFIG_PWM_DEBUG, enable pwm tracing (
> > > 
> > > 	echo 1 > /sys/kernel/debug/tracing/events/pwm/enable
> > > 
> > > ) then reproduce the problem and provide the output of
> > > 
> > > 	cat /sys/kernel/debug/tracing/trace
> > > 
> > > .
> > 
> > $ cat trace
> > # tracer: nop
> > #
> > # entries-in-buffer/entries-written: 13/13   #P:12
> > #
> > #                                _-----=> irqs-off/BH-disabled
> > #                               / _----=> need-resched
> > #                              | / _---=> hardirq/softirq
> > #                              || / _--=> preempt-depth
> > #                              ||| / _-=> migrate-disable
> > #                              |||| /     delay
> > #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> > #              | |         |   |||||     |         |
> >         modprobe-203     [000] .....     0.938668: pwm_get: pwmchip0.0: period=1066407 duty_cycle=533334 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.938775: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=0 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.938821: pwm_get: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.938936: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.938982: pwm_get: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.939274: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=921458 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.939320: pwm_get: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.939434: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> >         modprobe-203     [000] .....     0.939480: pwm_get: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> >  systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=5000000 polarity=0 enabled=1 err=0
> >  systemd-backlig-724     [006] .....     9.079585: pwm_get: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> >  systemd-backlig-724     [006] .....     9.079698: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> >  systemd-backlig-724     [006] .....     9.079750: pwm_get: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > $
> > 
> > > 
> > > I didn't take a deeper dive in this driver combination, but here is a
> > > description about what *should* happen:
> > > 
> > > You're talking about period in MHz, the PWM abstraction uses
> > > nanoseconds. So your summary translated to the PWM wording is (to the
> > > best of my understanding):
> > > 
> > >   1. PWM backlight driver requests PWM with .period = 200 ns and
> > >      .duty_cycle = 200 ns.
> > > 
> > >   2. leds-qcom-lpg cannot pick 200 ns exactly and then chooses .period =
> > >      1000000000 / 4.26666 MHz = 234.375 ns
> > >      
> > >   3. leds-qcom-lpg then determines setting for requested .duty_cycle
> > >      based on .period = 200 ns which then ends up with something bogus.
> 
> The trace looks better than what I expected. 2. is fine here because it
> seems when Sebastian wrote "driver requests PWM with 5 MHz period" that
> meant period = 5000000 ns. That was then rounded down to 4266537 ns. And
> the request for period = 5000000 ns + duty_cycle = 5000000 ns was
> serviced by configuring period = 4266537 ns + duty_cycle = 4266537 ns.
> So that's a 100 % relative duty configuration as intended.
> 
> So just from the traces I don't spot a problem. Do these logs not match
> what actually happens on the signal?

What I do not get is why do we expect 2 pwm_get() and 2 pwm_apply()
calls each time ?

Need to dig a bit further.

But meanwhile, if the first pwm_apply() call goes all the way to the
provider, then the duty cycle value, when translated to the actual PWM
value that gets written to reg, will overflow. So this is what is wrong.
And this is what actually happens.

> 
> Best regards
> Uwe



