Return-Path: <linux-leds+bounces-4862-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F6AE0E64
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 22:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A0877A4F84
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 20:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2707244686;
	Thu, 19 Jun 2025 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgBxXsXx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DCF30E820;
	Thu, 19 Jun 2025 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363429; cv=none; b=oKISWJdcbslrV46gq2YnWF22bp5UxVopeCmOR/uXAPUwRoWC0vBFNWFAkwhXuLeoe3CDi1eoc8oVX8H/XPivs2qQsFDpOazhhSjligVn0xm77CvtmiTnxNBCt/eS2u6O7xUkf8FHQqliRk94GwI8o+M+LTVAgEfYh3U4W1Z0I6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363429; c=relaxed/simple;
	bh=fk3fmHlAtMJ5XqQyz6sbrUWHSI6GW95mIPRC7IjMxio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0BrWPPGI5d3+uzcdNEiktA4hTugcbFgeTdss4G7A5vH5ox8HVZhh4SEwdcpLmoot/zZ3FWPS9XBe2pqat1flZTloRQNkeN/VsOFTf9pkF17AzhWL3WwSaDyeIx9kTYPsTEEMq/HbnMtYE1Cven0kLlQGG9YpyrCC6HyAdOTpsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgBxXsXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D609FC4CEEA;
	Thu, 19 Jun 2025 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750363429;
	bh=fk3fmHlAtMJ5XqQyz6sbrUWHSI6GW95mIPRC7IjMxio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kgBxXsXx+0RC+DQAfbbjIERuH0TEbASijWoawjtW8h6hyMuqO8RoUDDRxiOrCtEr4
	 oup9YfEPiFKeHWAGQzmoTqwEIWvpLfjh/N1pOMYL7hQJzaE4a1nQCLtxJEvgd3HyOR
	 fspVyMw+zIjDykPH0JV20aIavDqxLoSMi9evfeea7834ykIoX9N6Qgt2WoNcyy0Gnj
	 vhdN+1o+iiEfjLkyoHDVapy8uUUQd6Dg+KSBCTQcSpNw6CujVsS8ZNYdbwCakMYw9G
	 zLgD64tD/8RExiGfGRRsdQN/TyOL8da3lKLn/CnkDzbtP2oD++57p7KEotHFQSnOiX
	 ofWbryazOWPYw==
Message-ID: <7c5b6512-1374-41c9-be9a-ac05b573e2cd@kernel.org>
Date: Thu, 19 Jun 2025 22:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Lee Jones <lee@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>,
 ilpo.jarvinen@linux.intel.com, chumuzero@gmail.com, corbet@lwn.net,
 cs@tuxedo.de, ggo@tuxedocomputers.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
 <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>
 <20250619094757.GB587864@google.com>
 <ebd9489d-2783-468a-ad07-e7d1c04fb165@kernel.org>
 <20250619151714.GJ795775@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250619151714.GJ795775@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,

On 19-Jun-25 5:17 PM, Lee Jones wrote:
> On Thu, 19 Jun 2025, Hans de Goede wrote:
> 
>> Hi Lee,
>>
>> On 19-Jun-25 11:47 AM, Lee Jones wrote:
>>> On Tue, 17 Jun 2025, Armin Wolf wrote:
>>>
>>>> Am 16.06.25 um 14:46 schrieb Werner Sembach:
>>>>
>>>>> Hi, small additon
>>>>>
>>>>> Am 15.06.25 um 19:59 schrieb Armin Wolf:
>>>>>> +        functionality.
>>>>>> +
>>>>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
>>>>>> +Date:        Juni 2025
>>>>>> +KernelVersion:    6.17
>>>>>> +Contact:    Armin Wolf <W_Armin@gmx.de>
>>>>>> +Description:
>>>>>> +        Forces the integrated lightbar to display a rainbow
>>>>>> animation when the machine
>>>>>> +        is not suspended. Writing "enable"/"disable" into this file
>>>>>> enables/disables
>>>>>> +        this functionality.
>>>>>> +
>>>>>> +        Reading this file returns the current status of the rainbow
>>>>>> animation functionality.
>>>>>> +
>>>>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
>>>>>> +Date:        Juni 2025
>>>>>> +KernelVersion:    6.17
>>>>>> +Contact:    Armin Wolf <W_Armin@gmx.de>
>>>>>> +Description:
>>>>>> +        Causes the integrated lightbar to display a breathing
>>>>>> animation when the machine
>>>>>> +        has been suspended and is running on AC power. Writing
>>>>>> "enable"/"disable" into
>>>>>> +        this file enables/disables this functionality.
>>>>>> +
>>>>>> +        Reading this file returns the current status of the
>>>>>> breathing animation
>>>>>> +        functionality.
>>>>>
>>>>> maybe this would be better under the /sys/class/leds/*/ tree if possible
>>>>
>>>> I CCed the LED mailing list so that they can give us advice on which location is the preferred one for new drivers.
>>>
>>> No need to involve the LED subsystem for a hardware function controlled
>>> by a single register value just because the interface involves an LED.
>>
>> Lee, the question here is where put the sysfs attribute to put the lightbar
>> in breathing mode e.g. which of these 2 should be used?  :
>>
>> 1. /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
>> 2. /sys/class/leds/uniwill-lightbar/breathing_in_suspend
>>
>> I think this is a fair question and since 2. involves the LED class userspace
>> API I also think that asking for the LED maintainers input is reasonable.
>>
>> FWIW I'm not sure myself. 2. is the more logical place / path. But 2. adds
>> a custom sysfs attr the LED class device. Whereas 1. adds a custom sysfs attr
>> in a place where these are more or less expected.
> 
> Right.  It was a reasonable question.  Did I imply otherwise?

Sorry, my bad, I interpreted your "No need to involve the LED
subsystem for a hardware function ..." remark as meaning that
you did not understand why you were Cc-ed.

I now realize that you meant that you believe the control for
this does not need to be under /sys/class/leds/

> If it wasn't clear, my vote (this is not a dictatorship) is for 1.

Ok, 1. works for me and that is what the patch is already doing,
so lets keep it as as.

Regards,

Hans



