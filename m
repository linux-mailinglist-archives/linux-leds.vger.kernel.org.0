Return-Path: <linux-leds+bounces-4074-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D1A4370B
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 09:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40B4C16CCAF
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 08:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050701A3144;
	Tue, 25 Feb 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEKuM0oY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B849525D541
	for <linux-leds@vger.kernel.org>; Tue, 25 Feb 2025 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471003; cv=none; b=JF3Q2kh99EOYddNMlCph+15lJsxP7IxNcPpT5BG5EBSSCErFBizlwzYoUDpGYZhKRhWqUel3dCX0jm3xOWZElzmIBiCe6ySoxsLzbRYnwjC56xfe0lMAXRrTEclxDdlkCPQqn/9wuvfpw1rT+0fQlRq6q/QQB0c4qOZCtkrk+Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471003; c=relaxed/simple;
	bh=FZCNASq3rvfaC6lcFJo9JAb0MLja2YS28ohHqS34PeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usOf3GNhHCKAlhXve5FlQ6pdJ3LS41dHvfNsBuOVmp3VzLjQ0CzrlmniZI7hPp23IepcEHrpUz/RyGHfW3Ck6Kse8uQT+gilVyNaLmHk7UhDPyj8m7NTY9CEtqPIR3vnkC2Pw7aBaG9vdgFHN0lOpcF0PQorue7jekVh804oLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEKuM0oY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbac134a19so810847866b.0
        for <linux-leds@vger.kernel.org>; Tue, 25 Feb 2025 00:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740471000; x=1741075800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTM6XCPTYu7eEjTXkG4qQhEeGs1vhsShGtg0r58ff2g=;
        b=EEKuM0oYoQZT+TnwOgmeOjamkfzhSqs+kpxvRVTD25EnuJF/49fTFkvjyE1bZgNqyy
         8FipbJDvIUgPsksqgCFsGOjsOobnBOEjT7xNoE8EOQkkOCaNaLp5QRXegkUIk5dFctwW
         wt8dZp44IW7vxMkBZTlnxdi5NEvJBNWVE4Khj9i3c5nrUqVI7br6GJK1ikYY3Ko0BzeA
         neCDCQGN0OvRzd8DIdicL687pvR9q1+IvBDYGBvBvc1mvsASwgSAqQwPr8oZN+bm+OIa
         7GzPOmPqwQ7YzR29xMKizGr9Y1Y/7yrDU21K0b3Kf1TFyK6hcUQpgy364EzjwxkTR6I6
         VvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471000; x=1741075800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTM6XCPTYu7eEjTXkG4qQhEeGs1vhsShGtg0r58ff2g=;
        b=Ck5OaAs6XKq625siQNC7VoCFdroDFvcm+pvqTidsVxsLx15y31+1/gEYx3Y/Cr/rns
         PFarFvHjyS1JM0OkNx7EmnS0cj6Ax9Llm64+GQloRSNuutCc/MBf+7xuuXo1CycHcs0N
         iBy0fRl0xQGAOp7TJGKFNrkjem2MWOCd9Jqrewea9UstY2nT/uvQiammAqUQySJqWxvs
         trsYcGEYYCH9Bbbr0zLCGI5KIYnyLGI5/NxkjEnbpu2T91mop19bNxnwKrIvuu2qFIHj
         7rcvjBYhBunZN9GFkM6BqQZTfc6jItMAKNYxA4OgmPpwELuxA66wt55wd2yteBDOhPzd
         bR+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcahtFACGI+0Dib6KTfsGjNbdzHA5wbMvaMosc5uu20rChr73IS92WWUuWooQ9/d5ageUJ8ITKrc4V@vger.kernel.org
X-Gm-Message-State: AOJu0YyTNgKQWrjsaGVkLjcQ8wGSOBWtJUItSVKoxwUuO2aLnGJQA3ZJ
	qkMAc0mhJAdKQtE3MT85KtPX3HI4Xne6igflOLBAJqN5GyCJQH/J0ZclEEXESZ0=
X-Gm-Gg: ASbGncv9T2vuTJ68siS6uKJHxQCg+YKOljPK2HmSo5Z6jdqU62/VXUPPPcez5rvdGxY
	4eoB1LLSFILQW/Ba0J75Q4KI4JsiqNWk1JHDR/YjBLyKTnfvadJqOsKclYzhgTF+js/GNWRukY0
	6t7PNoIFvcCFCrDgzlCrGD7Cei6vMqIGcQgDOyRDznSGZvLqpAPGwcj+EeqjDM39B1IRB+iewhv
	OMXuWgFlZ9EwH73KY+MTtELJqoXd54ipJ1Tr1TM0HV2tgfV2b2usmIEl7mzo19OlFVIetSgQt5N
	OgjS2EE9cvNBD9GuYUchGyo=
