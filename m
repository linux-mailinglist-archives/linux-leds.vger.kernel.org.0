Return-Path: <linux-leds+bounces-3105-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66E99FB70
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 00:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35821F207C2
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 22:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D901B6CED;
	Tue, 15 Oct 2024 22:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY0Zmj3U"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601321E3A4;
	Tue, 15 Oct 2024 22:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729031304; cv=none; b=t7pY2mufrabR7A6zsUelHZlTrfuWXm5zm4ZbZGPfLpiPIGvtUF+7BL5ggl5LMUzd7NzWxws4Hx/WenN54nErdYDZYzNM14aBR5TfSwPHGlToK4scvLWdNW2WxZJlxSks7KY48oDpcDYG5sSGj4PE76NiYKm5MVHG93+CwxTLtUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729031304; c=relaxed/simple;
	bh=a0RTiiha6mPWbx0b17T/7PmgKNeOnAvA7memI4GBDw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGHo7zz5tF6rPVU1bvNLhdBvS0gm6GIvJgFEmY7iYf734car/lyco7JyMgJ8FHWrH7/TaS6LLUUR9xtcpWHvGLnJptqrz6xJvY1rbSKScl19ZKPkeyEIn0QaN70Rof4eBhcDoc7BFUB9iICuok+ITGok7zotpxkWc7deyc7j/VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY0Zmj3U; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f58c68c5so4668940e87.3;
        Tue, 15 Oct 2024 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729031300; x=1729636100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0F9hGDWzIVb2s51Jm2CUB663+7VVD+hgyyNTHwDihY=;
        b=aY0Zmj3UeaFGCIMJAXMaEq+PAJ7A1br8ozZUW/8d9qDKtesnydkO9bSeGMzC1+eqZI
         9IcIst6YeVqjsqv8bsOHW4FRcmFIPXH/Pj/MpdkMV8AKePywZHet4vqBQ0L5dcHrKfAP
         KBw6QjpQZeuBM0VyzIFYMYMNNxtQ0uJH6ercPEZ8KeruP/MrRIy8XCIS62YPVSOFTPmd
         /87ewFexNzKoC7X2V1+ZtB7vTktENI81rEGFnHI8akKutemQxMid34sL5w9ztERiqDbw
         vm76v1k0m1AnNJY1vkHR1yVsd5MFYwios3bSLnSKP+dEImEEjNpYSVYH4/vPxO/r/kDK
         xH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729031300; x=1729636100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0F9hGDWzIVb2s51Jm2CUB663+7VVD+hgyyNTHwDihY=;
        b=rp4Omjjv56Owoy/RTCBv20Fvy9g4lVs8Nzm1H/jNbaSPAxJoaagnZlA/vHiVbF5eeC
         yt010UZK4Owu4KE0w9lSq3HaEIKV9OKlu8wYverG0iMuUIUKw28aBGZp5m6ftdvK/rjm
         zU0gxXaPbmPRqlMdgn5xpwKhb19py0yrswBiKIO4igWsjL6btJ9eDs52uw8sSO5n4Y4k
         9Ie2z76CtKzussi8gE0sgQ8opchxP/Rgpb7np+NOBagW7UrbBxYsis1q/I5Ttzvnds8H
         Dd5+ik3DNlm6gGbxAVhj7pHN9yiQhxUREZAqVoqN9hEiSiYyCY+O6sUGhzJaXe3QoIby
         sEmg==
X-Forwarded-Encrypted: i=1; AJvYcCVoFsIGOQaUUfGzi3Af+HuWng6Uy/cx6TCyavw1o7CJwF2EKinFNDHknk1Kt5FIQivR3jq3DKQAwp6Hfw==@vger.kernel.org, AJvYcCWAy/gLpj/WXzZn2UJH0ToxxCEBJ71ORBZ4rje9ZWvzmb3LsMS95Y9GLLf1rYDvfRmLYkFn3OCCrrYQH8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2oQwmWrGbwq5Z0OLQIAfskog6AqsgvXmpaBHz1n8M93Ro4Vy
	yNR2pfECDz9118QF6bjmABgCnj6MLaSX7b+UOvHqfDTfJUWg0DAU4BgBFscywHSdEEfSwuEIZhG
	Za4rksvPo/lx/4fKW2FtGtY0kJYtlefqwgc0=
