Return-Path: <linux-leds+bounces-6210-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1CC7080A
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 18:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BCE0343908
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 17:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3076F243367;
	Wed, 19 Nov 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yEd2xxua"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD41FAC42;
	Wed, 19 Nov 2025 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573697; cv=none; b=uR1Y8loITu/DB6xt8TBDIjUkjpR4ZPoToMqam8O2Mw/Xw1w9Rq5K7j9mRDzV8wQOhz/J6IoMt7FI1pK4b6mu8CMUBGXgyO0svOZu0CKEt9HUgyIFPalCr5sau2kycl0BMLmh2G6uH76ve4h0PaF5w66aUNWlvAbxwqHPHMbeP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573697; c=relaxed/simple;
	bh=CP1RHwnLKRxiLODuRu9d3QUcRfYZy94bnfo/gKve3d8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=umqo6DKNqn1FfDaHGfhaaign2CgosCxNtWE1IROx7VtWkOIyVPPcuD8lRea0f8TAApP8uu0lZPdweo4ADnJvjM0BNNRYZYh2Viy+yQmrrU5P+x3+71XpCONL+9ZmMHkHa0yDrswJrHQEZTkn0duQJvYvv+3yZiPFlO8lSiUOmr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yEd2xxua; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dBTBW16zVz9tl0;
	Wed, 19 Nov 2025 18:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763573683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8QG+N4/1kcdXJQ/ndyF1FfjMK6+46fe00n91fXl4zg=;
	b=yEd2xxualOZVytUgw3Cm0xIpSSC+7i0hA/sy4Jpc/iTSCJvNNzs1XQ0HU5b74/FHvDgBb5
	X6QCpYcnMXyMVeqbdnCjfWM9ZHsbz95+R8P5Ai/2+V9PS0a33sJsxAa4dDebvAqdic28Av
	obTly/Pir2GjLVbNv/RvwHWdFWAMGgTjrNtwVYuO4LcNRiHgIxDhq/GKupAlfvIkaat3Ad
	ZvrX+B+wVyf3eErqKyxWbTdt6/oTWudG1hcfgjwQZ3W7cK7yaSGVoO1IGVXreyah4PpCvC
	9CuOUsy9k9wCuOuGQ98BEHBzpVFOzZ/Ye1MT8O8XtNXvDRi0ciTzMbnOvUaf9Q==
Message-ID: <d520f61e-1c51-48dd-aa49-6bf4618d6b54@mailbox.org>
Date: Wed, 19 Nov 2025 17:09:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] leds: trigger: netdev: Check offload ability on interface
 up
From: Marek Vasut <marek.vasut@mailbox.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Daniel Golle <daniel@makrotopia.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
 <b4ba27e5-a1cc-4477-a254-a318e586ef2a@mailbox.org>
Content-Language: en-US
In-Reply-To: <b4ba27e5-a1cc-4477-a254-a318e586ef2a@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 846c09ea91c3b08f769
X-MBO-RS-META: sx15x14jwms1as3f6qs156fxnrhnbrkr

On 11/17/25 12:18 PM, Marek Vasut wrote:

Hello one more time,

