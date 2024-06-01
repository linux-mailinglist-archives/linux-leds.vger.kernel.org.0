Return-Path: <linux-leds+bounces-1806-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB98D71BB
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 21:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F26281D92
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 19:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8262154BF3;
	Sat,  1 Jun 2024 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7f9iJ0x"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BB14E2EF
	for <linux-leds@vger.kernel.org>; Sat,  1 Jun 2024 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717271747; cv=none; b=UOibUMuG5n+wS1XpBEEWzQnpIAgH5MgMbylMd9H/5PizEwxmjUTo+7vM9aHU9SWOyU+BJEWkSK6ESOA/0kuUQfrnmQRYW9EYN1AvdpUKxffZdH4e5fST66qluA1Z0FNjBBnNXnbNGHvsDp5P92YpzwgPZrMTl+23/ExSqo10jVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717271747; c=relaxed/simple;
	bh=A49AwwSCXe3HpJBKS0l79oZUtg3rOIon9AFOj4aiL68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5Rz8Db4hxZs9Cqfbmc5F+bax4T/JLB9rOQwX7gzIEawQlUq4hMfs56jph4pC93o25M0OY0OnCMlsuGkenJkR3xbmy5CNucvRHjKU2014R3kKPRIKpSTVZqcokf9jXUmozxIrYpyXMAdbN+tV1lD6Mq0J+PxM6KQ0eZJlQ3MK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7f9iJ0x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717271744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xv1u/cziXJdgcUfjQg3E6xWMz4yELzheoY91oGxsqJ0=;
	b=D7f9iJ0x92o2QxyL2XEc/3iyyH4L5csD2WB7J+Sx9gexFySy+33qVWWBOGmKCXRTaCcHr2
	jS8XMjdLrnBOUVrubo24JJoZTqld1Y5CbOZlX7of0O9SWFY3RM2+fj0kZdn0sFeeiUnSqy
	OIsEf8I44JaGgtLsdnsjWrL8/ybyYZA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-iGt86R59MKCX5FXyTyYlyg-1; Sat,
 01 Jun 2024 15:55:39 -0400
X-MC-Unique: iGt86R59MKCX5FXyTyYlyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 281EF3C025AC;
	Sat,  1 Jun 2024 19:55:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6846F1C0D104;
	Sat,  1 Jun 2024 19:55:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [RFC 2/2] leds: trigger: input-events: Fix locking issues of input_lock vs led-trigger locks
Date: Sat,  1 Jun 2024 21:55:28 +0200
Message-ID: <20240601195528.48308-3-hdegoede@redhat.com>
In-Reply-To: <20240601195528.48308-1-hdegoede@redhat.com>
References: <20240601195528.48308-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

The input subsystem registers LEDs with default triggers while holding
the input_lock and input_register_handler() takes the input_lock this
means that a triggers activate method cannot directly call
input_register_handler().

Move the calling of input_register_handler() to the already existing
delayed-work to avoid this issue.

Here is a lockdep from having the input-events trigger activated on a LED
and then after that plugging in a USB keyboard:

[ 2840.220145] usb 1-1.3: new low-speed USB device number 3 using xhci_hcd
[ 2840.307172] usb 1-1.3: New USB device found, idVendor=0603, idProduct=0002, bcdDevice= 2.21
[ 2840.307375] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 2840.307423] usb 1-1.3: Product: USB Composite Device
[ 2840.307456] usb 1-1.3: Manufacturer: SINO WEALTH
[ 2840.333985] input: SINO WEALTH USB Composite Device as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.0/0003:0603:0002.0007/input/input19

[ 2840.386545] ======================================================
[ 2840.386549] WARNING: possible circular locking dependency detected
[ 2840.386554] 6.10.0-rc1+ #97 Tainted: G         C  E
[ 2840.386558] ------------------------------------------------------
[ 2840.386562] kworker/1:1/52 is trying to acquire lock:
[ 2840.386566] ffff98fcf1629300 (&led_cdev->led_access){+.+.}-{3:3}, at: led_classdev_register_ext+0x1c6/0x380
[ 2840.386590]
               but task is already holding lock:
[ 2840.386593] ffffffff88130cc8 (input_mutex){+.+.}-{3:3}, at: input_register_device.cold+0x47/0x150
[ 2840.386608]
               which lock already depends on the new lock.

[ 2840.386611]
               the existing dependency chain (in reverse order) is:
