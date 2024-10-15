Return-Path: <linux-leds+bounces-3101-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F599F499
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 19:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3871F2513F
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 17:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D51D1FC7E6;
	Tue, 15 Oct 2024 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR2RT59O"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAC1FAF1F;
	Tue, 15 Oct 2024 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015170; cv=none; b=lw1xOnUb6o3Zp+OH3wa21OCExuDgptcvK+Vjt1RVFj/gNNhlXCUzWrEIxNHX7Jl3OvdJ+reyvsSlrLlCWSyTxVPG5mkMIc7wy9emQi3NveQX2p4mKYUwDYI4sVCRci5DTz5rPsbR+q7/IpO3nyGIs6XXzOfH4A2A13jg2e9cbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015170; c=relaxed/simple;
	bh=1KK6RuGO5UouioukXkgUiQ9qJwIIV9skM0O1Gh+CWOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N21ZMrfzVJjPXPBlsv3dpMltANbajnlDIyJ0GGpEK8lUiVlZ7gictdxDG2+hCjlXwVLuOQimsDmRGqcK/RebfT0GDLq/lH618Qd4Dj86FlJDgE4MqDocZXxJb8p2QLAb5wLYiQLchDsZXasTYTpwJ9eVGdOki3ZaUyltO/uaDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR2RT59O; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so891581fa.1;
        Tue, 15 Oct 2024 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729015164; x=1729619964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YO7LMx3QgYNwsaElybe+TVModTUR8j6wNgerkQ+iQE=;
        b=KR2RT59OBLdecQcIKDPfYtadz4h0QmqitMjkceSCAb2Co1uGRKyb9nsmb8Yuqt7QkO
         zp3utr9sOmNrX1U8iSbPkHQg036jTG7pV2E5AfKlnlLkPexohD06xg4A6GeRDMqV3dJj
         OHj0KbY2dTZQeccxAxju8pcuvkEnrkYeCplGCo6eSObe/bZWQXO4OYavzdEJy9l4ElO6
         QXt+xsZbxWhyAsuwRjvDZ/SBNCc/ihc8rwYvzxp+6yTb9I+gAbps+vFZPFuySA8H7mxI
         M0s6U8IkBXei540/zwcEyBqWokBUF5b1txY8ltL+HS3NCjShpSzeOQoao7H0SEqiHbRc
         ZEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015164; x=1729619964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YO7LMx3QgYNwsaElybe+TVModTUR8j6wNgerkQ+iQE=;
        b=G9Ew/O4XmY/4vwZyFgWBORqtOREKV24pUBtF2rJhywzPZ9LkdBGyqyesFodCOhClO0
         xrSVsGBXfKq+sQUUgMEjCxgjVHONOAcl4dVbXxKnRr1RftbgJvkMgsa71/7ZIbUlyUvr
         BUcWVgK5V/S92j/i0xJlCGXjP1NIeHgni1+m6iWuJ52YTyWc9PgbKqv2r9ybQL+hQyiO
         EKYCAWoIm/BmemV7sFCdjEtY6iu+bU32cS7gxYl9x4rfjw/x5I7ITPTD3d4h7qtazG00
         5R3GFQOlbCPadLyj2x6fWlR1tiS0mlJ34ogD5qxRH2tC+kWR1hw9Gw9X3IkHcZpKlWyK
         WK1w==
X-Forwarded-Encrypted: i=1; AJvYcCVkI8DB0Rl2JCJl14EckOhC9oZ4B7IQDrVyMFVeIuov0ld+En7u/1FxIGJeTkRKGcVJQUFVa54ZV+PgSA==@vger.kernel.org, AJvYcCXQEcKxZxBle8WyoJryx4gqYAte2qwWIBoXWGmG3EA0ZL1hUN5Pc0qEQ/j25EV5pgAFfBjBOu/bShe6ao8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+UHMDBvTq1dIlzexnpo3OPAU2hDNdbIzei+ZUnCLwGQXBexxP
	sqHCtRA4gN5vMRiwHscY4uIC1Ulrd+Jx354dWnLy68VnsfoTKiC9CfbODN6nQRA6XJ0stBAB/rm
	SI5MAlErwBuqFc3vnqYajMEGoHvHHZ0qsCTc=
X-Google-Smtp-Source: AGHT+IFTrevc7O/wn0/KTW/5rAjcG2Ullzbn++L/oREYP/ana3Bg7GFF/ZnJ4XdfAFBmCntlBQPpWAwOHbF9SKxqvA0=
X-Received: by 2002:a2e:a587:0:b0:2fb:62ad:89e4 with SMTP id
 38308e7fff4ca-2fb62ad8d54mr2731801fa.19.1729015164177; Tue, 15 Oct 2024
 10:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162532.2292871-1-quic_mojha@quicinc.com>
