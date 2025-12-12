Return-Path: <linux-leds+bounces-6409-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 760F9CB80B3
	for <lists+linux-leds@lfdr.de>; Fri, 12 Dec 2025 07:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9FC3300A56E
	for <lists+linux-leds@lfdr.de>; Fri, 12 Dec 2025 06:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DC127FD5A;
	Fri, 12 Dec 2025 06:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rcszNIuS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X1/PlC+Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30901F130B;
	Fri, 12 Dec 2025 06:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765521703; cv=none; b=RjdpLYdU3O8CO5f9d3OnLnE2wXra/eeQ0+La6FUhM6+nHQ2yRM2APFx/DRVR+njUng5v3DNHvPr5Y9uArvVXLb2pUZ9LfEoWC/oD0r86Q1XkwWKToj4Mju+tZp4HUCl8VhqsbpiEstD7HhPbUxnP3b5qhKCxU1eRTfFr5vAWHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765521703; c=relaxed/simple;
	bh=c1pvoRmFLPZ7C60+UHjUvVcaYLkNWFbq936n7PaFVOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cojddCZF4bue3E50V7h1pgW4EcA2DBTpHe0W4HxEoJopNA5M26dj+2DVaOPF31izs6cuDfChZbffZ/XODFv2o04NJQDfedNymmAoRSarfU3fk0pgQ2i5DB+X4bsUwSfSKEFG1oe2rBXkYdIxrc7A/4vyW2KY4H3l0aJ+YGUK4oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rcszNIuS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X1/PlC+Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765521699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dbqnWOzU1QgfZzh3LUiM+zNWyg3VfTMDZdq1JBruF70=;
	b=rcszNIuS/4P/73q00DLrhdm66YUzWlMqnFvfPYRLic9Ly4wxkCIGX4Z6qifRiGBvjA9Rmn
	8xrgZpAsPfN5gcOnWPJc3qWlZmjfUinuQwUXzsmsawj8Yp5foekuM6otOg4LjUsdVsu3xr
	e+PEAfc5yQ5L/jfYn+2hLs1FGpjMYlfw0JJEhecWtBdQxY7mischpnD8xIOaP32cXphs7Z
	VZqZZBrg2iZda1B0HcKNpDOTvpVlADlZhgnEfO8ysiU0JKDB0hnebAz/dloEYFnV38Q+pI
	+GEifP8/o3RG2IJKHEsOkQ3FsEnzQ9VAk4AG8XJ1yLMyJ8rt6BG9nVtbwzWfMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765521699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dbqnWOzU1QgfZzh3LUiM+zNWyg3VfTMDZdq1JBruF70=;
	b=X1/PlC+Y2X20BnVIOluMKJ9Xcuwbj1ZPqZuCkLMvNagPP+YbKN7S9ikZOg0teIEr/7n6/O
	uFeVodwXr2Sd5qCw==
To: syzbot <syzbot+416b3bb7740906d1fb1e@syzkaller.appspotmail.com>,
 anna-maria@linutronix.de, frederic@kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [syzbot] [kernel?] BUG: soft lockup in tmigr_handle_remote
