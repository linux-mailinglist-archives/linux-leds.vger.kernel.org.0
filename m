Return-Path: <linux-leds+bounces-3301-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C029BE12F
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B161F23E73
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213571B5EDC;
	Wed,  6 Nov 2024 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZJ3edXo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61A7D3F4;
	Wed,  6 Nov 2024 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882429; cv=none; b=iBnygQBx2vFMIx9XMubtXYkh6fcFeR7HGEm84vMnNI71EoHQhgGitj97kBKyO9sQvCnSq8C73RjJTqNi6jDFajdiflq5VgGqCbNdyl2/xectRW4AqTod44IzRN0EdCZ4knzlW5cjd2e0t7CdWQmDKc7Y8jaYr1eHHs12H8jRc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882429; c=relaxed/simple;
	bh=U4H1UkFB2GiREgkJc442onlPdKsWNCgG54uKnyfm/yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaYm89X1SSxQS6Dyj+mYsKirPNwV/asA4Rt7rJbC4hRa5qso29P2Ntc0ycnOfz9DPRpsphO7VXdH+rhQ9IcsqlM9qv1KzYUjrh8XUMIqnaJNEvjyfQbuZGdF3oStN0dLHhKVb16dtJbDwGdC1Ga6WyCdOasrh7ThqqXVetpG60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZJ3edXo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D5CC4CECD;
	Wed,  6 Nov 2024 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730882428;
	bh=U4H1UkFB2GiREgkJc442onlPdKsWNCgG54uKnyfm/yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZJ3edXoEfh9dGZK0jiFJthUAZChOZZGR/pTo3ShyIsPj0U8aTOe1AvVvxLR6Tjqs
	 5tZhSQ8U85XSYeV2/DG3iYo460PUDQpw86RWcON4q1VY+JtCAp8r0zCVGfNFHZdP28
	 nc9CrJRXKRnDQGX+WnpflWFZ22EkJLEybEwkb147mYEU9Aa4d8n175W8uwiuAHYgYP
	 4AN70SZMKdITpwp1qA/T+X1joSJug6eRsq60bzBCkH1poDnVD5p4CIT2lkDvQUAAxQ
	 6xEJIrj2XsYzoO0ELm0K/dHecBEPp8n4YPdG/BlUCZs1jUmzonvtXf9NCdAuRPiIJ8
	 fUNivVesNfpHw==
Date: Wed, 6 Nov 2024 08:40:24 +0000
From: Lee Jones <lee@kernel.org>
To: anish kumar <yesanishhere@gmail.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
Message-ID: <20241106084024.GH1807686@google.com>
References: <20241103160527.82487-1-quic_mojha@quicinc.com>
 <CABCoZhCxgQmkpCtCUtSwpHRHzn-EUBRnT5jCEDGM0hh28Kkz5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCoZhCxgQmkpCtCUtSwpHRHzn-EUBRnT5jCEDGM0hh28Kkz5g@mail.gmail.com>

On Sun, 03 Nov 2024, anish kumar wrote:

> On Sun, Nov 3, 2024 at 8:15 AM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
> >
> > There is NULL pointer issue observed if from Process A where hid device
> > being added which results in adding a led_cdev addition and later a
> > another call to access of led_cdev attribute from Process B can result
> > in NULL pointer issue.
> >
> > Use mutex led_cdev->led_access to protect access to led->cdev and its
> > attribute inside brightness_show() and max_brightness_show() and also
> > update the comment for mutex that it should be used to protect the led
> > class device fields.
> >
> >         Process A                               Process B
> >
> >  kthread+0x114
> >  worker_thread+0x244
> >  process_scheduled_works+0x248
> >  uhid_device_add_worker+0x24
> >  hid_add_device+0x120
> >  device_add+0x268
> >  bus_probe_device+0x94
> >  device_initial_probe+0x14
> >  __device_attach+0xfc
> >  bus_for_each_drv+0x10c
> >  __device_attach_driver+0x14c
> >  driver_probe_device+0x3c
> >  __driver_probe_device+0xa0
> >  really_probe+0x190
> >  hid_device_probe+0x130
> >  ps_probe+0x990
> >  ps_led_register+0x94
> >  devm_led_classdev_register_ext+0x58
> >  led_classdev_register_ext+0x1f8
> >  device_create_with_groups+0x48
> >  device_create_groups_vargs+0xc8
> >  device_add+0x244
> >  kobject_uevent+0x14
> >  kobject_uevent_env[jt]+0x224
> >  mutex_unlock[jt]+0xc4
> >  __mutex_unlock_slowpath+0xd4
> >  wake_up_q+0x70
> >  try_to_wake_up[jt]+0x48c
> >  preempt_schedule_common+0x28
> >  __schedule+0x628
> >  __switch_to+0x174
> >                                                 el0t_64_sync+0x1a8/0x1ac
> >                                                 el0t_64_sync_handler+0x68/0xbc
> >                                                 el0_svc+0x38/0x68
> >                                                 do_el0_svc+0x1c/0x28
> >                                                 el0_svc_common+0x80/0xe0
> >                                                 invoke_syscall+0x58/0x114
> >                                                 __arm64_sys_read+0x1c/0x2c
> >                                                 ksys_read+0x78/0xe8
> >                                                 vfs_read+0x1e0/0x2c8
> >                                                 kernfs_fop_read_iter+0x68/0x1b4
> >                                                 seq_read_iter+0x158/0x4ec
> >                                                 kernfs_seq_show+0x44/0x54
> >                                                 sysfs_kf_seq_show+0xb4/0x130
> >                                                 dev_attr_show+0x38/0x74
> >                                                 brightness_show+0x20/0x4c
> >                                                 dualshock4_led_get_brightness+0xc/0x74
> >
> > [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
> > [ 3313.874301][ T4013] Mem abort info:
> > [ 3313.874303][ T4013]   ESR = 0x0000000096000006
> > [ 3313.874305][ T4013]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [ 3313.874307][ T4013]   SET = 0, FnV = 0
> > [ 3313.874309][ T4013]   EA = 0, S1PTW = 0
> > [ 3313.874311][ T4013]   FSC = 0x06: level 2 translation fault
> > [ 3313.874313][ T4013] Data abort info:
> > [ 3313.874314][ T4013]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> > [ 3313.874316][ T4013]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [ 3313.874318][ T4013]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=00000008f2b0a000
> > ..
> >
> > [ 3313.874332][ T4013] Dumping ftrace buffer:
> > [ 3313.874334][ T4013]    (ftrace buffer empty)
> > ..
> > ..
> > [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> > [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
> > [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> > [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> > ..
> > ..
> > [ 3313.874685][ T4013] Call trace:
> > [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> > [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> > [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> > [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> > [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> > [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> > [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> > [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> > [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> > [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> > [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> > [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> > [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> > [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> > [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> > [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
> >
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> 
> 
> reviewed-by: Anish Kumar <yesanishhere@gmail.com>

Please correct this and save it as a key-binding to prevent further
typos.

-- 
Lee Jones [李琼斯]

