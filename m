Return-Path: <linux-leds+bounces-3169-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B49B0BB6
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2024 19:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C9E31F29B02
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2024 17:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748F620BB2E;
	Fri, 25 Oct 2024 17:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eesz4yOz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FB20C331;
	Fri, 25 Oct 2024 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729877603; cv=none; b=VlWtQGt3iY1h2ibzvAIIH9YMri+JOwAgJhnkqCMEC4AE6j6y5EmU7tg7zavo1RXFrPX+ZCmg0PbZ0OcdEsW8PgZca/sIEXL7spGrnUhtB6+RK94NwcqqrdO78SKLMcv725Hv3BZKaaUZ5T3rDlPr1xPt9yV1ORCmAR/l6D015Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729877603; c=relaxed/simple;
	bh=d/UzsRPLzxQE01PBa4Hz2irteKgehW8+QrWvWfNnT4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdArDZUTHO5U5j4jUOEeC1+LvEUQF/0KEKkkZkkWsKxWC00SqUDU2BrOSb+WGBNtl6GlA6ZWEAVbVihCZwi/98yOQ9LQvoHukNpDIeUtIEBMS6nUQFzt0tszbtiLD9/sV0OcflMGYyxoKx9iw04DZI51nZto7GMJhknAZkaA3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eesz4yOz; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso36443951fa.3;
        Fri, 25 Oct 2024 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729877599; x=1730482399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99pybVDYRLslEdwwpZplxd7/ayJf5dnQpBoeoJ7r9Mo=;
        b=eesz4yOzYAljcUU0WnnDreQmW0NtmhCuV1AFCl4y8PROxZNEZF/UpI+h2d3LvrfHe7
         nMo23fsr8viowHe45BQoVReSLhssF9koW5UGYIE/hwW9wrnUX3N1Qy7k71M0dddy2hry
         iEugl2v0dzlWyzyMQjD5A51yd4mcfkbt6NuUrcolvsmF9HwOpRbUd4QkCPBn0MJpxLHA
         KtuCFbqkruUI3ATViybwdcA+hIXthlcqSmDXwTE+WQxV3gW5Bbjb5oOp5YdNXy3cxSY3
         6M7CXvnQn9cyqXdKTd/gvrv4e3HkfUwJvU8V+ZOBo+rrFTy5Po+VKJIYzhRLua8oOly0
         bkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877599; x=1730482399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99pybVDYRLslEdwwpZplxd7/ayJf5dnQpBoeoJ7r9Mo=;
        b=LPonlWdJAq1+Ha/pYjyzNGp6ow3RWANFk5i3+8XwUYgorsAHBbbR2leWPjrq/e6vmQ
         Qu4hqzEemArvmlNSVG8kTkE/dS3Ym6VlWFEIw1XCkZFw5w7k2B2RjBZupMb/QVubL/Mx
         Kq1DfMQnbpFwEPi8NK3ONpobFJW0GHtSuJVC87e2KMw22K2j20c4uLxo2gj8NFsG9bfW
         c8eOihL8WhpBzVEux4lRELZOIERL62kieCO/eSUgUW5V3X9OjpQt/NqrhaYOFKAze/2s
         P9+cJU1mKAxoWM4xWB2ZEAjNtiuRYd2M/yeOzRLW5UGPsQnkVmH93fZB2czBhnX5TNms
         zO3A==
X-Forwarded-Encrypted: i=1; AJvYcCWBaImPZlErpBzxOKnLpUwrbSvRHZwI7wQ08vNwdFvF9mckWK9WeVnJ2+OfKkMO/SYfcNN1vcG68X0dqw==@vger.kernel.org, AJvYcCXTnvniGchc0dL45gRt8msGMR4IRZCImIhMqkHhiD8PjCLI74UWmyBQti6MDTyUvEuCK4QMIigbK8ZXcl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeKgEqU8AdqgByANcfSA6cderVHLo02WUcl5XfzVWmxp3z2lc
	E/ajaIOV6n2nQZOYgcHSx/WlRJsKGI5LUw64xzts3tSo65CRk4KB4gpp1PAXs4Uqyc3FfNwkhsN
	cPI0KJF8DdeIjvGI1HS6G1cGOazm8Y95xXz0=
X-Google-Smtp-Source: AGHT+IE09xdjj9Dc7D7332AWO3EAAfpLIjImJNg4iJNEDX4xuHrmtvw4ate4URMxgxdhvrzIhvCTAEM/stCXttjjgXs=
X-Received: by 2002:a05:6512:224b:b0:531:8f2f:8ae7 with SMTP id
 2adb3069b0e04-53b348dac70mr17868e87.25.1729877598582; Fri, 25 Oct 2024
 10:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025171128.1226045-1-quic_mojha@quicinc.com>
In-Reply-To: <20241025171128.1226045-1-quic_mojha@quicinc.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Fri, 25 Oct 2024 10:33:06 -0700
Message-ID: <CABCoZhCR3GtExwjsxeoVPxK8OscEEF9SH9h2QbbfcKWfQ4+EfA@mail.gmail.com>
Subject: Re: [PATCH v2] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 10:12=E2=80=AFAM Mukesh Ojha <quic_mojha@quicinc.co=
m> wrote:
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

Reviewed-by: anish kumar <yesanishhere@gmail.com>
> ---
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
>         struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +       unsigned int brightness;
>
> -       /* no lock needed for this */
> +       mutex_lock(&led_cdev->led_access);
>         led_update_brightness(led_cdev);
> +       brightness =3D led_cdev->brightness;
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
>         struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +       unsigned int max_brightness;
> +
> +       mutex_lock(&led_cdev->led_access);
> +       max_brightness =3D led_cdev->max_brightness;
> +       mutex_unlock(&led_cdev->led_access);
>
> -       return sprintf(buf, "%u\n", led_cdev->max_brightness);
> +       return sprintf(buf, "%u\n", max_brightness);
>  }
>  static DEVICE_ATTR_RO(max_brightness);
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index e5968c3ed4ae..3524634fcc47 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -238,7 +238,7 @@ struct led_classdev {
>         struct kernfs_node      *brightness_hw_changed_kn;
>  #endif
>
> -       /* Ensures consistent access to the LED Flash Class device */
> +       /* Ensures consistent access to the LED Class device */
>         struct mutex            led_access;
>  };
>
> --
> 2.34.1
>
>

