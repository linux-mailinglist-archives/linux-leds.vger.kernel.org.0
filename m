Return-Path: <linux-leds+bounces-222-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4906800798
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6ABEB20F92
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 09:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F061E524;
	Fri,  1 Dec 2023 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM2qwCtq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E541DDE9;
	Fri,  1 Dec 2023 09:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B088C433C9;
	Fri,  1 Dec 2023 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701424501;
	bh=bfdACYLcpe5G5L0M6AML9A5cua2JX5r67pEzdtiedpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OM2qwCtqmy0HGBIU7FzC2dum9gSWAJTUBmZo7ezgnnkLNhs37nOT2dDuUK/FIF8I4
	 mGkwd/lGcEwDQJPrb/3K3t4VMPda5s5WglnPeMQy3gLu8Qg6ubXqxYx7edDZ/J0Rec
	 RK51Ff/+rCzMzqdb5M0TIPaw6PBQX5d1jlRtBmTCjFjJG73cT79e3kMZS87MCUCko2
	 QZOBWEz1+Ljk7A58EKLpWxdsddEUcmP9lOfi3xkEnFOUExR32PYsp05NkJQlgVqQ16
	 nc2WlDcYLxMo84mmFUkY7nFFFIjNTY/8m90CzhE2AjWXv6WObo8MBsNyXJy+ZqIkBo
	 eTJl13jJZgSAw==
Date: Fri, 1 Dec 2023 09:54:55 +0000
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
Message-ID: <20231201095455.GS32077@kernel.org>
References: <7cfd7a10-53d4-45a8-908c-39459b1f8b1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cfd7a10-53d4-45a8-908c-39459b1f8b1a@gmail.com>

On Wed, Nov 29, 2023 at 09:03:56AM +0100, Heiner Kallweit wrote:
> When working on LED support for r8169 I got the following lockdep
> warning. Easiest way to prevent this scenario seems to be to take
> the RTNL lock before the trigger_data lock in set_device_name().
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.7.0-rc2-next-20231124+ #2 Not tainted
> ------------------------------------------------------
> bash/383 is trying to acquire lock:
> ffff888103aa1c68 (&trigger_data->lock){+.+.}-{3:3}, at: netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
> 
> but task is already holding lock:
> ffffffff8cddf808 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock+0x12/0x20
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 (rtnl_mutex){+.+.}-{3:3}:
>        __mutex_lock+0x9b/0xb50
>        mutex_lock_nested+0x16/0x20
>        rtnl_lock+0x12/0x20
>        set_device_name+0xa9/0x120 [ledtrig_netdev]
>        netdev_trig_activate+0x1a1/0x230 [ledtrig_netdev]
>        led_trigger_set+0x172/0x2c0
>        led_trigger_write+0xf1/0x140
>        sysfs_kf_bin_write+0x5d/0x80
>        kernfs_fop_write_iter+0x15d/0x210
>        vfs_write+0x1f0/0x510
>        ksys_write+0x6c/0xf0
>        __x64_sys_write+0x14/0x20
>        do_syscall_64+0x3f/0xf0
>        entry_SYSCALL_64_after_hwframe+0x6c/0x74
> 
> -> #0 (&trigger_data->lock){+.+.}-{3:3}:
>        __lock_acquire+0x1459/0x25a0
>        lock_acquire+0xc8/0x2d0
>        __mutex_lock+0x9b/0xb50
>        mutex_lock_nested+0x16/0x20
>        netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
>        call_netdevice_register_net_notifiers+0x5a/0x100
>        register_netdevice_notifier+0x85/0x120
>        netdev_trig_activate+0x1d4/0x230 [ledtrig_netdev]
>        led_trigger_set+0x172/0x2c0
>        led_trigger_write+0xf1/0x140
>        sysfs_kf_bin_write+0x5d/0x80
>        kernfs_fop_write_iter+0x15d/0x210
>        vfs_write+0x1f0/0x510
>        ksys_write+0x6c/0xf0
>        __x64_sys_write+0x14/0x20
>        do_syscall_64+0x3f/0xf0
>        entry_SYSCALL_64_after_hwframe+0x6c/0x74
> 
> other info that might help us debug this:
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(rtnl_mutex);
>                                lock(&trigger_data->lock);
>                                lock(rtnl_mutex);
>   lock(&trigger_data->lock);
> 
>  *** DEADLOCK ***
> 
> 8 locks held by bash/383:
>  #0: ffff888103ff33f0 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x6c/0xf0
>  #1: ffff888103aa1e88 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x114/0x210
>  #2: ffff8881036f1890 (kn->active#82){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x11d/0x210
>  #3: ffff888108e2c358 (&led_cdev->led_access){+.+.}-{3:3}, at: led_trigger_write+0x30/0x140
>  #4: ffffffff8cdd9e10 (triggers_list_lock){++++}-{3:3}, at: led_trigger_write+0x75/0x140
>  #5: ffff888108e2c270 (&led_cdev->trigger_lock){++++}-{3:3}, at: led_trigger_write+0xe3/0x140
>  #6: ffffffff8cdde3d0 (pernet_ops_rwsem){++++}-{3:3}, at: register_netdevice_notifier+0x1c/0x120
>  #7: ffffffff8cddf808 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock+0x12/0x20
> 
> stack backtrace:
> CPU: 0 PID: 383 Comm: bash Not tainted 6.7.0-rc2-next-20231124+ #2
> Hardware name: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x5c/0xd0
>  dump_stack+0x10/0x20
>  print_circular_bug+0x2dd/0x410
>  check_noncircular+0x131/0x150
>  __lock_acquire+0x1459/0x25a0
>  lock_acquire+0xc8/0x2d0
>  ? netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
>  __mutex_lock+0x9b/0xb50
>  ? netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
>  ? __this_cpu_preempt_check+0x13/0x20
>  ? netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
>  ? __cancel_work_timer+0x11c/0x1b0
>  ? __mutex_lock+0x123/0xb50
>  mutex_lock_nested+0x16/0x20
>  ? mutex_lock_nested+0x16/0x20
>  netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
>  call_netdevice_register_net_notifiers+0x5a/0x100
>  register_netdevice_notifier+0x85/0x120
>  netdev_trig_activate+0x1d4/0x230 [ledtrig_netdev]
>  led_trigger_set+0x172/0x2c0
>  ? preempt_count_add+0x49/0xc0
>  led_trigger_write+0xf1/0x140
>  sysfs_kf_bin_write+0x5d/0x80
>  kernfs_fop_write_iter+0x15d/0x210
>  vfs_write+0x1f0/0x510
>  ksys_write+0x6c/0xf0
>  __x64_sys_write+0x14/0x20
>  do_syscall_64+0x3f/0xf0
>  entry_SYSCALL_64_after_hwframe+0x6c/0x74
> RIP: 0033:0x7f269055d034
> Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d 35 c3 0d 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48
> RSP: 002b:00007ffddb7ef748 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 00007f269055d034
> RDX: 0000000000000007 RSI: 000055bf5f4af3c0 RDI: 0000000000000001
> RBP: 000055bf5f4af3c0 R08: 0000000000000073 R09: 0000000000000001
> R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000007
> R13: 00007f26906325c0 R14: 00007f269062ff20 R15: 0000000000000000
>  </TASK>
> 
> Fixes: f42c437acc55 ("leds: trigger: netdev: add additional specific link speed mode")

Hi Heiner,

The hash above doesn't seem to match what is upstream.
Perhaps it should be:

Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link speed mode")

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

...

