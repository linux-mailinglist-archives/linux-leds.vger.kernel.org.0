Return-Path: <linux-leds+bounces-1842-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAF8FE5F9
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 14:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDEA21C24578
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 12:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E696F194AF1;
	Thu,  6 Jun 2024 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnLROKiD"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0A3CF73
	for <linux-leds@vger.kernel.org>; Thu,  6 Jun 2024 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675322; cv=none; b=NbOORgiuQcPAxoh9z9sWx39TkcpQneMBP8VjZrDisQS5A76GIV9Oa3suW25GCJLUFWthskhAyjFJ/QxR7oBdADIzwQ7AXZuvohIR+jXwehSKnkQwIRM3yrz9Y1gjEM2iI6cpmY4iqyxw4UAHpsbYUGBwmZkTZhuKLi1ITgqSTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675322; c=relaxed/simple;
	bh=XzA9XcS9J8/JaJGhY85xTyvzVAiJwfKIIBi3J6rxAwM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KSFp9HdaHuRkc3KDjQJUQfmuk4FKEAcIhdbXLkeN9l6+zxyJwaJWSM8ZgD+/zA8kaDLCoBPTIIAWQbfRn20+ZScleK89jc5Z1/e1ZBGug/ABYwyO+jLMrnwMgzzB0NQBbh5JdlLUHiXWJBtjBVD/ufXPNotczNRPLRtZHyyyNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnLROKiD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717675320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1PVj6wl0RhMQ9aVu/kpZquF9TBmMzt7pDp7sPNrIU4=;
	b=RnLROKiDEbQqFqam6thCorke4vTls/P2yfkkAF/iaaA0uiPQRPU12dBzqpS/v3qSWx9Wo2
	yvlt/VsOl932VG6J6Q134k+B2ASmDVnaAZ7QRIT8tMQxjvvmC/9HHSvr+7oHWlIaG24LX2
	l7nJA+0pnrlnDNR3XB/chO1R2e3EsiI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-gs7PAWk_PTOq381LWNGcHg-1; Thu, 06 Jun 2024 08:01:59 -0400
X-MC-Unique: gs7PAWk_PTOq381LWNGcHg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2eaab1d55deso6293721fa.3
        for <linux-leds@vger.kernel.org>; Thu, 06 Jun 2024 05:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675317; x=1718280117;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1PVj6wl0RhMQ9aVu/kpZquF9TBmMzt7pDp7sPNrIU4=;
        b=Esr1K4Du/2BoD3wwexR/Ivuv5lucYo5F+QKJ85FcvkyJesZxhANqb6tOwha+dWsk3G
         d9s/jVGEgMoFvn1eoiweyIEBDbRL1BqdzJEfhdJImiN42rFRF8mKom+z8dFm7/2QzJIU
         lchGa5ZH3gwWzKtIpWr0J1UM6wXOnF9dG2UzTaehNq5SC2VNSFyoAPTLaKfvXXImd8MR
         DTijBwSQulMwVPo5xBnnVjdQxVKRIIbldpuHnPkPhNd7A4qrYDlP0XO6PHG7B6fSYLrH
         XZBMUzPfQCiCE37sJdiANZw4eNL7OecsN7Dv+2l2y0t9fMPXOkWze25vqo/KZlT75mtM
         bOLg==
X-Forwarded-Encrypted: i=1; AJvYcCX/2ju76lAFwbUZ3mPE/9i5D1X+0qfp3QUy/8BElx9he/MoWZO6+bE5IpbY5BnAjWN5vNWnF8Fbpu3gO/V4lQjAwU1ln7Fgz4iT3g==
X-Gm-Message-State: AOJu0YxGb7QG74SW7DrC+HH4JYA2KM0OHmKTjiLi6V3nmtWA+8hFoWtW
	hEQ7jaRp1c1DCvFzgR1yqaa7pfSlkDGtHEeOss3sOBS6kfFsX1ygSzSIRbXCNRssY2CHK+kUhOz
	mBe2Owvjt8hPuieZ4UowCXrCzsYLGd2pP1uXn1V6cOFHhsJKVuRF8CP8l3WU=
X-Received: by 2002:a2e:6804:0:b0:2d6:dba1:6d37 with SMTP id 38308e7fff4ca-2eac79c3350mr33444951fa.11.1717675317613;
        Thu, 06 Jun 2024 05:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2WITeGFROobQCTrCntY3Omdm5T0qGOCAwnVA1tvshsd8kmSQuctYu9lHc2+ZfKmWSvWTupQ==
X-Received: by 2002:a2e:6804:0:b0:2d6:dba1:6d37 with SMTP id 38308e7fff4ca-2eac79c3350mr33444781fa.11.1717675317163;
        Thu, 06 Jun 2024 05:01:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9d296sm980451a12.7.2024.06.06.05.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 05:01:56 -0700 (PDT)
Message-ID: <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
Date: Thu, 6 Jun 2024 14:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
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
Content-Language: en-US, nl
In-Reply-To: <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 5/31/24 2:54 PM, Andrew Lunn wrote:
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
> systems.

<snip>

> Reverting this patch does seem like a good way forward, but i would
> also like to give Heiner a little bit of time to see if he has a quick
> real fix.

So it has been almost a week and no reply from Heiner. Since this is
causing real issues for users out there I think a revert of 66601a29bb23
should be submitted to Linus and then backported to the stable kernels.
to fix the immediate issue at hand.

Once the underlying locking issue which is the real root cause here
is fixed then we can reconsider re-applying 66601a29bb23.

Regards,

Hans






