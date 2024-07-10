Return-Path: <linux-leds+bounces-2245-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D492D717
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 19:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7481C203F4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 17:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06172198837;
	Wed, 10 Jul 2024 17:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeRkyYyM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4C197A8F;
	Wed, 10 Jul 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720631124; cv=none; b=AEKdb0bcVawgj2W32O1MFL1SHy+giNRabv1ENOjz/+ZBcvdUQlCApcoC8ruUETGLkd9d4qpn4x3SS/9xLa5174hAnEvxPkDm32tGvEpM/XORYv6j3czbh+yNYzBCl+b2dFLMFPn0oFf/SyXbDq0iDgEdHw0VGhQDezlb/vYV6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720631124; c=relaxed/simple;
	bh=DivAuN9Tev4Maxk4zvRjQrWJU/UN/KuYnVUsWHN29nU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdQy/vXVZ8CEIphIn5zx4+I970ENfaFZ19qKYxbYAjSB3vx3U3HUFBSRYD3RxuNq5b/lkBJhiI58KEtTXywdXY1ddltTEhr3sZkOWXPnMB4Tu0nljpmAAAePga+mDC35yklaI87S5h64SCDKnpnvKFBOyfmvUe3Fm9fAG4fX4NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeRkyYyM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266182a9d7so65845e9.0;
        Wed, 10 Jul 2024 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720631122; x=1721235922; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lf6wxeNP5rK6TuMa1Z/51uQTbc6tetQ+fMrkDHy9xyU=;
        b=PeRkyYyMFy1N7DV+X1L9m7HQGUDt4ZTmrIHS497Coqrr+1kq7OIsw4inUuqxvDbyan
         A3JOssErBT/uWMMTE4mMo0jpQicXaV4ZP4u/uUhiJY/fGjuQBcKQmnwQ8rR87XVg8dIF
         Gcr9txHkKRDyqUV3hI3CJeRRQuU7wKJg0Pd4yz/zrhlx3t3mH3oSWcHnXMMjT+5DZdI8
         tcYQBxBa8LoCJArfnIJOV1UwA/5+nlRa7bXO7YevEceKDlRw583mgYXJYOEbSQHRwV/H
         m2s7MqQw6FuNWSVmyyCpcA1hiReBQnFS7qobbjH/Ro0xhwJZhn8yDc8bbd11joeLTmqk
         PfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720631122; x=1721235922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lf6wxeNP5rK6TuMa1Z/51uQTbc6tetQ+fMrkDHy9xyU=;
        b=oR1PjPtTg74u/uF8A6m2g/LX/U4Ztnfg5uk6k3R808tRWhKk3gwSo9Lb+sTWc8TP05
         oelREgoHFwaahj10Op+nlU2FbzNX32zqltrr75gDG7Lsd7eXxZql+CaH5Bqi3vIVovlG
         sxH86bGLIRoTjXPEPRdG/B3rZ1AHLIRKwB8zPxCYFL1rqTL4oNRP9B/e/ZWN/uP1GcPc
         1grC0hH32X/GKXg/nn10kDLrA8PJyB6EQVNaECIcn5m3nYzDw5D397C2UinpJV47Xcub
         +dZfdTP0+OkYIortLqji25MajbOQrPaoC6KVNtX52t29wLyutcLOc3FzFxfDJpgFW9Pl
         pK8w==
X-Forwarded-Encrypted: i=1; AJvYcCXOTl7DujhFlH/aQQG5YgT5/GCnPCfwO5/fbcHoCYlTV7QlFlC0XOPRn9UmZzHqj4yZOepUK+GF4mKwcouCLOS3c6oxianOYJVJr4t1ein33vSyAsvpJSUaU9b2gDSkYc5ztFpT3FCXig==
X-Gm-Message-State: AOJu0YwHyKXhTHophOjejr8ANhY4JFuRgXF1/MbuYOXYmAF5vukjiSf8
	3yZ9XmNgB9vDs2zJVLX6khRu6x5QTPmv9wcG0baiGitNWCqgaoojGupBAQ==
X-Google-Smtp-Source: AGHT+IFLmNmpPoqAsNJ2teY32VoTDsyUODifPBc1xHItlWqr17TABKnadt6UXpNnkjxpqjGOkroGGQ==
X-Received: by 2002:a05:600c:3218:b0:426:4978:65f0 with SMTP id 5b1f17b1804b1-426707e2f88mr41610235e9.18.1720631121236;
        Wed, 10 Jul 2024 10:05:21 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74159csm87166325e9.42.2024.07.10.10.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 10:05:20 -0700 (PDT)
Message-ID: <668ebf50.050a0220.4aa0d.31b3@mx.google.com>
X-Google-Original-Message-ID: <Zo5ie2ldBMrJab3u@Ansuel-XPS.>
Date: Wed, 10 Jul 2024 12:29:15 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-leds@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to
 guard API
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>
 <20240710165528.GH501857@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240710165528.GH501857@google.com>

On Wed, Jul 10, 2024 at 05:55:28PM +0100, Lee Jones wrote:
> On Wed, 10 Jul 2024, Markus Elfring wrote:
> 
> > …
> > > +++ b/drivers/leds/leds-lp5521.c
> > …
> > > @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
> > >  	struct lp55xx_chip *chip = led->chip;
> > >  	int ret;
> > >
> > > -	mutex_lock(&chip->lock);
> > > +	guard(mutex, &chip->lock);
> > 
> > How did you come to the conclusion to try such a syntax variant out?
> > 
> > Would the following statement (with additional parentheses) be more appropriate?
> > 
> > 	guard(mutex)(&chip->lock);
> 
> Yes, that's the fix.
> 
> I'm more concerned with how untested patches came to being submitted.
>

Hi Lee,
profoundly sorry for the happening... Obviusly something went wrong in
me changing branch and the driver wasn't actually compiled in the
test... 

Also with the comments from Markus I tought this needed more changes and
I leaved out for a bit, so again I'm really sorry that this manage to
reach next.

What is the next step? Any way I can pose a fix on this and apologize for
the situation?

-- 
	Ansuel

