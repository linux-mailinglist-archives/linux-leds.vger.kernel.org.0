Return-Path: <linux-leds+bounces-3127-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295A9A2E82
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 22:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D5F281645
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 20:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5C417DFE0;
	Thu, 17 Oct 2024 20:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb306tc8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C19617BEC8;
	Thu, 17 Oct 2024 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197037; cv=none; b=KuUZmUslYCpHbHPDv5B0R2JVU5A82in4UgvEBItEMuJ77lwyxq/H96bBs91AMsY4Sq0pQdufqt5g2H21Vo3Ga+Njns+IMATuclIlVvmG6/SiK+ZZvZiee6j3u2AX33ZoLGxtN9h5jCV+WhLNmT/wNgh66KktUP2NSe9Bt7sF3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197037; c=relaxed/simple;
	bh=RmEk2a3SUN0mwg4Zxs4ZtRcHdZD43qyeKyfN8Z+pJKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WG94zwnjuV0okhWoIwbVbX/qdOyH6miSNhdG3AFjNE18eH9k0gxGwHf9VWa7tFK8tIub221d8OxxXtPntIdoeUwkRjWqHZjtLTmJNfxJXbQpoLMqxg8z2QE1nfEhnDp71Mt9hYFRCdPGhmXcLDslYb+JnxnSvqnAWMmnbgMO+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb306tc8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb443746b8so16972181fa.0;
        Thu, 17 Oct 2024 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729197030; x=1729801830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNxhyOHCQQ+glvsFF+JENSwwTbomwNvvYRHvuSnOhL4=;
        b=Nb306tc8uRH96fZbPga9IJbyb3tu/euAcNoYnQ+CzQMOpm6zecewi07w03RI+pDLiC
         TG9de4AiVn62AY7aR0/itU08NGTS7RaxT8erg9eNhvLBLw0H4VrfqbR/T/eIfQ+crexn
         KtVmtGyxzmnRMuQN19MehC+QEcO8pdi8H64t0d6mTXDe695x2R/cLAec532LkUn5MPYh
         bfBtWL3CrfjieBs/K3SSOH0YKLfZ73/M/wa+kMrUlM60TIsmWCMbjziwWTe3yxVZMY3C
         wC8/zLAMLRvkRtZBlvXZSdJIxd5Kpfy5gF566ioOSROV5PSJjRjFHhk1g6+iZ0RADvrN
         5AnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729197030; x=1729801830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNxhyOHCQQ+glvsFF+JENSwwTbomwNvvYRHvuSnOhL4=;
        b=V2Kco+eCnFnpS345LCO/qP9PM2rizXWo9ojJeI9X7NIkU6Qyk+JsFh7sJBv3DrqXZu
         Eusb3WAub1OdTUoEqMf8OctnOi/6gn8+yM+p8qpfngJr6rgzXslXIm7WTzsa+kHFeLUu
         y3Xt4WY3cI3eq3X/Tcx3sSiwplqfsEaep4tk5dCQg6ym3WrmAa/rdMn8WxstDRvty6xB
         F+69+gBmYXcjSpo4bbF1djWntIgpVuaoWjihiZK8ImPru4tUGDJoO/HcAkDtooJoNPCI
         QWmvG7cCWMcSeqvuWtH5vZ80LjIEobVFA2OBg3HkS/XINYUlBNo6pZc20525w+hqcVQL
         vWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGgtCo89dvTEhD/L5QiHo7Jyi1IcMFB2kxLOSlHeAGWBg5HvkOVqLUbe/Bz6wPr3O79yMKtUM+2DluPQ==@vger.kernel.org, AJvYcCWmnEQZNHzp/0jKdVKRWATIJ4+g2U5gyfaKhjf4wYigRoEUN8U91cYjJkDBpqa498QSZWvM9nPtADajZCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRJDzSKE2b3q0wHSmIDN1up+TsXDPFnNvagg77U/1PnpfpEhT
	a0/zWBgG73csWo+lazsPtkt5e2y8GV6hz4fR4rvnTQgETdtYg9DTXaaUIUcMX9QIYOeF8V8sNyL
	J9zP5yfQIpDgYzbodDDbO9UpNRxFYOqEfPjE=
