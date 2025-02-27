Return-Path: <linux-leds+bounces-4116-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D712A48624
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 18:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03AC97A151D
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 17:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686C21DAC88;
	Thu, 27 Feb 2025 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ww5FgaNi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565151AC435
	for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675921; cv=none; b=fk6psRiyddqv12Zd1HNvZKyYaxEgAY2Yb8YRGkrwVcuZIGNvn7H7raW1bBvnagY33VFDr5SDehznFjzM3m0bDoMSKdi/PLbJvAl7QMGUxLZhOUlycLXG0ujSBTMIQfnacA097Iw655NasJruJZ79DbHWcaSyQvV+fO3xVq7GQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675921; c=relaxed/simple;
	bh=7XChtsa0NQK2jNQqByJFv42QLQZfG/59qbf5QMzlocg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB+qeBcXSbKTRfiIX+bXxw7y8mXdXGejtHhB/F0iNN1fYBRqE8Fx6BTBaOCgUhgqWrpRjp213sATQ+1F5D/AmBDrW/Mre89tRCHA0TgLMPqbPe6Eb/MfINJ9RhHyZzZ13KHGKrStzJ1kUOo/Qb8co9WOyr3KDVAO/3k0zbdHGio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ww5FgaNi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso200544866b.2
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740675917; x=1741280717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6Y8JQULavsNlLpEQIX3xqjGtKxhdLW9C1hzs6N6L9o=;
        b=Ww5FgaNiNbH0Z21miuSO3vXT1jgydSjnpMGuH+EJC4ev26qbHHcfOQ2waCoRyE8x9g
         AU6pQ8lNE7Sj//4JCzvkHec91jMaGPoemEfPZWuPZquRo0SDyKAnHH6EA/oZAoTp85HR
         AI33fY7zKxiDKiLCPd4uqQxpi/+kLXMFrLCSb9g+OnZchauEowdwQSTZTLAU2p+ywsDH
         zxzvjImMyqFlcachADC2ftJpqkulwVUNLbJ9fN44EysKwGI7IiaCjUbZjzFLth0Z4g7a
         QiaSzvuOQqaBjGVFf57Jf6rSxNxe8FEuNjikpQa5TQVvjpIUTMVG8Skxaj71No3aGgqa
         wUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675917; x=1741280717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Y8JQULavsNlLpEQIX3xqjGtKxhdLW9C1hzs6N6L9o=;
        b=sx3Lowj9QSEZrszNjhwmhFDgkWPpiws2HwSxPXwdnGwska+aI+5R4ymkyVp/+N+gmi
         b7TUC/m4U+wez6vdehxkjmZTYeXq3FrtGNZrUxYe93b1fHcI+BGyrbrgWzcob+cUxnTy
         LpOuBekMXhBMhhiyl+sB4EBuNJbYO7v//XjJBM+Tq3CnV8m+YucBZS233nLTTb0F2D7n
         VqSsHyJK12vSRCZp8nLE+LZt/rHu0XE7ns5vtyzhVxDVWVHC96GiTzM0x0Jf7xH1uzUU
         Dp+RcwPVuqtYRpR1s+1K6gB46JwYWOIe6PAKuqERqz6+n4DjGC21YkZrvujUTzc+YANi
         S69g==
X-Forwarded-Encrypted: i=1; AJvYcCXmH/UYAhmeju9rdqXKiAQqaDRi9IPJVfU80VuIRzAvMAb5DSBSDRiG6M8TF2t3WDGFHP6WYXuw639S@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsMd2FyrdfjYTna92s6c7oxGRf9yofd9b8loon6D7ebvauD1m
	14+tXplD63dlGFfJY8VMlhebg0gN+Ph3pb8VgcMETPVifhLT/YqbrHqhriviWGA=
X-Gm-Gg: ASbGncvH0c4WYvB/BBSoeh6L68hsoI7Hd1zxnTgpDseE3aDEw3eNFzEQ2eAzyR1QPJa
	5LZOfs7zbvPUPVlo9OKXj2Gxsj0j7nG0S8K5FVLqcfGsBIJKPVeIPD1+4ksrQZCas4UlwIFQVSu
	bV31IOGCjAuWoXsOH7hxzuZvV0jGmPgipoWdwVU3Tm398lmtXg6oVepNBWM1spCR5yo+ing0t2E
	Me2LlaesUykPFO9Y+263jy+u4rjUbG0IelAISxsGs2I1h1N3LaJ9RK1K6UxMHgAiFoOkGgWKRH8
	rrJgI2ct6iaSMQYRjvO+r3s=
X-Google-Smtp-Source: AGHT+IEqzm7n+9CgLAtGOBByJjji4KY3D/kBRSRdTZK29CzMh0eKvJAC98wBTDUbj6GZHbvPXAzgOQ==
X-Received: by 2002:a17:906:d542:b0:ab7:beeb:d1f1 with SMTP id a640c23a62f3a-abf26837fcemr20886166b.51.1740675916853;
        Thu, 27 Feb 2025 09:05:16 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9990sm150354966b.35.2025.02.27.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:05:16 -0800 (PST)
