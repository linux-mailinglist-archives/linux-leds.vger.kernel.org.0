Return-Path: <linux-leds+bounces-1896-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA65907524
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7D311F222D6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CB5D535;
	Thu, 13 Jun 2024 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvGUsMYc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041138B
	for <linux-leds@vger.kernel.org>; Thu, 13 Jun 2024 14:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289095; cv=none; b=IWaO8BJcQSZVjCTLuZ54Ktq+QpaQ/hDi+Co9XSYoBJ/Wfkh+Mn1lirOCbAyQF6NmWjsFIaDWvm+CQ9cJUbPgwX0LcXqegEJxofkZghGuXX2wuaqUpHBukntxZjMHGtelKeo85On+58wOjpQT3ZgO0rijgritYiUnK6pYCATZgRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289095; c=relaxed/simple;
	bh=IenOP8FZmnmJsXJ3yl5Vb4RnKPQxZ0ij3us9NRw7VL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmZduuccX23zNBf/w4oAzrg/HhIprIyEmmxSwPLufdsogkNSyJeEJDGS68V9ntjAzJzxu6P64xhixiG4jWaHsufEQOydUnBTJkQfmImYHS8UN+braZzlfHTkeiuoo+VULp+rrIG98SEUK4w6qGhgFmXn7NCvpO5G0gV69EQ//2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvGUsMYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD62EC2BBFC;
	Thu, 13 Jun 2024 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289094;
	bh=IenOP8FZmnmJsXJ3yl5Vb4RnKPQxZ0ij3us9NRw7VL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvGUsMYcySEvjGuLTjtnUA5hMKpZ99Mc3GcpTj7yMwYI/9SG/q7Bb5KwKT1OFWj5U
	 z3+WkbdSk75Zn5KDUIqtwQD4uVbvahlCLlEX6dL3kFg5yPH4vM+ulJdNVebXYs/ENX
	 7pBHAvBoeXXRl3WY8jmiaTGqPQbPp9ennQBO2kYC8l8E6c+TelyUyWQN0gQEThCbIA
	 SbgYR+uO14yo+CpM1+lSifLhlfjD3rT3KajwGawb49Oeg9QK8D14nBjIWNZD9Ff6oU
	 ovtd2JGEVsmreo2iZ9DqVbxOqq+gwQftzZKrU3Kmq/hXYKbpVxla+hMkSMlN+PsBEx
	 TzxZuRPHUqiiQ==
Date: Thu, 13 Jun 2024 15:31:30 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/1] leds: trigger: input-events: Rewrite to fix a
 serious locking issue
Message-ID: <20240613143130.GE2561462@google.com>
References: <20240602160203.27339-1-hdegoede@redhat.com>
 <20240602160203.27339-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240602160203.27339-2-hdegoede@redhat.com>

On Sun, 02 Jun 2024, Hans de Goede wrote:

