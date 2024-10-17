Return-Path: <linux-leds+bounces-3125-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7EE9A2B8C
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 19:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 517CBB21F31
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 17:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ED91DF26E;
	Thu, 17 Oct 2024 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDYsDxXc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0D1D95BE;
	Thu, 17 Oct 2024 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729187949; cv=none; b=vEmojqU4ARJhFXMZilpawsHJebM6/Ux2K8pMCjz9juUAOH08McQiRcHilxwAJvgF5QCAajy7aOygVUSfmCVd+fwGlOV+Ic2bIyR8EU9CGy4fIyqg6yEiVNVFOYDDgtxSObVy/itKDb2GkFKF+OdKjNHUe/kEV2WHhBeZ1GxwVUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729187949; c=relaxed/simple;
	bh=7SqJC9pFiwbpf0LX/JQifbtAyBNyeDs3+hWmcbAqqTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMjUy87h6UstuHaxGfRlsKcvdia4NyolAoCu+jU8H69QIzJr/yeYRX+9SHhlQhuLcg64YJhIs1M89tPlDDZSknQw6nmvkKworRAzbvnPiW3gwxbnN5pv7YFflm5zKludwEAk9tMY5NFNBBl/diHvPgZixU9nO7QTvjo7eXXIp34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDYsDxXc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86e9db75b9so165194866b.1;
        Thu, 17 Oct 2024 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729187942; x=1729792742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvQrgOjAHlZRrBrPvACIpKwOIht0Nu1NboFA+g925w0=;
        b=KDYsDxXcPHxNxYN/W5yTvqi0zhXjIrwyFJyq6li985aMmU2b/wBerstaykJ2tTO4hW
         4vv/MKaWRkP/4aRs1nsfkZKTQvEoXWG1FNbwnHcVyF0I1hbEAFcaeOgnNXQ+mvS6LUbp
         TvN8+XyS39MPKaHb/bwZx4ABhEe3yLho2W1IyvK3TlKZrTnFSAYQyFKpsjqFXkvc720c
         CZuFl2bASYPQzraOZsvspF1PEAkIJo2M/nSmujKzxjixKam7tXxbJenIpDl8ozq9SvaH
         R01ySzmB9CEKa7wM/zfR8V/45tyD20jHfdAmE8IRTmAFR5u5J1XjwO+Iiy9MMdY05c4S
         3zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729187942; x=1729792742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvQrgOjAHlZRrBrPvACIpKwOIht0Nu1NboFA+g925w0=;
        b=aMKhnDGCi8JQf4Koonwpj+Ek9u6SiIm/whB0edBXhbFLoL59L5Y8mwFs/iTqocSjSk
         7kt50orgLLIipuh1UG2r8m26iiH4XEnS4o+4JbPbn+QALosU3QfYv5fZvC4yWIRJYBt/
         yHRGV9DKnLrjNjksJtOXqcOqquiRLfDhWez0nzd8Vf7y10/Vm6djjbEjr0CE9mA/Bwjb
         aPTe00z92YdOfqHtV3vcVkVVqMEXRXu5xddcMvZouvMm12jcQEsjPC0szuIGKlKslFGm
         eIpe1PjbQcKMcKcZyE5xWX5vLJIn1fs/S7wdw5VJsAtwsA6ikxWskXLDBUXlDlvgydnF
         +h4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHecwuzBiMFhgxeBIrDwkX+cyryfeLVIqBJeZU4duRtqRNeMKvXO5qw9Z6DS3qDImcpJQtcD51tYZC5w==@vger.kernel.org, AJvYcCVomYW6LZYNjkUPo5CR2DddIC164AFqV0Z99Pb/nZU9YfvtSw9XB4Ik7Z8A8gAwpm73zhnhxBYRnJQuXPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvxfGDPSnIETs4ZYFC40gamFwu+atmBphhpZLPl7z8hvexrRP
	4TtJL8/T9G1eyYTdraIf2Xx7/1hu3lKd3bvqQWTlMUD95W9KYFUl