Date: Thu, 27 Feb 2025 19:05:14 +0200
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
Message-ID: <Z8CbSvlG856oxQRw@linaro.org>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
 <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
 <Z7zVgeM+7P7SLWIu@linaro.org>
 <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
 <Z7161SzdxhLITsW3@linaro.org>
 <5euqboshlfwweie7tlaffajzg3siiy6bm3j4evr572ko54gtbv@7lan3vizskt3>
 <Z8B2Bl/9uD3jPvQi@linaro.org>
 <j55de6bbipoavqx25w2s6qr7n6fv6w7bj3lrgyag4dlvvddbqv@shn22aqcqeci>
 <Z8CIY2OJUMqIOHGU@linaro.org>
 <Z8CTqdFafLY17C25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8CTqdFafLY17C25@linaro.org>

On 25-02-27 18:32:41, Abel Vesa wrote:
> On 25-02-27 17:44:35, Abel Vesa wrote:
> > On 25-02-27 16:25:06, Uwe Kleine-König wrote:
> > > Hello Abel,
> > > 
> > > On Thu, Feb 27, 2025 at 04:26:14PM +0200, Abel Vesa wrote:
> > > > On 25-02-27 10:58:47, Uwe Kleine-König wrote:
> > > > > Can you please enable CONFIG_PWM_DEBUG, enable pwm tracing (
> > > > > 
> > > > > 	echo 1 > /sys/kernel/debug/tracing/events/pwm/enable
> > > > > 
> > > > > ) then reproduce the problem and provide the output of
> > > > > 
> > > > > 	cat /sys/kernel/debug/tracing/trace
> > > > > 
> > > > > .
> > > > 
> > > > $ cat trace
> > > > # tracer: nop
> > > > #
> > > > # entries-in-buffer/entries-written: 13/13   #P:12
> > > > #
> > > > #                                _-----=> irqs-off/BH-disabled
> > > > #                               / _----=> need-resched
> > > > #                              | / _---=> hardirq/softirq
> > > > #                              || / _--=> preempt-depth
> > > > #                              ||| / _-=> migrate-disable
> > > > #                              |||| /     delay
> > > > #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> > > > #              | |         |   |||||     |         |
> > > >         modprobe-203     [000] .....     0.938668: pwm_get: pwmchip0.0: period=1066407 duty_cycle=533334 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.938775: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=0 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.938821: pwm_get: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.938936: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.938982: pwm_get: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.939274: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=921458 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.939320: pwm_get: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.939434: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> > > >         modprobe-203     [000] .....     0.939480: pwm_get: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> > > >  systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=5000000 polarity=0 enabled=1 err=0
> > > >  systemd-backlig-724     [006] .....     9.079585: pwm_get: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > > >  systemd-backlig-724     [006] .....     9.079698: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > > >  systemd-backlig-724     [006] .....     9.079750: pwm_get: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > > > $
> > > > 
> > > > > 
> > > > > I didn't take a deeper dive in this driver combination, but here is a
> > > > > description about what *should* happen:
> > > > > 
> > > > > You're talking about period in MHz, the PWM abstraction uses
> > > > > nanoseconds. So your summary translated to the PWM wording is (to the
> > > > > best of my understanding):
> > > > > 
> > > > >   1. PWM backlight driver requests PWM with .period = 200 ns and
> > > > >      .duty_cycle = 200 ns.
> > > > > 
> > > > >   2. leds-qcom-lpg cannot pick 200 ns exactly and then chooses .period =
> > > > >      1000000000 / 4.26666 MHz = 234.375 ns
> > > > >      
> > > > >   3. leds-qcom-lpg then determines setting for requested .duty_cycle
> > > > >      based on .period = 200 ns which then ends up with something bogus.
> > > 
> > > The trace looks better than what I expected. 2. is fine here because it
> > > seems when Sebastian wrote "driver requests PWM with 5 MHz period" that
> > > meant period = 5000000 ns. That was then rounded down to 4266537 ns. And
> > > the request for period = 5000000 ns + duty_cycle = 5000000 ns was
> > > serviced by configuring period = 4266537 ns + duty_cycle = 4266537 ns.
> > > So that's a 100 % relative duty configuration as intended.
> > > 
> > > So just from the traces I don't spot a problem. Do these logs not match
> > > what actually happens on the signal?
> > 
> > What I do not get is why do we expect 2 pwm_get() and 2 pwm_apply()
> > calls each time ?
> 
> OK, so the second pwm_apply() is due to CONFIG_PWM_DEBUG.
> 
> But still, the first pwm_apply() requests duty cycle of 5MHz:
> 
> systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=5000000 polarity=0 enabled=1 err=0
> 
> So since the period is 4.26MHz, due to the knobs selected by the
> provider, this duty cycle will result in a PWM value that is above the
> selected resolution, as I already mentioned.
> 

On top of that, the duty cycle in debugfs is also reported as 5000000ns
when in fact it is 4266666ns, as the trace shows.

> > 
> > Need to dig a bit further.
> > 
> > But meanwhile, if the first pwm_apply() call goes all the way to the
> > provider, then the duty cycle value, when translated to the actual PWM
> > value that gets written to reg, will overflow. So this is what is wrong.
> > And this is what actually happens.
> > 
> > > 
> > > Best regards
> > > Uwe
> > 
> > 
> > 
> 