X-Google-Smtp-Source: AGHT+IEOvUW2MCBOOC3CvM/WVZrY4cxy8meF6dDxj/umVRXZIMuduT9WF6UhD3hJnZCZUijAgv1vQzBuuyTK7omOXH4=
X-Received: by 2002:a05:6512:1048:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-539e54d771fmr8457207e87.1.1729031299879; Tue, 15 Oct 2024
 15:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162532.2292871-1-quic_mojha@quicinc.com>
 <CABCoZhB97E46NTRq-=JeUCH3V9fc45qC0WpA8qN2y6gxvWmbHA@mail.gmail.com> <Zw7COXsvJsWq4db9@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <Zw7COXsvJsWq4db9@hu-mojha-hyd.qualcomm.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Tue, 15 Oct 2024 15:28:08 -0700
Message-ID: <CABCoZhCDJfiRtUvQ-4ypaQsiktC3b22r4=TCy5V+RVeOb4wP+A@mail.gmail.com>
Subject: Re: [PATCH] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 12:28=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.co=
m> wrote:
>
> On Tue, Oct 15, 2024 at 10:59:12AM -0700, anish kumar wrote:
> > On Tue, Oct 15, 2024 at 9:26=E2=80=AFAM Mukesh Ojha <quic_mojha@quicinc=
.com> wrote:
> > >
> > > There is NULL pointer issue observed if from Process A where hid devi=
ce
> > > being added which results in adding a led_cdev addition and later a
> > > another call to access of led_cdev attribute from Process B can resul=
t
> > > in NULL pointer issue.
> >
> > Which pointer is NULL? Call stack shows that dualshock4_led_get_brightn=
ess
> > function could be culprit?
>
> in dualshock4_led_get_brightness()[1], led->dev is NULL here, as [2]
> is not yet completed.
>
> [1]
>  struct hid_device *hdev =3D to_hid_device(led->dev->parent);
>
> [2]
> led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
>                   led_cdev, led_cdev->groups, "%s", final_name);
>
> >
> > >
> > > Use mutex led_cdev->led_access to protect access to led->cdev and its
> > > attribute inside brightness_show().
> >
> > I don't think it is needed here because it is just calling the led driv=
er
> > callback and updating the brightness. So, why would we need to serializ=
e
> > that using mutex? Maybe the callback needs some debugging.
> > I'm curious if it is ready by the time the callback is invoked.
>
> Because, we should not be allowed to access led_cdev->dev as it is not
> completed and since, brightness_store() has this lock brightness_show()
> should also have this as we are seeing the issue without it.
>
> I hope, above might have answered your question.
>
> -Mukesh
> >
> > >
> > >         Process A                               Process B
> > >
> > >  kthread+0x114
> > >  worker_thread+0x244
> > >  process_scheduled_works+0x248
> > >  uhid_device_add_worker+0x24
> > >  hid_add_device+0x120
> > >  device_add+0x268
> > >  bus_probe_device+0x94
> > >  device_initial_probe+0x14
> > >  __device_attach+0xfc
> > >  bus_for_each_drv+0x10c
> > >  __device_attach_driver+0x14c
> > >  driver_probe_device+0x3c
> > >  __driver_probe_device+0xa0
> > >  really_probe+0x190
> > >  hid_device_probe+0x130
> > >  ps_probe+0x990
> > >  ps_led_register+0x94
> > >  devm_led_classdev_register_ext+0x58
> > >  led_classdev_register_ext+0x1f8
> > >  device_create_with_groups+0x48
> > >  device_create_groups_vargs+0xc8
> > >  device_add+0x244
> > >  kobject_uevent+0x14
> > >  kobject_uevent_env[jt]+0x224
> > >  mutex_unlock[jt]+0xc4
> > >  __mutex_unlock_slowpath+0xd4
> > >  wake_up_q+0x70
> > >  try_to_wake_up[jt]+0x48c
> > >  preempt_schedule_common+0x28
> > >  __schedule+0x628
> > >  __switch_to+0x174
> > >                                                 el0t_64_sync+0x1a8/0x=
1ac
> > >                                                 el0t_64_sync_handler+=
0x68/0xbc
> > >                                                 el0_svc+0x38/0x68
> > >                                                 do_el0_svc+0x1c/0x28
> > >                                                 el0_svc_common+0x80/0=
xe0
> > >                                                 invoke_syscall+0x58/0=
x114
> > >                                                 __arm64_sys_read+0x1c=
/0x2c
> > >                                                 ksys_read+0x78/0xe8
> > >                                                 vfs_read+0x1e0/0x2c8
> > >                                                 kernfs_fop_read_iter+=
0x68/0x1b4
> > >                                                 seq_read_iter+0x158/0=
x4ec
> > >                                                 kernfs_seq_show+0x44/=
0x54
> > >                                                 sysfs_kf_seq_show+0xb=
4/0x130
> > >                                                 dev_attr_show+0x38/0x=
74
> > >                                                 brightness_show+0x20/=
0x4c
> > >                                                 dualshock4_led_get_br=
ightness+0xc/0x74
> > >
> > > [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereferen=
ce at virtual address 0000000000000060
> > > [ 3313.874301][ T4013] Mem abort info:
> > > [ 3313.874303][ T4013]   ESR =3D 0x0000000096000006
> > > [ 3313.874305][ T4013]   EC =3D 0x25: DABT (current EL), IL =3D 32 bi=
ts
> > > [ 3313.874307][ T4013]   SET =3D 0, FnV =3D 0
> > > [ 3313.874309][ T4013]   EA =3D 0, S1PTW =3D 0
> > > [ 3313.874311][ T4013]   FSC =3D 0x06: level 2 translation fault
> > > [ 3313.874313][ T4013] Data abort info:
> > > [ 3313.874314][ T4013]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00=
000000
> > > [ 3313.874316][ T4013]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =
=3D 0
> > > [ 3313.874318][ T4013]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs=
 =3D 0
> > > [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=3D000=
00008f2b0a000
> > > ..
> > >
> > > [ 3313.874332][ T4013] Dumping ftrace buffer:
> > > [ 3313.874334][ T4013]    (ftrace buffer empty)
> > > ..
> > > ..
> > > [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> > > [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
> > > [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> > > [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> > > ..
> > > ..
> > > [ 3313.874685][ T4013] Call trace:
> > > [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> > > [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> > > [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> > > [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> > > [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> > > [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> > > [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> > > [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> > > [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> > > [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> > > [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> > > [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> > > [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> > > [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> > > [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> > > [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
> > >
> > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > ---
> > >  drivers/leds/led-class.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > index 06b97fd49ad9..e3cb93f19c06 100644
> > > --- a/drivers/leds/led-class.c
> > > +++ b/drivers/leds/led-class.c
> > > @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *dev,
> > >  {
> > >         struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > >
> > > -       /* no lock needed for this */

just get rid of the above comment then.

Also, the comment below in file leds.h
needs an update as originally the idea for this mutex lock was to
provide quick feedback to userspace based on this commit
https://github.com/torvalds/linux/commit/acd899e4f3066b6662f6047da5b795cc76=
2093cb

Basically a comment somewhere so that when a new attribute
gets added, it doesn't make the same mistake of not using the mutex
and run into the same issue.

/* Ensures consistent access to the LED Flash Class device */
struct mutex led_access;


> >
> > >> also you missed this.
> >
> > > +       mutex_lock(&led_cdev->led_access);
> > >         led_update_brightness(led_cdev);
> > > +       mutex_unlock(&led_cdev->led_access);
> > >
> > >         return sprintf(buf, "%u\n", led_cdev->brightness);
> > >  }
> > > --
> > > 2.34.1
> > >
> > >