X-Google-Smtp-Source: AGHT+IFM4ZPg3CHF2owqATI8AWOFfLVcMwgoTw/hnRbe9m/y27yBkr44haiyBLrYw93gkjmPWS4vYg==
X-Received: by 2002:a17:907:9489:b0:a99:e98f:e73d with SMTP id a640c23a62f3a-a99e9900010mr1382684066b.37.1729187941808;
        Thu, 17 Oct 2024 10:59:01 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2981765esm319154366b.129.2024.10.17.10.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 10:59:01 -0700 (PDT)
Message-ID: <c3965459-c295-c577-8b49-834ea4c19d55@gmail.com>
Date: Thu, 17 Oct 2024 19:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: anish kumar <yesanishhere@gmail.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241015162532.2292871-1-quic_mojha@quicinc.com>
 <CABCoZhB97E46NTRq-=JeUCH3V9fc45qC0WpA8qN2y6gxvWmbHA@mail.gmail.com>
 <Zw7COXsvJsWq4db9@hu-mojha-hyd.qualcomm.com>
 <CABCoZhCDJfiRtUvQ-4ypaQsiktC3b22r4=TCy5V+RVeOb4wP+A@mail.gmail.com>
 <Zw9S7LYZ1Sb/eMXe@hu-mojha-hyd.qualcomm.com>
 <CABCoZhBVEDKaaH36C+r4uMYo_08uRne9jikFCz8-yRuChR8JSw@mail.gmail.com>
 <385b7baa-8027-c4cf-948f-a1dff570befc@gmail.com>
 <CABCoZhBq4oFHOoPoWu2g=1Szry7bV9rBRgq_4zDxuS=17jfNhw@mail.gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CABCoZhBq4oFHOoPoWu2g=1Szry7bV9rBRgq_4zDxuS=17jfNhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/17/24 18:41, anish kumar wrote:
