Return-Path: <linux-leds+bounces-4159-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE82A50207
	for <lists+linux-leds@lfdr.de>; Wed,  5 Mar 2025 15:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8D318868AD
	for <lists+linux-leds@lfdr.de>; Wed,  5 Mar 2025 14:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C325C1632EF;
	Wed,  5 Mar 2025 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arCxSNTe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47C156225
	for <linux-leds@vger.kernel.org>; Wed,  5 Mar 2025 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185175; cv=none; b=NT1G6g70oUzVbZ+ASlgNl8Dy95zhdi0dWp74V/c3zfHI2///i7IQsAWwvaOnOsFJlbHjT0HVFyhMz9oV7Ai4qLqXx6dhwenfK5sTbeKvBhLDtMa09Omg4BqH9kLZoXcs7t2sqBpPBlMxdLT1D9DUpYl+SpcEmPJKv2mWSuE2pUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185175; c=relaxed/simple;
	bh=sd7TPE/d3JgGRw6PG/R3kWQGpab/KpIkkHlXD/668nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wlr44+tR7G58Ec7pPdUu52FcFGcoX1XnkDjxs36jk2Z7S4Vv01he4GkO5lTRbo1qhwtf9xPC8MilSb02AAGBO2w4W5juXhqJEl3j+W3pW6cQSq9iCEBJ9DE/RoIpVab/1LgtocYQwGgQnnyUixZ9+kKByx6YD770jcDulEyS6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arCxSNTe; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso567872a12.1
        for <linux-leds@vger.kernel.org>; Wed, 05 Mar 2025 06:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741185172; x=1741789972; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CbWU81zQtv408Xqq4RqPzIYJc74nIIr6NJj34yo9wfw=;
        b=arCxSNTe3W+Kgu9w/bqqy+dJm+V6uWh1CVBtXzrxY84maKnobw5cHO1XjkVTgiunYe
         D4kmiLRv0Jv6tOttdCBxrwM30b5BfGWbmxoQ6T88XuU5bwHhycIeCMEImi4SmUvGjrN8
         VyksZb4wixwYcU8aZbaWb8HuRLG+9vfDC/SR0BuXjFnLl3PHKIxgI3uSbQ8GkW8uchYl
         7Nr2N07rY6zkutHbZoByBxKiWSgRtN7sKzEHe8VFREcF+H0b1rjdu71gSsER62OBq9dM
         C+XNUZQxN5rG7kJJnAQXqoW+fLLfOGWTKo/1H3oMYt5KfpcV7aM0G0qnxR8GkievofW9
         qY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185172; x=1741789972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbWU81zQtv408Xqq4RqPzIYJc74nIIr6NJj34yo9wfw=;
        b=vh3aJzS0bwfC5KyNIEJr580sqodGYfGtXwcFtuE8U9OvoY7qDWRrhZraT8VgUtc6b+
         0FFod1+NrJFYDju2nKR2skGYKOg7SMGuPnBC9b93wuFBTv3o9axlqiRf2L2gnHeojhKy
         6m1q5YnuBcFhXDwd7OxB2DDMjFZt3aZuxHEPuUMsVbqY3cRGWiEbOvYM7zrJBha+Gd/Y
         uiEAVmw4wMex4DpSEkhDhUSlH75/JTU5IWQp+/jRI+0roAFA9ylgPkilqlLKylVo03rS
         uiB0ubJ4N7Elq42ultUk+tItED9mjJRzn1LUTqwOm3f4FGBbEjKftdlHWlOzeTgJyzkH
         g7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVDRae+BQ1t317n+Rzmu8ShvXcx0+Ae5RgidWPcT0ccB90n02ngc1x26e1QwDmxJKshxcybEUY5zbTW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzj3wlR4s+5m8PKtGsX+OdFANhgW0mBgqFY+wfJUhB+ABL1CzI
	bt1JiSi6yvdSDZa6JwN3LK9ML0NnUna/e+Ge+sKLr+kNDah3azBl6XKixpoMIR8=
X-Gm-Gg: ASbGnctZr2hJXGj4+z5fAN61Qoc8l0+v3gotc1jaEwkJYN7O97mwEZyVaGtR3fCywxe
	41/NpfQLaoYOGw9oifWRFKlJeSA6RCZDsu9YjHJrETlDObRyOvvPIs323H3k7MvcAg9xmKXidgz
	cILPqvsG5zK0Fh5fbKXSH4L0i0P8XCddcQaxSs3s8cQs5JUWVGyUO3718mk0I2dSK9qhHSX1VSG
	EX4UV8o9Q6j+Cl7SCXGLOM6ho5MpxaxTw0d7yj2xgHcESqXjU8FWWi8beJLYAbdml+0ajk9Pt0V
	6eHPKg9yuF0VqoLKTySOry8J3yCxeWKB/JLckO1KWg==
X-Google-Smtp-Source: AGHT+IHAqoBQT9Hk+U5fDiJxTYejm1CM0gFhnnswNHn6T8yBkT5kBmmJaaPOzv4fJvwsqsNj1NB98g==
X-Received: by 2002:a05:6402:1ece:b0:5e4:d75a:573e with SMTP id 4fb4d7f45d1cf-5e59f4f8e28mr3246228a12.32.1741185171960;
        Wed, 05 Mar 2025 06:32:51 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a6f2bsm9723207a12.75.2025.03.05.06.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:32:50 -0800 (PST)
Date: Wed, 5 Mar 2025 16:32:47 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Kamal Wadhwa <quic_kamalw@quicinc.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] leds: rgb: leds-qcom-lpg: Compute PWM value based on
 period instead
Message-ID: <Z8hgj11p+TY1546x@linaro.org>
References: <20250303-leds-qcom-lpg-compute-pwm-value-using-period-v1-1-833e729e3da2@linaro.org>
 <ylnkjxnukss7askv7ip5htrb4tyjzhpw7jim2se6rloleq5h6w@ngk7lbk26hxj>
 <Z8bGHV4PIkY4te6V@linaro.org>
 <5uk75v3cpy2hymdgjyvqdwyda34t2pn7jqyupyvhmqgo3wlxkl@uim4lth7lipa>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5uk75v3cpy2hymdgjyvqdwyda34t2pn7jqyupyvhmqgo3wlxkl@uim4lth7lipa>

On 25-03-04 16:38:57, Uwe Kleine-König wrote:
> On Tue, Mar 04, 2025 at 11:21:33AM +0200, Abel Vesa wrote:
> > On 25-03-04 07:24:32, Uwe Kleine-König wrote:
> > > Hello Abel,
> > > 
> > > On Mon, Mar 03, 2025 at 06:14:36PM +0200, Abel Vesa wrote:
> > > > Currently, the implementation computes the best matched period based
> > > > on the requested one, by looping through all possible register
> > > > configurations. The best matched period is below the requested period.
> > > 
> > > The best matched period *isn't above* the requested one. An exact match
> > > is fine.
> > > 
> > 
> > Yep, that's better. Will re-word.
> > 
> > > > This means the PWM consumer could request duty cycle values between
> > > > the best matched period and the requested period, which with the current
> > > > implementation for computing the PWM value, it will result in values out
> > > > of range with respect to the selected resolution.
> > > 
> > > I still don't understand what you mean with resolution here.
> > 
> > Resolution in this context means the number of bits the PWM value
> > (register value) is represented in. Currently, the driver supporst two PWM
> > HW subtypes: normal and Hi-Res. Normal ones recently got support for changing
> > the resolution between 6 bits or 9 bits. The high resolution ones support
> > anything between 8 bits and 15 bits.
> > 
> > > 
> > > I guess you spend some time understanding the workings of the driver and
> > > you also have an example request that results in a hardware
> > > configuration you don't like. Please share the latter to a) support your
> > > case and b) make it easier for your reviewers to judge if your change is
> > > indeed an improvement.
> > 
> > Sure, will bring up the 5ms period scenario again.
> > 
> > When the consumer requests a period of 5ms, the closest the HW can do in
> > this case is actually 4.26ms. Since the PWM API will continue to ask for
> > duty cycle values based on the 5ms period, for any duty cycle value
> > between 4.26ms and 5ms, the resulting PWM value will be above 255, which
> > has been selected as best resolution for the 4.26ms best matched period.
> > 
> > For example, when 5ms duty cycle value is requested, it will result in a
> > PWM value of 300, which overflows the 255 selected resolution.
> 
> this is the bug you have to fix then. The PWM value (that defines the
> duty cycle) has to be calculated based on .period = 4.26 ms and capped
> at 255. So assuming that 0 yields a duty cycle of 0 ms and 255 yields
> 4.26 ms, a request for .duty_cycle = 4; + .period = 5 should result in an
> actual .duty_cycle = 239 / 255 * 4.26 ms = 3.992705882352941 ms;
> + .period = 4.26 ms.

