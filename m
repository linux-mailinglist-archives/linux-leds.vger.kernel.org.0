Return-Path: <linux-leds+bounces-3120-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D729A0FD8
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 18:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749582897DA
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 16:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E358B187877;
	Wed, 16 Oct 2024 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNpB+Yza"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E9186E54;
	Wed, 16 Oct 2024 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729096646; cv=none; b=cWYYMdUcnX/Vv1l2AWNS1YJRBNnNuOEo8FIYOPwSITTHWzdDhx0J46HemIdQAEcuCWZeAV1R+jJ1HZbmALAbA+F2PxEJiqDVtkxqTzTWaIpUfRwCA6EHDOUPmb5Q06xRBNLpPVmqMaoqcdsuH/GcfjSgR1U1Vz7RF00U/e+P4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729096646; c=relaxed/simple;
	bh=bVoWUf5JIeW58zUB1s8zMcbCML5/BH6VBU8jAl7/MG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hh4lMZOYllMQ9Bn0yfcojf6UH+ibL1LizX3lQ2VAqL23DJ4d6oa04170WZ/3bufRAE1jP2QvMFZtPWscdcLYAm00dos8/EbGS3s+D8Px0d1YsSSRDfDW+UQbL/6fTa6Fl9C1vltp1LGpz/gdTyQ6BDtQmHXjA9ShA0l5XGQMcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNpB+Yza; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f7606199so19252e87.0;
        Wed, 16 Oct 2024 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729096643; x=1729701443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luQKTNxR6ATZZds0S4gxL4eIwnavQ16i9lpfXcg6qJA=;
        b=LNpB+Yza0Dljpe0/N5NCTFo1h+op8Ae7ZePWgPNiMA4TL/UHBjtIO6CPewTgdNNZ7t
         0r08z1L96xI3Gn0gUK0yL7L18Vihflx/s/JELAmEkWJTLWnEGtBMCNuj4D6Oevg+bmgm
         w1psx7p5tUzEWhiR6V1Nyyhyig5gHh/D6sOupGmlMEywZnWggSHclwN7Qfr0Zw6mSgcP
         oT9jlnX+DndUa+tw79/lqCzxNSG2DKWpPUfVx5PJYS1ByPeVQUebQ5y0bRMwG6DrYCd5
         7DcvfO8lT7kC/iEeYwWrfJ9KEZCfZFWtIDdmhW/55BholqYHdmEYX75feYfevfotGJqF
         pqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729096643; x=1729701443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luQKTNxR6ATZZds0S4gxL4eIwnavQ16i9lpfXcg6qJA=;
        b=l1EYAGjjS1Ne/wCZr9S8paiNbpQh+K0sji85yZ6JJdIwBuzsbsnPR9yBFLRE9/PQvM
         +tWq4qkGwWqYOLHEO74w4DM/vJ4N64CXdGfEbNih2m8PgLZ6RCypmVjMTeGqfyIOP5GU
         GYcqaTdf4yfFZcDj4eRlS4l1hn1r1KqdhhjEc+e8JfxHBwSUW5j2V6VJO31KHS6tAxsq
         iIDPr8Z+316SXqlW/byvovntnXuKF59X57aP1HZWmL8In1ssSEKrl9rplENrZeSUvTsy
         REQ6K2kEMBmoWqNwBOip2FPBuh03da+DPhNAEWPvT0OmEUJ6i1qQdtgD/o69yp9yE53d
         tXUg==
X-Forwarded-Encrypted: i=1; AJvYcCWx26/4IDbFeyyoLm3/39xkgWtO7VNPcRvU/A4Hk583vWHIkunbvirDEirRVlBTDysPnU2bDCRLhnLUDg==@vger.kernel.org, AJvYcCXgx+z6kX0VonsZ8R7hznoLSH1BwUBJlze7OyqMVm5fcuw7Blvhe8RM4MA9lGQCQYS5JcBcesSnjMOhYXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPd5dwz7th9cGtSFdYGP9xp9oZVBXm9h4NHbIiYGTIX83Gj4i
	dmnxohiqHwj5J54G7EXVjxiyFMDwJOoRk/537FebHJ6GUAEME/fAqEboHqngWnQCtuAF57BwdkM
	KSoUCZznT73clor37qfeIc4lGQCEVksdlc4U=
