Return-Path: <linux-leds+bounces-4854-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4687AE05CF
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 14:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21CF07AD026
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 12:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3BF23B627;
	Thu, 19 Jun 2025 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHYdw3a/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7522E402;
	Thu, 19 Jun 2025 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336228; cv=none; b=n/p6zeGObzb2kRkHnkZdui0vjSl774ktkIq/Ozdv/g02dw2IGDz1qMB8sY/BMbSN0AqcV+gMd3HKs51KhVBbUZOSOfTGrWRWsZ2WRmFx9B1KApPEj3aP+rgDmnYMb62imlgzOVqTd5ej/1RCYDUVCGg4HP+ffXCiE5tOfoVwzPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336228; c=relaxed/simple;
	bh=Ww2BBz1HgkQfNGABCdYcAVENvhjoK9QiQSPMdEmdNPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQ0Nd5b6qRxbb0Pt0h7XOORv9vJUsN+kMwLj73+Ga7OLWYt+0NBIu8X0jyY4NREqI4bBkwdYCu9iLe6joSlnviS/y5R4EzNiPJU57pQGIlu3kYPav9r71POkHMloewmgzsjBiJbMPqWb7Wtw2L4o1DqOSVTW09kl2RzC0z/I1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHYdw3a/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AA4C4CEEA;
	Thu, 19 Jun 2025 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336228;
	bh=Ww2BBz1HgkQfNGABCdYcAVENvhjoK9QiQSPMdEmdNPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tHYdw3a/vmx4E7MTGvfkhzPZbCXCyhtdJOxdE1bsjt+dZy9eA6IOWE2vIvTa5idJG
	 sj982uj8NGfv7X3q5h8ubEvKQheRw7ut3lLOYLtV+D1GSquW9xqXhc+IOb7lOC7Wl8
	 JR6oeFgiouVmn4ZAcbOUoomWC3ZkAPAw3da5yedtMujWBqSlAB8+qLUMu9SnRc1f4H
	 SjRYXbuDg5ymUCvtoj/xouZq8X81xJckC4iHfv0OYxtdXoFfkKGVqv7w5H8KmmrdYT
	 oCMC5xlF7YaSleQrMZzSTVREpqaTEDccRjIHx+dkJwHq9f+fLabH10QBHgLHFRbnin
	 RHxKmM8/D0aXw==
Message-ID: <ebd9489d-2783-468a-ad07-e7d1c04fb165@kernel.org>
Date: Thu, 19 Jun 2025 14:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Lee Jones <lee@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Cc: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
 <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>
 <20250619094757.GB587864@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250619094757.GB587864@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,

On 19-Jun-25 11:47 AM, Lee Jones wrote:
> On Tue, 17 Jun 2025, Armin Wolf wrote:
> 
>> Am 16.06.25 um 14:46 schrieb Werner Sembach:
>>
>>> Hi, small additon
>>>
>>> Am 15.06.25 um 19:59 schrieb Armin Wolf:
>>>> +        functionality.
>>>> +
>>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
>>>> +Date:        Juni 2025
>>>> +KernelVersion:    6.17
>>>> +Contact:    Armin Wolf <W_Armin@gmx.de>
>>>> +Description:
>>>> +        Forces the integrated lightbar to display a rainbow
>>>> animation when the machine
>>>> +        is not suspended. Writing "enable"/"disable" into this file
>>>> enables/disables
>>>> +        this functionality.
>>>> +
>>>> +        Reading this file returns the current status of the rainbow
>>>> animation functionality.
>>>> +
>>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
>>>> +Date:        Juni 2025
>>>> +KernelVersion:    6.17
>>>> +Contact:    Armin Wolf <W_Armin@gmx.de>
>>>> +Description:
>>>> +        Causes the integrated lightbar to display a breathing
>>>> animation when the machine
>>>> +        has been suspended and is running on AC power. Writing
>>>> "enable"/"disable" into
>>>> +        this file enables/disables this functionality.
>>>> +
>>>> +        Reading this file returns the current status of the
>>>> breathing animation
>>>> +        functionality.
>>>
>>> maybe this would be better under the /sys/class/leds/*/ tree if possible
>>
>> I CCed the LED mailing list so that they can give us advice on which location is the preferred one for new drivers.
> 
> No need to involve the LED subsystem for a hardware function controlled
> by a single register value just because the interface involves an LED.

Lee, the question here is where put the sysfs attribute to put the lightbar
in breathing mode e.g. which of these 2 should be used?  :

1. /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
2. /sys/class/leds/uniwill-lightbar/breathing_in_suspend

I think this is a fair question and since 2. involves the LED class userspace
API I also think that asking for the LED maintainers input is reasonable.

FWIW I'm not sure myself. 2. is the more logical place / path. But 2. adds
a custom sysfs attr the LED class device. Whereas 1. adds a custom sysfs attr
in a place where these are more or less expected.

Regards,

Hans




