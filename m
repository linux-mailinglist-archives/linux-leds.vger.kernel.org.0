Return-Path: <linux-leds+bounces-6061-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4100C45DF0
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 11:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAFD3A4DAB
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 10:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2479130594A;
	Mon, 10 Nov 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Bc/nggo4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4D3054F9
	for <linux-leds@vger.kernel.org>; Mon, 10 Nov 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769871; cv=none; b=Swi5dcRl+pC6JrD/ECo09UE36VoToOa/jEZVKsdEqpvekUeAc9cL7Th8RO4ERt/yllYunvoLVbn6vnVR3pMn4XfOyGtbQIVh4B+ghRe/+U1xAdm11YWb24Y9GRXe5fg9S9Isdz0ThMicB8SzYRB0/oDJVWlN5lU3dEtGjckYAUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769871; c=relaxed/simple;
	bh=ytVSzmYaDqD0qwMAifjOEvYSRHFoM76EE2Q+SxLmLnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYTa7gT9FlLRVzLUUMancRZ22JjYvNlG2KbNdMgzy9cAjq8EOrTBksmC+wSnRbzC9OH/pW26mmAmo+h7bfQZxCYJbs3aQ98YHdUJ80AIDFyfRXu2zt16J3Zai9lZdw5GyKmhcASel7fJG4SpJLcWqM6JHaaLPXGhUj7sbNQjsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Bc/nggo4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1475102f8f.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Nov 2025 02:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762769866; x=1763374666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=;
        b=Bc/nggo4DD+U+wO0qS71yHjtA7jHJNMLKFlQ4bOmL2fIOp2OT/FsuO1q66wZag0ZlS
         wcGRYBnT0zqQSZfATNyZHGrhXwJ9vHIWfS3tmBd8371aRKOZY5AIqkF2ZeRKCcpeYDTW
         0/L2STKrv2P9/MWfgqIb0Y7qwOO/pTN+17cn4GKmA4BrMh6Xv791vJS1GPyqzEfvuDQD
         8nC/kdZdz4nuA0f4mHmT8cvBjvWg48bb4k/G06dwlRU8in5PqCdwgkl1zp9xQNRLrBoe
         kROW6uuxpjM6Ta/EvddLHx+IRzoiDEs70lx4pWkFIciy5lo1qk0Ahddn4MN6rscJiDe7
         MVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769866; x=1763374666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=;
        b=QIfzHnlIAmebzzuojRK0hL7LaUBGUtzroPNcZcLmaf3KO+fntqxWtuH+UXN4Wcxyrh
         YygwJK3YXoKW3Y8CFxg5zb5zVCwGihLMIHqeBo25ROLUhX8dCsMmUKqwAcbUhOnWOLMp
         QFyPFReLJUo7XVbyFpSGr6XNV9n7gLryYEjKHb9l265GepoS6CocQh2mVEhqggxLguSC
         sVMJQURbf8qQ4SHWQfRcbbTjPRHCf3FC1zPYN8xI4O55RENEX+ZQNHCESJ3RAQMopOul
         bh1oKd6JH82JlchssF6HAjNzc98I0CyGetTTfpxg5+YDQ1aJK/Ik/zhEEG2mwuK105if
         DYlA==
X-Forwarded-Encrypted: i=1; AJvYcCUaAYFhlAHrcJZYgNyK4TWBwSPG1Fce9rSuegVx/6yjBPHBskfn0ONxmYznaZi1TiAcL89zjgXc9UL0@vger.kernel.org
X-Gm-Message-State: AOJu0YxNyEbh5lLJSqmUkN0+4rKIPkYQkCp+LWtk7quOwCHoIW/rRrQb
	nkTRungyg3GgIrqQDbiiwyEVCkTHjg4EtoY8/Orba1LsTGGn5z1ZxrkkCNPbaCR2x9qZxMa3R6B
	mYmbb34w=
