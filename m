Return-Path: <linux-leds+bounces-3245-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279539BA750
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 18:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EF72814EB
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 17:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56A14F9E9;
	Sun,  3 Nov 2024 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yv1YqPJe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D447080F;
	Sun,  3 Nov 2024 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730656565; cv=none; b=kTfUNEOI7vixVCM6i9tbSBuPd1wRjMnVCvwtoJ/18LySpWniFjDn9FHangiLFkuYtIfNl7GlJEy1bsWgtJYfMqX10lXAKlT+GUVYFkkSCPoiBAMHDMVbDjs6Xw8O8pQCGDlP5s3rxmgwHCQPIpiG30rVNpbbO4Z89z3kIUcX6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730656565; c=relaxed/simple;
	bh=paxo03j/hKNdgK1yoYG9WqQcXD6SWqrFNKoEkcI+CkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbzlPiVZfWLYIfOJSlX7fM3JRY89wsBxDAsK9O7o/9xq65h2epLIhBjrZnED87M8i40y372X7yAynrjb1i0/EaeyyanNAUN/5ehHk761+I14pw/1sjDM4TPM4nDPaCokHcD7diKbr2s6JdUZfUbUVGWc0FQbxdwmtab0HY/LVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yv1YqPJe; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so41345041fa.1;
        Sun, 03 Nov 2024 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730656561; x=1731261361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jd+fxIoCWTSvZp/tGoyshzSMcbCvXc7tRidGMg1lBFs=;
        b=Yv1YqPJeSBcJV4HPZoz++YDqFKbAaBFRCLO3npGlxJOaI1mifYUQNZqr5F4OoRSv+p
         1aEjgIY5/adbFg5PVl2z74txWschw1sHeSGJhjSKI8n5asZqXKioCtWsbhzxgljIBXvm
         be7xnZh3G9313faB4u5T33wJ5g1DNQfMD+0hDkjyT43EMOJjgefPF4Ki5xeqVM484MOX
         YpK+gOrzImHQR2MDtKtkbv5ukpywArTu0qqIU+r5eolMjOyfCrbTr0I7Y8koR5kJxcdR
         rHxmV2aJhCb74O+lF0TSNjS0jh4s0LpvvI8EbPyY/lHQ3lUdVV84QXU8gcX28XN7ctIX
         HW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730656561; x=1731261361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jd+fxIoCWTSvZp/tGoyshzSMcbCvXc7tRidGMg1lBFs=;
        b=ItKp+EQhQlRPgcj01Pxc9jq8KEEAakiHdmV2923NMWHJaaPHTUfHb4jK6YpZuAG2xc
         1RJTHZjoCdN9NMIM9u7ujLUV1e4ttLpTc32fyXdYZuw5N/IXsesomvOULo754eA59YPv
         6/fyvvrq9CHsmF6JTvBKFgy5K46FUVnePxuaGl4X+gpNNVp493RgsXqAQUWFNDvQ1oYg
         iixqMvwB03REbcEcbrsgvkcidxaVq7aozfdDek93YO8zVjOZ1x8m2KIlLObmBB9AMysw
         9sg9nZh/Le9qG6ZRxrh9XAoIWJtHELnZJWesEtKKHbLkr1jV4t6tb10IuHdrZMxHctiP
         yZaw==
X-Forwarded-Encrypted: i=1; AJvYcCUNLt011N2GUfQ4ETCeKq7gYnNb5WjPdL6xJylhY61xP2oswTU/NZKr7Ip+r1O9/pxin8QAs3SGSE0jWQ==@vger.kernel.org, AJvYcCVlCRj7MJrbtdGzxVx3xw/q0JI8qcin+f4gg53AQVmpqqrRI9e/k4uXlcUOqsRqCAyId+6d6iK51yKCmlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxuuCsIUIuVFrueBXStiSK6y71i7lVn/BMoVCtzHiUE7YC21u
	pD5eF5cFHboRDKkHPSHEMRHbyMxXjAX8J4alXxngGrhN9h+LRGd1DVmRzOZCTJlxEROjYzdrRdz
	kQQhtrGhq+w+J2MiekeYsVpuTTK4=
X-Google-Smtp-Source: AGHT+IGUwOTFgCFbXye4flFgCdgrLWo4dE0+cJem5SaqKaZ8V5tgw4NSbRcAKpfpD7HH0Pqe+aYbB6OIqSA0yOcep7g=
X-Received: by 2002:a2e:a989:0:b0:2fb:382e:4105 with SMTP id
 38308e7fff4ca-2fdef271476mr35600281fa.11.1730656560601; Sun, 03 Nov 2024
 09:56:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103160527.82487-1-quic_mojha@quicinc.com>
