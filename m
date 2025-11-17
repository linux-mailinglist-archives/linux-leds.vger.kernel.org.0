Return-Path: <linux-leds+bounces-6165-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD25DC63CD5
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 12:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3254E3802DC
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 11:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AE03594F;
	Mon, 17 Nov 2025 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qP8SReAN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87211CBA;
	Mon, 17 Nov 2025 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378321; cv=none; b=bGIn/XNP4Jhw1CzWcXhyxAG/UZYzrizXt0vqiWmqWg8eZjv4hxIcqLfoHZhMRUdhtDNNQ4WBsCAZqTmYljijlURz/ecckU5YPtzQen7nv87BYarUnHQNfE1TIeRSc3uaRSDhNyVOAmyEdO00JtV9dcge7p+04kDkUgPkHAsK4Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378321; c=relaxed/simple;
	bh=5wLLJVB66wca9v8xVdIHb23PUiY2YkW+I6ixqL5yXxY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=em3Y/I1IW2/hPkN6jJ8/tUqJ9jEdAbxLgWP3/+eMtNBt51gK+UcyuBAYx8yJqxyiEePT6opXmhu0YSwBHq+M2J9bZrbys4rvTrZmOXGtuAn2VoL0CwvQ222GdNwgT1cNVSJcUNkFcWX3alT7sNo8Iyquxi20KFbfXiXGlxDpJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qP8SReAN; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d94xR54l8z9tPN;
	Mon, 17 Nov 2025 12:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763378315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/yUxH07BZ7z6RY7qPh9V7bK+ouYzlYaoiAPzW2PwTA=;
	b=qP8SReAN+DvwGXLfoMM3KkUe58s99DnzSDTAf1XxGfRjnYhfBORD1wZDUFwm37CoPG+IVJ
	O08FKzwSJLvbAl0N4Q6FzdxDEq1ZmrcMdLshQgzorqd8wC9rN3tEwSxmFb63fhJv5AgP7C
	jJIPdLAy0KQvz2srB1P1+KVdFKLEVA7tMYGKSVcrYb/lRPFmQfnvatOujR7q1fgYR9rWoN
	Z79MzL8sEK57SET0sx5yYtTf64twTb1UE11oLnNU6fgrZ/LTyE65tN4gTczxLU3DFKlUrP
	BpBpjvxWVERm0uPoD13NFIYTTZ9qZt4pfdr1K3VOYzTb8vbZtxVTu9zU4+dV7g==
Message-ID: <b4ba27e5-a1cc-4477-a254-a318e586ef2a@mailbox.org>
Date: Mon, 17 Nov 2025 12:18:31 +0100
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
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
Content-Language: en-US
In-Reply-To: <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c634c576c82130d98b2
X-MBO-RS-META: z4y1gngkuhdep4ypa3wmytu8h5dof3xm

On 10/3/24 2:47 AM, Marek Vasut wrote:

Hello again,

>>> On STM32MP13xx with RTL8211F, it is enough to have the following udev 
>>> rule
>>> in place, boot the machine with cable plugged in, and the LEDs won't 
>>> work
>>> without this patch once the interface is brought up, even if they 
>>> should:
>>> "
>>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", 
>>> ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", 
>>> ATTR{link_1000}="1", ATTR{device_name}="end0"
>>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", 
>>> ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name} 
>>> ="end0"
>>> "
>>
>> Nice use of udev. I had not thought about using it for this.

I might have been a bit too hasty with this. The following is only a 
quick preliminary FYI, I am still investigating the details.

I observe on 6.18-rc6 (ST STM32MP13xx , so STM32 DWMAC ethernet, and 
RTL8211F PHY), that if I use the these udev rules (SoC has two MACs, 
there are two rules for each MAC, and 2 rules for each of two LEDs on 
each MAC PHY , therefore four rules in total ; the rules for both MACs 
are identical):

"
ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", 
ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", 
ATTR{device_name}="ethsom0"
ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", 
ATTR{tx}="1", ATTR{device_name}="ethsom0"

ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-1:01:green:lan", ATTR{trigger}="netdev", 
ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", 
ATTR{device_name}="ethsom1"
ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-1:01:yellow:lan", ATTR{trigger}="netdev", ATTR{rx}="1", 
ATTR{tx}="1", ATTR{device_name}="ethsom1"
"

I get this backtrace. Notice the "sysfs: cannot create duplicate 
filename ..." part , I suspect there is some subtle race condition ?

"
sysfs: cannot create duplicate filename 
'/devices/platform/soc/5c007000.bus/5800e000.ethernet/mdio_bus/stmmac-1/stmmac-1:01/leds/stmmac-1:01:green:lan/link_10'
CPU: 0 UID: 0 PID: 153 Comm: (udev-worker) Not tainted 6.18.0-rc6 #1 
PREEMPT
Hardware name: STM32 (Device Tree Support)
Call trace:
  unwind_backtrace from show_stack+0x18/0x1c
  show_stack from dump_stack_lvl+0x54/0x68
  dump_stack_lvl from sysfs_warn_dup+0x58/0x6c
  sysfs_warn_dup from sysfs_add_file_mode_ns+0xf0/0x130
  sysfs_add_file_mode_ns from internal_create_group+0x344/0x480
  internal_create_group from internal_create_groups+0x48/0x6c
  internal_create_groups from led_trigger_set+0x1e4/0x278
  led_trigger_set from led_trigger_write+0xe0/0x118
  led_trigger_write from sysfs_kf_bin_write+0x98/0xa0
  sysfs_kf_bin_write from kernfs_fop_write_iter+0x14c/0x198
  kernfs_fop_write_iter from vfs_write+0x170/0x1d4
  vfs_write from ksys_write+0x7c/0xd0
  ksys_write from ret_fast_syscall+0x0/0x54
Exception stack(0xedbf1fa8 to 0xedbf1ff0)
1fa0:                   00000006 bec4476c 00000015 bec4476c 00000006 
00000001
1fc0: 00000006 bec4476c 000e7698 00000004 00000006 fffffff7 00000000 
000d1710
1fe0: 00000004 bec44578 b6c34397 b6bb15e6
leds stmmac-1:01:green:lan: Failed to add trigger attributes
"

If I find out more, I will get back to this thread.

