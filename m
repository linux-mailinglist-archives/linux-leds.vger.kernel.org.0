Return-Path: <linux-leds+bounces-3124-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 595179A293E
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 18:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C64C1C21FA4
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 16:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9991DF73F;
	Thu, 17 Oct 2024 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2RqZ5GC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630371DF269;
	Thu, 17 Oct 2024 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183306; cv=none; b=hMZWeqjO9Od1RZNV1rVDUFCQPeyOnWc/A+a5rOkWN++R0NKw4df/FrmMGHQ9ZZ5n5Hwh+y7rPW7kakW85JV5dey4dEk+ALUx/ooo7vakyCJjYy6r+AbgtLQcZIFlZsBNrphNW2vZOgvmg7bi4OzV0OiRFMMFnvCCW3Mh9WQmj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183306; c=relaxed/simple;
	bh=PLYUky9zvPNqrqkJ/B9gcdpk3OdefHM6/CcuBXwOldw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFGSbZEUagJ9Mr0LKD68nse/15ngCvejdFT6QSnEApYnbCAbQaCH7OrJhQe6W00U4CR4ZpgMv3j5zRDVqb3Og5KF4A6iXqvPy0j56w0qPpwi1hjTnFXkMn55q2y+o9g2/urj2S4JMJ2c25uuX1QgIDuPXoLmAv47hLF5k2x9vbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2RqZ5GC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1540950e87.0;
        Thu, 17 Oct 2024 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729183299; x=1729788099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YruI1wKdblVS9MrXyz8EFs1zb2kgu58gQQIrYue/4s=;
        b=h2RqZ5GC+e3Spr2841Awcc725jbh0ITwklaIUsdQJeSKsP0q0ors1ntaM3pWO5oK7b
         rXOVFqelgP560TSNqQ3OV3NS3+7GC+xGQVsBq5EmErRQVsj8REjYG1T8qOhOAv7Ynb2i
         Djm/7VdswB8DYlwT+odJI+NeeLRKmZrKqf0kwEoT/Bd8EY8Z+fgIygoymoVAhKd46jCl
         O90BVg1WapGRHM+yZIE6L4zrMYo97mNJdl9pF8j9YXIP8h2gG/MdAoT1MSzynwDNUgAg
         zwQ/OV6ZIjh3SwTi9k1WhAXTqFVmczgFr2NdEDPPaehPCm9aMJNnRposLQbI7gbk7+5+
         Pm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183299; x=1729788099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YruI1wKdblVS9MrXyz8EFs1zb2kgu58gQQIrYue/4s=;
        b=ObIqVU9SI8IhmOc7Wfgw0GEBw0fdIqBcns29DNB1BQW3Q3XhlgUQIPTT392Lzb+wJ+
         YNG4Tod71brObFajKZB/gamLxLjnvmyPsZ/DswxQlQO9guwplkVyvW2QY0NXVP+MU7fX
         gWzEmOzvTSVEqwIWv4Bnb0P8/7bPzOxy2e2ViAMXW2lNQVX8nwcD1UD+lnXCB6oO7vax
         H3soSrr03jaM0KMHp0Be/pDX8LNe2IxO+Asy38w0upe2A4SWArcFMeELDOwbDbjDsDba
         w/WARVwYSuutFZVa0FV4ZTC9cV7twySlQu/C5qj9jD1rhY9yN3ZqKzeJsvcDA3I+GIrs
         g7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUlnXYNOsOCRuM5e7vO+E9XIknbmG9YNUY6d6BQzf5r0czCjrKQjtlu85q7UwjjKIpU+IZhOMmgkV/lhg==@vger.kernel.org, AJvYcCWRU7OXJg3SQlFMutvmg7lH4fsBWO9/gHxkkEJyiJSZkBiRXVyKFt1UbTw3+oDzBRosmHMDwjkPUQV/xXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXzOry3Pm6mhOCYCYGvhg7eHumM4BP6u/DQXTLidjB0Mx9ZQv
	fb97DPGY60L2AMFa2bAsOg2Pp/sAkWvjyOM2PGTXfaPTM2Xncph7IWtZtdI0tELLkoxQXAgtLVv
	MIv3TzBxaL5KjglEzg+kOgokKeaA=