In-Reply-To: <6937b688.a70a0220.38f243.00c1.GAE@google.com>
References: <6937b688.a70a0220.38f243.00c1.GAE@google.com>
Date: Fri, 12 Dec 2025 15:41:34 +0900
Message-ID: <87bjk4dwwx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Dec 08 2025 at 21:41, syzbot wrote:
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT 
> Hardware name: ARM-Versatile Express
> PC is at __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
> PC is at _raw_spin_unlock_irq+0x28/0x54 kernel/locking/spinlock.c:202
> LR is at tmigr_handle_remote_cpu kernel/time/timer_migration.c:1038 [inline]
> LR is at tmigr_handle_remote_up+0x268/0x4b0 kernel/time/timer_migration.c:1074
> pc : [<81abb53c>]    lr : [<80346df4>]    psr: 60000113
> sp : 82801be0  ip : 82801bf0  fp : 82801bec
> r10: 00000001  r9 : 00000031  r8 : b7f9d100
> r7 : ddddb488  r6 : 82801cb8  r5 : 830bf3b0  r4 : 830bf380
> r3 : 000085d1  r2 : 00000103  r1 : 830bf3b0  r0 : ddddb488
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 30c5387d  Table: 85dd6940  DAC: fffffffd
> Call trace: 
> [<81abb514>] (_raw_spin_unlock_irq) from [<80346df4>] (tmigr_handle_remote_cpu kernel/time/timer_migration.c:1038 [inline])
> [<81abb514>] (_raw_spin_unlock_irq) from [<80346df4>] (tmigr_handle_remote_up+0x268/0x4b0 kernel/time/timer_migration.c:1074)
> [<80346b8c>] (tmigr_handle_remote_up) from [<803450a4>] (__walk_groups_from+0x3c/0xe4 kernel/time/timer_migration.c:566)
>  r10:8281b500 r9:8280c820 r8:80346b8c r7:82801cb8 r6:830bf380 r5:00000002
>  r4:830bf380
> [<80345068>] (__walk_groups_from) from [<8034743c>] (__walk_groups kernel/time/timer_migration.c:583 [inline])
> [<80345068>] (__walk_groups_from) from [<8034743c>] (tmigr_handle_remote+0xe8/0x108 kernel/time/timer_migration.c:1133)
>  r9:82804d80 r8:00000102 r7:00000001 r6:00000082 r5:00000002 r4:dddc7488
> [<80347354>] (tmigr_handle_remote) from [<80327600>] (run_timer_softirq+0x30/0x34 kernel/time/timer.c:2408)
>  r4:82804084
> [<803275d0>] (run_timer_softirq) from [<8025b55c>] (handle_softirqs+0x140/0x458 kernel/softirq.c:622)
> [<8025b41c>] (handle_softirqs) from [<8025b9d0>] (__do_softirq kernel/softirq.c:656 [inline])
> [<8025b41c>] (handle_softirqs) from [<8025b9d0>] (invoke_softirq kernel/softirq.c:496 [inline])
> [<8025b41c>] (handle_softirqs) from [<8025b9d0>] (__irq_exit_rcu+0x110/0x1d0 kernel/softirq.c:723)
>  r10:00000000 r9:8281b500 r8:00000000 r7:82801dd8 r6:82443e68 r5:8247ef9c
>  r4:8281b500
> [<8025b8c0>] (__irq_exit_rcu) from [<8025bd48>] (irq_exit+0x10/0x18 kernel/softirq.c:751)
>  r5:8247ef9c r4:826c3a9c
> [<8025bd38>] (irq_exit) from [<81aad164>] (generic_handle_arch_irq+0x7c/0x80 kernel/irq/handle.c:295)
> [<81aad0e8>] (generic_handle_arch_irq) from [<80200bdc>] (__irq_svc+0x7c/0xbc arch/arm/kernel/entry-armv.S:228)
> Exception stack(0x82801dd8 to 0x82801e20)
> 1dc0:                                                       00000001 00000000
> 1de0: 00008872 00008870 84121368 00000004 00000001 84121368 842d1a88 84121240
> 1e00: 00000000 82801e3c 82801e28 82801e28 81abb6cc 81abb6f4 80000013 ffffffff
>  r9:8281b500 r8:842d1a88 r7:82801e0c r6:ffffffff r5:80000013 r4:81abb6f4
> [<81abb6b4>] (_raw_spin_lock) from [<809c74b8>] (class_raw_spinlock_constructor include/linux/spinlock.h:535 [inline])
> [<81abb6b4>] (_raw_spin_lock) from [<809c74b8>] (gpio_mmio_set+0x44/0x80 drivers/gpio/gpio-mmio.c:234)
>  r5:00000004 r4:84121240

So this holds the gpio chip lock, with interrupts enabled, so the timer
interrupt can hit in the lock held region....