[ 2840.386615]
               -> #3 (input_mutex){+.+.}-{3:3}:
[ 2840.386624]        __mutex_lock+0x8c/0xc10
[ 2840.386634]        input_register_handler+0x1c/0xf0
[ 2840.386641]        0xffffffffc142c437
[ 2840.386655]        led_trigger_set+0x1e1/0x2e0
[ 2840.386661]        led_trigger_register+0x170/0x1b0
[ 2840.386666]        do_one_initcall+0x5e/0x3a0
[ 2840.386675]        do_init_module+0x60/0x220
[ 2840.386683]        __do_sys_init_module+0x15f/0x190
[ 2840.386689]        do_syscall_64+0x93/0x180
[ 2840.386696]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 2840.386705]
               -> #2 (&led_cdev->trigger_lock){+.+.}-{3:3}:
[ 2840.386714]        down_write+0x3b/0xd0
[ 2840.386720]        led_trigger_register+0x12c/0x1b0
[ 2840.386725]        rfkill_register+0xec/0x340 [rfkill]
[ 2840.386739]        wiphy_register+0x82a/0x930 [cfg80211]
[ 2840.386907]        brcmf_cfg80211_attach+0xcbd/0x1430 [brcmfmac]
[ 2840.386952]        brcmf_attach+0x1ba/0x4c0 [brcmfmac]
[ 2840.386991]        brcmf_pcie_setup+0x899/0xc70 [brcmfmac]
[ 2840.387030]        brcmf_fw_request_done+0x13b/0x180 [brcmfmac]
[ 2840.387070]        request_firmware_work_func+0x3b/0x70
[ 2840.387078]        process_one_work+0x21a/0x590
[ 2840.387085]        worker_thread+0x1d1/0x3e0
[ 2840.387090]        kthread+0xee/0x120
[ 2840.387096]        ret_from_fork+0x30/0x50
[ 2840.387105]        ret_from_fork_asm+0x1a/0x30
[ 2840.387112]
               -> #1 (leds_list_lock){++++}-{3:3}:
[ 2840.387123]        down_write+0x3b/0xd0
[ 2840.387129]        led_classdev_register_ext+0x29e/0x380
[ 2840.387134]        0xffffffffc0e6b74c
[ 2840.387143]        platform_probe+0x40/0xa0
[ 2840.387151]        really_probe+0xde/0x340
[ 2840.387157]        __driver_probe_device+0x78/0x110
[ 2840.387162]        driver_probe_device+0x1f/0xa0
[ 2840.387168]        __driver_attach+0xba/0x1c0
[ 2840.387173]        bus_for_each_dev+0x6b/0xb0
[ 2840.387180]        bus_add_driver+0x111/0x1f0
[ 2840.387185]        driver_register+0x6e/0xc0
[ 2840.387191]        do_one_initcall+0x5e/0x3a0
[ 2840.387197]        do_init_module+0x60/0x220
[ 2840.387204]        __do_sys_init_module+0x15f/0x190
[ 2840.387210]        do_syscall_64+0x93/0x180
[ 2840.387217]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 2840.387224]
               -> #0 (&led_cdev->led_access){+.+.}-{3:3}:
[ 2840.387233]        __lock_acquire+0x11c6/0x1f20
[ 2840.387239]        lock_acquire+0xc8/0x2b0
[ 2840.387244]        __mutex_lock+0x8c/0xc10
[ 2840.387251]        led_classdev_register_ext+0x1c6/0x380
[ 2840.387256]        input_leds_connect+0x139/0x260
[ 2840.387262]        input_attach_handler.isra.0+0x75/0x90
[ 2840.387268]        input_register_device.cold+0xa1/0x150
[ 2840.387274]        hidinput_connect+0x848/0xb00
[ 2840.387280]        hid_connect+0x567/0x5a0
[ 2840.387288]        hid_hw_start+0x3f/0x60
[ 2840.387294]        hid_device_probe+0x10d/0x190
[ 2840.387298]        really_probe+0xde/0x340
[ 2840.387304]        __driver_probe_device+0x78/0x110
[ 2840.387309]        driver_probe_device+0x1f/0xa0
[ 2840.387314]        __device_attach_driver+0x85/0x110
[ 2840.387320]        bus_for_each_drv+0x78/0xc0
[ 2840.387326]        __device_attach+0xb0/0x1b0
[ 2840.387332]        bus_probe_device+0x94/0xb0
[ 2840.387337]        device_add+0x64a/0x860
[ 2840.387343]        hid_add_device+0xe5/0x240
[ 2840.387349]        usbhid_probe+0x4bb/0x600
[ 2840.387356]        usb_probe_interface+0xea/0x2b0
[ 2840.387363]        really_probe+0xde/0x340
[ 2840.387368]        __driver_probe_device+0x78/0x110
[ 2840.387373]        driver_probe_device+0x1f/0xa0
[ 2840.387378]        __device_attach_driver+0x85/0x110
[ 2840.387383]        bus_for_each_drv+0x78/0xc0
[ 2840.387390]        __device_attach+0xb0/0x1b0
[ 2840.387395]        bus_probe_device+0x94/0xb0
[ 2840.387400]        device_add+0x64a/0x860
[ 2840.387405]        usb_set_configuration+0x5e8/0x880
[ 2840.387411]        usb_generic_driver_probe+0x3e/0x60
[ 2840.387418]        usb_probe_device+0x3d/0x120
[ 2840.387423]        really_probe+0xde/0x340
[ 2840.387428]        __driver_probe_device+0x78/0x110
[ 2840.387434]        driver_probe_device+0x1f/0xa0
[ 2840.387439]        __device_attach_driver+0x85/0x110
[ 2840.387444]        bus_for_each_drv+0x78/0xc0
[ 2840.387451]        __device_attach+0xb0/0x1b0
[ 2840.387456]        bus_probe_device+0x94/0xb0
[ 2840.387461]        device_add+0x64a/0x860
[ 2840.387466]        usb_new_device.cold+0x141/0x38f
[ 2840.387473]        hub_event+0x1166/0x1980
[ 2840.387479]        process_one_work+0x21a/0x590
[ 2840.387484]        worker_thread+0x1d1/0x3e0
[ 2840.387488]        kthread+0xee/0x120
[ 2840.387493]        ret_from_fork+0x30/0x50
[ 2840.387500]        ret_from_fork_asm+0x1a/0x30
[ 2840.387506]
               other info that might help us debug this:

[ 2840.387509] Chain exists of:
                 &led_cdev->led_access --> &led_cdev->trigger_lock --> input_mutex

[ 2840.387520]  Possible unsafe locking scenario:

[ 2840.387523]        CPU0                    CPU1
[ 2840.387526]        ----                    ----
[ 2840.387529]   lock(input_mutex);
[ 2840.387534]                                lock(&led_cdev->trigger_lock);
[ 2840.387540]                                lock(input_mutex);
[ 2840.387545]   lock(&led_cdev->led_access);
[ 2840.387550]
                *** DEADLOCK ***

[ 2840.387552] 7 locks held by kworker/1:1/52:
[ 2840.387557]  #0: ffff98fcc1d07148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x4af/0x590
[ 2840.387570]  #1: ffffb67e00213e60 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x1d5/0x590
[ 2840.387583]  #2: ffff98fcc6582190 (&dev->mutex){....}-{3:3}, at: hub_event+0x57/0x1980
[ 2840.387596]  #3: ffff98fccb3c6990 (&dev->mutex){....}-{3:3}, at: __device_attach+0x26/0x1b0
[ 2840.387610]  #4: ffff98fcc5260960 (&dev->mutex){....}-{3:3}, at: __device_attach+0x26/0x1b0
[ 2840.387622]  #5: ffff98fce3999a20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x26/0x1b0
[ 2840.387635]  #6: ffffffff88130cc8 (input_mutex){+.+.}-{3:3}, at: input_register_device.cold+0x47/0x150
[ 2840.387649]
               stack backtrace:
[ 2840.387653] CPU: 1 PID: 52 Comm: kworker/1:1 Tainted: G         C  E      6.10.0-rc1+ #97
[ 2840.387659] Hardware name: Xiaomi Inc Mipad2/Mipad, BIOS MIPad-P4.X64.0043.R03.1603071414 03/07/2016
[ 2840.387665] Workqueue: usb_hub_wq hub_event
[ 2840.387674] Call Trace:
[ 2840.387681]  <TASK>
[ 2840.387689]  dump_stack_lvl+0x68/0x90
[ 2840.387700]  check_noncircular+0x10d/0x120
[ 2840.387710]  ? register_lock_class+0x38/0x480
[ 2840.387717]  ? check_noncircular+0x74/0x120
[ 2840.387727]  __lock_acquire+0x11c6/0x1f20
[ 2840.387736]  lock_acquire+0xc8/0x2b0
[ 2840.387743]  ? led_classdev_register_ext+0x1c6/0x380
[ 2840.387753]  __mutex_lock+0x8c/0xc10
[ 2840.387760]  ? led_classdev_register_ext+0x1c6/0x380
[ 2840.387766]  ? _raw_spin_unlock_irqrestore+0x35/0x60
[ 2840.387773]  ? klist_next+0x158/0x160
[ 2840.387781]  ? led_classdev_register_ext+0x1c6/0x380
[ 2840.387787]  ? lockdep_init_map_type+0x58/0x250
[ 2840.387796]  ? led_classdev_register_ext+0x1c6/0x380
[ 2840.387802]  led_classdev_register_ext+0x1c6/0x380
[ 2840.387810]  ? kvasprintf+0x70/0xb0
[ 2840.387820]  ? kasprintf+0x3e/0x50
[ 2840.387829]  input_leds_connect+0x139/0x260
[ 2840.387838]  input_attach_handler.isra.0+0x75/0x90
[ 2840.387846]  input_register_device.cold+0xa1/0x150
[ 2840.387854]  hidinput_connect+0x848/0xb00
[ 2840.387862]  ? usbhid_start+0x45b/0x7b0
[ 2840.387870]  hid_connect+0x567/0x5a0
[ 2840.387878]  ? __mutex_unlock_slowpath+0x2d/0x260
[ 2840.387891]  hid_hw_start+0x3f/0x60
[ 2840.387899]  hid_device_probe+0x10d/0x190
[ 2840.387906]  ? __pfx___device_attach_driver+0x10/0x10
[ 2840.387913]  really_probe+0xde/0x340
[ 2840.387919]  ? pm_runtime_barrier+0x50/0x90
[ 2840.387927]  __driver_probe_device+0x78/0x110
[ 2840.387934]  driver_probe_device+0x1f/0xa0
[ 2840.387941]  __device_attach_driver+0x85/0x110
[ 2840.387949]  bus_for_each_drv+0x78/0xc0
[ 2840.387959]  __device_attach+0xb0/0x1b0
[ 2840.387967]  bus_probe_device+0x94/0xb0
[ 2840.387974]  device_add+0x64a/0x860
[ 2840.387982]  ? __debugfs_create_file+0x14a/0x1c0
[ 2840.387993]  hid_add_device+0xe5/0x240
[ 2840.388002]  usbhid_probe+0x4bb/0x600
[ 2840.388013]  usb_probe_interface+0xea/0x2b0
[ 2840.388021]  ? __pfx___device_attach_driver+0x10/0x10
[ 2840.388028]  really_probe+0xde/0x340
[ 2840.388034]  ? pm_runtime_barrier+0x50/0x90
[ 2840.388040]  __driver_probe_device+0x78/0x110
[ 2840.388048]  driver_probe_device+0x1f/0xa0
[ 2840.388055]  __device_attach_driver+0x85/0x110
[ 2840.388062]  bus_for_each_drv+0x78/0xc0
[ 2840.388071]  __device_attach+0xb0/0x1b0
[ 2840.388079]  bus_probe_device+0x94/0xb0
[ 2840.388086]  device_add+0x64a/0x860
[ 2840.388094]  ? __mutex_unlock_slowpath+0x2d/0x260
[ 2840.388103]  usb_set_configuration+0x5e8/0x880
[ 2840.388114]  ? __pfx___device_attach_driver+0x10/0x10
[ 2840.388121]  usb_generic_driver_probe+0x3e/0x60
[ 2840.388129]  usb_probe_device+0x3d/0x120
[ 2840.388137]  really_probe+0xde/0x340
[ 2840.388142]  ? pm_runtime_barrier+0x50/0x90
[ 2840.388149]  __driver_probe_device+0x78/0x110
[ 2840.388156]  driver_probe_device+0x1f/0xa0
[ 2840.388163]  __device_attach_driver+0x85/0x110
[ 2840.388171]  bus_for_each_drv+0x78/0xc0
[ 2840.388180]  __device_attach+0xb0/0x1b0
[ 2840.388188]  bus_probe_device+0x94/0xb0
[ 2840.388195]  device_add+0x64a/0x860
[ 2840.388202]  ? lockdep_hardirqs_on+0x78/0x100
[ 2840.388210]  ? _raw_spin_unlock_irqrestore+0x35/0x60
[ 2840.388219]  usb_new_device.cold+0x141/0x38f
[ 2840.388227]  hub_event+0x1166/0x1980
[ 2840.388242]  process_one_work+0x21a/0x590
[ 2840.388249]  ? move_linked_works+0x70/0xa0
[ 2840.388260]  worker_thread+0x1d1/0x3e0
[ 2840.388268]  ? __pfx_worker_thread+0x10/0x10
[ 2840.388273]  kthread+0xee/0x120
[ 2840.388279]  ? __pfx_kthread+0x10/0x10
[ 2840.388287]  ret_from_fork+0x30/0x50
[ 2840.388294]  ? __pfx_kthread+0x10/0x10
[ 2840.388301]  ret_from_fork_asm+0x1a/0x30
[ 2840.388315]  </TASK>
[ 2840.415630] hid-generic 0003:0603:0002.0007: input,hidraw6: USB HID v1.10 Keyboard [SINO WEALTH USB Composite Device] on usb-0000:00:14.0-1.3/input0

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/trigger/ledtrig-input-events.c | 40 ++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index 94d5580ea093..813b5782b2d2 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -6,6 +6,7 @@
  * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
  */
 