> The input subsystem registers LEDs with default triggers while holding
> the input_lock and input_register_handler() takes the input_lock this
> means that a triggers activate method cannot directly call
> input_register_handler() as the old ledtrig-input-events code is doing.
> 
> The initial implementation of the input-events trigger mainly did not use
> the simple LED trigger mechanism because that mechanism had an issue with
> the initial state of a newly activated LED not matching the last
> led_trigger_event() call for the trigger. This issue has been fixed in
> commit 822c91e72eac ("leds: trigger: Store brightness set by
> led_trigger_event()").
> 
> Rewrite the "input-events" trigger to use the simple LED trigger mechanism,
> registering a single input_handler at module_init() time and using
> led_trigger_event() to set the brightness for all LEDs controlled by this
> trigger.
> 
> Compared to the old code this looses the ability for the user to configure
> a different brightness for the on state then LED_FULL, this is standard for
> simple LED triggers and since this trigger is only in for-leds-next ATM
> losing that functionality is not a regression.
> 
> This also changes the configurability of the LED off timeout from a per
> LED setting to a global setting (runtime modifiable module-parameter).
> 
> Switching to registering a single input_handler at module_init() time fixes
> the following locking issue reported by lockdep:
> 
> [ 2840.220145] usb 1-1.3: new low-speed USB device number 3 using xhci_hcd
> [ 2840.307172] usb 1-1.3: New USB device found, idVendor=0603, idProduct=0002, bcdDevice= 2.21
> [ 2840.307375] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 2840.307423] usb 1-1.3: Product: USB Composite Device
> [ 2840.307456] usb 1-1.3: Manufacturer: SINO WEALTH
> [ 2840.333985] input: SINO WEALTH USB Composite Device as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.0/0003:0603:0002.0007/input/input19
> 
> [ 2840.386545] ======================================================
> [ 2840.386549] WARNING: possible circular locking dependency detected
> [ 2840.386554] 6.10.0-rc1+ #97 Tainted: G         C  E
> [ 2840.386558] ------------------------------------------------------
> [ 2840.386562] kworker/1:1/52 is trying to acquire lock:
> [ 2840.386566] ffff98fcf1629300 (&led_cdev->led_access){+.+.}-{3:3}, at: led_classdev_register_ext+0x1c6/0x380
> [ 2840.386590]
>                but task is already holding lock:
> [ 2840.386593] ffffffff88130cc8 (input_mutex){+.+.}-{3:3}, at: input_register_device.cold+0x47/0x150
> [ 2840.386608]
>                which lock already depends on the new lock.
> 
> [ 2840.386611]
>                the existing dependency chain (in reverse order) is:
> [ 2840.386615]
>                -> #3 (input_mutex){+.+.}-{3:3}:
> [ 2840.386624]        __mutex_lock+0x8c/0xc10
> [ 2840.386634]        input_register_handler+0x1c/0xf0
> [ 2840.386641]        0xffffffffc142c437
> [ 2840.386655]        led_trigger_set+0x1e1/0x2e0
> [ 2840.386661]        led_trigger_register+0x170/0x1b0
> [ 2840.386666]        do_one_initcall+0x5e/0x3a0
> [ 2840.386675]        do_init_module+0x60/0x220
> [ 2840.386683]        __do_sys_init_module+0x15f/0x190
> [ 2840.386689]        do_syscall_64+0x93/0x180
> [ 2840.386696]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [ 2840.386705]
>                -> #2 (&led_cdev->trigger_lock){+.+.}-{3:3}:
> [ 2840.386714]        down_write+0x3b/0xd0
> [ 2840.386720]        led_trigger_register+0x12c/0x1b0
> [ 2840.386725]        rfkill_register+0xec/0x340 [rfkill]
> [ 2840.386739]        wiphy_register+0x82a/0x930 [cfg80211]
> [ 2840.386907]        brcmf_cfg80211_attach+0xcbd/0x1430 [brcmfmac]
> [ 2840.386952]        brcmf_attach+0x1ba/0x4c0 [brcmfmac]
> [ 2840.386991]        brcmf_pcie_setup+0x899/0xc70 [brcmfmac]
> [ 2840.387030]        brcmf_fw_request_done+0x13b/0x180 [brcmfmac]
> [ 2840.387070]        request_firmware_work_func+0x3b/0x70
> [ 2840.387078]        process_one_work+0x21a/0x590
> [ 2840.387085]        worker_thread+0x1d1/0x3e0
> [ 2840.387090]        kthread+0xee/0x120
> [ 2840.387096]        ret_from_fork+0x30/0x50
> [ 2840.387105]        ret_from_fork_asm+0x1a/0x30
> [ 2840.387112]
>                -> #1 (leds_list_lock){++++}-{3:3}:
> [ 2840.387123]        down_write+0x3b/0xd0
> [ 2840.387129]        led_classdev_register_ext+0x29e/0x380
> [ 2840.387134]        0xffffffffc0e6b74c
> [ 2840.387143]        platform_probe+0x40/0xa0
> [ 2840.387151]        really_probe+0xde/0x340
> [ 2840.387157]        __driver_probe_device+0x78/0x110
> [ 2840.387162]        driver_probe_device+0x1f/0xa0
> [ 2840.387168]        __driver_attach+0xba/0x1c0
> [ 2840.387173]        bus_for_each_dev+0x6b/0xb0
> [ 2840.387180]        bus_add_driver+0x111/0x1f0
> [ 2840.387185]        driver_register+0x6e/0xc0
> [ 2840.387191]        do_one_initcall+0x5e/0x3a0
> [ 2840.387197]        do_init_module+0x60/0x220
> [ 2840.387204]        __do_sys_init_module+0x15f/0x190
> [ 2840.387210]        do_syscall_64+0x93/0x180
> [ 2840.387217]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [ 2840.387224]
>                -> #0 (&led_cdev->led_access){+.+.}-{3:3}:
> [ 2840.387233]        __lock_acquire+0x11c6/0x1f20
> [ 2840.387239]        lock_acquire+0xc8/0x2b0
> [ 2840.387244]        __mutex_lock+0x8c/0xc10
> [ 2840.387251]        led_classdev_register_ext+0x1c6/0x380
> [ 2840.387256]        input_leds_connect+0x139/0x260
> [ 2840.387262]        input_attach_handler.isra.0+0x75/0x90
> [ 2840.387268]        input_register_device.cold+0xa1/0x150
> [ 2840.387274]        hidinput_connect+0x848/0xb00
> [ 2840.387280]        hid_connect+0x567/0x5a0
> [ 2840.387288]        hid_hw_start+0x3f/0x60
> [ 2840.387294]        hid_device_probe+0x10d/0x190
> [ 2840.387298]        really_probe+0xde/0x340
> [ 2840.387304]        __driver_probe_device+0x78/0x110
> [ 2840.387309]        driver_probe_device+0x1f/0xa0
> [ 2840.387314]        __device_attach_driver+0x85/0x110
> [ 2840.387320]        bus_for_each_drv+0x78/0xc0
> [ 2840.387326]        __device_attach+0xb0/0x1b0
> [ 2840.387332]        bus_probe_device+0x94/0xb0
> [ 2840.387337]        device_add+0x64a/0x860
> [ 2840.387343]        hid_add_device+0xe5/0x240
> [ 2840.387349]        usbhid_probe+0x4bb/0x600
> [ 2840.387356]        usb_probe_interface+0xea/0x2b0
> [ 2840.387363]        really_probe+0xde/0x340
> [ 2840.387368]        __driver_probe_device+0x78/0x110
> [ 2840.387373]        driver_probe_device+0x1f/0xa0
> [ 2840.387378]        __device_attach_driver+0x85/0x110
> [ 2840.387383]        bus_for_each_drv+0x78/0xc0
> [ 2840.387390]        __device_attach+0xb0/0x1b0
> [ 2840.387395]        bus_probe_device+0x94/0xb0
> [ 2840.387400]        device_add+0x64a/0x860
> [ 2840.387405]        usb_set_configuration+0x5e8/0x880
> [ 2840.387411]        usb_generic_driver_probe+0x3e/0x60
> [ 2840.387418]        usb_probe_device+0x3d/0x120
> [ 2840.387423]        really_probe+0xde/0x340
> [ 2840.387428]        __driver_probe_device+0x78/0x110
> [ 2840.387434]        driver_probe_device+0x1f/0xa0
> [ 2840.387439]        __device_attach_driver+0x85/0x110
> [ 2840.387444]        bus_for_each_drv+0x78/0xc0
> [ 2840.387451]        __device_attach+0xb0/0x1b0
> [ 2840.387456]        bus_probe_device+0x94/0xb0
> [ 2840.387461]        device_add+0x64a/0x860
> [ 2840.387466]        usb_new_device.cold+0x141/0x38f
> [ 2840.387473]        hub_event+0x1166/0x1980
> [ 2840.387479]        process_one_work+0x21a/0x590
> [ 2840.387484]        worker_thread+0x1d1/0x3e0
> [ 2840.387488]        kthread+0xee/0x120
> [ 2840.387493]        ret_from_fork+0x30/0x50
> [ 2840.387500]        ret_from_fork_asm+0x1a/0x30
> [ 2840.387506]
>                other info that might help us debug this:
> 
> [ 2840.387509] Chain exists of:
>                  &led_cdev->led_access --> &led_cdev->trigger_lock --> input_mutex
> 
> [ 2840.387520]  Possible unsafe locking scenario:
> 
> [ 2840.387523]        CPU0                    CPU1
> [ 2840.387526]        ----                    ----
> [ 2840.387529]   lock(input_mutex);
> [ 2840.387534]                                lock(&led_cdev->trigger_lock);
> [ 2840.387540]                                lock(input_mutex);
> [ 2840.387545]   lock(&led_cdev->led_access);
> [ 2840.387550]
>                 *** DEADLOCK ***
> 
> [ 2840.387552] 7 locks held by kworker/1:1/52:
> [ 2840.387557]  #0: ffff98fcc1d07148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x4af/0x590
> [ 2840.387570]  #1: ffffb67e00213e60 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x1d5/0x590
> [ 2840.387583]  #2: ffff98fcc6582190 (&dev->mutex){....}-{3:3}, at: hub_event+0x57/0x1980
> [ 2840.387596]  #3: ffff98fccb3c6990 (&dev->mutex){....}-{3:3}, at: __device_attach+0x26/0x1b0
> [ 2840.387610]  #4: ffff98fcc5260960 (&dev->mutex){....}-{3:3}, at: __device_attach+0x26/0x1b0
> [ 2840.387622]  #5: ffff98fce3999a20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x26/0x1b0
> [ 2840.387635]  #6: ffffffff88130cc8 (input_mutex){+.+.}-{3:3}, at: input_register_device.cold+0x47/0x150
> [ 2840.387649]
>                stack backtrace:
> [ 2840.387653] CPU: 1 PID: 52 Comm: kworker/1:1 Tainted: G         C  E      6.10.0-rc1+ #97
> [ 2840.387659] Hardware name: Xiaomi Inc Mipad2/Mipad, BIOS MIPad-P4.X64.0043.R03.1603071414 03/07/2016
> [ 2840.387665] Workqueue: usb_hub_wq hub_event
> [ 2840.387674] Call Trace:
> [ 2840.387681]  <TASK>
> [ 2840.387689]  dump_stack_lvl+0x68/0x90
> [ 2840.387700]  check_noncircular+0x10d/0x120
> [ 2840.387710]  ? register_lock_class+0x38/0x480
> [ 2840.387717]  ? check_noncircular+0x74/0x120
> [ 2840.387727]  __lock_acquire+0x11c6/0x1f20
> [ 2840.387736]  lock_acquire+0xc8/0x2b0
> [ 2840.387743]  ? led_classdev_register_ext+0x1c6/0x380
> [ 2840.387753]  __mutex_lock+0x8c/0xc10
> [ 2840.387760]  ? led_classdev_register_ext+0x1c6/0x380
> [ 2840.387766]  ? _raw_spin_unlock_irqrestore+0x35/0x60
> [ 2840.387773]  ? klist_next+0x158/0x160
> [ 2840.387781]  ? led_classdev_register_ext+0x1c6/0x380
> [ 2840.387787]  ? lockdep_init_map_type+0x58/0x250
> [ 2840.387796]  ? led_classdev_register_ext+0x1c6/0x380
> [ 2840.387802]  led_classdev_register_ext+0x1c6/0x380
> [ 2840.387810]  ? kvasprintf+0x70/0xb0
> [ 2840.387820]  ? kasprintf+0x3e/0x50
> [ 2840.387829]  input_leds_connect+0x139/0x260
> [ 2840.387838]  input_attach_handler.isra.0+0x75/0x90
> [ 2840.387846]  input_register_device.cold+0xa1/0x150
> [ 2840.387854]  hidinput_connect+0x848/0xb00
> [ 2840.387862]  ? usbhid_start+0x45b/0x7b0
> [ 2840.387870]  hid_connect+0x567/0x5a0
> [ 2840.387878]  ? __mutex_unlock_slowpath+0x2d/0x260
> [ 2840.387891]  hid_hw_start+0x3f/0x60
> [ 2840.387899]  hid_device_probe+0x10d/0x190
> [ 2840.387906]  ? __pfx___device_attach_driver+0x10/0x10
> [ 2840.387913]  really_probe+0xde/0x340
> [ 2840.387919]  ? pm_runtime_barrier+0x50/0x90
> [ 2840.387927]  __driver_probe_device+0x78/0x110
> [ 2840.387934]  driver_probe_device+0x1f/0xa0
> [ 2840.387941]  __device_attach_driver+0x85/0x110
> [ 2840.387949]  bus_for_each_drv+0x78/0xc0
> [ 2840.387959]  __device_attach+0xb0/0x1b0
> [ 2840.387967]  bus_probe_device+0x94/0xb0
> [ 2840.387974]  device_add+0x64a/0x860
> [ 2840.387982]  ? __debugfs_create_file+0x14a/0x1c0
> [ 2840.387993]  hid_add_device+0xe5/0x240
> [ 2840.388002]  usbhid_probe+0x4bb/0x600
> [ 2840.388013]  usb_probe_interface+0xea/0x2b0
> [ 2840.388021]  ? __pfx___device_attach_driver+0x10/0x10
> [ 2840.388028]  really_probe+0xde/0x340
> [ 2840.388034]  ? pm_runtime_barrier+0x50/0x90
> [ 2840.388040]  __driver_probe_device+0x78/0x110
> [ 2840.388048]  driver_probe_device+0x1f/0xa0
> [ 2840.388055]  __device_attach_driver+0x85/0x110
> [ 2840.388062]  bus_for_each_drv+0x78/0xc0
> [ 2840.388071]  __device_attach+0xb0/0x1b0
> [ 2840.388079]  bus_probe_device+0x94/0xb0
> [ 2840.388086]  device_add+0x64a/0x860
> [ 2840.388094]  ? __mutex_unlock_slowpath+0x2d/0x260
> [ 2840.388103]  usb_set_configuration+0x5e8/0x880
> [ 2840.388114]  ? __pfx___device_attach_driver+0x10/0x10
> [ 2840.388121]  usb_generic_driver_probe+0x3e/0x60
> [ 2840.388129]  usb_probe_device+0x3d/0x120
> [ 2840.388137]  really_probe+0xde/0x340
> [ 2840.388142]  ? pm_runtime_barrier+0x50/0x90
> [ 2840.388149]  __driver_probe_device+0x78/0x110
> [ 2840.388156]  driver_probe_device+0x1f/0xa0
> [ 2840.388163]  __device_attach_driver+0x85/0x110
> [ 2840.388171]  bus_for_each_drv+0x78/0xc0
> [ 2840.388180]  __device_attach+0xb0/0x1b0
> [ 2840.388188]  bus_probe_device+0x94/0xb0
> [ 2840.388195]  device_add+0x64a/0x860
> [ 2840.388202]  ? lockdep_hardirqs_on+0x78/0x100
> [ 2840.388210]  ? _raw_spin_unlock_irqrestore+0x35/0x60
> [ 2840.388219]  usb_new_device.cold+0x141/0x38f
> [ 2840.388227]  hub_event+0x1166/0x1980
> [ 2840.388242]  process_one_work+0x21a/0x590
> [ 2840.388249]  ? move_linked_works+0x70/0xa0
> [ 2840.388260]  worker_thread+0x1d1/0x3e0
> [ 2840.388268]  ? __pfx_worker_thread+0x10/0x10
> [ 2840.388273]  kthread+0xee/0x120
> [ 2840.388279]  ? __pfx_kthread+0x10/0x10
> [ 2840.388287]  ret_from_fork+0x30/0x50
> [ 2840.388294]  ? __pfx_kthread+0x10/0x10
> [ 2840.388301]  ret_from_fork_asm+0x1a/0x30
> [ 2840.388315]  </TASK>
> [ 2840.415630] hid-generic 0003:0603:0002.0007: input,hidraw6: USB HID v1.10 Keyboard [SINO WEALTH USB Composite Device] on usb-0000:00:14.0-1.3/input0