X-Google-Smtp-Source: AGHT+IElWI7n/rjmYnkCTeDlBzUXlzvOCvl3dSc57/weiN6h4uUc6kSy4cqaZkK6t0vdFuqwCgARu79lzCrywqz1t84=
X-Received: by 2002:a05:6512:b08:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53a03ea078amr5953155e87.0.1729183299029; Thu, 17 Oct 2024
 09:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162532.2292871-1-quic_mojha@quicinc.com>
 <CABCoZhB97E46NTRq-=JeUCH3V9fc45qC0WpA8qN2y6gxvWmbHA@mail.gmail.com>
 <Zw7COXsvJsWq4db9@hu-mojha-hyd.qualcomm.com> <CABCoZhCDJfiRtUvQ-4ypaQsiktC3b22r4=TCy5V+RVeOb4wP+A@mail.gmail.com>
 <Zw9S7LYZ1Sb/eMXe@hu-mojha-hyd.qualcomm.com> <CABCoZhBVEDKaaH36C+r4uMYo_08uRne9jikFCz8-yRuChR8JSw@mail.gmail.com>
 <385b7baa-8027-c4cf-948f-a1dff570befc@gmail.com>
In-Reply-To: <385b7baa-8027-c4cf-948f-a1dff570befc@gmail.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Thu, 17 Oct 2024 09:41:27 -0700
Message-ID: <CABCoZhBq4oFHOoPoWu2g=1Szry7bV9rBRgq_4zDxuS=17jfNhw@mail.gmail.com>
Subject: Re: [PATCH] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 5:12=E2=80=AFAM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> Hi Anish and Mukesh,
>
> On 10/16/24 18:37, anish kumar wrote:
> > On Tue, Oct 15, 2024 at 10:45=E2=80=AFPM Mukesh Ojha <quic_mojha@quicin=
c.com> wrote:
> >>
> >> On Tue, Oct 15, 2024 at 03:28:08PM -0700, anish kumar wrote:
> >>> On Tue, Oct 15, 2024 at 12:28=E2=80=AFPM Mukesh Ojha <quic_mojha@quic=
inc.com> wrote:
> >>>>
> >>>> On Tue, Oct 15, 2024 at 10:59:12AM -0700, anish kumar wrote:
> >>>>> On Tue, Oct 15, 2024 at 9:26=E2=80=AFAM Mukesh Ojha <quic_mojha@qui=
cinc.com> wrote:
> >>>>>>
> >>>>>> There is NULL pointer issue observed if from Process A where hid d=
evice
> >>>>>> being added which results in adding a led_cdev addition and later =
a
> >>>>>> another call to access of led_cdev attribute from Process B can re=
sult
> >>>>>> in NULL pointer issue.
> >>>>>
> >>>>> Which pointer is NULL? Call stack shows that dualshock4_led_get_bri=
ghtness
> >>>>> function could be culprit?
> >>>>
> >>>> in dualshock4_led_get_brightness()[1], led->dev is NULL here, as [2]
> >>>> is not yet completed.
> >>>>
> >>>> [1]
> >>>>   struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> >>>>
> >>>> [2]
> >>>> led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
> >>>>                    led_cdev, led_cdev->groups, "%s", final_name);
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Use mutex led_cdev->led_access to protect access to led->cdev and =
its
> >>>>>> attribute inside brightness_show().
> >>>>>
> >>>>> I don't think it is needed here because it is just calling the led =
driver
> >>>>> callback and updating the brightness. So, why would we need to seri=
alize
> >>>>> that using mutex? Maybe the callback needs some debugging.
> >>>>> I'm curious if it is ready by the time the callback is invoked.
> >>>>
> >>>> Because, we should not be allowed to access led_cdev->dev as it is n=
ot
> >>>> completed and since, brightness_store() has this lock brightness_sho=
w()
> >>>> should also have this as we are seeing the issue without it.
> >>>>
> >>>> I hope, above might have answered your question.
> >>>>
> >>>> -Mukesh
> >>>>>
> >>>>>>
> >>>>>>          Process A                               Process B
> >>>>>>
> >>>>>>   kthread+0x114
> >>>>>>   worker_thread+0x244
> >>>>>>   process_scheduled_works+0x248
> >>>>>>   uhid_device_add_worker+0x24
> >>>>>>   hid_add_device+0x120
> >>>>>>   device_add+0x268
> >>>>>>   bus_probe_device+0x94
> >>>>>>   device_initial_probe+0x14
> >>>>>>   __device_attach+0xfc
> >>>>>>   bus_for_each_drv+0x10c
> >>>>>>   __device_attach_driver+0x14c
> >>>>>>   driver_probe_device+0x3c
> >>>>>>   __driver_probe_device+0xa0
> >>>>>>   really_probe+0x190
> >>>>>>   hid_device_probe+0x130
> >>>>>>   ps_probe+0x990
> >>>>>>   ps_led_register+0x94
> >>>>>>   devm_led_classdev_register_ext+0x58
> >>>>>>   led_classdev_register_ext+0x1f8
> >>>>>>   device_create_with_groups+0x48
> >>>>>>   device_create_groups_vargs+0xc8
> >>>>>>   device_add+0x244
> >>>>>>   kobject_uevent+0x14
> >>>>>>   kobject_uevent_env[jt]+0x224
> >>>>>>   mutex_unlock[jt]+0xc4
> >>>>>>   __mutex_unlock_slowpath+0xd4
> >>>>>>   wake_up_q+0x70
> >>>>>>   try_to_wake_up[jt]+0x48c
> >>>>>>   preempt_schedule_common+0x28
> >>>>>>   __schedule+0x628
> >>>>>>   __switch_to+0x174
> >>>>>>                                                  el0t_64_sync+0x1a=
8/0x1ac
> >>>>>>                                                  el0t_64_sync_hand=
ler+0x68/0xbc
> >>>>>>                                                  el0_svc+0x38/0x68
> >>>>>>                                                  do_el0_svc+0x1c/0=
x28
> >>>>>>                                                  el0_svc_common+0x=
80/0xe0
> >>>>>>                                                  invoke_syscall+0x=
58/0x114
> >>>>>>                                                  __arm64_sys_read+=
0x1c/0x2c
> >>>>>>                                                  ksys_read+0x78/0x=
e8
> >>>>>>                                                  vfs_read+0x1e0/0x=
2c8
> >>>>>>                                                  kernfs_fop_read_i=
ter+0x68/0x1b4
> >>>>>>                                                  seq_read_iter+0x1=
58/0x4ec
> >>>>>>                                                  kernfs_seq_show+0=
x44/0x54
> >>>>>>                                                  sysfs_kf_seq_show=
+0xb4/0x130
> >>>>>>                                                  dev_attr_show+0x3=
8/0x74
> >>>>>>                                                  brightness_show+0=
x20/0x4c
> >>>>>>                                                  dualshock4_led_ge=
t_brightness+0xc/0x74
> >>>>>>
> >>>>>> [ 3313.874295][ T4013] Unable to handle kernel NULL pointer derefe=
rence at virtual address 0000000000000060
> >>>>>> [ 3313.874301][ T4013] Mem abort info:
> >>>>>> [ 3313.874303][ T4013]   ESR =3D 0x0000000096000006
> >>>>>> [ 3313.874305][ T4013]   EC =3D 0x25: DABT (current EL), IL =3D 32=
 bits