X-Gm-Gg: ASbGncuEIdd2ksfOI7EeFf2nI2DGyGy3G+gWp6Q2yZFnzesVrGkJVOEk7/+RIt/jnBV
	WohEoBrM/Y7dw5diJlb3cd71zk0VMPzKJ8VidSjTsEDdYer2ULLqPMib3/NXqVJPFbhBQZ1UHWl
	cv8Zbrs8BAyVkWy6Jhdn43gH5a9Pl9txQCQp3O3lQvgC8Oljey3GLlDdoACiyVKL+Il/PBkwacU
	Rf5hDfhDKJB/0Q1fslP/BsXSZGka+qhxwRV9zJagmsmtNtp+CgaHzuYW9+xF1aCa7QgWA5HCCjQ
	hwuX01jtIf9t7kO1Bi+gJ13dpXneTy4svkzp3iXg7jrdOY4M0e8KKrb0M597TiW+eWLJ363VqUQ
	PfE4Lnobtj430rO7q/vA2ODSM6U5G5H7oXvBJotXp2HRWhGpNzThyS/POOp+ipl+HD15bnXvArx
	22iWAxmsFSFeupcrRYIzXUKYcZE9m8CvP5MtqPu4AAz8123a9h6BsOojVEwt0=
X-Google-Smtp-Source: AGHT+IGUpHSfeagdIBM88vePaTs3yIVY9gCWpK2lN42s3k1Y6AfvZPuuxOVOOc+I4rI5U6e1xXLxSw==
X-Received: by 2002:a05:6000:228a:b0:429:f088:7fb with SMTP id ffacd0b85a97d-42b2c655058mr7359131f8f.7.1762769866339;
        Mon, 10 Nov 2025 02:17:46 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2e96441dsm13918929f8f.23.2025.11.10.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:17:44 -0800 (PST)
Date: Mon, 10 Nov 2025 10:19:56 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aRG8TMqehv-oR6v1@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
 <aRG359gIeP48V2ZZ@aspen.lan>
 <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>

On Mon, Nov 10, 2025 at 11:03:27AM +0100, Maud Spierings wrote:
> On 11/10/25 11:01, Daniel Thompson wrote:
> > On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> > > On 11/7/25 17:14, Daniel Thompson wrote:
> > > > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > > > +/*
> > > > > + * 1. disable unused strings
> > > > > + * 2. set dim mode
> > > > > + * 3. set initial brightness
> > > >
> > > > How does this code set the initial brightness? It doens't set the
> > > > MAX25014_TON* registers.
> > >
> > > Yep forgot to remove that, I discovered the backlight core takes care of the
> > > default brightness, so I removed it from here.
> >
> > What do you mean by this? Are you sure you aren't relying on another
> > driver to enable the backlight rather than the backlight core?
>
> Not that I know of, there is the systemd backlight service, but I am pretty
> sure I can see it first turn on, then get switched to the old value by the
> systemd service. Unless the simple-panel driver controls it? The backlight
> is linked to that.

I think you should look at the code. I think it's likely the backlight
is only coming on due to the link to simple-panel.

Normal way to handle that case (if you want to avoid the backlight
turning on "too early") is to set the power mode to BACKLIGHT_POWER_OFF
if (and only off) the backlight is linked to a panel. See
pwm_backlight_initial_power_state() for an example.

If you are relying on "the backlight core [to take] care of the default
brightness" then you have to request it in the driver (by calling
backlight_update_status() after registering the backlight).


> > > > > + * 4. set setting register
> > > > > + * 5. enable the backlight
> > > > > + */
> > > > > +static int max25014_configure(struct max25014 *maxim)
> >
> >
> > > > > +static int max25014_probe(struct i2c_client *cl)
> > > > > <snip>
> > > > > +
> > > > > +	/* Enable can be tied to vin rail wait if either is available */
> > > > > +	if (maxim->enable || maxim->vin) {
> > > > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > > > +		usleep_range(2000, 2500);
> > > > > +	}
> > > >
> > > > If you really want to keep the devm_regulator_get_optional() I guess
> > > > maybe you could persuade me it's need to avoid this sleep... although
> > > > I'd be fairly happy to remove the NULL checks here too!
> > >
> > > Just wait unconditionally?
> >
> > If you think it will be unusual for the driver to be used without enable
> > or regulator then it's ok to wait unconditionally (all examples you
> > have added so far have an enable pin).
>
> I think it may actually be a very common implementation to have the enable
> pin attached to Vin, we don't have it set up that way. But it is displayed
> that way in an example schematic in the datasheet.

Your call.


Daniel.