Do we really have to add the _whole_ trace?

Is there no way to snip it a little?

Or perhaps Link: to the whole trace?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/trigger/ledtrig-input-events.c | 136 +++++---------------
>  1 file changed, 34 insertions(+), 102 deletions(-)

This is nice!

> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
> index 1de0176799f9..1c79731562c2 100644
> --- a/drivers/leds/trigger/ledtrig-input-events.c
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
> @@ -3,31 +3,32 @@
>   * Input Events LED trigger
>   *
>   * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
> - * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
>   */
>  
>  #include <linux/input.h>
>  #include <linux/jiffies.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  #include "../leds.h"
>  
> -#define DEFAULT_LED_OFF_DELAY_MS			5000
> +static unsigned long led_off_delay_ms = 5000;
> +module_param(led_off_delay_ms, ulong, 0644);
> +MODULE_PARM_DESC(led_off_delay_ms,
> +	"Specify delay in ms for turning LEDs off after last input event");
>  
> -struct input_events_data {
> -	struct input_handler handler;
> +static struct input_events_data {
>  	struct delayed_work work;
>  	spinlock_t lock;
> -	struct led_classdev *led_cdev;
> -	int led_cdev_saved_flags;
>  	/* To avoid repeatedly setting the brightness while there are events */
>  	bool led_on;
>  	unsigned long led_off_time;
> -	unsigned long led_off_delay;
> -};
> +} input_events_data;