X-Google-Smtp-Source: AGHT+IEnXpt9R2H4LAqyJIeLeBvmT6mKxXZzTR9N81dMq9nN7xB97LNUDsl5AB9GUvelMBjWfgrYC4Xst52VRlshyJA=
X-Received: by 2002:a05:6512:3c95:b0:537:a745:3e with SMTP id
 2adb3069b0e04-539da5939a5mr9870158e87.45.1729096642783; Wed, 16 Oct 2024
 09:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162532.2292871-1-quic_mojha@quicinc.com>
 <CABCoZhB97E46NTRq-=JeUCH3V9fc45qC0WpA8qN2y6gxvWmbHA@mail.gmail.com>
 <Zw7COXsvJsWq4db9@hu-mojha-hyd.qualcomm.com> <CABCoZhCDJfiRtUvQ-4ypaQsiktC3b22r4=TCy5V+RVeOb4wP+A@mail.gmail.com>
 <Zw9S7LYZ1Sb/eMXe@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <Zw9S7LYZ1Sb/eMXe@hu-mojha-hyd.qualcomm.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Wed, 16 Oct 2024 09:37:10 -0700
Message-ID: <CABCoZhBVEDKaaH36C+r4uMYo_08uRne9jikFCz8-yRuChR8JSw@mail.gmail.com>
Subject: Re: [PATCH] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 10:45=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.co=
m> wrote:
>
> On Tue, Oct 15, 2024 at 03:28:08PM -0700, anish kumar wrote:
> > On Tue, Oct 15, 2024 at 12:28=E2=80=AFPM Mukesh Ojha <quic_mojha@quicin=
c.com> wrote:
> > >
> > > On Tue, Oct 15, 2024 at 10:59:12AM -0700, anish kumar wrote:
> > > > On Tue, Oct 15, 2024 at 9:26=E2=80=AFAM Mukesh Ojha <quic_mojha@qui=
cinc.com> wrote:
> > > > >
> > > > > There is NULL pointer issue observed if from Process A where hid =
device
> > > > > being added which results in adding a led_cdev addition and later=
 a
> > > > > another call to access of led_cdev attribute from Process B can r=
esult
> > > > > in NULL pointer issue.
> > > >
> > > > Which pointer is NULL? Call stack shows that dualshock4_led_get_bri=
ghtness
> > > > function could be culprit?
> > >
> > > in dualshock4_led_get_brightness()[1], led->dev is NULL here, as [2]
> > > is not yet completed.
> > >
> > > [1]
> > >  struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> > >
> > > [2]
> > > led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
> > >                   led_cdev, led_cdev->groups, "%s", final_name);
> > >
> > > >
> > > > >
> > > > > Use mutex led_cdev->led_access to protect access to led->cdev and=
 its