In-Reply-To: <20241103160527.82487-1-quic_mojha@quicinc.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Sun, 3 Nov 2024 09:55:48 -0800
Message-ID: <CABCoZhCxgQmkpCtCUtSwpHRHzn-EUBRnT5jCEDGM0hh28Kkz5g@mail.gmail.com>
Subject: Re: [PATCH v3] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 3, 2024 at 8:15 AM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>
> There is NULL pointer issue observed if from Process A where hid device
> being added which results in adding a led_cdev addition and later a
> another call to access of led_cdev attribute from Process B can result
> in NULL pointer issue.
>
> Use mutex led_cdev->led_access to protect access to led->cdev and its
> attribute inside brightness_show() and max_brightness_show() and also
> update the comment for mutex that it should be used to protect the led
> class device fields.
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
>                                                 el0t_64_sync_handler+0x68/0xbc
>                                                 el0_svc+0x38/0x68
>                                                 do_el0_svc+0x1c/0x28
>                                                 el0_svc_common+0x80/0xe0
>                                                 invoke_syscall+0x58/0x114
>                                                 __arm64_sys_read+0x1c/0x2c
>                                                 ksys_read+0x78/0xe8
>                                                 vfs_read+0x1e0/0x2c8
>                                                 kernfs_fop_read_iter+0x68/0x1b4
>                                                 seq_read_iter+0x158/0x4ec
>                                                 kernfs_seq_show+0x44/0x54
>                                                 sysfs_kf_seq_show+0xb4/0x130
>                                                 dev_attr_show+0x38/0x74
>                                                 brightness_show+0x20/0x4c
>                                                 dualshock4_led_get_brightness+0xc/0x74
>
> [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
> [ 3313.874301][ T4013] Mem abort info:
> [ 3313.874303][ T4013]   ESR = 0x0000000096000006
> [ 3313.874305][ T4013]   EC = 0x25: DABT (current EL), IL = 32 bits
> [ 3313.874307][ T4013]   SET = 0, FnV = 0
> [ 3313.874309][ T4013]   EA = 0, S1PTW = 0
> [ 3313.874311][ T4013]   FSC = 0x06: level 2 translation fault
> [ 3313.874313][ T4013] Data abort info:
> [ 3313.874314][ T4013]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> [ 3313.874316][ T4013]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [ 3313.874318][ T4013]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=00000008f2b0a000
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


reviewed-by: Anish Kumar <yesanishhere@gmail.com>
>
>
> ---
> Changes in v3:
>  - s/Class/class in comment for variable led_access.
>
> Changes in v2:
>  - Updated the comment for led_access mutex lock.
>  - Also added mutex protection for max_brightness_show().
>
>  drivers/leds/led-class.c | 14 +++++++++++---
>  include/linux/leds.h     |  2 +-
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 06b97fd49ad9..f69f4e928d61 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -29,11 +29,14 @@ static ssize_t brightness_show(struct device *dev,
>                 struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       unsigned int brightness;
>
> -       /* no lock needed for this */
> +       mutex_lock(&led_cdev->led_access);
>         led_update_brightness(led_cdev);
> +       brightness = led_cdev->brightness;
> +       mutex_unlock(&led_cdev->led_access);
>
> -       return sprintf(buf, "%u\n", led_cdev->brightness);
> +       return sprintf(buf, "%u\n", brightness);
>  }
>
>  static ssize_t brightness_store(struct device *dev,
> @@ -70,8 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
>                 struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       unsigned int max_brightness;
> +
> +       mutex_lock(&led_cdev->led_access);
> +       max_brightness = led_cdev->max_brightness;
> +       mutex_unlock(&led_cdev->led_access);
>
> -       return sprintf(buf, "%u\n", led_cdev->max_brightness);
> +       return sprintf(buf, "%u\n", max_brightness);
>  }
>  static DEVICE_ATTR_RO(max_brightness);
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index e5968c3ed4ae..2337f516fa7c 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -238,7 +238,7 @@ struct led_classdev {
>         struct kernfs_node      *brightness_hw_changed_kn;
>  #endif
>
> -       /* Ensures consistent access to the LED Flash Class device */
> +       /* Ensures consistent access to the LED class device */
>         struct mutex            led_access;
>  };
>
> --
> 2.34.1
>
>

