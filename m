Return-Path: <linux-leds+bounces-3426-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584ED9D5180
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 18:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183012823C3
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 17:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7182719CD0E;
	Thu, 21 Nov 2024 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="ENWjK1wT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116515689A
	for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209582; cv=none; b=UEAxV0qKXRszi633sl2wjNDNCOtH9HKv214MhYIwMPmYJ+2fZs55PDRE5Upjf7btdHR2Wm1KKOeTAovzCHhYTLzk1V5jeDT3/Cl4PB79sXWjtGysVdRzmoaVVczEIwo/5CV0QpYlt44IzOhiawWQL8F1Z1rXKO/sgmp1+ub2oeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209582; c=relaxed/simple;
	bh=n8Wo1iQ52Aw1E64TSb6ntmmEig/Iw/KhYEDmtwYBRLA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVTG5xXukdT6VGSF3L9wLjE5RakoRkYUy0omhlFJI40Tauaayg1BxKFhDB8T6tEE6lzy1CiaqF2XjdRMQ4x4gBg6Q7byQGkHeX/5iMUTatuzSd6eULM+jtT5ZBvW9jjeqLemmIvgOh78fitscl3Xu/mwJSY3N8nTaqISyjyyZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=ENWjK1wT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so1617270a12.1
        for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 09:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732209579; x=1732814379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fik5fg6pZ4xpZXDrf0q8ORna4/F0UwRhMO+ozPaBmr8=;
        b=ENWjK1wT3eUfJkxbfMf4px8lL6ij0/oLqYz5HRxPXiVu5yhjRcWni2nH3GEQDUZBiT
         z+VZ322C0k3eoZWvVDNXsiTI8TH7wOmT1Fygk5haGl8ISL7EgR8oDEwa8Rv0VVg9M3y/
         DzRa6dtdTO5r6MH6KhVkU9KnJhtgTEhsx4u+gngQ6B8rVn28mGGH4r+Pe7NHUY3zldzy
         xSaAgBX0uPNWW1PVPqZDEsCNyZEjHQGGBYTe/FhT7k5PAJz0PwbKsjUxJVkB0AO5oApF
         TVZkPm04GhT2lyLuO8jBxXH9F35tiggUihGUIr/elSkokSn1hlDsXNUmqQbbRmuPQyou
         9Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732209579; x=1732814379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fik5fg6pZ4xpZXDrf0q8ORna4/F0UwRhMO+ozPaBmr8=;
        b=Z0hMKnsudBmZXQ7JcUHOYkYYD8mN9j4RY1Ns/vzVWnAKFsWr/2M6XJkFxxhXy2FG7m
         XUFoJtJF8QHra2IIdrXRh9hiSTI9VRocBI9FnoI0beWnpzOlUCdfyYaypsU1AhMtJhnx
         n12tBNjSgKi2FBgFTqpeQnD28KMs+ycHrVoY3cnwcxP3CplZZz3JcmADXvxl9MFPWwQf
         p1JmmNQ1NsBU4Qsee8TD4GyV7I/Haw5VW9Gu183MwDbwN5MXI0q4qUeCJnfBi5X71ym8
         IjFWc1OLHgm+++4T33ZjkKCBhFCTj8cEOldBbDjAp6/YQD/d7u4QDF+rjDtswm1AlAJP
         RALA==
X-Forwarded-Encrypted: i=1; AJvYcCVffQZ4zpT4s2FedEk+jHsYxyaHkqwFP4Fv4gs3kHZBv5p8xUpN7/2SwSB0H/0xjs/zsD/RmZEcuB7l@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJUdP3QpOH8VJfcdeXL+w0UwQp2Ake/JgffJAFgzIkOVarn0R
	6k0CitrPeYScGVEQdaW0fic6PtJPYY6+V/7OkKz5xVvd/fRUo3WN4pxfNcD5dgUphLLxo0PxFoN
	88MfQLGvX64WPjU6Uykw3Kj5YDrKc/NljEfpNpPb0fPwrOK+aqSuYCitYEf4pAgb0362aVeL6GB
	7EkKMaBnbnEkY5fqQYdnbaRvmU
