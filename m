Return-Path: <linux-leds+bounces-1729-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A08D5F92
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 169E4285271
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB1E1514C9;
	Fri, 31 May 2024 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wxo9t/jL"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACF155CB4
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150983; cv=none; b=rhCm+L4sAT7Qpn94nKksuVDEcRZpczr0Yl5LR3zboYld9c3tUWkZPNpwcf10zeBJ1on0KUJLbWP6HWXjcmqyeyxz+m4h8Aluo9IbDo2kS64Nr5GYD0HvO3pmTSPlx43Vunm6bup4YIj/NcxpVAEibPj6lC0zfwvkkZ47CG0z/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150983; c=relaxed/simple;
	bh=a1JWqYbjwPQm4T1Ju7/3F3H6I1a/c5hAWgN5Dupdn/Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UWOgU3/LDhjx5MJ5pmwlP1jBAxFuiqvzxMMSr9uIf+f9P1FwRkYjLmQrtQ4+GpFX8BQdICCaP5jwp1PK+rhSPy+yiqQWBvMk9Ahpj8DCJWVdYbSlBPH7M1xOTeLAFSJAkjj9OdAGQOqwD0H5ABlSWQWuBeC4BsTRdlv8C1jwhTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wxo9t/jL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717150980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaTelKWHHF6u2n5nTlInAsaGDwOamWFK0/SKKe/CGiY=;
	b=Wxo9t/jLKtUZg/AHLUssjuTOxplExO7hCr9NZTxZ0H8YlNKAWCD4ooa1iWtnp3NgnV3xv7
	fr4DYg1flVD8XMygNlk2zNcNt73+BOMaOkgTsfj1Lf6MVH6FUxojj43V8iMa8nWeA1yTcm
	hFos2/7lwQ6iA6sOJ4MHkIdvqew12EA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-GZZghHlrM--BA0zI78Bx0Q-1; Fri, 31 May 2024 06:22:58 -0400
X-MC-Unique: GZZghHlrM--BA0zI78Bx0Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a626ac4c2faso89537966b.3
        for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 03:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150977; x=1717755777;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vaTelKWHHF6u2n5nTlInAsaGDwOamWFK0/SKKe/CGiY=;
        b=vuCI5T/QWPJ3QW9G8rvOpgyuHjnGQI/dkYlvjwtlpSGCXlAjqq4V9fRAU9SGYgV2dL
         ltRlnpiqye9aIBrmxd5YGxHjVpfHcxLfErR+ohjJtDlP8wKezU4CNFNjQ8nJZzGiCrWJ
         C4oJdfWcYjGlOZ+hp6xYGDSI5QSJoG56VqwHAnoMAy2jM/PTJ3Tk15abjmnmImQyXU9/
         LMquL0uOY+vg6zE1oSuq4rxNxntyfZDLKzgaGragAXlKiD2P7MRtc9rFkv9q+X8EOYd+
         qyR6j6xQAWXcKsNHukCdhfK3+pemeXFr3p/JTCJARMXgtVe6X3jtbwpYZs4tHo0wocHS
         V6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXwgQWbrKnHHtsI1wjXv8ir7QIBZebpfUITZz64dC3IvtO0DxSuNZHy97HnDbMr3P38+mmmhgzSBa7HDCfurk/5C49jnmKR8HmHCA==
X-Gm-Message-State: AOJu0Yw9YNGLqsPGBPdJPRESTuKbohToDXCKgElJF89zSol3r7qyLvM9
	kiq583jY7mqt9lxJRhZ7Vf/aVtEqDLgetXJKlLpnUV+/Hk35E8m3scfz+Ic8DrR7mETf0bUuvpk
	ykUNooIWo6bwNX7y/h6Ao4lxQys00s7Q5eGGhH2Atq/7rZVUnQTgh9imdSjg=
X-Received: by 2002:a17:907:595:b0:a63:598:88fd with SMTP id a640c23a62f3a-a6821d62fdcmr107618166b.62.1717150977202;
        Fri, 31 May 2024 03:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSvhvSNvdu5xkeI3bbuqqlwZn0qnT45v1jRMe+TGpK0X2Gza5WBIuAwZroMV1IxAKSc5hhdw==