X-Google-Smtp-Source: AGHT+IHnbPPdNB2w+U68jNynvP4GviJRjFcq6tnYXEleMnMCN8d1RhiI8vYxyzFYAoDrvYPvXCGYj486cGr6tpgU0ko=
X-Received: by 2002:a05:651c:1546:b0:2f5:2e2:eadf with SMTP id
 38308e7fff4ca-2fb61b4c4d3mr57319091fa.10.1729197030134; Thu, 17 Oct 2024
 13:30:30 -0700 (PDT)
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
 <385b7baa-8027-c4cf-948f-a1dff570befc@gmail.com> <CABCoZhBq4oFHOoPoWu2g=1Szry7bV9rBRgq_4zDxuS=17jfNhw@mail.gmail.com>
 <c3965459-c295-c577-8b49-834ea4c19d55@gmail.com>
In-Reply-To: <c3965459-c295-c577-8b49-834ea4c19d55@gmail.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Thu, 17 Oct 2024 13:30:18 -0700
Message-ID: <CABCoZhBmmmyQ6s27s_gXrv6rR9Wf672-t+OEg-PfdxReFdr++Q@mail.gmail.com>
Subject: Re: [PATCH] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 10:59=E2=80=AFAM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
>
>
> On 10/17/24 18:41, anish kumar wrote:
> > On Thu, Oct 17, 2024 at 5:12=E2=80=AFAM Jacek Anaszewski
> > <jacek.anaszewski@gmail.com> wrote:
> >>
> >> Hi Anish and Mukesh,
> >>
> >> On 10/16/24 18:37, anish kumar wrote:
> >>> On Tue, Oct 15, 2024 at 10:45=E2=80=AFPM Mukesh Ojha <quic_mojha@quic=
inc.com> wrote:
> >>>>
> >>>> On Tue, Oct 15, 2024 at 03:28:08PM -0700, anish kumar wrote:
> >>>>> On Tue, Oct 15, 2024 at 12:28=E2=80=AFPM Mukesh Ojha <quic_mojha@qu=
icinc.com> wrote:
> >>>>>>
> >>>>>> On Tue, Oct 15, 2024 at 10:59:12AM -0700, anish kumar wrote:
> >>>>>>> On Tue, Oct 15, 2024 at 9:26=E2=80=AFAM Mukesh Ojha <quic_mojha@q=
uicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> There is NULL pointer issue observed if from Process A where hid=
 device
> >>>>>>>> being added which results in adding a led_cdev addition and late=
r a
> >>>>>>>> another call to access of led_cdev attribute from Process B can =
result
> >>>>>>>> in NULL pointer issue.
> >>>>>>>
> >>>>>>> Which pointer is NULL? Call stack shows that dualshock4_led_get_b=
rightness
> >>>>>>> function could be culprit?
> >>>>>>
> >>>>>> in dualshock4_led_get_brightness()[1], led->dev is NULL here, as [=
2]
> >>>>>> is not yet completed.
> >>>>>>
> >>>>>> [1]
> >>>>>>    struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> >>>>>>
> >>>>>> [2]
> >>>>>> led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0=
,
> >>>>>>                     led_cdev, led_cdev->groups, "%s", final_name);
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Use mutex led_cdev->led_access to protect access to led->cdev an=
d its
> >>>>>>>> attribute inside brightness_show().
> >>>>>>>
> >>>>>>> I don't think it is needed here because it is just calling the le=
d driver
> >>>>>>> callback and updating the brightness. So, why would we need to se=
rialize
> >>>>>>> that using mutex? Maybe the callback needs some debugging.
> >>>>>>> I'm curious if it is ready by the time the callback is invoked.
> >>>>>>
> >>>>>> Because, we should not be allowed to access led_cdev->dev as it is=
 not