> [<809c7474>] (gpio_mmio_set) from [<809b7c74>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
>  r7:00000001 r6:00000000 r5:00000002 r4:841e1028

While on the other CPU:

> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT 
> Hardware name: ARM-Versatile Express
> PC is at arch_spin_lock arch/arm/include/asm/spinlock.h:74 [inline]
> PC is at do_raw_spin_lock include/linux/spinlock.h:187 [inline]
> PC is at __raw_spin_lock include/linux/spinlock_api_smp.h:134 [inline]
> PC is at _raw_spin_lock+0x40/0x58 kernel/locking/spinlock.c:154
> LR is at __raw_spin_lock include/linux/spinlock_api_smp.h:132 [inline]
> LR is at _raw_spin_lock+0x18/0x58 kernel/locking/spinlock.c:154
> pc : [<81abb6f4>]    lr : [<81abb6cc>]    psr: 80000113
> sp : df805d68  ip : df805d68  fp : df805d7c
> r10: 81c05450  r9 : 84121240  r8 : 842d1a88
> r7 : 84121368  r6 : 00000001  r5 : 00000001  r4 : 84121368
> r3 : 00008870  r2 : 00008871  r1 : 00000000  r0 : 00000001
> Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 30c5387d  Table: 84d295c0  DAC: 00000000
> Call trace: frame pointer underflow
> [<81abb6b4>] (_raw_spin_lock) from [<809c74b8>] (class_raw_spinlock_constructor include/linux/spinlock.h:535 [inline])
> [<81abb6b4>] (_raw_spin_lock) from [<809c74b8>] (gpio_mmio_set+0x44/0x80 drivers/gpio/gpio-mmio.c:234)
>  r5:00000001 r4:84121240
> [<809c7474>] (gpio_mmio_set) from [<809b7c74>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
>  r7:00000001 r6:00000000 r5:00000000 r4:841e1000
> [<809b7c58>] (gpiochip_set) from [<809ba53c>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
> [<809ba4c4>] (gpiod_set_raw_value_commit) from [<809bbddc>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
>  r10:81c05450 r9:df805ebc r8:00000102 r7:ffffde37 r6:00000007 r5:00000001
>  r4:841e1000
> [<809bbd98>] (gpiod_set_value_nocheck) from [<809bbe2c>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
> [<809bbdf0>] (gpiod_set_value) from [<809cc5c8>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
>  r5:83315844 r4:83315844
> [<809cc56c>] (gpio_led_set) from [<809c9e60>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
> [<809cc56c>] (gpio_led_set) from [<809c9e60>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
> [<809cc56c>] (gpio_led_set) from [<809c9e60>] (led_set_brightness_nosleep+0x38/0x44 drivers/leds/led-core.c:369)
>  r5:83315844 r4:8444c58c
> [<809c9e28>] (led_set_brightness_nosleep) from [<809ccec4>] (led_heartbeat_function+0x84/0x144 drivers/leds/trigger/ledtrig-heartbeat.c:90)
> [<809cce40>] (led_heartbeat_function) from [<80326f70>] (call_timer_fn+0x30/0x220 kernel/time/timer.c:1748)
>  r7:ffffde37 r6:809cce40 r5:8444c58c r4:83216000
> [<80326f40>] (call_timer_fn) from [<80327424>] (expire_timers kernel/time/timer.c:1799 [inline])
> [<80326f40>] (call_timer_fn) from [<80327424>] (__run_timers+0x2c4/0x3f8 kernel/time/timer.c:2373)
>  r9:df805ebc r8:ffffde37 r7:00000000 r6:809cce40 r5:dddd9f00 r4:8444c58c

The timer soft interrupt tries to aquire the same lock...

7e061b462b3d ("gpio: mmio: use lock guards") got this wrong:

-       unsigned long flags;
 
-       raw_spin_lock_irqsave(&chip->lock, flags);
+       guard(raw_spinlock)(&chip->lock);

No?

Thanks,

        tglx