>>>> On STM32MP13xx with RTL8211F, it is enough to have the following 
>>>> udev rule
>>>> in place, boot the machine with cable plugged in, and the LEDs won't 
>>>> work
>>>> without this patch once the interface is brought up, even if they 
>>>> should:
>>>> "
>>>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", 
>>>> ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", 
>>>> ATTR{link_1000}="1", ATTR{device_name}="end0"
>>>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", 
>>>> ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", 
>>>> ATTR{device_name} ="end0"
>>>> "
>>>
>>> Nice use of udev. I had not thought about using it for this.
> 
> I might have been a bit too hasty with this. The following is only a 
> quick preliminary FYI, I am still investigating the details.
> 
> I observe on 6.18-rc6 (ST STM32MP13xx , so STM32 DWMAC ethernet, and 
> RTL8211F PHY), that if I use the these udev rules (SoC has two MACs, 
> there are two rules for each MAC, and 2 rules for each of two LEDs on 
> each MAC PHY , therefore four rules in total ; the rules for both MACs 
> are identical):
> 
> "
> ACTION=="add|change", SUBSYSTEM=="leds", 
> KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10} 
> ="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="ethsom0"
> ACTION=="add|change", SUBSYSTEM=="leds", 
> KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", 
> ATTR{tx}="1", ATTR{device_name}="ethsom0"
> 
> ACTION=="add|change", SUBSYSTEM=="leds", 
> KERNEL=="stmmac-1:01:green:lan", ATTR{trigger}="netdev", ATTR{link_10} 
> ="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="ethsom1"
> ACTION=="add|change", SUBSYSTEM=="leds", 
> KERNEL=="stmmac-1:01:yellow:lan", ATTR{trigger}="netdev", ATTR{rx}="1", 
> ATTR{tx}="1", ATTR{device_name}="ethsom1"
> "
> 
> I get this backtrace. Notice the "sysfs: cannot create duplicate 
> filename ..." part , I suspect there is some subtle race condition ?
> 
> "
> sysfs: cannot create duplicate filename '/devices/platform/ 
> soc/5c007000.bus/5800e000.ethernet/mdio_bus/stmmac-1/stmmac-1:01/leds/ 
> stmmac-1:01:green:lan/link_10'
> CPU: 0 UID: 0 PID: 153 Comm: (udev-worker) Not tainted 6.18.0-rc6 #1 
> PREEMPT
> Hardware name: STM32 (Device Tree Support)
> Call trace:
>   unwind_backtrace from show_stack+0x18/0x1c
>   show_stack from dump_stack_lvl+0x54/0x68
>   dump_stack_lvl from sysfs_warn_dup+0x58/0x6c
>   sysfs_warn_dup from sysfs_add_file_mode_ns+0xf0/0x130
>   sysfs_add_file_mode_ns from internal_create_group+0x344/0x480
>   internal_create_group from internal_create_groups+0x48/0x6c
>   internal_create_groups from led_trigger_set+0x1e4/0x278
>   led_trigger_set from led_trigger_write+0xe0/0x118
>   led_trigger_write from sysfs_kf_bin_write+0x98/0xa0
>   sysfs_kf_bin_write from kernfs_fop_write_iter+0x14c/0x198
>   kernfs_fop_write_iter from vfs_write+0x170/0x1d4
>   vfs_write from ksys_write+0x7c/0xd0
>   ksys_write from ret_fast_syscall+0x0/0x54
> Exception stack(0xedbf1fa8 to 0xedbf1ff0)
> 1fa0:                   00000006 bec4476c 00000015 bec4476c 00000006 
> 00000001
> 1fc0: 00000006 bec4476c 000e7698 00000004 00000006 fffffff7 00000000 
> 000d1710
> 1fe0: 00000004 bec44578 b6c34397 b6bb15e6
> leds stmmac-1:01:green:lan: Failed to add trigger attributes
> "
> 
> If I find out more, I will get back to this thread.

I've been tracking it all the way to kernfs, but so far without much 
success.

I found commit 52c47742f79d ("leds: triggers: send uevent when changing 
triggers") which indicates the udev rules above are likely wrong, but 
they still shouldn't corrupt sysfs the way they do, right ?

If you have any hint how to find out what is actually going on, I would 
be much grateful. I already tried KASAN on this and LOCKDEP, but neither 
triggers. I was also adding a lot of trace_printk() into netdev LED 
trigger, but all I could find is the link_* attributes are removed, then 
added again, and the kernel complains the link_10 attribute already exists.

I also noticed that if I try to list /sys/...stmmac-1:01:green:lan/ 
directory after the splat with netdev trigger set, the result of the 
listing is not always the same, sometimes there are the netdev trigger 
attributes, sometimes not, and sometimes they are corrupted.