> >>>>>> completed and since, brightness_store() has this lock brightness_s=
how()
> >>>>>> should also have this as we are seeing the issue without it.
> >>>>>>
> >>>>>> I hope, above might have answered your question.
> >>>>>>
> >>>>>> -Mukesh
> >>>>>>>
> >>>>>>>>
> >>>>>>>>           Process A                               Process B
> >>>>>>>>
> >>>>>>>>    kthread+0x114
> >>>>>>>>    worker_thread+0x244
> >>>>>>>>    process_scheduled_works+0x248
> >>>>>>>>    uhid_device_add_worker+0x24
> >>>>>>>>    hid_add_device+0x120
> >>>>>>>>    device_add+0x268
> >>>>>>>>    bus_probe_device+0x94
> >>>>>>>>    device_initial_probe+0x14
> >>>>>>>>    __device_attach+0xfc
> >>>>>>>>    bus_for_each_drv+0x10c
> >>>>>>>>    __device_attach_driver+0x14c
> >>>>>>>>    driver_probe_device+0x3c
> >>>>>>>>    __driver_probe_device+0xa0
> >>>>>>>>    really_probe+0x190
> >>>>>>>>    hid_device_probe+0x130
> >>>>>>>>    ps_probe+0x990
> >>>>>>>>    ps_led_register+0x94
> >>>>>>>>    devm_led_classdev_register_ext+0x58
> >>>>>>>>    led_classdev_register_ext+0x1f8
> >>>>>>>>    device_create_with_groups+0x48
> >>>>>>>>    device_create_groups_vargs+0xc8
> >>>>>>>>    device_add+0x244
> >>>>>>>>    kobject_uevent+0x14
> >>>>>>>>    kobject_uevent_env[jt]+0x224
> >>>>>>>>    mutex_unlock[jt]+0xc4
> >>>>>>>>    __mutex_unlock_slowpath+0xd4
> >>>>>>>>    wake_up_q+0x70
> >>>>>>>>    try_to_wake_up[jt]+0x48c
> >>>>>>>>    preempt_schedule_common+0x28
> >>>>>>>>    __schedule+0x628
> >>>>>>>>    __switch_to+0x174
> >>>>>>>>                                                   el0t_64_sync+0=
x1a8/0x1ac
> >>>>>>>>                                                   el0t_64_sync_h=
andler+0x68/0xbc
> >>>>>>>>                                                   el0_svc+0x38/0=
x68
> >>>>>>>>                                                   do_el0_svc+0x1=
c/0x28
> >>>>>>>>                                                   el0_svc_common=
+0x80/0xe0
> >>>>>>>>                                                   invoke_syscall=
+0x58/0x114
> >>>>>>>>                                                   __arm64_sys_re=
ad+0x1c/0x2c
> >>>>>>>>                                                   ksys_read+0x78=
/0xe8
> >>>>>>>>                                                   vfs_read+0x1e0=
/0x2c8
> >>>>>>>>                                                   kernfs_fop_rea=
d_iter+0x68/0x1b4
> >>>>>>>>                                                   seq_read_iter+=
0x158/0x4ec
> >>>>>>>>                                                   kernfs_seq_sho=
w+0x44/0x54
> >>>>>>>>                                                   sysfs_kf_seq_s=
how+0xb4/0x130
> >>>>>>>>                                                   dev_attr_show+=
0x38/0x74
> >>>>>>>>                                                   brightness_sho=
w+0x20/0x4c
> >>>>>>>>                                                   dualshock4_led=
_get_brightness+0xc/0x74
> >>>>>>>>
> >>>>>>>> [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dere=
ference at virtual address 0000000000000060
> >>>>>>>> [ 3313.874301][ T4013] Mem abort info:
> >>>>>>>> [ 3313.874303][ T4013]   ESR =3D 0x0000000096000006
> >>>>>>>> [ 3313.874305][ T4013]   EC =3D 0x25: DABT (current EL), IL =3D =
32 bits
> >>>>>>>> [ 3313.874307][ T4013]   SET =3D 0, FnV =3D 0
> >>>>>>>> [ 3313.874309][ T4013]   EA =3D 0, S1PTW =3D 0
> >>>>>>>> [ 3313.874311][ T4013]   FSC =3D 0x06: level 2 translation fault
> >>>>>>>> [ 3313.874313][ T4013] Data abort info:
> >>>>>>>> [ 3313.874314][ T4013]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D=
 0x00000000
> >>>>>>>> [ 3313.874316][ T4013]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAcce=
ss =3D 0
> >>>>>>>> [ 3313.874318][ T4013]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D =
0, Xs =3D 0
> >>>>>>>> [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=
=3D00000008f2b0a000
> >>>>>>>> ..
> >>>>>>>>
> >>>>>>>> [ 3313.874332][ T4013] Dumping ftrace buffer:
> >>>>>>>> [ 3313.874334][ T4013]    (ftrace buffer empty)
> >>>>>>>> ..
> >>>>>>>> ..
> >>>>>>>> [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> >>>>>>>> [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x=
74
> >>>>>>>> [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> >>>>>>>> [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> >>>>>>>> ..
> >>>>>>>> ..
> >>>>>>>> [ 3313.874685][ T4013] Call trace:
> >>>>>>>> [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> >>>>>>>> [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> >>>>>>>> [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> >>>>>>>> [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> >>>>>>>> [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> >>>>>>>> [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> >>>>>>>> [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> >>>>>>>> [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> >>>>>>>> [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> >>>>>>>> [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> >>>>>>>> [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> >>>>>>>> [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> >>>>>>>> [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> >>>>>>>> [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> >>>>>>>> [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> >>>>>>>> [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
> >>>>>>>>
> >>>>>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>    drivers/leds/led-class.c | 3 ++-
> >>>>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> >>>>>>>> index 06b97fd49ad9..e3cb93f19c06 100644
> >>>>>>>> --- a/drivers/leds/led-class.c
> >>>>>>>> +++ b/drivers/leds/led-class.c
> >>>>>>>> @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *=
dev,
> >>>>>>>>    {
> >>>>>>>>           struct led_classdev *led_cdev =3D dev_get_drvdata(dev)=
;
> >>>>>>>>
> >>>>>>>> -       /* no lock needed for this */
> >>>>>
> >>>>> just get rid of the above comment then.
> >>>>
> >>>> If you notice, it is already removed (-) .
> >>>>
> >>>>>
> >>>>> Also, the comment below in file leds.h
> >>>>> needs an update as originally the idea for this mutex lock was to
> >>>>> provide quick feedback to userspace based on this commit
> >>>>> https://github.com/torvalds/linux/commit/acd899e4f3066b6662f6047da5=
b795cc762093cb
> >>>>>
> >>>>> Basically a comment somewhere so that when a new attribute
> >>>>> gets added, it doesn't make the same mistake of not using the mutex
> >>>>> and run into the same issue.
> >>>>>
> >>>>> /* Ensures consistent access to the LED Flash Class device */
> >>>>> struct mutex led_access;
> >>>>
> >>>> Thanks for accepting that it is an issue.
> >>>> I think, comment is very obvious actually the patch you mentioned sh=
ould
> >>>> be in fixes tag as it introduced the lock but did not protect the sh=
ow
> >>>> while it does it for store.
> >>>
> >>> Yes, but that patch was added for supporting flash class
> >>> device and wasn't explicitly to take care of the scenario that you
> >>> are trying to handle and the above comment in leds.h states the same.
> >>
> >> Correct. led_access mutex was introduced to add support for preventing
> >> any LED class device state changes originating from sysfs while
> >> v4l2_flash wrapper owns the device.
> >>
> >> Since the inception of LED subsystem all the locking was deemed to be
> >> the responsibility of every single LED class driver and initially sysf=
s
> >> attr callbacks didn't have any locking. After some time when LED core
> >> started to grow it turned out that it was required to lock the LED cla=
ss
> >> initialization sequence, so as not to give the userspace an opportunit=
y
> >> to set LED brightness on not fully initialized device, which was
> >> introduced in [0]. led_access mutex was already in place so it was use=
d.
> >> However as you noticed, it is not used consistently across all LED cla=
ss
> >> sysfs attrs callbacks.
> >>
> >> Since brightness_show() does not acquire led_access mutex it is still
> >> possible to call brightness_get op when LED class initialization
> >> sequence is not yet finished.
> >>
> >> Still, I'd propose to first narrow down the issue and figure out what
> >> actually causes NULL pointer dereference, as it apparently
> >> originates from dualshock4_led_get_brightness and not from LED core.
> >
> > Mukesh already explained the issue in earlier emails but here is the gi=
st
> > anyway.
> >
> > led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
> >    led_cdev, led_cdev->groups, "%s", final_name);
> >
> > If you look at the above code, device_create_with_groups function
> > can create all the sysfs and before it returns and assigns led_cdev->de=
v
> > pointer, those sysfs callback can get triggered and if the callback
> > accesses led_cdev->dev this variable, it will crash as it is not yet
> > assigned.
>
> Your trace ends in dualshock4_led_get_brightness(). Did you confirm that
> NULL pointer dereference is caused by accessing led_cdev->dev there?

Based on the comment from mukesh, he confirmed that.

Relevant comment from him:
"
in dualshock4_led_get_brightness()[1], led->dev is NULL here, as [2]
is not yet completed.

[1]
struct hid_device *hdev =3D to_hid_device(led->dev->parent);

[2]
led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
                       led_cdev, led_cdev->groups, "%s", final_name);
"
>
> --
> Best regards,
> Jacek Anaszewski

