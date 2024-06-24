Return-Path: <linux-leds+bounces-2109-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA98915773
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 21:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3861F2423F
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 19:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB03C1A01D9;
	Mon, 24 Jun 2024 19:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjDFYfie"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BB19FA75;
	Mon, 24 Jun 2024 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259009; cv=none; b=pnuu6BiIi+fzdrZEsBqwy5LhoyTYObzMS9dYypIk/EfINWBxlHUXbXco3ul1s8y4VSDyE6epgTZDAa6m8y17TnhOrWFHqMLpUr9A4ABdG21CU3vzgGRLtUQcM5/DX1ilxJt6rtf6y8BjoBmaZk2Xef2MQJco21j5Tb8CedAdriw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259009; c=relaxed/simple;
	bh=wfH4VLTZwqhNocG3xUbj2r3Te7N435LjMt4Lh3GT9Ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wx652vNqHCrGuacVjqKToQToErbiEZGIGD6GNJrMegLY52kUdhuXMbi43tcJm+xoT0rcGNDrZqPTgNwRdI7fAhe69VvZ6/yk087grKwXpyY6wBESr38SmAUPUyLOTU7cOXQ05EzqUT8I0Qe0iekF6WITvRDX3cj03p4wl1LBboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjDFYfie; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cd717ec07so3762507e87.0;
        Mon, 24 Jun 2024 12:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719259006; x=1719863806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EeV/maekjPb/g21RQUWiF3q3foi+u70EVe41HOf7KOI=;
        b=CjDFYfieKviYQ9RAqNQXi73wxeeousLTMgGNw7NW1DqyMYOCH/PqQN6sMtk4Mz0unB
         y8KqJn34c8/JDQ1krROsHRUK/82oMQdDWdJpUbY+scBs8SLihCTDvU184/5z9t3jvCm/
         nX5MQ/SUGEgkOI7erqjpoIjKjcOtHcAb5NE5DV97iMQQPGGVvP8gDdudB5OtQT2nSAOJ
         Tqmu8gc96+jfLcJh3NYlYF/IHd1u+rUHfY77aWClXKrLU9XKJ5u2u9T46pJ54z6nJNcg
         my2FYkbftmh8QVNqodR+7zHBVT1Sg+bSTsGZc5NXOfDaSuSAfTyj6IOOWPYLPC9rSG0k
         cLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719259006; x=1719863806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeV/maekjPb/g21RQUWiF3q3foi+u70EVe41HOf7KOI=;
        b=S4IEm6o/acnbYg97D/ZXCPXBnu/05WjvLgUrjKDQXwh2gGgQvjF2NaDQR6V7qabWnL
         S+NZYWq/+IiHRxAuTVxRdrXbpWh20WPKfXTWdg2ZjMvFwF+9vyueFFQvUHu4kjp+FrEY
         UaImGnTRiRXEtO3WL1wR6fZ5TZVfHFh6iTeuqaQdCCTKReFxi6NMXxcsapTpV+mmoFgn
         54ItXPup6MXyi5HPdBBau0665+ffoKiFYFLNA3GupIQ+ANViQUsGhe7aYPIMHDX2pY52
         PI49hqC4EO9l4ApSsq1vnkthEWCQi9iLuSZq1oyGLwQ/ZZUyFcx8kBKlpRZf4dVB1zOZ
         vx0A==
X-Forwarded-Encrypted: i=1; AJvYcCUgkSb62WmIVK5caYhGY/HKeiN0bwFjvQ8LXaErzK7PAwQUzOA0AV0saKkn6HQiUeA2rDAe2EM0YaVdZ/BWwWX0rTaQMlIz+0IuWMAni/Z+pyU/7AwL3NG0G/bSjm0oKSVeriVLTgdTzIeffwoVdnYqZ/UodYblaBEAcjJgFHEILw==
X-Gm-Message-State: AOJu0Yx5wH354cxOE3vYT9rmMc1K4tB3mApUtwv43SsiyIryGPuw5wuT
	+8dqRxOVVJmAfzw1t2g/0EDYz62S+uSAIgfjVxu3WzvGlw/ryPFE
X-Google-Smtp-Source: AGHT+IF/Vj2cmEC/NaXSYrMy4Wxa3BHDV8iEcUl3ZXHdHpc8JIxOFMRZehsxBTO6IVO/0vBypRDPkQ==
X-Received: by 2002:a05:6512:ba1:b0:52c:dd38:f3a3 with SMTP id 2adb3069b0e04-52ce185cf4amr4028544e87.46.1719259005615;
        Mon, 24 Jun 2024 12:56:45 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07d:2d00:ad78:a407:846a:969b? (dynamic-2a01-0c23-c07d-2d00-ad78-a407-846a-969b.c23.pool.telefonica.de. [2a01:c23:c07d:2d00:ad78:a407:846a:969b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a724b3a5a04sm201040866b.51.2024.06.24.12.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 12:56:45 -0700 (PDT)
Message-ID: <7003f6f3-a90f-4423-982b-7862bb9a1489@gmail.com>
Date: Mon, 24 Jun 2024 21:57:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Andrew Lunn <andrew@lunn.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2024 14:54, Andrew Lunn wrote:
>> I actually have been looking at a ledtrig-netdev lockdep warning yesterday
>> which I believe is the same thing. I'll include the lockdep trace below.
>>
>> According to lockdep there indeed is a ABBA (ish) cyclic deadlock with
>> the rtnl mutex vs led-triggers related locks. I believe that this problem
>> may be a pre-existing problem but this now actually gets hit in kernels >=
>> 6.9 because of commit 66601a29bb23 ("leds: class: If no default trigger is
>> given, make hw_control trigger the default trigger"). Before that commit
>> the "netdev" trigger would not be bound / set as phy LEDs trigger by default.
>>
>> +Cc Heiner Kallweit who authored that commit.
>>
>> The netdev trigger typically is not needed because the PHY LEDs are typically
>> under hw-control and the netdev trigger even tries to leave things that way
>> so setting it as the active trigger for the LED class device is basically
>> a no-op. I guess the goal of that commit is correctly have the triggers
>> file content reflect that the LED is controlled by a netdev and to allow
>> changing the hw-control mode without the user first needing to set netdev
>> as trigger before being able to change the mode.
> 
> It was not the intention that this triggers is loaded for all
> systems. It should only be those that actually have LEDs which can be
> controlled:
> 
> drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
> drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
> drivers/net/ethernet/intel/igc/igc_leds.c:	led_cdev->hw_control_trigger = "netdev";
> drivers/net/dsa/qca/qca8k-leds.c:		port_led->cdev.hw_control_trigger = "netdev";
> drivers/net/phy/phy_device.c:		cdev->hw_control_trigger = "netdev";
> 
> Reverting this patch does seem like a good way forward, but i would
> also like to give Heiner a little bit of time to see if he has a quick
> real fix.
> 
Sorry, I was on vacation and can reply only now.
I agree that a revert is appropriate because the actual issue that this change revealed
seems to be non-trivial to fix.
Drawback is that now a user who wants to control LEDs has to know that he first has to
manually load the netdev trigger module and set the netdev trigger.

That the netdev trigger module is now loaded by default on systems with r8169 I don't
really see as an issue. I think it's normal that this is opt-out.
If a user has a problem with this for whatever reason he has several options to
prevent this:
- disable R8169 LED support in kernel config
- disable netdev trigger in kernel config
- remove netdev trigger module
- blacklist netdev trigger module

>      Andrew

Heiner