+#include <linux/dev_printk.h>
 #include <linux/input.h>
 #include <linux/jiffies.h>
 #include <linux/leds.h>
@@ -19,6 +20,8 @@
 
 /* To avoid repeatedly setting the brightness while there are events */
 #define FL_LED_ON					0
+#define FL_REGISTER_HANDLER				1
+#define FL_HANDLER_REGISTERED				2
 
 struct input_events_data {
 	struct input_handler handler;
@@ -35,6 +38,16 @@ static void led_input_events_work(struct work_struct *work)
 {
 	struct input_events_data *data =
 		container_of(work, struct input_events_data, work.work);
+	int ret;
+
+	/* Handler gets registered here (from work) to avoid locking issues */
+	if (test_and_clear_bit(FL_REGISTER_HANDLER, &data->flags)) {
+		ret = input_register_handler(&data->handler);
+		if (ret)
+			dev_err(data->led_cdev->dev, "Failed to register input handler\n");
+		else
+			set_bit(FL_HANDLER_REGISTERED, &data->flags);
+	}
 
 	spin_lock_irq(&data->lock);
 
@@ -164,7 +177,6 @@ static const struct input_device_id input_events_ids[] = {
 static int input_events_activate(struct led_classdev *led_cdev)
 {
 	struct input_events_data *data;
-	int ret;
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -181,6 +193,7 @@ static int input_events_activate(struct led_classdev *led_cdev)
 
 	data->led_cdev = led_cdev;
 	data->led_cdev_saved_flags = led_cdev->flags;
+	data->led_off_time = jiffies;
 	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
 
 	/*
@@ -191,20 +204,15 @@ static int input_events_activate(struct led_classdev *led_cdev)
 	if (!led_cdev->blink_brightness)
 		led_cdev->blink_brightness = led_cdev->max_brightness;
 
-	/* Start with LED off */
-	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
-
-	ret = input_register_handler(&data->handler);
-	if (ret) {
-		kfree(data);
-		return ret;
-	}
-
 	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
 
 	/* Turn LED off during suspend, original flags are restored on deactivate() */
 	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
 
+	/* Handler gets registered from work to avoid locking issues */
+	set_bit(FL_REGISTER_HANDLER, &data->flags);
+	queue_delayed_work(system_wq, &data->work, 0);
+
 	led_set_trigger_data(led_cdev, data);
 	return 0;
 }
@@ -213,10 +221,18 @@ static void input_events_deactivate(struct led_classdev *led_cdev)
 {
 	struct input_events_data *data = led_get_trigger_data(led_cdev);
 
+	/*
+	 * Ensure work queued from activate() has registered the handler
+	 * before unregistering it.
+	 */
+	flush_delayed_work(&data->work);
+	if (test_bit(FL_HANDLER_REGISTERED, &data->flags))
+		input_unregister_handler(&data->handler);
+
+	cancel_delayed_work_sync(&data->work);
+
 	led_cdev->flags = data->led_cdev_saved_flags;
 	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
-	input_unregister_handler(&data->handler);
-	cancel_delayed_work_sync(&data->work);
 	kfree(data);
 }
 
-- 
2.45.1