OK then. The patchset that fixes this according to your suggestion is
already on the list (re-spun):

https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org/

> 
> > > > So change the way the PWM value is determined as a ratio between the
> > > > requested period and duty cycle, mapped on the resolution interval.
> > > 
> > > Is the intention here that (for the picked period) a duty_cycle is
> > > selected that approximates the requested relative duty_cycle (i.e.
> > > .duty_cycle / .period)?
> > 
> > Yes, that exactly what the intention is.
> > 
> > > If it's that: Nack. This might be the right thing for your use case, but
> > > it's wrong for others, it complicates the driver because you have spend
> > > more effort in the calculation and (from my POV even worse) the driver's
> > > behaviour deviates from the usual one for pwm drivers. I admit there are
> > > some other lowlevel pwm drivers that are not aligned to the procedure I
> > > described that should be used to determine the register settings for a
> > > given request. But I target a common behaviour of all pwm drivers
> > > because that is the only way the pwm API functions can make a promise to
> > > its consumers about the resulting behaviour. Reaching this is difficult,
> > > because some consumers might depend on the "broken" behaviour of a given
> > > lowlevel driver (and also because analysing a driver to check and fix
> > > its behaviour is an effort). But "fixing" a driver to deviate from the
> > > declared right behaviour is wrong and includes all downsides that make
> > > me hesitate to align the old drivers to the common policy.
> > 
> > OK, fair enough. But I still don't get what you expect from the provider
> > that can't give the exact requested period. Do you expect the consumer
> > to request a period, then provider compute a best matched one, which in
> > our case is pretty far, and then still give exact duty cycle values ?
> > 
> > Like: request 5ms period, get 4.26ms instead, then request 4ms duty
> > cycle and get exact 4ms duty cycle when measured, instead of a
> > proportional value to the best matched period?
> 
> Yes.
>  
> > If so, then what happens when consumer asks for 5ms duty cycle?
> > Everything above the 4.26ms will just represent 100% duty cycle.
> 
> Yes.

I still think this is wrong.

I do agree with the exact value. I advocated for it on the other
thread.

But the fact that the API allows requests with values above what the
provider can do is wrong.

In this specific case, we are talking about top 15% that it just
thrown away. But it becomes even worse for others.

> 
> > > The policy to pick a hardware setting is a compromise between consumer
> > > needs and what is straight forward to implement for (most) hardware
> > > drivers. Please stick to that. If you want more flexibility and
> > > precision in your consumer, please consider converting the pwm driver to
> > > the waveform API.
> > 
> > That means the pwm_bl driver will have to switch to waveform API, IIUC.
> 
> Yes, if the pwm_bl driver cares about that precision it has to switch.
> 
> While the waveform API isn't expressive enough, just use 4260000 as
> period in the pwm_bl device, or ignore the missing precision.
> 
> > That might break other providers for the pwm_bl consumer, wouldn't it?
> 
> Given that the consumer side of the waveform API only works with drivers
> that are converted: maybe. You could fall-back to the legacy API.

Based on the provider's best matched period? Hm.

>  
> > > > [...]
> > > > ---
> > > > base-commit: 0067a4b21c9ab441bbe6bf3635b3ddd21f6ca7c3
> > > 
> > > My git repo doesn't know that commit. Given that you said your patch
> > > bases on that other series, this isn't surprising. Please use a publicly
> > > available commit as base parameter, otherwise you (and I) don't benefit
> > > from the armada of build bots because they just silently fail to test in
> > > this case.
> > 
> > Well, this is a pretty common practice. When the patch relies on other
> > patches that haven't been merged yet, but are still on the list, you
> > can't really base it on a publicly available commit.
> > 
> > And the fixes patchset that this is based on is needed for this to work.
> > 
> > So I really don't get how this can be done differently.
> 
> You can still use --base=$newestpubliccommit and git-format-patch will
> at least give a chance to the build bots by emitting patch-ids for all
> the commits between the public base and the start of your patch series.

Got it. I use b4 for most patches nowadays. I'll try to make use of it's
--edit-deps and see where that lands.

> 
> Best regards
> Uwe

Thanks,
Abel

