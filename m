Return-Path: <linux-leds+bounces-5831-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965CBF311D
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 20:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AC6C18C0A43
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 18:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438C54414;
	Mon, 20 Oct 2025 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOYn8iv6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208C293C4E
	for <linux-leds@vger.kernel.org>; Mon, 20 Oct 2025 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986656; cv=none; b=rEux+52TEboTsPzSM6A5J+oaf2eys5QpDgA8rUD6LLpk4OUEA68vjmcamyaRbvNSTeYgDKuJ5IVCbYMGTPpNd5M8zyXI5TEleAsvphl8IBZfn9ZhhXA7CB7arSZiZ65fitvE08PHCrpgDyIIpKjFV9oZ1xbRZo6DDRHCY1stNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986656; c=relaxed/simple;
	bh=pJrhHqs4c+A7V2oVpb0PyljGoTdkdXe3u8DtctqD/Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8v8PwYVyMGkzYVDBHCzY6ExW+jI8bFf8r+0xPEhNd9KeNTUYEGi4VdTnetrQgIltDC7Zq7VhVNfA/eosFcudGJtbtWcVD+EmXd1OG5tvFNrLdARqsWAUGwSymiyy8rHjVEOaMc093JiV5V1LVwYiwh597P7Wn9y+Ah8+1DRIcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOYn8iv6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37634d352dfso59449391fa.3
        for <linux-leds@vger.kernel.org>; Mon, 20 Oct 2025 11:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760986652; x=1761591452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yomFW1qWfhP0FOOqNGrLEjYZGSO1r76v4ICK3o8nR1Q=;
        b=fOYn8iv6ZWYZmTzhDjQd+ljA1Kop07NYAUWOpAnMv6qD7iqhNOWLJLwUHJAjnc0ZKG
         6AgbJ8Bw7bxmyOsC9Utwx6zsZ7zfqDeJ9PFAH1hNLDhVFeOz3POAndYIw6jt0H9+ZSTX
         ZvWdpFHVNT1/AzqjlBiX4lMKv4iVNUQy6/KJP5Ws4a7WACSmeB9XGU0yWeXwzZWoZmU4
         beOIeisgKM69bs3oO+w6xkNGlmknOHSLrEMDQ2XEdXfH531ZSzcYDF2fxzachjNuvsTR
         mBKql5i4ywpFcEJ0LNmadow8Za0LDkXEMAPNynQz9gST3mXJ0MK8JbYO2w7yLeBogfNf
         4JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760986652; x=1761591452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yomFW1qWfhP0FOOqNGrLEjYZGSO1r76v4ICK3o8nR1Q=;
        b=ClSF+3x67suf3jxH5Ksss0qpK0hdlzlsCkGU9R0hyCnP7yI6xyunXzbOpFQQ8gxP0I
         /B6sYxpm/r+Y2bGxUCumH7GFCqVHgMwgM9ZUi5KOTYbij4SivexUrQvNk+BEKDAOP4c9
         d0RkYc0lmEi0mjboeVwuADldGA8z4WZ9JiaCyQTeKWiKd47uEHjXh8ABQaUaR06XLSn6
         oO+ZZ/FZ1wFS7mqM8wOhN4+MkyBCS+aq15zLA52OaTbtx9pIxbwjnGuRC89DJ8c2UTUm
         GY7qBKMvoLo+5cDo9rSlDgd5XEWzUpjOhnr+xPeMiSkhJaRUxYiA3xTFF1gHqXjyOAON
         vrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWydegPYThajvd4VnWADQmBtzoWMlL6bZM5h8XgZnyQUxpvbRlnVPADJouhBASHDHGUBvHedJFGBgpz@vger.kernel.org
X-Gm-Message-State: AOJu0YwCeDX0w6ngLdh4hol2Y786lNTKeumHrgoX7BwKTaHCs7iIilXr
	4qI02WO8lEa/es3LCcciu7puj34GZcjShn/IkuqB+oUguEjt68obGqubyvJ/Ig==