> > > > > attribute inside brightness_show().
> > > >
> > > > I don't think it is needed here because it is just calling the led =
driver
> > > > callback and updating the brightness. So, why would we need to seri=
alize
> > > > that using mutex? Maybe the callback needs some debugging.
> > > > I'm curious if it is ready by the time the callback is invoked.
> > >
> > > Because, we should not be allowed to access led_cdev->dev as it is no=
t
> > > completed and since, brightness_store() has this lock brightness_show=
()
> > > should also have this as we are seeing the issue without it.
> > >
> > > I hope, above might have answered your question.
> > >
> > > -Mukesh
> > > >
> > > > >
> > > > >         Process A                               Process B
> > > > >
> > > > >  kthread+0x114
> > > > >  worker_thread+0x244
> > > > >  process_scheduled_works+0x248
> > > > >  uhid_device_add_worker+0x24
> > > > >  hid_add_device+0x120
> > > > >  device_add+0x268
> > > > >  bus_probe_device+0x94
> > > > >  device_initial_probe+0x14
> > > > >  __device_attach+0xfc
> > > > >  bus_for_each_drv+0x10c
> > > > >  __device_attach_driver+0x14c
> > > > >  driver_probe_device+0x3c
> > > > >  __driver_probe_device+0xa0
> > > > >  really_probe+0x190
> > > > >  hid_device_probe+0x130
> > > > >  ps_probe+0x990
> > > > >  ps_led_register+0x94
> > > > >  devm_led_classdev_register_ext+0x58
> > > > >  led_classdev_register_ext+0x1f8
> > > > >  device_create_with_groups+0x48
> > > > >  device_create_groups_vargs+0xc8
> > > > >  device_add+0x244
> > > > >  kobject_uevent+0x14
> > > > >  kobject_uevent_env[jt]+0x224
> > > > >  mutex_unlock[jt]+0xc4
> > > > >  __mutex_unlock_slowpath+0xd4
> > > > >  wake_up_q+0x70
> > > > >  try_to_wake_up[jt]+0x48c
> > > > >  preempt_schedule_common+0x28
> > > > >  __schedule+0x628
> > > > >  __switch_to+0x174
> > > > >                                                 el0t_64_sync+0x1a=
8/0x1ac
> > > > >                                                 el0t_64_sync_hand=
ler+0x68/0xbc
> > > > >                                                 el0_svc+0x38/0x68
> > > > >                                                 do_el0_svc+0x1c/0=
x28
> > > > >                                                 el0_svc_common+0x=
80/0xe0
> > > > >                                                 invoke_syscall+0x=
58/0x114
> > > > >                                                 __arm64_sys_read+=
0x1c/0x2c
> > > > >                                                 ksys_read+0x78/0x=
e8
> > > > >                                                 vfs_read+0x1e0/0x=
2c8
> > > > >                                                 kernfs_fop_read_i=
ter+0x68/0x1b4
> > > > >                                                 seq_read_iter+0x1=
58/0x4ec
> > > > >                                                 kernfs_seq_show+0=
x44/0x54
> > > > >                                                 sysfs_kf_seq_show=
+0xb4/0x130
> > > > >                                                 dev_attr_show+0x3=
8/0x74
> > > > >                                                 brightness_show+0=
x20/0x4c
> > > > >                                                 dualshock4_led_ge=
t_brightness+0xc/0x74
> > > > >
> > > > > [ 3313.874295][ T4013] Unable to handle kernel NULL pointer deref=
erence at virtual address 0000000000000060
> > > > > [ 3313.874301][ T4013] Mem abort info:
> > > > > [ 3313.874303][ T4013]   ESR =3D 0x0000000096000006
> > > > > [ 3313.874305][ T4013]   EC =3D 0x25: DABT (current EL), IL =3D 3=
2 bits
> > > > > [ 3313.874307][ T4013]   SET =3D 0, FnV =3D 0
> > > > > [ 3313.874309][ T4013]   EA =3D 0, S1PTW =3D 0
> > > > > [ 3313.874311][ T4013]   FSC =3D 0x06: level 2 translation fault
> > > > > [ 3313.874313][ T4013] Data abort info:
> > > > > [ 3313.874314][ T4013]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D =
0x00000000
> > > > > [ 3313.874316][ T4013]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAcces=
s =3D 0
> > > > > [ 3313.874318][ T4013]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0=
, Xs =3D 0
> > > > > [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=
=3D00000008f2b0a000
> > > > > ..
> > > > >
> > > > > [ 3313.874332][ T4013] Dumping ftrace buffer:
> > > > > [ 3313.874334][ T4013]    (ftrace buffer empty)
> > > > > ..
> > > > > ..
> > > > > [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> > > > > [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x7=
4
> > > > > [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> > > > > [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> > > > > ..
> > > > > ..
> > > > > [ 3313.874685][ T4013] Call trace:
> > > > > [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> > > > > [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> > > > > [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> > > > > [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> > > > > [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> > > > > [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> > > > > [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> > > > > [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> > > > > [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> > > > > [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> > > > > [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> > > > > [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> > > > > [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> > > > > [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> > > > > [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> > > > > [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
> > > > >
> > > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > > ---
> > > > >  drivers/leds/led-class.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > > > index 06b97fd49ad9..e3cb93f19c06 100644
> > > > > --- a/drivers/leds/led-class.c
> > > > > +++ b/drivers/leds/led-class.c
> > > > > @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *d=
ev,
> > > > >  {
> > > > >         struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > > >
> > > > > -       /* no lock needed for this */
> >
> > just get rid of the above comment then.
>
> If you notice, it is already removed (-) .
>
> >
> > Also, the comment below in file leds.h
> > needs an update as originally the idea for this mutex lock was to
> > provide quick feedback to userspace based on this commit
> > https://github.com/torvalds/linux/commit/acd899e4f3066b6662f6047da5b795=
cc762093cb
> >
> > Basically a comment somewhere so that when a new attribute
> > gets added, it doesn't make the same mistake of not using the mutex
> > and run into the same issue.
> >
> > /* Ensures consistent access to the LED Flash Class device */
> > struct mutex led_access;
>
> Thanks for accepting that it is an issue.
> I think, comment is very obvious actually the patch you mentioned should
> be in fixes tag as it introduced the lock but did not protect the show
> while it does it for store.

Yes, but that patch was added for supporting flash class
device and wasn't explicitly to take care of the scenario that you
are trying to handle and the above comment in leds.h states the same.

I think we should modify that comment and state clearly that
the aforementioned mutex is also to handle access to led_cdev->dev.
Either here in this .h or where attributes are defined, so that new attribu=
tes
that get added doesn't suffer from the same bug.

led_trigger_set also this function also suffers from the same bug so you
need to handle it the same way.

>
> Fixes: acd899e4f306 ("leds: implement sysfs interface locking mechanism")
>
> -Mukesh
> >
> >
> > > >
> > > > >> also you missed this.
> > > >
> > > > > +       mutex_lock(&led_cdev->led_access);
> > > > >         led_update_brightness(led_cdev);
> > > > > +       mutex_unlock(&led_cdev->led_access);
> > > > >
> > > > >         return sprintf(buf, "%u\n", led_cdev->brightness);
> > > > >  }
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >

