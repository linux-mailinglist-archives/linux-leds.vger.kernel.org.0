Return-Path: <linux-leds+bounces-3275-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 475759BC4A2
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 06:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41101F224EB
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 05:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F036B383;
	Tue,  5 Nov 2024 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="OUPKLLqG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F5D181334
	for <linux-leds@vger.kernel.org>; Tue,  5 Nov 2024 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784213; cv=none; b=kGdFEDhxvSt6l2AmS8O3z1Sol7K2uk6ypliOhTxaGOPr6aYcKTjA/MYv8cl648Dtk0k+WBFe+SzaB0XmTBx3VP5WuyHnw5oiiFEZ0E4WXV6se2EwlrqLrg+Mh/j23SbDeNTqdI3Yb6GsdB9qEhVMJCF84r7xhp5upV56+SgnvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784213; c=relaxed/simple;
	bh=Zsdsrn5QyifI5KpUEy3Si6Hqlwx2uydMgzuv5g0ftik=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgAXaSKx1DoAO6kxQN8Q1m179K+883IzY5oxA+6b3nJqKfpjQu6IPreUWnForVoQwkcSjLxBXlWARTcUoD9RQn96P6ekTP6GjCY54EHN+5GCKcqon0OoYaiUGiVTLPKkZKUDssqqoAjRQ9I1k9BwyL2hmPKH2yu1DyY3QcUNqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=OUPKLLqG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cec8c4e2f6so3302859a12.1
        for <linux-leds@vger.kernel.org>; Mon, 04 Nov 2024 21:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730784210; x=1731389010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLek+8rRFefzz3qfy2bF6CDdC5m9OTEU8lr9WxdqGCM=;
        b=OUPKLLqGiaq3JR1DjLLeKfn96BtuzkXt4KDKQoBGkM7tCUlGb0+oukSonlBsetvca+
         KEEMZEWOdVZpvofCrzf5vI5IrnVKeLiVS39JaKvDzXFfrAZOhhjI7oNLtxijFicckY+2
         DwlE0hLTTw9ETXmt8j8+vts64oYCx32+oA71FNMTzJ9eIX0BVFc+bhm36/ZdfYSs1bHE
         5C7VvLi5pyTcVOu5IKW1kKYzuW2mHY1XxCKMUO186oM6U4t24An2RyD6S17MCrcQQCuH
         /U09YzSqYanZ2KOQrsg4LEvhO3VcW5FTUBdQcdlGhxQsC+hXkfoUZbGZgRx4Tckd3wNY
         vKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730784210; x=1731389010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLek+8rRFefzz3qfy2bF6CDdC5m9OTEU8lr9WxdqGCM=;
        b=ucwuXI4nNRlzKNj6M8C6gC2ooQN+mCvwM5u+6MM1+RGN3pe5YRTxoiNCKB/h3Zrtym
         lI2paJP3JG4BKF612aWo/etG/3zJpbqiwOaS+aki+7niLvUhxd7MDJN9NAejzg+dG2Fv
         n0uNCqcNBw6SY6CxFDZ8tX1QwMv48iE2i+5l0gH/lXfsRwL6esXxg0RYh85VL8xzYfJW
         Zh7HdkjhYEf0MIDiaNbzZcpgYwsF7fhyn70ZvFTkg5/sBQLCDixRoFhEIQ7+w6sx+sVB
         HwPyqynAz9PtA2aUxk/Z+AVMzKgTNBpj0mzZSKfW1v0E4JS4skQWTSZdBNCi3SbSiVzu
         r+kw==
X-Forwarded-Encrypted: i=1; AJvYcCUXuDTqMyrEWgOMNMkV2JEn4XmN9M7pUkU0ncXKZr2c1+zWHaBJRye8+Yh5I3G+0HvD9VzcK23bK4vL@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtcvDcXxhKrzbkQjyPL1zoYuVjSb0n50Ej9fjT/eEmaeYMMPC
	vyLWdy+AfNtPlBTOjQBz2HhlfGxJUxcGvwWC+Io0zHwVxezZepZabOC+EmonuUA3z5xtJHy37mz
	iunffLxUD5V29HuqbRidgyiXFQaRAhEVB7e4P0Xbd4pLaRY3mL3RRWxPynomp2BeqgmWd8m2OyK
	Yt6SSkqSnvUYHVbqB+QpH0CO8T
X-Google-Smtp-Source: AGHT+IHEIACSt9/rcfK3SRS20RLq+YIWg4Kpqj9LfsyCOxuVCHRmz+k9dQ4OGU35Nq4IDBHXxM7DQQ==
X-Received: by 2002:a17:906:c145:b0:a99:7bc0:bca9 with SMTP id a640c23a62f3a-a9e6553af4fmr1495008166b.3.1730784209066;
        Mon, 04 Nov 2024 21:23:29 -0800 (PST)
Received: from admins-Air ([2a02:810d:aec0:2a54:587b:f26d:2c10:f02a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181398bsm76145566b.196.2024.11.04.21.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:23:27 -0800 (PST)
Date: Tue, 5 Nov 2024 06:23:20 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: michal.vokac@ysoft.com, pavel@ucw.cz, lee@kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v4 2/3] leds: Add LED1202 I2C driver
Message-ID: <ZymryKmQxU6Ndkih@admins-Air>
References: <Zx0A8ywBb9J65Rxl@admins-Air>
 <20241101170658.GA1807686@google.com>
 <ZyYKCMbviprVnoDK@admins-Air>
 <01b7029f-ecac-4b45-a28d-04081b326024@ysoft.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01b7029f-ecac-4b45-a28d-04081b326024@ysoft.com>

> 
> Hi Vicentiu,

Hey Michal
 
> Once a while I browse through the patches in various mailing lists to keep myself informed.
> So I came across your patch set pretty randomly.
> 
> I have few tips for you to make your life easier before you get to some serious troubles
> with the maintainers ;)
> 

Thanks for the advice. Annoying the maintainers was definitely not my intention.
My apologies for any inconvenience.

> 1. Always send all the patches in the series to the same recipients list.
> 
> That is, do not send dt-bindings to just Rob, Krzysztof etc. and LED driver
> patches to Lee et al. We all need to see the whole thing.
> 
> If you run the scripts/get_maintainer.pl script on the series, you get a complete list.
> This is what Krzysztof requested you to do in his comments to v3.

Ok. Understood

> 2. Use git format-patch and git send-email tools to submit patches.
> 
> If you use these tools you will avoid issues with wrong threading of the messages.
> 

I have a Macbook as a work computer. 
I've found online that the way to send it on Mac is with mutt.
Most certanly I lack some skills, but I took me almost 1 day to have everything working
mutt + google account + script mutt_oauth2.py

So, quickly jumping to git format-patch and git send-email was something I was not looking
forward to.


> 3. The following text should not be here.
> 
> You are supposed to just reply in-place to the review messages to acknowledge
> that you read the comments and you understand what the reviewers want to
> change. Then you send a next version of the series as a new message to all
> the recipients. Definitely not as a in-reply-to to the previous version.
> 

Ok. I think I got. Hopefully the next ones will be ok.

> 
> Best regards,
> Michal

Thanks again and best regards,
Vicentiu