X-Gm-Gg: ASbGncuL4ZQIvhH+DxOe/YDdqD6XMguLkrAmZ4p7HFKkItIgQfSxs9gCQ4Bsywf1If9
	E8KPBUVlf1D9KoFGhdlaK3DoenAwc1/mJAoqbcQRkb6VBYmd6A+vTQE2satkuHg9DfPPV3zOmAu
	dcVYlEkbrDN+ls9J5+lU2TFRrC+WeWFz4drHsweLr9jcm7w+t8LgiyViZDRJmFSj32+eyDcHgcr
	5IZaC3jyrRha+TqZnO+SxI9A/KiMBt6stIdm6k5r/eKe+LO2pgrqoYxODT88P5Dl1HCF9n2ef+Q
	ROW2pyT042zYWl5yTA==
X-Google-Smtp-Source: AGHT+IEgydldMZZK3DL67PowCK6G04XlplMKaFxYYjgxXS8/yAqD7Uv47pTRRe/rOwuReXnCnuRW8w==
X-Received: by 2002:a17:907:97c9:b0:a9a:e0b8:5b7c with SMTP id a640c23a62f3a-aa4dd52c717mr743373966b.7.1732209578751;
        Thu, 21 Nov 2024 09:19:38 -0800 (PST)
Received: from admins-Air ([2a02:810d:aec0:2a54:6de0:d3b6:653b:5260])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f42d48dfsm102526666b.106.2024.11.21.09.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:19:38 -0800 (PST)
Date: Thu, 21 Nov 2024 18:19:36 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 3/3] leds: Add LED1202 I2C driver
Message-ID: <Zz9rqJ4CXENy7wZm@admins-Air>
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241118145449.7370-4-vicentiu.galanopulo@remote-tech.co.uk>
 <f6620b99-aabe-4b76-8a60-deae0a9042ae@wanadoo.fr>
 <Zz9pZsQEM29dLu7k@admins-Air>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz9pZsQEM29dLu7k@admins-Air>

On Thu, Nov 21, 2024 at 06:10:00PM +0100, Vicentiu Galanopulo wrote:
> On Mon, Nov 18, 2024 at 09:13:32PM +0100, Christophe JAILLET wrote:
> > Le 18/11/2024 à 15:54, Vicentiu Galanopulo a écrit :
> > > The output current can be adjusted separately for each channel by 8-bit
> > > analog (current sink input) and 12-bit digital (PWM) dimming control. The
> > > LED1202 implements 12 low-side current generators with independent dimming
> > > control.
> > > Internal volatile memory allows the user to store up to 8 different patterns,
> > > each pattern is a particular output configuration in terms of PWM
> > > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> > > common to all patterns. Each device tree LED node will have a corresponding
> > > entry in /sys/class/leds with the label name. The brightness property
> > > corresponds to the per channel analog dimming, while the patterns[1-8] to the
> > > PWM dimming control.
> > > 
> > > Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> > ...

Sorry for resending this, I pasted wrong in the previous one and didn't notice


> > > +{
> > > +	return value/ST1202_MILLIS_PATTERN_DUR_MIN - 1;
> > 
> > Can value be 0?
> > If yes, should the return value be clamped?
> 
 No, it's called in st1202_duration_pattern_write, which is mostly a wrapper,
 called in 2 places:
 line 225: ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
 line 258: ret = st1202_duration_pattern_write(chip, patt, pattern[patt].delta_t); 
 
 for line 258, I make sure in line 250:
                          if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
 				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
 			           return -EINVAL;
 that it respects the range provided by the datasheet and supported by the chip.
 
>  
> > 
> > Is it needed?
> > (There is no i2c_get_clientdata())
> 
 Indeed, not needed so removed.
> 
>  
> > > +
> > 
> > CJ
> 
 Thank you very much for thanking the time to review!
 
 Kindest regards,
 Vicentiu

