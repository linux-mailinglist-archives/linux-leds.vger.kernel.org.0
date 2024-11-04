Return-Path: <linux-leds+bounces-3270-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE09BB8EE
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 16:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40B4D1C21DAF
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7CC1C231D;
	Mon,  4 Nov 2024 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="XUyZoYcb"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E361BF80C;
	Mon,  4 Nov 2024 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733879; cv=none; b=rfgHukrHL/SiyOMYJJRLxPeFXhCJh96LQYjzI6NU0MSnsNHHuQrtIjBnNmGkyQUDvQMIx1qeP4oO0O1WGAxupX4gFcUrhppH5QSjL7MsHURtbvAwntCVIDTYx4/keDjzvfrB+EPgwUTFeIW3QZf8YUVnHTtBaBkfkoiL0LVKkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733879; c=relaxed/simple;
	bh=jCDBlylsOzrgQaNlej+sW6wCxbQqqoCN8j/G9BzxwkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=TPyn8Eg+KBJi5mFO69zrNwNQ6RBh8xOim6qkFwcadAzErpyw9F4UYSd9aiFvzZmvt8fYnR1hpZwbPiJdRSmCAfWQQh0dDu9F5Yg26RYu7lB6I5xOPwLAHMoKzxI4Obec1Lx/fk3uSOL7z0zdzSjYalgjZ64Kx2VJqVdJEEmGtU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=XUyZoYcb; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1730733402;
	bh=Q6WriQMGrsUgGeqFJrLVcxtByXDFPjJNGKQK3ku9RWk=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=XUyZoYcbQ7a2pcnxqoLn8RulRO0I/cnoX/Isca+voXKfnX+2q9MX9XcqB1xwR1Q6C
	 uKZ6fYxybH1o6NWaAgzLzZIxeT7H2hVYVEEIdHSO+uEkP5KJrktSTK0pr5GjfVOlIE
	 emjKYk1EFu3adYt5H5GnQp1Vkl1KFcTS1x4EawmY=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 79D9DA03E9;
	Mon,  4 Nov 2024 16:16:42 +0100 (CET)
Message-ID: <01b7029f-ecac-4b45-a28d-04081b326024@ysoft.com>
Date: Mon, 4 Nov 2024 16:16:42 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] leds: Add LED1202 I2C driver
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
References: <Zx0A8ywBb9J65Rxl@admins-Air>
 <20241101170658.GA1807686@google.com> <ZyYKCMbviprVnoDK@admins-Air>
Content-Language: en-US
Cc: pavel@ucw.cz, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <ZyYKCMbviprVnoDK@admins-Air>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02. 11. 24 12:16, Vicentiu Galanopulo wrote:
> 
>>
>> Alphabetical.
> Done
>>> +#define ST1202_BUF_SIZE                    16
>>
>> This appears to be unused.
> Done
>> Please make sure all of these defines are used or removed.
>>
>>
>> I'm usually all for defines, but this one is a bit over the top.
> Removed
>>
>>
>> Why have you broken the line here and not 2 lines down?
> Checkpatch was complaining
>   
>>
>> Do this during declaration.
> Moved it inside for_each_available_child_of_node_scoped
> 
>> Lee Jones [李琼斯]
> Thank you for the review. I think corrected everything.

Hi Vicentiu,

Once a while I browse through the patches in various mailing lists to keep myself informed.
So I came across your patch set pretty randomly.

I have few tips for you to make your life easier before you get to some serious troubles
with the maintainers ;)

1. Always send all the patches in the series to the same recipients list.

That is, do not send dt-bindings to just Rob, Krzysztof etc. and LED driver
patches to Lee et al. We all need to see the whole thing.

If you run the scripts/get_maintainer.pl script on the series, you get a complete list.
This is what Krzysztof requested you to do in his comments to v3.

2. Use git format-patch and git send-email tools to submit patches.

If you use these tools you will avoid issues with wrong threading of the messages.

3. The following text should not be here.

You are supposed to just reply in-place to the review messages to acknowledge
that you read the comments and you understand what the reviewers want to
change. Then you send a next version of the series as a new message to all
the recipients. Definitely not as a in-reply-to to the previous version.

> [PATCH v5 2/3] leds: Add LED1202 I2C driver
> 
> The output current can be adjusted separately for each channel by 8-bit
> analog (current sink input) and 12-bit digital (PWM) dimming control. The
> LED1202 implements 12 low-side current generators with independent dimming
> control. Internal volatile memory allows the user to store up to 8 different
> patterns, each pattern is a particular output configuration in terms of PWM
> duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> common to all patterns. Each device tree LED node will have a corresponding
> entry in /sys/class/leds with the label name. The brightness property
> corresponds to the per channel analog dimming, while the patterns[1-8] to the
> PWM dimming control.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
> Changes in v5:
>    - remove unused macros
>    - switch to using devm_led_classdev_register_ext (struct st1202_led update)
>    - add prescalar_to_milliseconds (convert [22..5660]ms to [0..255] reg value)
>    - remove register range check in dt_init (range protected by yaml)
>    - address all review comments in v4
> Changes in v4:
>    - Remove attributes/extended attributes implementation
>    - Use /sys/class/leds/<led>/hw_pattern (Pavel suggestion)
>    - Implement review findings of Christophe JAILLET
> Changes in v3:
>    - Rename all ll1202 to st1202, including driver file name
>    - Convert all magic numbers to defines
>    - Refactor the show/store callbacks as per Lee's and Thomas's review
>    - Remove ll1202_get_channel and use dev_ext_attributes instead
>    - Log all error values for all the functions
>    - Use sysfs_emit for show callbacks
> Changes in v2:
>    - Fix build error for device_attribute modes

I hope you will get this sorted, I know the beginnings are difficult.

Best regards,
Michal