> On Thu, Oct 17, 2024 at 5:12 AM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>>
>> Hi Anish and Mukesh,
>>
>> On 10/16/24 18:37, anish kumar wrote:
>>> On Tue, Oct 15, 2024 at 10:45 PM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>>>>
>>>> On Tue, Oct 15, 2024 at 03:28:08PM -0700, anish kumar wrote:
>>>>> On Tue, Oct 15, 2024 at 12:28 PM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>>>>>>
>>>>>> On Tue, Oct 15, 2024 at 10:59:12AM -0700, anish kumar wrote:
>>>>>>> On Tue, Oct 15, 2024 at 9:26 AM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> There is NULL pointer issue observed if from Process A where hid device
>>>>>>>> being added which results in adding a led_cdev addition and later a
>>>>>>>> another call to access of led_cdev attribute from Process B can result
>>>>>>>> in NULL pointer issue.
>>>>>>>
>>>>>>> Which pointer is NULL? Call stack shows that dualshock4_led_get_brightness
>>>>>>> function could be culprit?
>>>>>>
>>>>>> in dualshock4_led_get_brightness()[1], led->dev is NULL here, as [2]
>>>>>> is not yet completed.
>>>>>>
>>>>>> [1]
>>>>>>    struct hid_device *hdev = to_hid_device(led->dev->parent);
>>>>>>
>>>>>> [2]
>>>>>> led_cdev->dev = device_create_with_groups(&leds_class, parent, 0,
>>>>>>                     led_cdev, led_cdev->groups, "%s", final_name);
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Use mutex led_cdev->led_access to protect access to led->cdev and its
>>>>>>>> attribute inside brightness_show().
>>>>>>>
>>>>>>> I don't think it is needed here because it is just calling the led driver
>>>>>>> callback and updating the brightness. So, why would we need to serialize
>>>>>>> that using mutex? Maybe the callback needs some debugging.
>>>>>>> I'm curious if it is ready by the time the callback is invoked.
>>>>>>
>>>>>> Because, we should not be allowed to access led_cdev->dev as it is not
>>>>>> completed and since, brightness_store() has this lock brightness_show()
>>>>>> should also have this as we are seeing the issue without it.
>>>>>>
>>>>>> I hope, above might have answered your question.
>>>>>>
>>>>>> -Mukesh
>>>>>>>
>>>>>>>>
>>>>>>>>           Process A                               Process B
>>>>>>>>
>>>>>>>>    kthread+0x114
>>>>>>>>    worker_thread+0x244
>>>>>>>>    process_scheduled_works+0x248
>>>>>>>>    uhid_device_add_worker+0x24
>>>>>>>>    hid_add_device+0x120
>>>>>>>>    device_add+0x268
>>>>>>>>    bus_probe_device+0x94
>>>>>>>>    device_initial_probe+0x14
>>>>>>>>    __device_attach+0xfc
>>>>>>>>    bus_for_each_drv+0x10c
>>>>>>>>    __device_attach_driver+0x14c
>>>>>>>>    driver_probe_device+0x3c
>>>>>>>>    __driver_probe_device+0xa0
>>>>>>>>    really_probe+0x190
>>>>>>>>    hid_device_probe+0x130
>>>>>>>>    ps_probe+0x990
>>>>>>>>    ps_led_register+0x94
>>>>>>>>    devm_led_classdev_register_ext+0x58
>>>>>>>>    led_classdev_register_ext+0x1f8
>>>>>>>>    device_create_with_groups+0x48
>>>>>>>>    device_create_groups_vargs+0xc8
>>>>>>>>    device_add+0x244
>>>>>>>>    kobject_uevent+0x14
>>>>>>>>    kobject_uevent_env[jt]+0x224
>>>>>>>>    mutex_unlock[jt]+0xc4
>>>>>>>>    __mutex_unlock_slowpath+0xd4
>>>>>>>>    wake_up_q+0x70
>>>>>>>>    try_to_wake_up[jt]+0x48c
>>>>>>>>    preempt_schedule_common+0x28
>>>>>>>>    __schedule+0x628
>>>>>>>>    __switch_to+0x174
>>>>>>>>                                                   el0t_64_sync+0x1a8/0x1ac
>>>>>>>>                                                   el0t_64_sync_handler+0x68/0xbc
>>>>>>>>                                                   el0_svc+0x38/0x68
>>>>>>>>                                                   do_el0_svc+0x1c/0x28
>>>>>>>>                                                   el0_svc_common+0x80/0xe0
>>>>>>>>                                                   invoke_syscall+0x58/0x114
>>>>>>>>                                                   __arm64_sys_read+0x1c/0x2c
>>>>>>>>                                                   ksys_read+0x78/0xe8
>>>>>>>>                                                   vfs_read+0x1e0/0x2c8
>>>>>>>>                                                   kernfs_fop_read_iter+0x68/0x1b4
>>>>>>>>                                                   seq_read_iter+0x158/0x4ec
>>>>>>>>                                                   kernfs_seq_show+0x44/0x54
>>>>>>>>                                                   sysfs_kf_seq_show+0xb4/0x130
>>>>>>>>                                                   dev_attr_show+0x38/0x74
>>>>>>>>                                                   brightness_show+0x20/0x4c
>>>>>>>>                                                   dualshock4_led_get_brightness+0xc/0x74
>>>>>>>>
>>>>>>>> [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
>>>>>>>> [ 3313.874301][ T4013] Mem abort info:
>>>>>>>> [ 3313.874303][ T4013]   ESR = 0x0000000096000006
>>>>>>>> [ 3313.874305][ T4013]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>>>>>> [ 3313.874307][ T4013]   SET = 0, FnV = 0
>>>>>>>> [ 3313.874309][ T4013]   EA = 0, S1PTW = 0
>>>>>>>> [ 3313.874311][ T4013]   FSC = 0x06: level 2 translation fault
>>>>>>>> [ 3313.874313][ T4013] Data abort info:
>>>>>>>> [ 3313.874314][ T4013]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>>>>>>>> [ 3313.874316][ T4013]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>>>>>>> [ 3313.874318][ T4013]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>>>>>>> [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=00000008f2b0a000
>>>>>>>> ..
>>>>>>>>
>>>>>>>> [ 3313.874332][ T4013] Dumping ftrace buffer:
>>>>>>>> [ 3313.874334][ T4013]    (ftrace buffer empty)
>>>>>>>> ..
>>>>>>>> ..
>>>>>>>> [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
>>>>>>>> [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
>>>>>>>> [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
>>>>>>>> [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
>>>>>>>> ..
>>>>>>>> ..
>>>>>>>> [ 3313.874685][ T4013] Call trace:
>>>>>>>> [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
>>>>>>>> [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
>>>>>>>> [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
>>>>>>>> [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
>>>>>>>> [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
>>>>>>>> [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
>>>>>>>> [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
>>>>>>>> [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
>>>>>>>> [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
>>>>>>>> [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
>>>>>>>> [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
>>>>>>>> [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
>>>>>>>> [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
>>>>>>>> [ 3313.874727][ T4013]  el0_svc+0x38/0x68
>>>>>>>> [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
>>>>>>>> [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
>>>>>>>>
>>>>>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>>>>>> ---
>>>>>>>>    drivers/leds/led-class.c | 3 ++-
>>>>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>>>>>>> index 06b97fd49ad9..e3cb93f19c06 100644
>>>>>>>> --- a/drivers/leds/led-class.c
>>>>>>>> +++ b/drivers/leds/led-class.c
>>>>>>>> @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *dev,
>>>>>>>>    {
>>>>>>>>           struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>>>>>>>
>>>>>>>> -       /* no lock needed for this */
>>>>>
>>>>> just get rid of the above comment then.
>>>>
>>>> If you notice, it is already removed (-) .
>>>>
>>>>>
>>>>> Also, the comment below in file leds.h
>>>>> needs an update as originally the idea for this mutex lock was to
>>>>> provide quick feedback to userspace based on this commit
>>>>> https://github.com/torvalds/linux/commit/acd899e4f3066b6662f6047da5b795cc762093cb
>>>>>
>>>>> Basically a comment somewhere so that when a new attribute
>>>>> gets added, it doesn't make the same mistake of not using the mutex
>>>>> and run into the same issue.
>>>>>
>>>>> /* Ensures consistent access to the LED Flash Class device */
>>>>> struct mutex led_access;
>>>>
>>>> Thanks for accepting that it is an issue.
>>>> I think, comment is very obvious actually the patch you mentioned should
>>>> be in fixes tag as it introduced the lock but did not protect the show
>>>> while it does it for store.
>>>
>>> Yes, but that patch was added for supporting flash class
>>> device and wasn't explicitly to take care of the scenario that you
>>> are trying to handle and the above comment in leds.h states the same.
>>
>> Correct. led_access mutex was introduced to add support for preventing
>> any LED class device state changes originating from sysfs while
>> v4l2_flash wrapper owns the device.
>>
>> Since the inception of LED subsystem all the locking was deemed to be
>> the responsibility of every single LED class driver and initially sysfs
>> attr callbacks didn't have any locking. After some time when LED core
>> started to grow it turned out that it was required to lock the LED class
>> initialization sequence, so as not to give the userspace an opportunity
>> to set LED brightness on not fully initialized device, which was
>> introduced in [0]. led_access mutex was already in place so it was used.
>> However as you noticed, it is not used consistently across all LED class
>> sysfs attrs callbacks.
>>
>> Since brightness_show() does not acquire led_access mutex it is still
>> possible to call brightness_get op when LED class initialization
>> sequence is not yet finished.
>>
>> Still, I'd propose to first narrow down the issue and figure out what
>> actually causes NULL pointer dereference, as it apparently
>> originates from dualshock4_led_get_brightness and not from LED core.
> 
> Mukesh already explained the issue in earlier emails but here is the gist
> anyway.
> 
> led_cdev->dev = device_create_with_groups(&leds_class, parent, 0,
>    led_cdev, led_cdev->groups, "%s", final_name);
> 
> If you look at the above code, device_create_with_groups function
> can create all the sysfs and before it returns and assigns led_cdev->dev
> pointer, those sysfs callback can get triggered and if the callback
> accesses led_cdev->dev this variable, it will crash as it is not yet
> assigned.

Your trace ends in dualshock4_led_get_brightness(). Did you confirm that
NULL pointer dereference is caused by accessing led_cdev->dev there?

-- 
Best regards,
Jacek Anaszewski