X-Gm-Gg: ASbGncuPWosy+vNYzVzJGVifNl2tJQtGQTYl32YOHpjYdHsd68CTRVp7mG5XChloB6R
	WgW6YP0ELR3dPHaikTf2DogHSFQHPrVbAH9kvDge0KrRLUTdhkIXIBZCkxzxXdax3d2XCbOV+Vf
	iCaesLG0SQo6WxWsjBdbRS1LfATVnAoWAq9IBqDJn/53ZFQKpaXMmYy7wDUDsJWILj68uE2bBld
	tmnAZNVw/vj7mCNZBbB62xhHjXmfsoFCV6rwOSFWp1pF1jXZIwaPfzD2QFOyZhYf01AIn9a+pBf
	I+ZOwu7YufAIdJhvjhY6iUAYBPGPmAwXoyQvrmoxPxBGm8TjSjzwBPLBOv+Alz8N1ZhFyULyq9H
	Ik8GUtk3tZmwIA3//J8UZa8QIVXg22W4jyg9B5BS78+Ap5bakMcCjUWm0X9d5vsFcvQNJ/joov4
	D7GiEEsQbxDQWZpvf5uCeVWME=
X-Google-Smtp-Source: AGHT+IFGY61egK49lI4lU4K+qW2E2OyMh3JeYnQVrX+tpayx5+dAhCPNHY+nYw078SaMlhFXUZPZJA==
X-Received: by 2002:a2e:be0a:0:b0:363:f65f:ddcb with SMTP id 38308e7fff4ca-377979395a2mr40301371fa.18.1760986652239;
        Mon, 20 Oct 2025 11:57:32 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b702fsm24353341fa.6.2025.10.20.11.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:57:31 -0700 (PDT)
Message-ID: <f76b9004-46ba-4cf6-993b-004242005d07@gmail.com>
Date: Mon, 20 Oct 2025 20:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] leds: Add a virtual LED driver for groups of
To: Jonathan Brophy <Professor_jonny@hotmail.com>,
 Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <20251019092331.49531-1-professorjonny98@gmail.com>
 <3df51774-9774-40e6-ae65-7621bdce0f91@gmail.com>
 <DS0PR84MB37465DFAA8E8994B503A69829FF4A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <DS0PR84MB37465DFAA8E8994B503A69829FF4A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/25 23:17, Jonathan Brophy wrote:
> on 10/20/25 3:25am Jacek Anaszewski wrote:
>> On 10/19/25 11:23, Jonathan Brophy wrote:
> 
>>> From: Jonathan Brophy <professor_jonny@hotmail.com>
>>>
>>> Introduce a new driver that implements virtual LED groups,
>>> aggregating multiple monochromatic LEDs into virtual groups and providing
>>> priority-based control for concurrent state management.
>>
>>Aren't you trying to reinvent LED trigger mechanism?
>>
>>--
>>Best regards,
>>Jacek Anaszewski
> 
> It is much simpler than that, I'm just trying to group LEDs into a new 
> virtual (fake) leds with some priority rules and define all this in the 
> DTS.
> 
> Consider below is a dts of my router as an example.
> 
> The leds node is the actual status LED I have in my router three 
> elements red, green and blue:
> 
> Then I have my virtualcolor_leds node defining my groups that consist of 
> these elements.
> 
> I have two leds defined in each color I wish to display one that blinks 
> and one that does not.
> 
>  From here I can define all my led colors and logic pattern in the 
> device tree.
> 
> These virtual LEDs just appear as regular LEDs in sysfs.
> 
> After a factory reset of my device I would expect the status led to be 
> solid yellow when it starts up then when ready to setup blink blue ready 
> for setup.
> 
> It I connected these ot standard triggers I would end up with a mess not 
> knowing the status if multiple triggers operated at the same time.
> 
> Without the logic I would likely after boot have a yellow led that 
> flashes white as the solid yellow would mix with the flashing blue by 
> mixing of the power  and setting up triggers.
> 
> I can define aliases to the virtual leds for access within user space 
> and have all the features of a normal led with out the logic headache.
> 
> My alternative is to create a driver defining logic in userspace with a 
> cronjob or as such or with a custom binary.

Userspace "driver" or rather a service would be for sure an approach
quicker to implement, that would not need lengthy discussion here to
achieve a consensus on the design.

Otherwise, I would see this solution rather as a new LED trigger, that
would allow to define the LEDs to be grouped under it. The trigger
interface would need also to allow defining patterns according to which
the LEDs would be lit.

Still, the trigger would be a task for months, and would need much
analysis to come up with a reasonable user interface.

-- 
Best regards,
Jacek Anaszewski


