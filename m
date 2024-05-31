Return-Path: <linux-leds+bounces-1756-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD778D6329
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B63AE1C26419
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCBF15AAB6;
	Fri, 31 May 2024 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BwMZRhNB"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20F158DA6
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162612; cv=none; b=QVCXh08Am5Uja6WrTGS/69oO/vltoghCqb0xZpa7Zy2daQ2dJenzCYuSGeor9sdob88IVzJhKvXu7TSZWeMiKwvQXnm2ha7RtRXbF3vMGeMsUMP/iBO021ClWLAtv+knbUdPzNL8Oa7vewmWDdQf0orLxni+QZ+yjW3yhn5vrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162612; c=relaxed/simple;
	bh=fHZWsCZgLehsBmHUlJSI0XG6+oxgaHq5c/G9th2fkKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNP+iIquEZ0GmBf3ZbRUFut5d6GIgM92kyeuLNvNurG4C0LYLJlqHiLwH4KGd8duhKxOO+dSojyVMqBAgCjoeGZKvCqLQq9tn435QhCgA3UVLXEAuRB6nN3Y+0I2YVa/LkY1k/veRYXLGFm7mDBjHhBga9nZxK6eQWpb7BbYKbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BwMZRhNB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717162609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xiMkkJB35GmuPxh7rMmIJANRZ/YYuyNN0vLhNarAFs4=;
	b=BwMZRhNBu2Crqokv5MDLVv9hVb6tYhA4SIpRZTDZ2ZCvH0pV8y6a1qGN30rdrIj5Dy7gju
	6lqUite6VJBhJgkhMJ41mS8mYTkbkhb4iMXyMyPZE/fV9PF+L82DJaKbsHsLHs1wLRJ1II
	CpZEfYSUJeeWslcics8h3AmITEuGLXs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-FMqeZ_DGMGudoK5T5XQSWw-1; Fri, 31 May 2024 09:36:47 -0400
X-MC-Unique: FMqeZ_DGMGudoK5T5XQSWw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52b7ebd3c74so779739e87.3
        for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 06:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717162605; x=1717767405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xiMkkJB35GmuPxh7rMmIJANRZ/YYuyNN0vLhNarAFs4=;
        b=d09fGZd2/97KHdWI3mfBaW5i48n0gu2yk8cchaedOHhibRUpKcZ6w4jdzqgsVRzPqL
         kF2VR2o3ijAcjLuj47nJ29hZnAz+ALQVHBHvA4DgBodu/WCs21BrOY40lhR6aoFuEUq8
         moajhcHBO1RpDMxFTjO3Ok5ywaK2Q5HP8AB4znFu/wN/gmC2+7BSZ8CRBXn82PsvCkwa
         S1pVnobJsp702/8EJ+xusSMIx+igfkISP263CjnrXLDVOwztSISNs3bKdiwmg8dTRK0g
         tHHKbP91rM148vILftxUynuORV0eV8lzNiKgArhvBSmtgEMS8tsbQfL/DSezhFWzYAnx
         8HLg==
X-Forwarded-Encrypted: i=1; AJvYcCXwCy77js+n9NjQe1e8Y6jiABWRWUTHwTca3cU2VzMZxuDcz7QcA+HZOMg75UqqKX8wOW+b69Go1w+N9k4l5J2xtxbL8noUb63big==
X-Gm-Message-State: AOJu0YwdPGwLmhQeMsqThONgKZG1+WYDTwMECNVviEpzZE+3lz8zNPsX
	wN3Fba+Gb/dR8M8vwXMl9+DqbReYu9XcFiL3bYK3EYyFytek36ZKNjgb4ie4FlqUpOzRzXx6vv/
	DPYDIdxdR3HkWFuLPJ5Xx2yqMCuyrMpuGRfSv7ioklYzBtFhzB1tSC82Seag=
X-Received: by 2002:a05:6512:4ce:b0:52b:7a5f:817f with SMTP id 2adb3069b0e04-52b8956b5bemr1133055e87.19.1717162605717;
        Fri, 31 May 2024 06:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEro17MUNy0FfJuJni5QfWCgWFnnZ+g2Nai9cZuxNwB9y0ZSsPWHEN4eW5raMCs3pl5xLc2dg==
X-Received: by 2002:a05:6512:4ce:b0:52b:7a5f:817f with SMTP id 2adb3069b0e04-52b8956b5bemr1133036e87.19.1717162605234;
        Fri, 31 May 2024 06:36:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c6d4b6sm1005484a12.74.2024.05.31.06.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 06:36:44 -0700 (PDT)
Message-ID: <d8341ffe-c0d9-4a37-869a-956cc1425f74@redhat.com>
Date: Fri, 31 May 2024 15:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <2a6045e2-031a-46b6-9943-eaae21d85e37@redhat.com>
 <e6800715-6bc0-49a0-bd00-5a75b852ea9d@lunn.ch>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e6800715-6bc0-49a0-bd00-5a75b852ea9d@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 3:29 PM, Andrew Lunn wrote:
>>> drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
>>> drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
>>> drivers/net/ethernet/intel/igc/igc_leds.c:	led_cdev->hw_control_trigger = "netdev";
>>> drivers/net/dsa/qca/qca8k-leds.c:		port_led->cdev.hw_control_trigger = "netdev";
>>> drivers/net/phy/phy_device.c:		cdev->hw_control_trigger = "netdev";
>>
>> Well those drivers combined, esp. with the generic phy_device in there
>> does mean that the ledtrig-netdev module now gets loaded on a whole lot
>> of x86 machines where before it would not.
> 
> phy_device will only do something if there is the needed Device Tree
> properties. Given that very few systems use DT on x86, that should not
> be an issue.

That is good to know.

> So only x86 systems with r8169 and igc should have the
> trigger module loaded because of this.

Those are very popular NICs though, so that is still a lot of
systems.

> It would be good to understand
> why other systems have the trigger loaded.

Actually my system has a RTL8168 ethernet NIC so the netdev trigger
getting loaded there is expected.

> However, as you say, this
> will not fix the underlying deadlock, it will just limit it to systems with r8169
> and igc...

Right, given on the above discussion I believe that it likely already
is limited to systems with Realtek r8169 or Intel i225 / i226 NICs.

Regards,

Hans