Does this fix really require statically declared structs?

> +static struct led_trigger *input_events_led_trigger;
>  
>  static void led_input_events_work(struct work_struct *work)
>  {
> @@ -41,62 +42,24 @@ static void led_input_events_work(struct work_struct *work)
>  	 * running before a new event pushed led_off_time back.
>  	 */
>  	if (time_after_eq(jiffies, data->led_off_time)) {
> -		led_set_brightness_nosleep(data->led_cdev, LED_OFF);
> +		led_trigger_event(input_events_led_trigger, LED_OFF);
>  		data->led_on = false;
>  	}
>  
>  	spin_unlock_irq(&data->lock);
>  }
>  
> -static ssize_t delay_show(struct device *dev, struct device_attribute *attr, char *buf)
> -{
> -	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
> -
> -	return sysfs_emit(buf, "%lu\n", input_events_data->led_off_delay);
> -}
> -
> -static ssize_t delay_store(struct device *dev, struct device_attribute *attr,
> -			   const char *buf, size_t size)
> -{
> -	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
> -	unsigned long delay;
> -	int ret;
> -
> -	ret = kstrtoul(buf, 0, &delay);
> -	if (ret)
> -		return ret;
> -
> -	/* Clamp between 0.5 and 1000 seconds */
> -	delay = clamp_val(delay, 500UL, 1000000UL);
> -	input_events_data->led_off_delay = msecs_to_jiffies(delay);
> -
> -	return size;
> -}
> -
> -static DEVICE_ATTR_RW(delay);
> -
> -static struct attribute *input_events_led_attrs[] = {
> -	&dev_attr_delay.attr,
> -	NULL
> -};
> -ATTRIBUTE_GROUPS(input_events_led);
> -
>  static void input_events_event(struct input_handle *handle, unsigned int type,
>  			       unsigned int code, int val)
>  {
> -	struct input_events_data *data =
> -		container_of(handle->handler, struct input_events_data, handler);
> -	unsigned long led_off_delay = READ_ONCE(data->led_off_delay);
> -	struct led_classdev *led_cdev = data->led_cdev;
> +	struct input_events_data *data = &input_events_data;

IFF we have to use statically declared structs ...

Why not just use input_events_data.foo?

> +	unsigned long led_off_delay = msecs_to_jiffies(led_off_delay_ms);
>  	unsigned long flags;
>  
> -	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
> -		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
> -
>  	spin_lock_irqsave(&data->lock, flags);
>  
>  	if (!data->led_on) {
> -		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
> +		led_trigger_event(input_events_led_trigger, LED_FULL);
>  		data->led_on = true;
>  	}
>  	data->led_off_time = jiffies + led_off_delay;
> @@ -118,7 +81,7 @@ static int input_events_connect(struct input_handler *handler, struct input_dev
>  
>  	handle->dev = dev;
>  	handle->handler = handler;
> -	handle->name = "input-events";
> +	handle->name = KBUILD_MODNAME;
>  
>  	ret = input_register_handle(handle);
>  	if (ret)
> @@ -160,72 +123,41 @@ static const struct input_device_id input_events_ids[] = {
>  	{ }
>  };
>  
> -static int input_events_activate(struct led_classdev *led_cdev)
> +static struct input_handler input_events_handler = {
> +	.name = KBUILD_MODNAME,
> +	.event = input_events_event,
> +	.connect = input_events_connect,
> +	.disconnect = input_events_disconnect,
> +	.id_table = input_events_ids,
> +};
> +
> +static int __init input_events_init(void)
>  {
> -	struct input_events_data *data;
>  	int ret;
>  
> -	data = kzalloc(sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> +	INIT_DELAYED_WORK(&input_events_data.work, led_input_events_work);
> +	spin_lock_init(&input_events_data.lock);
>  
> -	data->handler.name = "input-events";
> -	data->handler.event = input_events_event;
> -	data->handler.connect = input_events_connect;
> -	data->handler.disconnect = input_events_disconnect;
> -	data->handler.id_table = input_events_ids;
> +	led_trigger_register_simple("input-events", &input_events_led_trigger);
>  
> -	INIT_DELAYED_WORK(&data->work, led_input_events_work);
> -	spin_lock_init(&data->lock);
> -
> -	data->led_cdev = led_cdev;
> -	data->led_cdev_saved_flags = led_cdev->flags;
> -	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
> -
> -	/*
> -	 * Use led_cdev->blink_brightness + LED_BLINK_SW flag so that sysfs
> -	 * brightness writes will change led_cdev->new_blink_brightness for
> -	 * configuring the on state brightness (like ledtrig-heartbeat).
> -	 */
> -	if (!led_cdev->blink_brightness)
> -		led_cdev->blink_brightness = led_cdev->max_brightness;
> -
> -	/* Start with LED off */
> -	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
> -
> -	ret = input_register_handler(&data->handler);
> +	ret = input_register_handler(&input_events_handler);
>  	if (ret) {
> -		kfree(data);
> +		led_trigger_unregister_simple(input_events_led_trigger);
>  		return ret;
>  	}
>  
> -	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
> -
> -	/* Turn LED off during suspend, original flags are restored on deactivate() */
> -	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
> -
> -	led_set_trigger_data(led_cdev, data);
>  	return 0;
>  }
>  
> -static void input_events_deactivate(struct led_classdev *led_cdev)
> +static void __exit input_events_exit(void)
>  {
> -	struct input_events_data *data = led_get_trigger_data(led_cdev);
> -
> -	led_cdev->flags = data->led_cdev_saved_flags;
> -	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
> -	input_unregister_handler(&data->handler);
> -	cancel_delayed_work_sync(&data->work);
> -	kfree(data);
> +	input_unregister_handler(&input_events_handler);
> +	cancel_delayed_work_sync(&input_events_data.work);
> +	led_trigger_unregister_simple(input_events_led_trigger);
>  }
>  
> -static struct led_trigger input_events_led_trigger = {
> -	.name       = "input-events",
> -	.activate   = input_events_activate,
> -	.deactivate = input_events_deactivate,
> -	.groups     = input_events_led_groups,
> -};
> -module_led_trigger(input_events_led_trigger);
> +module_init(input_events_init);
> +module_exit(input_events_exit);
>  
>  MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>  MODULE_DESCRIPTION("Input Events LED trigger");
> -- 
> 2.45.1
> 
> 

-- 
Lee Jones [李琼斯]