> >>>>>> [ 3313.874307][ T4013]   SET =3D 0, FnV =3D 0
> >>>>>> [ 3313.874309][ T4013]   EA =3D 0, S1PTW =3D 0
> >>>>>> [ 3313.874311][ T4013]   FSC =3D 0x06: level 2 translation fault
> >>>>>> [ 3313.874313][ T4013] Data abort info:
> >>>>>> [ 3313.874314][ T4013]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0=
x00000000
> >>>>>> [ 3313.874316][ T4013]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess=
 =3D 0
> >>>>>> [ 3313.874318][ T4013]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0,=
 Xs =3D 0
> >>>>>> [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=3D=
00000008f2b0a000
> >>>>>> ..
> >>>>>>
> >>>>>> [ 3313.874332][ T4013] Dumping ftrace buffer:
> >>>>>> [ 3313.874334][ T4013]    (ftrace buffer empty)
> >>>>>> ..
> >>>>>> ..
> >>>>>> [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> >>>>>> [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
> >>>>>> [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> >>>>>> [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> >>>>>> ..
> >>>>>> ..
> >>>>>> [ 3313.874685][ T4013] Call trace:
> >>>>>> [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> >>>>>> [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> >>>>>> [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> >>>>>> [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> >>>>>> [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> >>>>>> [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> >>>>>> [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> >>>>>> [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> >>>>>> [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> >>>>>> [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> >>>>>> [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> >>>>>> [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> >>>>>> [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> >>>>>> [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> >>>>>> [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> >>>>>> [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
> >>>>>>
> >>>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> >>>>>> ---
> >>>>>>   drivers/leds/led-class.c | 3 ++-
> >>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> >>>>>> index 06b97fd49ad9..e3cb93f19c06 100644
> >>>>>> --- a/drivers/leds/led-class.c
> >>>>>> +++ b/drivers/leds/led-class.c
> >>>>>> @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *de=
v,
> >>>>>>   {
> >>>>>>          struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> >>>>>>
> >>>>>> -       /* no lock needed for this */
> >>>
> >>> just get rid of the above comment then.
> >>
> >> If you notice, it is already removed (-) .
> >>
> >>>
> >>> Also, the comment below in file leds.h
> >>> needs an update as originally the idea for this mutex lock was to
> >>> provide quick feedback to userspace based on this commit
> >>> https://github.com/torvalds/linux/commit/acd899e4f3066b6662f6047da5b7=
95cc762093cb
> >>>
> >>> Basically a comment somewhere so that when a new attribute
> >>> gets added, it doesn't make the same mistake of not using the mutex
> >>> and run into the same issue.
> >>>
> >>> /* Ensures consistent access to the LED Flash Class device */
> >>> struct mutex led_access;
> >>
> >> Thanks for accepting that it is an issue.
> >> I think, comment is very obvious actually the patch you mentioned shou=
ld
> >> be in fixes tag as it introduced the lock but did not protect the show
> >> while it does it for store.
> >
> > Yes, but that patch was added for supporting flash class
> > device and wasn't explicitly to take care of the scenario that you
> > are trying to handle and the above comment in leds.h states the same.
>
> Correct. led_access mutex was introduced to add support for preventing
> any LED class device state changes originating from sysfs while
> v4l2_flash wrapper owns the device.
>
> Since the inception of LED subsystem all the locking was deemed to be
> the responsibility of every single LED class driver and initially sysfs
> attr callbacks didn't have any locking. After some time when LED core
> started to grow it turned out that it was required to lock the LED class
> initialization sequence, so as not to give the userspace an opportunity
> to set LED brightness on not fully initialized device, which was
> introduced in [0]. led_access mutex was already in place so it was used.
> However as you noticed, it is not used consistently across all LED class
> sysfs attrs callbacks.
>
> Since brightness_show() does not acquire led_access mutex it is still
> possible to call brightness_get op when LED class initialization
> sequence is not yet finished.
>
> Still, I'd propose to first narrow down the issue and figure out what
> actually causes NULL pointer dereference, as it apparently
> originates from dualshock4_led_get_brightness and not from LED core.

Mukesh already explained the issue in earlier emails but here is the gist
anyway.

led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
  led_cdev, led_cdev->groups, "%s", final_name);

If you look at the above code, device_create_with_groups function
can create all the sysfs and before it returns and assigns led_cdev->dev
pointer, those sysfs callback can get triggered and if the callback
accesses led_cdev->dev this variable, it will crash as it is not yet
assigned.

In my opinion, we just have to put a proper comment in attribute creation
part so that if a new attribute gets added it uses the lock.
>
> I bet that the driver is not fully initialized up to the point when
> devm_led_classdev_register_ext() is called in it.
>
> >
> > I think we should modify that comment and state clearly that
> > the aforementioned mutex is also to handle access to led_cdev->dev.
> > Either here in this .h or where attributes are defined, so that new att=
ributes
> > that get added doesn't suffer from the same bug.
> >
> > led_trigger_set also this function also suffers from the same bug so yo=
u
> > need to handle it the same way.
>
> led_trigger_set() is already called with led_access mutex held in
> led_trigger_write(), i.e. from "trigger" sysfs attr.

makes sense.

>
> >>
> >> Fixes: acd899e4f306 ("leds: implement sysfs interface locking mechanis=
m")
> >>
> >> -Mukesh
> >>>
> >>>
> >>>>>
> >>>>>>> also you missed this.
> >>>>>
> >>>>>> +       mutex_lock(&led_cdev->led_access);
> >>>>>>          led_update_brightness(led_cdev);
> >>>>>> +       mutex_unlock(&led_cdev->led_access);
> >>>>>>
> >>>>>>          return sprintf(buf, "%u\n", led_cdev->brightness);
> >>>>>>   }
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>>>
> >
>
> [0]
> https://lore.kernel.org/linux-leds/20180523222221.27621-1-lhenriques@suse=
.com/
>
> --
> Best regards,
> Jacek Anaszewski

