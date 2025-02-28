Return-Path: <linux-leds+bounces-4121-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC52A49430
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 09:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9017A546E
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BB1254879;
	Fri, 28 Feb 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vR/k2l7J"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56271EDA2F
	for <linux-leds@vger.kernel.org>; Fri, 28 Feb 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733155; cv=none; b=mn1D9xyC7s3vU+y+6RwJo/sHrYjbXp+6kx3VAM1o9YAt55FIt3UtVWomSSXkYZuxiPgU5s1N3ehDTyBWlBPE4dWuqBGbMZt0W7oKvIuL2tUp97M1kUdO3RsUFZ2gS+SQug6UijT7dywhi2avsJwTJaFDUrqqgPCcqHj4PQo+ZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733155; c=relaxed/simple;
	bh=bLEtAyE5Aa/xsQIBOnXYf2Hy93VCBG3sU+stkJWUAMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJzma/3pAT5xbKeVM4kqvHJqZmeaQuGfuZcVZxosKAFbIC8dxQJyu1kNh/LJNAhyRvNDTeUIEy5C1tEA2n3JkjKmjQS3jJH4aTyc+Z/jWxWHEyOriGi84+n1FWaiorywzfAG5m8r/YrpqsMOBAWM7l7iAI9U70Zv314D81jQU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vR/k2l7J; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so3371662a12.0
        for <linux-leds@vger.kernel.org>; Fri, 28 Feb 2025 00:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740733152; x=1741337952; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mo2JWZvfARQxbztcC0oXWR4xyuLy9YblRRhrM00mM5o=;
        b=vR/k2l7J/j5J2Hi8B4DtGrAlElh7t1Lq91fovjRQ6yxzQpXca7TKBNsiBx8mlW023o
         d7dVqaFFSMsGHcR4R4g5u+h+tw9T/Wj4cMYZkKa5RaDVWEBeQosxWgrEULN3GHSeIjFt
         MpJXougfTFrJMyY4MG3LyoZuzTx9V5sIAr9w/9wFTXTIFNRVmQhERkG/J+36daVqu6uI
         F+mYZq9UeDv0rIfefAUWafW0SkS1SqPPs/sTaCU+sNRaV6nE/J0EjJ7cHAeQEhUF5Z9W
         7LFEAX8kNxASWxQ2Y3oAdCNllZqqIYXTOmkzXT0yYvWgmkTtS5S+Ibz0N2ibmm8AV4Bj
         cR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733152; x=1741337952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mo2JWZvfARQxbztcC0oXWR4xyuLy9YblRRhrM00mM5o=;
        b=Tm0r82BziSa+wvuCFrG3KaWJPgzL0X6fhTUhldt5gvFnvbfCVMh9hm/ANhSWba/Pye
         IfPTYVNdIM0bf4odm4Insmww8JqxeveIVBSGBJ9XXZ2SRSSzqRAWcGL5PynYLOiDriO6
         jWp33cz/R3i4baYdL46OEkSI97yKosBtmK/HsSrsVj7yKeGBWwfmmDtNcug580TH2Bk0
         bHFlGeKivME9wQD3TwKXjgrPLBu4Nu82QdoMWVtanRXrTDrFM/JonkilUwPIaUQQWFNC
         1RpGisfTBacOvXVLSE3yix4YSPtCVgNnEPYe8EEE6mHCcTNbZdRrljHGWiymtn3vGr2L
         ZfVg==
X-Forwarded-Encrypted: i=1; AJvYcCUzuI8s7W1BMWdpJ2hY9B3cZVKY1V5tdgEfTDZ6gMNlkbvZzEs7BcsA6cty1yw59vuM95couKmjf+Iw@vger.kernel.org
X-Gm-Message-State: AOJu0YyncABNOBQYSmXA8vzt9c8otOV7yT0Ife3HSk50t7QHUvzpUaKo
	5W+7dS1PeAML/I4vL8WohTaY4E04R/zqVrHceoT+/J5aZO+ZChCdYc52ATGVL3LQy0x0b/DDXAD
	X
X-Gm-Gg: ASbGnctKDfuaPkvN5nkYRSeHCfKfskljfhGXJAPB4JOjXL7PVCbyBu+/BbTiQrBfT/g
	mPfdQpbiWOku/DPbvSv6BvZbVxOZ0KsTY3iyt3duJj0umyw6tuGVtPyYmHZ5RPk/ozo85s3SAVx
	rQrMj4lQcggLz7rxHj/ZFQC00Qva27rDQOrE5ovqDn5osNO3OWqqK776SxLbVL3GpYi0DxEfTNK
	FhAgUXmw6j/DMuEp6RhnxT2q1s49uIbecOVJ8QGRqzmqKGhmX21FYPJYplImq+1DHcW1G47ePks
	qQqTRFY1iKGiCe994uZSuT8=