X-Google-Smtp-Source: AGHT+IH78rQCXGVsPrlSUYZZv10P9jMNRp2jVxWUVaz7hLLqsSzePgLDEodcEI7LyrAtAm0f6WCgwQ==
X-Received: by 2002:a17:907:988:b0:ab7:6c4a:6a74 with SMTP id a640c23a62f3a-abed0cc4e16mr232089466b.16.1740470999871;
        Tue, 25 Feb 2025 00:09:59 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2013591sm98465366b.122.2025.02.25.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:09:58 -0800 (PST)
Date: Tue, 25 Feb 2025 10:09:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
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
Message-ID: <Z7161SzdxhLITsW3@linaro.org>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
 <dfthocttum7dscotngi6l2hz6bpdwfgrdxpvkcv6bdux3lt66d@iqfvmntvzyut>
 <Z7zVgeM+7P7SLWIu@linaro.org>
 <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w>

On 25-02-25 01:09:00, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Feb 24, 2025 at 10:24:33PM +0200, Abel Vesa wrote:
> > On 25-02-21 00:35:08, Sebastian Reichel wrote:
> > > On Thu, Feb 20, 2025 at 12:31:00PM +0200, Abel Vesa wrote:
> > > > Currently, for the high resolution PWMs, the resolution, clock,
> > > > pre-divider and exponent are being selected based on period. Basically,
> > > > the implementation loops over each one of these and tries to find the
> > > > closest (higher) period based on the following formula:
> > > > 
> > > >                           period * refclk
> > > > prediv_exp = log2 -------------------------------------
> > > >                     NSEC_PER_SEC * pre_div * resolution
> > > > 
> > > > Since the resolution is power of 2, the actual period resulting is
> > > > usually higher than what the resolution allows. That's why the duty
> > > > cycle requested needs to be capped to the maximum value allowed by the
> > > > resolution (known as PWM size).
> > > > 
> > > > Here is an example of how this can happen:
> > > > 
> > > > For a requested period of 5000000, the best clock is 19.2MHz, the best
> > > > prediv is 5, the best exponent is 6 and the best resolution is 256.
> > > > 
> > > > Then, the pwm value is determined based on requested period and duty
> > > > cycle, best prediv, best exponent and best clock, using the following
> > > > formula:
> > > > 
> > > >                             duty * refclk
> > > > pwm_value = ----------------------------------------------
> > > >                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
> > > > 
> > > > So in this specific scenario:
> > > > 
> > > > (5000000 * 19200000) / (1000000000 * 5 * (1 << 64)) = 300
> > > > 
> > > > With a resolution of 8 bits, this pwm value obviously goes over.
> > > > 
> > > > Therefore, the max pwm value allowed needs to be 255.
> > > > 
> > > > If not, the PMIC internal logic will only value that is under the set PWM
> > > > size, resulting in a wrapped around PWM value.
> > > > 
> > > > This has been observed on Lenovo Thinkpad T14s Gen6 (LCD panel version)
> > > > which uses one of the PMK8550 to control the LCD backlight.
> > > > 
> > > > Fix the value of the PWM by capping to a max based on the chosen
> > > > resolution (PWM size).
> > > > 
> > > > Cc: stable@vger.kernel.org    # 6.4
> > > > Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > > Note: This fix is blocking backlight support on Lenovo Thinkpad T14s
> > > > Gen6 (LCD version), for which I have patches ready to send once this
> > > > patch is agreed on (review) and merged.
> > > > ---
> > > 
> > > Do you know if the pwm duty cycle to pwm value calculation is
> > > correct otherwise?
> > 
> > Sorry for the late reply.
> 
> No worries, I understand this takes time.
> 
> > Here is my understanding of the calculation of the pwm value currently
> > implemented.
> > 
> > First, find the best pre_div, refclk, resolution and prediv_exp by looping
> > through all refclk, resolution and prediv possible values, for the
> > following formula:
> > 
> >                          period * refclk
> > prediv_exp = log2 -------------------------------------
> >                     NSEC_PER_SEC * pre_div * (1 << resolution)
> > 
> > 
> > So in DT we set the period to 50000000. For this, as I mentioned in the
> > commit message the best refclk is 19.2MHz, the best prediv is 5, the best
> > exponent is 6 and the best resolution is 255.
> > 
> > So if you use these to compute the period following this formula:
> > 
> > 
> >                 NSEC_PER_SEC * prediv * (1 << resolution)
> > best_period = -------------------------------------------
> >                              refclk
> > 
> > So in our case:
> > 
> > (1000000000 * 5 * (1 << 8) * (1 << 6)) / 19200000 = 4266666.6666...
> > 
> > So here is where the things go wrong. Bjorn helped me figure this out today
> > (off-list). Basically, the pwm framework will allow values up to 5000000,
> > as specified in the DT, but for then pwm value will go over 255
> > when computing the actual pwm value by the following formula:
> > 
> >                             duty * refclk
> > pwm_value = ----------------------------------------------
> >                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
> > 
> > 
> > So here is how the value 300 is reached (I messed up this next formula in
> > the commit message):
> > 
> > (5000000 * 19200000) / (1000000000 * 5 * (1 << 8)) = 300
> > 
> > But if we were to use the best_period determined:
> > 
> > (4266666 * 19200000) / (1000000000 * 5 * (1 << 8)) = 255
> > 
> > So I guess the process of determining the best parameters is correct.
> > What I think is missing is we need to divide the requested period (5000000)
> > to the resolution (255) and make sure the duty cycle is a multiple of the
> > result.
> 
> Let me try to summarize that:
> 
> 1. PWM backlight driver requests PWM with 5 MHz period
> 2. leds-qcom-lpg uses 4.2666 MHz period instead due to HW limits
> 3. PWM backlight driver is unaware and requests a duty cycle
>    expecting the period to be 5 MHz, so the duty cycle can
>    exceed 100%