X-Received: by 2002:a17:907:595:b0:a63:598:88fd with SMTP id a640c23a62f3a-a6821d62fdcmr107615866b.62.1717150976625;
        Fri, 31 May 2024 03:22:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85ca5sm70339766b.165.2024.05.31.03.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 03:22:56 -0700 (PDT)
Message-ID: <d8f8b1b2-1ffd-435a-8bed-b1a05d16a270@redhat.com>
Date: Fri, 31 May 2024 12:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
From: Hans de Goede <hdegoede@redhat.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 11:50 AM, Hans de Goede wrote:
> Hi,
> 
> On 5/31/24 10:39 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [adding the LED folks and the regressions list to the list of recipients]
>>
>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>> for once, to make this easily accessible to everyone.
>>
>> Lee, Pavel, could you look into below regression report please? Thread
>> starts here:
>> https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
>>
>> Another report with somewhat similar symptom can be found here:
>> https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>>
>> See also Russell's analysis of that report below (many many thx for
>> that, much appreciated Russel!).
>>
>> To my untrained eyes all of this sounds a lot like we still have a 6.9
>> regression related to the LED code somewhere. Reminder, we had earlier
>> trouble, but that was avoided through other measures:
>>
>> * 3d913719df14c2 ("wifi: iwlwifi: Use request_module_nowait") /
>> https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
>>
>> * c04d1b9ecce565 ("igc: Fix LED-related deadlock on driver unbind") /
>> https://lore.kernel.org/all/ZhRD3cOtz5i-61PB@mail-itl/
>>
>> * 19fa4f2a85d777 ("r8169: fix LED-related deadlock on module removal")
>>
>> That iwlwifi commit even calls it self "work around". The developer that
>> submitted it bisected the problem to a LED merge, but sadly that was the
>> end of it. :-/
> 
> I actually have been looking at a ledtrig-netdev lockdep warning yesterday
> which I believe is the same thing. I'll include the lockdep trace below.
> 
> According to lockdep there indeed is a ABBA (ish) cyclic deadlock with
> the rtnl mutex vs led-triggers related locks. I believe that this problem
> may be a pre-existing problem but this now actually gets hit in kernels >=
> 6.9 because of commit 66601a29bb23 ("leds: class: If no default trigger is
> given, make hw_control trigger the default trigger"). Before that commit
> the "netdev" trigger would not be bound / set as phy LEDs trigger by default.
> 
> +Cc Heiner Kallweit who authored that commit.
> 
> The netdev trigger typically is not needed because the PHY LEDs are typically
> under hw-control and the netdev trigger even tries to leave things that way
> so setting it as the active trigger for the LED class device is basically
> a no-op. I guess the goal of that commit is correctly have the triggers
> file content reflect that the LED is controlled by a netdev and to allow
> changing the hw-control mode without the user first needing to set netdev
> as trigger before being able to change the mode.
> 
> But there is a price to this, besides the locking problem this also
> causes the ledtrig-netdev module to load on pretty much everyones
> systems (when build as a module) even though 99.999% of our users
> likely does not need this at all...
> 
> Given this price and the troubles this is causing I think it might be best
> to revert 66601a29bb23. There might still be a locking issue when setting
> the trigger to netdev manually (I'll check and follow up) but this should
> fix the regression users are hitting since typically users do not set
> the trigger manually.

Ok, I can confirm that the lockdep warning is gone for me with 66601a29bb23
reverted. Unfortunately it does still happen after a "modprobe ledtrig_netdev"
(to add it to the list of available triggers) and then setting the trigger
for /sys/class/leds/enp42s0-0::lan to netdev manually.

Still reverting 66601a29bb23 should avoid the problem getting triggered
and this would seem like a safe fix especially for the 6.9 series and
then the necessary time can be taken to fix the actual underlying locking
issue which 66601a29bb23 exposes.

> Gene, as the original reporter of this can you do "modinfo ledtrig_netdev"
> and if this shows that ledtrig_netdev is a module for you try blacklisting
> ledtrig_netdev ?  And if it is not a module can you try building a 6.9
> kernel with commit 66601a29bb23 reverted and see if that helps ?

Regards,
 
Hans




> Here is the promised lockdep report:
> [   73.959672] ======================================================
> [   73.959675] WARNING: possible circular locking dependency detected
> [   73.959677] 6.10.0-rc1+ #94 Not tainted
> [   73.959680] ------------------------------------------------------
> [   73.959682] NetworkManager/1815 is trying to acquire lock:
> [   73.959685] ffffffffb2145170 (triggers_list_lock){++++}-{3:3}, at: led_trigger_register+0x40/0x1b0
> [   73.959695] 
>                but task is already holding lock:
> [   73.959697] ffffffffb2158fe8 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x133/0x630
> [   73.959706] 
>                which lock already depends on the new lock.
> 
> [   73.959708] 
>                the existing dependency chain (in reverse order) is:
> [   73.959710] 
>                -> #2 (rtnl_mutex){+.+.}-{3:3}:
> [   73.959716]        __mutex_lock+0x8c/0xc10
> [   73.959720]        set_device_name+0x2d/0x140 [ledtrig_netdev]
> [   73.959725]        netdev_trig_activate+0x197/0x210 [ledtrig_netdev]
> [   73.959728]        led_trigger_set+0x1e1/0x2e0
> [   73.959731]        led_trigger_register+0x170/0x1b0
> [   73.959734]        do_one_initcall+0x5e/0x3a0
> [   73.959738]        do_init_module+0x60/0x220
> [   73.959741]        __do_sys_init_module+0x15f/0x190
> [   73.959745]        do_syscall_64+0x93/0x180
> [   73.959748]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   73.959752] 
>                -> #1 (&led_cdev->trigger_lock){+.+.}-{3:3}:
> [   73.959758]        down_write+0x3b/0xd0
> [   73.959761]        led_trigger_set_default+0x34/0xe0
> [   73.959764]        led_classdev_register_ext+0x311/0x3a0
> [   73.959767]        input_leds_connect+0x139/0x260
> [   73.959770]        input_attach_handler.isra.0+0x75/0x90
> [   73.959773]        input_register_device.cold+0xa1/0x150
> [   73.959776]        hidinput_connect+0x848/0xb00
> [   73.959779]        hid_connect+0x567/0x5a0
> [   73.959783]        hid_hw_start+0x3f/0x60
> [   73.959787]        hid_device_probe+0x10d/0x190
> [   73.959789]        really_probe+0xde/0x340
> [   73.959793]        __driver_probe_device+0x78/0x110
> [   73.959796]        driver_probe_device+0x1f/0xa0
> [   73.959798]        __device_attach_driver+0x85/0x110
> [   73.959801]        bus_for_each_drv+0x78/0xc0
> [   73.959805]        __device_attach+0xb0/0x1b0
> [   73.959808]        bus_probe_device+0x94/0xb0
> [   73.959810]        device_add+0x64a/0x860
> [   73.959814]        hid_add_device+0xe5/0x240
> [   73.959817]        usbhid_probe+0x4bb/0x600
> [   73.959821]        usb_probe_interface+0xea/0x2b0
> [   73.959824]        really_probe+0xde/0x340
> [   73.959827]        __driver_probe_device+0x78/0x110
> [   73.959830]        driver_probe_device+0x1f/0xa0
> [   73.959833]        __device_attach_driver+0x85/0x110
> [   73.959835]        bus_for_each_drv+0x78/0xc0
> [   73.959839]        __device_attach+0xb0/0x1b0
> [   73.959842]        bus_probe_device+0x94/0xb0
> [   73.959844]        device_add+0x64a/0x860
> [   73.959847]        usb_set_configuration+0x5e8/0x880
> [   73.959850]        usb_generic_driver_probe+0x3e/0x60
> [   73.959854]        usb_probe_device+0x3d/0x120
> [   73.959857]        really_probe+0xde/0x340
> [   73.959859]        __driver_probe_device+0x78/0x110
> [   73.959862]        driver_probe_device+0x1f/0xa0
> [   73.959865]        __device_attach_driver+0x85/0x110
> [   73.959868]        bus_for_each_drv+0x78/0xc0
> [   73.959871]        __device_attach+0xb0/0x1b0
> [   73.959874]        bus_probe_device+0x94/0xb0
> [   73.959876]        device_add+0x64a/0x860
> [   73.959880]        usb_new_device.cold+0x141/0x38f
> [   73.959883]        hub_event+0x1166/0x1980
> [   73.959886]        process_one_work+0x21a/0x590
> [   73.959889]        worker_thread+0x1d1/0x3e0
> [   73.959891]        kthread+0xee/0x120
> [   73.959895]        ret_from_fork+0x30/0x50
> [   73.959898]        ret_from_fork_asm+0x1a/0x30
> [   73.959902] 
>                -> #0 (triggers_list_lock){++++}-{3:3}:
> [   73.959908]        __lock_acquire+0x11c6/0x1f20
> [   73.959911]        lock_acquire+0xc8/0x2b0
> [   73.959914]        down_write+0x3b/0xd0
> [   73.959916]        led_trigger_register+0x40/0x1b0
> [   73.959919]        phy_led_triggers_register+0xb4/0x240
> [   73.959923]        phy_attach_direct+0x378/0x380
> [   73.959926]        phy_connect_direct+0x21/0x70
> [   73.959929]        rtl_open+0x2e1/0x490 [r8169]
> [   73.959934]        __dev_open+0xea/0x1b0
> [   73.959937]        __dev_change_flags+0x201/0x240
> [   73.959939]        dev_change_flags+0x22/0x60
> [   73.959942]        do_setlink+0x32d/0x1070
> [   73.959945]        __rtnl_newlink+0x516/0x9d0
> [   73.959948]        rtnl_newlink+0x43/0x70
> [   73.959951]        rtnetlink_rcv_msg+0x159/0x630
> [   73.959953]        netlink_rcv_skb+0x4f/0x100
> [   73.959956]        netlink_unicast+0x18c/0x260
> [   73.959959]        netlink_sendmsg+0x207/0x420
> [   73.959962]        ____sys_sendmsg+0x364/0x3a0
> [   73.959965]        ___sys_sendmsg+0x84/0xd0
> [   73.959967]        __sys_sendmsg+0x8e/0xd0
> [   73.959971]        do_syscall_64+0x93/0x180
> [   73.959974]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   73.959977] 
>                other info that might help us debug this:
> 
> [   73.959979] Chain exists of:
>                  triggers_list_lock --> &led_cdev->trigger_lock --> rtnl_mutex
> 
> [   73.959987]  Possible unsafe locking scenario:
> 
> [   73.959989]        CPU0                    CPU1
> [   73.959991]        ----                    ----
> [   73.959993]   lock(rtnl_mutex);
> [   73.959996]                                lock(&led_cdev->trigger_lock);
> [   73.960000]                                lock(rtnl_mutex);
> [   73.960004]   lock(triggers_list_lock);
> [   73.960007] 
>                 *** DEADLOCK ***
> 
> [   73.960009] 1 lock held by NetworkManager/1815:
> [   73.960012]  #0: ffffffffb2158fe8 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x133/0x630
> [   73.960020] 
>                stack backtrace:
> [   73.960023] CPU: 5 PID: 1815 Comm: NetworkManager Not tainted 6.10.0-rc1+ #94
> [   73.960026] Hardware name: Micro-Star International Co., Ltd. MS-7C95/B550M PRO-VDH WIFI (MS-7C95), BIOS 2.J0 01/02/2024
> [   73.960029] Call Trace:
> [   73.960031]  <TASK>
> [   73.960034]  dump_stack_lvl+0x68/0x90
> [   73.960039]  check_noncircular+0x10d/0x120
> [   73.960044]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960048]  ? __lock_acquire+0xc19/0x1f20
> [   73.960055]  __lock_acquire+0x11c6/0x1f20
> [   73.960062]  lock_acquire+0xc8/0x2b0
> [   73.960065]  ? led_trigger_register+0x40/0x1b0
> [   73.960073]  down_write+0x3b/0xd0
> [   73.960076]  ? led_trigger_register+0x40/0x1b0
> [   73.960079]  led_trigger_register+0x40/0x1b0
> [   73.960083]  phy_led_triggers_register+0xb4/0x240
> [   73.960089]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960091]  ? schedule_timeout+0xc1/0x1b0
> [   73.960095]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960097]  ? find_held_lock+0x2b/0x80
> [   73.960101]  ? phy_attach_direct+0x1b0/0x380
> [   73.960105]  ? phy_attach_direct+0x1b0/0x380
> [   73.960108]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960110]  ? lock_release+0x169/0x2b0
> [   73.960115]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960118]  ? __mutex_unlock_slowpath+0x2d/0x260
> [   73.960124]  phy_attach_direct+0x378/0x380
> [   73.960128]  ? __pfx_r8169_phylink_handler+0x10/0x10 [r8169]
> [   73.960134]  phy_connect_direct+0x21/0x70
> [   73.960139]  rtl_open+0x2e1/0x490 [r8169]
> [   73.960147]  __dev_open+0xea/0x1b0
> [   73.960152]  __dev_change_flags+0x201/0x240
> [   73.960155]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960160]  dev_change_flags+0x22/0x60
> [   73.960165]  do_setlink+0x32d/0x1070
> [   73.960172]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960175]  ? __lock_acquire+0x3ce/0x1f20
> [   73.960178]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960180]  ? __nla_validate_parse+0x52/0xc70
> [   73.960185]  ? __entry_text_end+0x1025c9/0x1025cd
> [   73.960190]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960193]  ? __lock_acquire+0x3ce/0x1f20
> [   73.960199]  __rtnl_newlink+0x516/0x9d0
> [   73.960204]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960211]  ? __entry_text_end+0x1025c9/0x1025cd
> [   73.960214]  ? rcu_is_watching+0xd/0x40
> [   73.960217]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960220]  ? kmalloc_trace_noprof+0x25c/0x320
> [   73.960224]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960230]  rtnl_newlink+0x43/0x70
> [   73.960235]  rtnetlink_rcv_msg+0x159/0x630
> [   73.960241]  ? __pfx_rtnetlink_rcv_msg+0x10/0x10
> [   73.960246]  netlink_rcv_skb+0x4f/0x100
> [   73.960257]  netlink_unicast+0x18c/0x260
> [   73.960262]  netlink_sendmsg+0x207/0x420
> [   73.960270]  ____sys_sendmsg+0x364/0x3a0
> [   73.960273]  ? import_iovec+0x17/0x20
> [   73.960277]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960280]  ? copy_msghdr_from_user+0xd9/0x150
> [   73.960286]  ___sys_sendmsg+0x84/0xd0
> [   73.960292]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960294]  ? __lock_acquire+0x3ce/0x1f20
> [   73.960299]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960304]  ? find_held_lock+0x2b/0x80
> [   73.960307]  ? __fget_files+0xc3/0x190
> [   73.960312]  ? __fget_files+0xc3/0x190
> [   73.960315]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960317]  ? lock_release+0x169/0x2b0
> [   73.960322]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960327]  __sys_sendmsg+0x8e/0xd0
> [   73.960337]  do_syscall_64+0x93/0x180
> [   73.960340]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960345]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960349]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960352]  ? find_held_lock+0x2b/0x80
> [   73.960356]  ? __memcg_slab_free_hook+0x56/0x230
> [   73.960360]  ? __memcg_slab_free_hook+0x56/0x230
> [   73.960363]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960366]  ? lock_release+0x169/0x2b0
> [   73.960370]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960373]  ? __memcg_slab_free_hook+0x60/0x230
> [   73.960378]  ? kmem_cache_free+0x144/0x430
> [   73.960382]  ? syscall_exit_to_user_mode+0x11/0x280
> [   73.960387]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960390]  ? do_syscall_64+0x9f/0x180
> [   73.960393]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960396]  ? lockdep_hardirqs_on+0x78/0x100
> [   73.960400]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960403]  ? do_syscall_64+0x9f/0x180
> [   73.960406]  ? fd_install+0xba/0x310
> [   73.960411]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960414]  ? kmem_cache_free+0x144/0x430
> [   73.960420]  ? do_sys_openat2+0x64/0xb0
> [   73.960423]  ? syscall_exit_to_user_mode+0x11/0x280
> [   73.960428]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960431]  ? do_syscall_64+0x9f/0x180
> [   73.960435]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960437]  ? lockdep_hardirqs_on+0x78/0x100
> [   73.960441]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960444]  ? do_syscall_64+0x9f/0x180
> [   73.960448]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   73.960453]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   73.960457] RIP: 0033:0x7f857a9db79b
> [   73.960461] Code: 48 89 e5 48 83 ec 20 89 55 ec 48 89 75 f0 89 7d f8 e8 49 7a f7 ff 8b 55 ec 48 8b 75 f0 41 89 c0 8b 7d f8 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 45 f8 e8 a1 7a f7 ff 48 8b
> [   73.960464] RSP: 002b:00007ffcf5d3a660 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
> [   73.960468] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f857a9db79b
> [   73.960471] RDX: 0000000000000000 RSI: 00007ffcf5d3a6a0 RDI: 000000000000000d
> [   73.960473] RBP: 00007ffcf5d3a680 R08: 0000000000000000 R09: 0000000000000000
> [   73.960476] R10: 0000000000000000 R11: 0000000000000293 R12: 00005632de03d9d0
> [   73.960478] R13: 000000000000000a R14: 00007ffcf5d3a83c R15: 0000000000000000
> [   73.960488]  </TASK>
> [   73.960561] Generic FE-GE Realtek PHY r8169-0-2a00:00: attached PHY driver (mii_bus:phy_addr=r8169-0-2a00:00, irq=MAC)
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>> On 30.05.24 16:04, Russell King (Oracle) wrote:
>>> On Thu, May 30, 2024 at 09:36:45AM -0400, Genes Lists wrote:
>>>> On Thu, 2024-05-30 at 08:53 -0400, Genes Lists wrote:
>>>> This report for 6.9.1 could well be the same issue:
>>>> https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>>>
>>> The reg_check_chans_work() thing in pid 285 is likely stuck on the
>>> rtnl lock. The same is true of pid 287.
>>>
>>> That will be because of the thread (pid 663) that's stuck in
>>> __dev_open()...led_trigger_register(), where the rtnl lock will have
>>> been taken in that path. It looks to me like led_trigger_register()
>>> is stuck waiting for read access with the leds_list_lock rwsem.
>>>
>>> There are only two places that take that rwsem in write mode, which
>>> are led_classdev_register_ext() and led_classdev_unregister(). None
>>> of these paths are blocking in v6.9.
>>>
>>> Pid 641 doesn't look significant (its probably waiting for either
>>> pid 285 or 287 to complete its work.)
>>>
>>> Pid 666 looks like it is blocked waiting for exclusive write-access
>>> on the leds_list_lock - but it isn't holding that lock. This means
>>> there must already be some other reader or writer holding this lock.
>>>
>>> Pid 722 doesn't look sigificant (same as pid 641).
>>>
>>> Pid 760 is also waiting for the rtnl lock.
>>>
>>> Pid 854, 855 also doesn't look sigificant (as pid 641).
>>>
>>> And then we get to pid 858. This is in set_device_name(), which
>>> was called from led_trigger_set() and led_trigger_register().
>>> We know from pid 663 that led_trigger_register() can take a read
>>> on leds_list_lock, and indeed it does and then calls
>>> led_match_default_trigger(), which then goes on to call
>>> led_trigger_set(). Bingo, this is why pid 666 is blocked, which
>>> then blocks pid 663. pid 663 takes the rtnl lock, which blocks
>>> everything else _and_ also blocks pid 858 in set_device_name().
>>>
>>> Lockdep would've found this... this is a classic AB-BA deadlock
>>> between the leds_list_lock rwsem and the rtnl mutex.
>>>
>>> I haven't checked to see how that deadlock got introduced, that's
>>> for someone else to do.
>>
>> P.S.:
>>
>> #regzbot report: /
>> #regzbot introduced: f5c31bcf604d
>> #regzbot duplicate:
>> https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>> #regzbot summary: leds: Hung tasks due to a AB-BA deadlock between the
>> leds_list_lock rwsem and the rtnl mutex
>>
> 


