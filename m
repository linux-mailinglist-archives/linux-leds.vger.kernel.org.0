Return-Path: <linux-leds+bounces-5172-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB3B16718
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 21:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 469137A983F
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 19:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6978B1E570D;
	Wed, 30 Jul 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="jQg5miRR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2462AE74;
	Wed, 30 Jul 2025 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905042; cv=none; b=KryFNEBihJR6AuEqepa21HCUkmubwFDa82mAj+fG8raeQLcMUorf7NcyhrMwGkxmKkKVw6TH3Yo9upc/VUVj8fedUCQ0dFJN0Ticu3gu79rCP+hHe4YXmrWLcwN/U6QccPKZfitcvNEswS+8MJl7daKzWofePM4UGi8AOVWdwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905042; c=relaxed/simple;
	bh=khtml9RtnRjSSPRRrCR/+QfYGLYLBLAqmAvwfUCjcVo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aPMEWbCfD9RQ+953COUmZuwMQyRFcSJvx3oLLEVZueLtrO1/FTruV8xs5qtqjEZUCP/yrbZstelKXdIPhGebAnqolXeyLvE8OHUro0zkriWdsNMDgxNC7AntSJQKCGeuPZR653J8BBBCLzSAYBjYYyN2GVVWNQb1LusDaY7TgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=jQg5miRR; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1753905027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/q1/ijPw1e2Q92rioAtt4ZINjgooInrMuTW/Z/Sz9xE=;
	b=jQg5miRR+84MPUTRh150aKHGLt4ikOIhQHFH9fpBqN92Q6FOwIUw3Uo0o19lX/IChB8Z6I
	bmj40z2X4yv5x2/EPMGEtL7ZNuMzB1W3lxHps+kfmN6D/ivH4AIUanLXcFqRNuQj8dyDHw
	AXK6VtpREotTOM8pqEMRgI0HHwDgvmdUHHOuMoH9WfFfs3jBdnzYnMUDqvix3dBASvJ4lo
	QL+OtiBvzy4slFX8bG4+Hk/TKaAG5QnNZaoAJJJQvkZkEQ4UrV7Ojb77GCdxKzFT9Hb8LG
	twq1w8QfXiGt72yotjLeokmNVrDGR7xPczBTKy5w9y4+FQ844zVBCyNXSNWxlA==
Date: Wed, 30 Jul 2025 21:50:25 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Diederik de Haas <didi.debian@cknow.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: BUG: Circular locking dependency on netdev led trigger on NanoPi
 R5S
In-Reply-To: <6817efe1-f2c2-4686-bdf1-fca11f066e3a@arm.com>
References: <DBLBPIBKFCJV.36AVW8JY88L7H@cknow.org>
 <6817efe1-f2c2-4686-bdf1-fca11f066e3a@arm.com>
Message-ID: <475ee9ae8cdca5ce86b708fe0ade7c9d@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Robin and Diederik,