Yes, exactly.

> 
> Then the question is: Why is the PWM backlight driver not aware of
> the reduced period? It runs pwm_get_state(), so leds-qcom-lpg can
> actually report back that it is using 4.2 MHz instead of 5 MHz.

That's a good point. Will try to do that instead.

> 
> I guess that also means the bug could be avoided by requesting a
> period of 4266666 in DT in the first place. Might be an option to
> unblock the T14s upstreaming.

Haven't tried yet. But yes, it should work. Will try soon.

> 
> Greetings,
> 
> -- Sebastian
> 
> > Something like this:
> > 
> > step = period / (1 << resolution)
> > 
> > So: 
> > 
> > 5000000 / ((1 << 8) - 1) = 19607
> > 
> > and then:
> > 
> > pwm_value = duty / step;

As for this, it's all wrong, because if the user will expect an exact
duty cycle, this will not give that. And I think it's obvious why.

So your suggestion of reporting the "actual" period should be the way to
go.

> > 
> > Hope this makes sense.
> > 
> > Will try this out and respin the patch.
> > 
> > > 
> > > I'm asking because the max value is only used for capping, so with
> > > this patch the maximum brightness will be reached at around 80% duty
> > > cycle (i.e. when the wrap over happens without this patch).
> > > 
> > > Locally I'm currently remapping the duty cycle range to the PWM
> > > value range, which means the display brightness increases
> > > step-by-step until reaching 100% "duty cycle":
> > > 
> > > 		val = (duty * 255) / chan->period;
> > > 		chan->pwm_value = min(val, 255);
> > > 
> > > But for the backlight control the absolute numbers do not really
> > > matter and I have zero knowledge about the chip. So it might be
> > > that the controller really can only go up to ~80% duty cycle at
> > > these settings?
> > > 
> > > Greetings,
> > > 
> > > -- Sebastian
> > > 
> > > >  drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > > > index f3c9ef2bfa572f9ee86c8b8aa37deb8231965490..146cd9b447787bf170310321e939022dfb176e9f 100644
> > > > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > > > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > > > @@ -529,7 +529,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
> > > >  	unsigned int clk_rate;
> > > >  
> > > >  	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
> > > > -		max = LPG_RESOLUTION_15BIT - 1;
> > > > +		max = BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;
> > > >  		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
> > > >  	} else {
> > > >  		max = LPG_RESOLUTION_9BIT - 1;
> > > > 
> > > > ---
> > > > base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> > > > change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Abel Vesa <abel.vesa@linaro.org>
> > > > 
> > 
> > 



