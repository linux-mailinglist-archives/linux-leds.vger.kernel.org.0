Return-Path: <linux-leds+bounces-2218-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E492A178
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2024 13:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A10282B65
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2024 11:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97C37E591;
	Mon,  8 Jul 2024 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="H6WckEvo"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE977113;
	Mon,  8 Jul 2024 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439269; cv=none; b=hMRV7MQTpmUu31j6YeqJm/JqOLCeUVtulieEZBc7h00JESLzrT82ZYNLXk00aD933pAHpUKbGS+/g/c1gmAB/HCqbphNbut1HYMRWkrTEjf3vnoB+duvDZTugfKsC+E0SN+4AgWQ+S/3DKwBTUoKJKNbmm91DoFHwdovOLarBjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439269; c=relaxed/simple;
	bh=OGrfAYDjhNJ/RWJ8ed5CWpEEd3s1wIymkAS2sH7Lw0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttLhZArIcDxEIoXF0KiDlANNgqh9ckgJs+LG1CKPFeyIjEYQBQNTkSna8R3cevSa+pOlfjTdwHq+lKno6BGPywIw/zJ5JU82UyAgaoRtSHdSZRURvE8m9ADgiXrxXjvNqHuMWxK3po/bBnEBi6RhUABb7EMljJ5bz0AkZ0UHpqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=H6WckEvo; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D6E7A886F0;
	Mon,  8 Jul 2024 13:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720439266;
	bh=To0BmBVITkoRhzwFmcQPhG1TYR0we/gZjwDGjPQ9oEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H6WckEvo44qjT7lyVELBCmr/MBIXBCE7xwrDDMj6k+xzxfvP9kuWSbR4+YWv8g1yH
	 zJTSw9Wcn/YJxFRuyR60dJyfae1MrtRPa4Yyew4GmehZy+J1e6Ug55MFcBMpqE2Far
	 x2a8Psa7WfGXiehmisQVzF2TQoEpwZH5tgqHAk5OJqwPabV9A7vqazYUukEzD0LE7T
	 hDCE7owm7quOHQGTm2/0YnU7vglCt8Fwz6YQbc7Hg0ZS8q0Hes79um+Asc8GsX7R0f
	 E4Lzhjl6zdpx3psyAImhCcGehhhjFMOepgCxiscG3rN7SJ0jmrdx7f6hqNPRl5Npm5
	 4N2pV2VVsGjCg==
Message-ID: <800e848c-9cf7-4ded-aa44-a132cdc302af@denx.de>
Date: Mon, 8 Jul 2024 13:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: Document "netdev" trigger
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-leds@vger.kernel.org
Cc: kernel@dh-electronics.com, Conor Dooley <conor+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20240705215313.256963-1-marex@denx.de>
 <22b43c93-6055-4503-94ad-cd449f21f801@kernel.org>
 <ba158821-2f9f-46f6-9929-5bc810f2e10b@denx.de>
 <9a0b596a-82ab-4731-8a48-88b02e48395b@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9a0b596a-82ab-4731-8a48-88b02e48395b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/8/24 8:18 AM, Krzysztof Kozlowski wrote:
> On 07/07/2024 21:49, Marek Vasut wrote:
>> On 7/7/24 3:49 PM, Krzysztof Kozlowski wrote:
>>> On 05/07/2024 23:52, Marek Vasut wrote:
>>>> Document the "netdev" trigger which is used to control LEDs by
>>>> network device activity.
>>>
>>> Instead, please propose a patch adding a comment there (in that place):
>>> "# netdev - not accepted, please do not add it"
>>>
>>> This is like fourth or fifth attempt.
>>>
>>> https://lore.kernel.org/all/20230217230346.GA2217008-robh@kernel.org/
>>
>> There is a follow up to that discussion:
>>
>> https://lore.kernel.org/all/20230221014413.GA780723-robh@kernel.org/
>>
>> That netdev trigger is nothing new, there are existing DTs using that
>> trigger in-tree going back to 2019, this is only documenting it.
>>
>> So, shall I really add a comment or update the commit message ?
> 
> I was not aware that discussion, so it seems commit will be fine, but
> with updated message.

V2 with slightly expanded commit message sent, thanks !