X-Google-Smtp-Source: AGHT+IG+ohc2Pb9yFbQaY7IHiQEBgBBf60B3jiO2zg3pP45+H+r70TxRLEMjkL+Z5vuXly0heAE9eQ==
X-Received: by 2002:a17:907:7f22:b0:abb:b209:aba6 with SMTP id a640c23a62f3a-abf25da2d4amr224744566b.3.1740733151822;
        Fri, 28 Feb 2025 00:59:11 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf3e117114sm24695766b.147.2025.02.28.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:59:11 -0800 (PST)
Date: Fri, 28 Feb 2025 10:59:09 +0200
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
Message-ID: <Z8F63fS/RDnF8+oU@linaro.org>
References: <Z7zVgeM+7P7SLWIu@linaro.org>
 <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
 <Z7161SzdxhLITsW3@linaro.org>
 <5euqboshlfwweie7tlaffajzg3siiy6bm3j4evr572ko54gtbv@7lan3vizskt3>
 <Z8B2Bl/9uD3jPvQi@linaro.org>
 <j55de6bbipoavqx25w2s6qr7n6fv6w7bj3lrgyag4dlvvddbqv@shn22aqcqeci>
 <Z8CIY2OJUMqIOHGU@linaro.org>
 <Z8CTqdFafLY17C25@linaro.org>
 <Z8CbSvlG856oxQRw@linaro.org>
 <ioater5m23lhkmyik3hurozol6vtyx6ovac3phmvcphrmmprwb@igggmox3jz5m>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ioater5m23lhkmyik3hurozol6vtyx6ovac3phmvcphrmmprwb@igggmox3jz5m>

On 25-02-27 19:09:39, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Feb 27, 2025 at 07:05:14PM +0200, Abel Vesa wrote:
> > On 25-02-27 18:32:41, Abel Vesa wrote:
> > > On 25-02-27 17:44:35, Abel Vesa wrote:
> > > > On 25-02-27 16:25:06, Uwe Kleine-König wrote:
> > > > > Hello Abel,
> > > > > 
> > > > > On Thu, Feb 27, 2025 at 04:26:14PM +0200, Abel Vesa wrote:
> > > > > > On 25-02-27 10:58:47, Uwe Kleine-König wrote:
> > > > > > > Can you please enable CONFIG_PWM_DEBUG, enable pwm tracing (
> > > > > > > 
> > > > > > > 	echo 1 > /sys/kernel/debug/tracing/events/pwm/enable
> > > > > > > 
> > > > > > > ) then reproduce the problem and provide the output of
> > > > > > > 
> > > > > > > 	cat /sys/kernel/debug/tracing/trace
> > > > > > > 
> > > > > > > .
> > > > > > 
> > > > > > $ cat trace
> > > > > > # tracer: nop
> > > > > > #
> > > > > > # entries-in-buffer/entries-written: 13/13   #P:12
> > > > > > #
> > > > > > #                                _-----=> irqs-off/BH-disabled
> > > > > > #                               / _----=> need-resched
> > > > > > #                              | / _---=> hardirq/softirq
> > > > > > #                              || / _--=> preempt-depth
> > > > > > #                              ||| / _-=> migrate-disable
> > > > > > #                              |||| /     delay
> > > > > > #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> > > > > > #              | |         |   |||||     |         |
> > > > > >         modprobe-203     [000] .....     0.938668: pwm_get: pwmchip0.0: period=1066407 duty_cycle=533334 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.938775: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=0 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.938821: pwm_get: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.938936: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.938982: pwm_get: pwmchip0.0: period=4266537 duty_cycle=0 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.939274: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=921458 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.939320: pwm_get: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.939434: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> > > > > >         modprobe-203     [000] .....     0.939480: pwm_get: pwmchip0.0: period=4266537 duty_cycle=921355 polarity=0 enabled=1 err=0
> > > > > >  systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=5000000 polarity=0 enabled=1 err=0
> > > > > >  systemd-backlig-724     [006] .....     9.079585: pwm_get: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > > > > >  systemd-backlig-724     [006] .....     9.079698: pwm_apply: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > > > > >  systemd-backlig-724     [006] .....     9.079750: pwm_get: pwmchip0.0: period=4266537 duty_cycle=4266537 polarity=0 enabled=1 err=0
> > > > > > $
> > > > > > 
> > > > > > > 
> > > > > > > I didn't take a deeper dive in this driver combination, but here is a
> > > > > > > description about what *should* happen:
> > > > > > > 
> > > > > > > You're talking about period in MHz, the PWM abstraction uses
> > > > > > > nanoseconds. So your summary translated to the PWM wording is (to the
> > > > > > > best of my understanding):
> > > > > > > 
> > > > > > >   1. PWM backlight driver requests PWM with .period = 200 ns and
> > > > > > >      .duty_cycle = 200 ns.
> > > > > > > 
> > > > > > >   2. leds-qcom-lpg cannot pick 200 ns exactly and then chooses .period =
> > > > > > >      1000000000 / 4.26666 MHz = 234.375 ns
> > > > > > >      
> > > > > > >   3. leds-qcom-lpg then determines setting for requested .duty_cycle
> > > > > > >      based on .period = 200 ns which then ends up with something bogus.
> > > > > 
> > > > > The trace looks better than what I expected. 2. is fine here because it
> > > > > seems when Sebastian wrote "driver requests PWM with 5 MHz period" that
> > > > > meant period = 5000000 ns. That was then rounded down to 4266537 ns. And
> > > > > the request for period = 5000000 ns + duty_cycle = 5000000 ns was
> > > > > serviced by configuring period = 4266537 ns + duty_cycle = 4266537 ns.
> > > > > So that's a 100 % relative duty configuration as intended.
> > > > > 
> > > > > So just from the traces I don't spot a problem. Do these logs not match
> > > > > what actually happens on the signal?
> > > > 
> > > > What I do not get is why do we expect 2 pwm_get() and 2 pwm_apply()
> > > > calls each time ?
> > > 
> > > OK, so the second pwm_apply() is due to CONFIG_PWM_DEBUG.
> 
> ack. This is done just for the tests implemented in CONFIG_PWM_DEBUG, as
> are the two pwm_get()s.
> 
> > > But still, the first pwm_apply() requests duty cycle of 5MHz:
> 
> 5 ms, yes. But it cannot give you 5 ms and so you get 4.266 ns.
> 
> > > systemd-backlig-724     [006] .....     9.079538: pwm_apply: pwmchip0.0: period=5000000 duty_cycle=5000000 polarity=0 enabled=1 err=0
> > > 
> > > So since the period is 4.26MHz, due to the knobs selected by the
> > > provider, this duty cycle will result in a PWM value that is above the
> > > selected resolution, as I already mentioned.
> 
> "above the selected resolution"? Do you mean you don't get the exact
> value that you requested?

I think I understand your point now.

You expectation is that the provider would remap the entire range of the
period to whatever the HW can do.

So in this case, when 5ms is requested as duty cycle from consumer, the 
provider will select the max value.

What the current implementation of the leds-qcom-lpg does is that will
expect a duty cycle request of up to 4.26ms. And according to you, even
if the consumer requests 5ms, the leds-qcom-lpg driver should write the
value of 255 (which is what the selected resolution allows (1 << 8) ) and
not compute a higher value.

I think this is wrong though. The fact that the pwm generic framework
reports 5ms when it is actually 4.26ms should be considered wrong.
For cases where the exact value of the duty cycle matters, this would
not even make sense.

Correct me if I'm wrong, but the pwm API should behave more like:
The consumer should ask for the closest period the HW can actually do
and then use that closest period from there on for every duty cycle
request. This way, if the consumer initially wants 5ms but the provider
can do only 4.26ms instead, at least the consumer would be able to
correct its duty cycle requests based on what the HW says it can do.

> 
> > On top of that, the duty cycle in debugfs is also reported as 5000000ns
> > when in fact it is 4266666ns, as the trace shows.
> 
> Yes. Consider that a relict from the times when there was no
> pwm_get_state_hw(). Both values are interesting in different situations.
> So just telling the real parameters isn't the optimal way forward
> either.
> 
> Something like the patch I showed in
> https://lore.kernel.org/all/7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm/

And this patchset only adds the info of actual value that the HW is actually doing.
So basically, the already existing state in this case will represent the
"desired" state.

> would make you a bit luckier I guess. Feel free to polish that one a bit
> (e.g.  by checking the return value of pwm_get_state_hw() and acting
> sensible in reply to it) and send a proper patch. (A Suggested-by for me
> is enough for such a patch, grab authorship yourself.)
> 
> > > > Need to dig a bit further.
> > > > 
> > > > But meanwhile, if the first pwm_apply() call goes all the way to the
> > > > provider, then the duty cycle value, when translated to the actual PWM
> > > > value that gets written to reg, will overflow.
> 
> No it will not. The .duty_cycle value (also 5000000 ns) will reach the
> lowlevel PWM driver together with .period = 5000000 ns. Both are rounded
> down to 4266666ns. I see no overflow. 

Again, the consumer is being lied to. It expects 5ms and gets 4.26ms
instead.

Imagine a device that is controlled via PWM and needs exact duty cycle
values in ms, what would the consumer driver do in this case?

And to make things worse, when the consumer is asking for duty cycle of
4ms while the period requested is 5ms (which would be 80%), the period
the provider will do is actually 4.26ms while the duty cycle would be
~3.41ms, which if the pwm step (reg value) doesn't allow, it will probably
result in an actual value that is even further than what the consumer
is expecting.

So I'm thinking maybe the pwm should probably even ask the provider
for what duty cycle it will provide based on provider's provided period
and then decide if the resulting duty cycle is what it really wants.

IIRC, this is more in line with what the CCF (common clocks framework)
currently does.

> 
> Best regards
> Uwe