On 2025-07-25 20:12, Robin Murphy wrote:
> On 2025-07-25 6:48 pm, Diederik de Haas wrote:
>> I have a FriendlyELEC NanoPi R5S (with rk3568 SoC) and in commit
>> 1631cbdb8089 ("arm64: dts: rockchip: Improve LED config for NanoPi 
>> R5S")
>> 
>> I tried to improve its LED configuration and that included
>> ``linux,default-trigger = "netdev"``
>> 
>> Problem: sometimes I got a 'hung task' error which resulted in the WAN
>> port not to come up (that's the only one I use) and logging in via
>> serial also didn't work, so pulling the plug was the only remedy.
>> 
>> Robin Murphy quickly identified that it likely had to do with led
>> triggers and removing those netdev triggers made the problem go 
>> away[1].
>> To find out what actually caused it, I built a kernel with 
>> PROOF_LOCKING
>> and PRINTK_CALLER enabled, which after adding a patch which fixed an
>> OOPS [2], showed the underlaying problem:
> 
> For the record, I think the actual deadlock condition Diederik's
> system hits in practice is a shorter cycle, wherein immediately after
> acquiring pernet_ops_rwsem, thread #0 then tries to take rtnl_mutex,
> which forms a straight inversion against thread #2 (which holds
> rtnl_mutex from devinet_ioctl()).

Thanks for the bug report and for the additional insights!

I've spent some time digging through the LED subsystem, which I'm
already somewhat familiar with, and I think I've narrowed down the
root cause of this deadlock.

I'll send a preliminary patch soon, after I make sure that the root
cause is identified correctly, and I hope Diederik will be willing
to test the patch.  If so, and if the patch checks out to be the
cure, I'll prepare and submit a proper patch, of course.

>>     ======================================================
>>     WARNING: possible circular locking dependency detected
>>     6.16-rc7+unreleased-arm64-cknow #1 Not tainted
>>     ------------------------------------------------------
>>     modprobe/936 is trying to acquire lock:
>>     ffffc943e0edc3b0 (pernet_ops_rwsem){++++}-{4:4}, at: 
>> register_netdevice_notifier+0x38/0x148
>> 
>>     but task is already holding lock:
>>     ffff0001f2762248 (&led_cdev->trigger_lock){+.+.}-{4:4}, at: 
>> led_trigger_register+0x14c/0x1e0
>> 
>>     which lock already depends on the new lock.
>> 
>>     the existing dependency chain (in reverse order) is:
>> 
>>     -> #3 (&led_cdev->trigger_lock){+.+.}-{4:4}:
>>            lock_acquire+0x1cc/0x348
>>            down_write+0x40/0xd8
>>            led_trigger_set_default+0x5c/0x170
>>            led_classdev_register_ext+0x340/0x488
>>            __sdhci_add_host+0x190/0x368 [sdhci]
>>            dwcmshc_probe+0x2b8/0x6b0 [sdhci_of_dwcmshc]
>>            platform_probe+0x70/0xe8
>>            really_probe+0xc8/0x3a0
>>            __driver_probe_device+0x84/0x160
>>            driver_probe_device+0x44/0x128
>>            __device_attach_driver+0xc4/0x170
>>            bus_for_each_drv+0x90/0xf8
>>            __device_attach_async_helper+0xc0/0x120
>>            async_run_entry_fn+0x40/0x180
>>            process_one_work+0x23c/0x640
>>            worker_thread+0x1b4/0x360
>>            kthread+0x150/0x250
>>            ret_from_fork+0x10/0x20
>> 
>>     -> #2 (triggers_list_lock){++++}-{4:4}:
>>            lock_acquire+0x1cc/0x348
>>            down_write+0x40/0xd8
>>            led_trigger_register+0x58/0x1e0
>>            phy_led_triggers_register+0xf4/0x258 [libphy]
>>            phy_attach_direct+0x328/0x3a8 [libphy]
>>            phylink_fwnode_phy_connect+0xb0/0x138 [phylink]
>>            __stmmac_open+0xec/0x520 [stmmac]
>>            stmmac_open+0x4c/0xe8 [stmmac]
>>            __dev_open+0x13c/0x310
>>            __dev_change_flags+0x1d4/0x260
>>            netif_change_flags+0x2c/0x80
>>            dev_change_flags+0x90/0xd0
>>            devinet_ioctl+0x55c/0x730
>>            inet_ioctl+0x1e4/0x200
>>            sock_do_ioctl+0x6c/0x140
>>            sock_ioctl+0x328/0x3c0
>>            __arm64_sys_ioctl+0xb4/0x118
>>            invoke_syscall+0x6c/0x100
>>            el0_svc_common.constprop.0+0x48/0xf0
>>            do_el0_svc+0x24/0x38
>>            el0_svc+0x54/0x1e0
>>            el0t_64_sync_handler+0x10c/0x140
>>            el0t_64_sync+0x198/0x1a0
>> 
>>     -> #1 (rtnl_mutex){+.+.}-{4:4}:
>>            lock_acquire+0x1cc/0x348
>>            __mutex_lock+0xac/0x590
>>            mutex_lock_nested+0x2c/0x40
>>            rtnl_lock+0x24/0x38
>>            register_netdevice_notifier+0x40/0x148
>>            rtnetlink_init+0x40/0x68
>>            netlink_proto_init+0x120/0x158
>>            do_one_initcall+0x88/0x3b8
>>            kernel_init_freeable+0x2d0/0x340
>>            kernel_init+0x28/0x160
>>            ret_from_fork+0x10/0x20
>> 
>>     -> #0 (pernet_ops_rwsem){++++}-{4:4}:
>>            check_prev_add+0x114/0xcb8
>>            __lock_acquire+0x12e8/0x15f0
>>            lock_acquire+0x1cc/0x348
>>            down_write+0x40/0xd8
>>            register_netdevice_notifier+0x38/0x148
>>            netdev_trig_activate+0x18c/0x1e8 [ledtrig_netdev]
>>            led_trigger_set+0x1d4/0x328
>>            led_trigger_register+0x194/0x1e0
>>            netdev_led_trigger_init+0x20/0xff8 [ledtrig_netdev]
>>            do_one_initcall+0x88/0x3b8
>>            do_init_module+0x5c/0x270
>>            load_module+0x1ed8/0x2608
>>            init_module_from_file+0x94/0x100
>>            idempotent_init_module+0x1e8/0x2f0
>>            __arm64_sys_finit_module+0x70/0xe8
>>            invoke_syscall+0x6c/0x100
>>            el0_svc_common.constprop.0+0x48/0xf0
>>            do_el0_svc+0x24/0x38
>>            el0_svc+0x54/0x1e0
>>            el0t_64_sync_handler+0x10c/0x140
>>            el0t_64_sync+0x198/0x1a0
>> 
>>     other info that might help us debug this:
>> 
>>     Chain exists of:
>>       pernet_ops_rwsem --> triggers_list_lock --> 
>> &led_cdev->trigger_lock
>> 
>>      Possible unsafe locking scenario:
>> 
>>            CPU0                    CPU1
>>            ----                    ----
>>       lock(&led_cdev->trigger_lock);
>>                                    lock(triggers_list_lock);
>>                                    lock(&led_cdev->trigger_lock);
>>       lock(pernet_ops_rwsem);
>> 
>>      *** DEADLOCK ***
>> 
>>     2 locks held by modprobe/936:
>>      #0: ffffc943e0d2baa8 (leds_list_lock){++++}-{4:4}, at: 
>> led_trigger_register+0x10c/0x1e0
>>      #1: ffff0001f2762248 (&led_cdev->trigger_lock){+.+.}-{4:4}, at: 
>> led_trigger_register+0x14c/0x1e0
>> 
>>     stack backtrace:
>>     CPU: 0 UID: 0 PID: 936 Comm: modprobe Not tainted 
>> 6.16-rc7+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 6.16~rc7-2~exp1
>>     Hardware name: FriendlyElec NanoPi R5S (DT)
>>     Call trace:
>>      show_stack+0x34/0xa0 (C)
>>      dump_stack_lvl+0x70/0x98
>>      dump_stack+0x18/0x24
>>      print_circular_bug+0x230/0x280
>>      check_noncircular+0x174/0x188
>>      check_prev_add+0x114/0xcb8
>>      __lock_acquire+0x12e8/0x15f0
>>      lock_acquire+0x1cc/0x348
>>      down_write+0x40/0xd8
>>      register_netdevice_notifier+0x38/0x148
>>      netdev_trig_activate+0x18c/0x1e8 [ledtrig_netdev]
>>      led_trigger_set+0x1d4/0x328
>>      led_trigger_register+0x194/0x1e0
>>      netdev_led_trigger_init+0x20/0xff8 [ledtrig_netdev]
>>      do_one_initcall+0x88/0x3b8
>>      do_init_module+0x5c/0x270
>>      load_module+0x1ed8/0x2608
>>      init_module_from_file+0x94/0x100
>>      idempotent_init_module+0x1e8/0x2f0
>>      __arm64_sys_finit_module+0x70/0xe8
>>      invoke_syscall+0x6c/0x100
>>      el0_svc_common.constprop.0+0x48/0xf0
>>      do_el0_svc+0x24/0x38
>>      el0_svc+0x54/0x1e0
>>      el0t_64_sync_handler+0x10c/0x140
>>      el0t_64_sync+0x198/0x1a0
>>     leds-gpio gpio-leds: bus: 'platform': really_probe: bound device 
>> to driver leds-gpio
>> 
>> Full serial log can be found at [3] which is quite verbose and the 
>> boot
>> took way longer then normal as the following was added to cmdline:
>> ``dyndbg="file dd.c func really_probe +p" maxcpus=1``
>> 
>> Free free to ask for additional info and/or to run tests.
>> 
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=arm/fixes&id=912b1f2a796ec73530a709b11821cb0c249fb23e
>> [2] 
>> https://lore.kernel.org/linux-rockchip/f81b88df-9959-4968-a60a-b7efd3d5ea24@arm.com/
>> [3] 
>> https://paste.sr.ht/~diederik/142e92bfb29bbb58bca18a74cdffc5e0ba79081c

