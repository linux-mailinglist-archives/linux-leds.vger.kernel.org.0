Return-Path: <linux-leds+bounces-5067-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ADBB06D4A
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jul 2025 07:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125284E719A
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jul 2025 05:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710132E7199;
	Wed, 16 Jul 2025 05:38:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322BA20C00C;
	Wed, 16 Jul 2025 05:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644333; cv=none; b=HmGbEwPLg2p0iZ6uypnskTHZBTGIxzkXnjXTzYNLEbc/QufwQTe1trFxj94ya/QRCr1vyqkTQgfmaj3z+GDctkTFQs7Z/XbiEvvltoGcSI+jReJr6FzGFMLSt9q5Gge0x0Ent9LatP9vNch3wml8lHkKZjs9/3ufdk0bIJiEGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644333; c=relaxed/simple;
	bh=Oxb7smbPtdmeeQd8dQntd2Uk4WBnH1UOJZCJEQ13erY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwnbeTZZPO2/ghFkrWVYxVQtsOH52BE8yOTtD9WP0miszqL5zXv6GDIb0Q544/TnuFF5B1ERib9RGbo9L6s1loswYlTKrCnmPaPNkSsfA6Jcwe14D00acV27Iw9v6zrDa5Bf/z19kkurNU9WWzz94V579FrOxM628ypOMCWXYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.54] (unknown [98.97.26.71])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DF0B7B4D0359;
	Wed, 16 Jul 2025 07:38:45 +0200 (CEST)
Message-ID: <e6e4eb98-f535-4fa5-af3e-5d144275b05a@freeshell.de>
Date: Tue, 15 Jul 2025 22:38:44 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Are LED functions strings or uint32 in
 Documentation/devicetree/bindings/leds/common.yaml
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-leds@vger.kernel.org
References: <91d71a35-bb22-4482-8b49-398899ee37ae@freeshell.de>
 <aHc1E2xPMfvKYcYx@duo.ucw.cz>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <aHc1E2xPMfvKYcYx@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/15/25 22:13, Pavel Machek wrote:
> Hi!
> 
>> Documentation/devicetree/bindings/leds/common.yaml [1] describes a
>> uint32 but the $ref is for a string, for "function". What's going on
>> there? Also what is the reasoning for that sort ordering [2] in the
>> examples, are we saying that gpios is like a register and function or
>> default-state is a kind of status?
>>
>> 1:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/common.yaml
>>
> 
> You may want to cc devicetree people and linux-leds mailing list.
> 
> Take a look at include/dt-bindings/leds/common.h, LED_FUNCTION_PANIC
> (for example) is a string, so documentation looks consistent to me.
> 
> BR,
> 								Pavel

Hi Pavel, thanks for the correction. That makes sense to me now, it is
more of a function name than a function enum.

Question about the dts examples' sort ordering remains? I try to follow
the devicetree code style document but I must get confused too easily :-)

Cheers,

-E

CC: devicetree, linux-leds