In-Reply-To: <20241015162532.2292871-1-quic_mojha@quicinc.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Tue, 15 Oct 2024 10:59:12 -0700
Message-ID: <CABCoZhB97E46NTRq-=JeUCH3V9fc45qC0WpA8qN2y6gxvWmbHA@mail.gmail.com>
Subject: Re: [PATCH] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 9:26=E2=80=AFAM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:
>
> There is NULL pointer issue observed if from Process A where hid device
> being added which results in adding a led_cdev addition and later a
> another call to access of led_cdev attribute from Process B can result
> in NULL pointer issue.

Which pointer is NULL? Call stack shows that dualshock4_led_get_brightness
function could be culprit?

>
> Use mutex led_cdev->led_access to protect access to led->cdev and its
> attribute inside brightness_show().

I don't think it is needed here because it is just calling the led driver
callback and updating the brightness. So, why would we need to serialize
that using mutex? Maybe the callback needs some debugging.
I'm curious if it is ready by the time the callback is invoked.

>
>         Process A                               Process B
>
>  kthread+0x114
>  worker_thread+0x244
>  process_scheduled_works+0x248
>  uhid_device_add_worker+0x24
>  hid_add_device+0x120
>  device_add+0x268
>  bus_probe_device+0x94
>  device_initial_probe+0x14
>  __device_attach+0xfc
>  bus_for_each_drv+0x10c
>  __device_attach_driver+0x14c
>  driver_probe_device+0x3c
>  __driver_probe_device+0xa0
>  really_probe+0x190
>  hid_device_probe+0x130
>  ps_probe+0x990
>  ps_led_register+0x94
>  devm_led_classdev_register_ext+0x58
>  led_classdev_register_ext+0x1f8
>  device_create_with_groups+0x48
>  device_create_groups_vargs+0xc8
>  device_add+0x244
>  kobject_uevent+0x14
>  kobject_uevent_env[jt]+0x224
>  mutex_unlock[jt]+0xc4
>  __mutex_unlock_slowpath+0xd4
>  wake_up_q+0x70
>  try_to_wake_up[jt]+0x48c
>  preempt_schedule_common+0x28
>  __schedule+0x628
>  __switch_to+0x174
>                                                 el0t_64_sync+0x1a8/0x1ac
>                                                 el0t_64_sync_handler+0x68=
/0xbc
>                                                 el0_svc+0x38/0x68
>                                                 do_el0_svc+0x1c/0x28
>                                                 el0_svc_common+0x80/0xe0
>                                                 invoke_syscall+0x58/0x114
>                                                 __arm64_sys_read+0x1c/0x2=
c
>                                                 ksys_read+0x78/0xe8
>                                                 vfs_read+0x1e0/0x2c8
>                                                 kernfs_fop_read_iter+0x68=
/0x1b4
>                                                 seq_read_iter+0x158/0x4ec
>                                                 kernfs_seq_show+0x44/0x54
>                                                 sysfs_kf_seq_show+0xb4/0x=
130
>                                                 dev_attr_show+0x38/0x74
>                                                 brightness_show+0x20/0x4c
>                                                 dualshock4_led_get_bright=
ness+0xc/0x74
>
> [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereference a=
t virtual address 0000000000000060
> [ 3313.874301][ T4013] Mem abort info:
> [ 3313.874303][ T4013]   ESR =3D 0x0000000096000006
> [ 3313.874305][ T4013]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [ 3313.874307][ T4013]   SET =3D 0, FnV =3D 0
> [ 3313.874309][ T4013]   EA =3D 0, S1PTW =3D 0
> [ 3313.874311][ T4013]   FSC =3D 0x06: level 2 translation fault
> [ 3313.874313][ T4013] Data abort info:
> [ 3313.874314][ T4013]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x000000=
00
> [ 3313.874316][ T4013]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [ 3313.874318][ T4013]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D=
 0
> [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000=
8f2b0a000
> ..
>
> [ 3313.874332][ T4013] Dumping ftrace buffer:
> [ 3313.874334][ T4013]    (ftrace buffer empty)
> ..
> ..
> [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
> [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> ..
> ..
> [ 3313.874685][ T4013] Call trace:
> [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/leds/led-class.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 06b97fd49ad9..e3cb93f19c06 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *dev,
>  {
>         struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>
> -       /* no lock needed for this */

>> also you missed this.

> +       mutex_lock(&led_cdev->led_access);
>         led_update_brightness(led_cdev);
> +       mutex_unlock(&led_cdev->led_access);
>
>         return sprintf(buf, "%u\n", led_cdev->brightness);
>  }
> --
> 2.34.1
>
>

