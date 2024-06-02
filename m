Return-Path: <linux-leds+bounces-1810-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E58D75C8
	for <lists+linux-leds@lfdr.de>; Sun,  2 Jun 2024 15:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06918281BB9
	for <lists+linux-leds@lfdr.de>; Sun,  2 Jun 2024 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAE13B7AC;
	Sun,  2 Jun 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHEpe7pK"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A41173F
	for <linux-leds@vger.kernel.org>; Sun,  2 Jun 2024 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717335828; cv=none; b=Idki1j7wsVniHGQOcQEaBYoQeEya8iodQZbqH44j6a6lPI11xN2lioJmV/wkMAPkT/lGTN/JS3NVATiOBfMDxWCmodSRFROP9VJULTLQ6Rdanw4QZXiWwc6CIwSTpw1BcRyhgi7EXHZ3hrl96uPhLOn1ZYDUkbTFFfvBXQhHdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717335828; c=relaxed/simple;
	bh=MO9bnMyu61szu0BUAN62PydE8/47UObIWoeA3R9AZk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kf86Zl9m1w2vql0YYm9NWkM+mO2GOFFWpc0xvITVJ2QgnlIKiBxhhrVpjcyrUCXltLtAWQvk4aFOGpLh/mSxUzqB3cQBsoTcoaVxZfGzVwpAkybJXB4eoHug6qezjvM8+eGwG7I9BztO9oCx2Pz82XcNYTthVvjgdt3EeLVQuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHEpe7pK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717335824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9UELzpXtlxyLbGYvVDwBIqtSOdg44/N92yFov+i5ds=;
	b=XHEpe7pKd7SpkUBLar1LxHUYjiCaIjxdvP2cX/ctGkNAA5aWqltMwBNKMACCB5RPlpAVGs
	4nIz9T0CdfZbqYICAFIva4taAhF4PaSDPg1+51FBnZdozvW+66vEXQslk1aYaubizkWNVX
	hN1QL8kunuBWAlGp6XKRE5CCKOeP1KU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-mhEgAuJyO0uOl-vIZzt60Q-1; Sun, 02 Jun 2024 09:43:43 -0400
X-MC-Unique: mhEgAuJyO0uOl-vIZzt60Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6900c7ce42so9866566b.0
        for <linux-leds@vger.kernel.org>; Sun, 02 Jun 2024 06:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717335822; x=1717940622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9UELzpXtlxyLbGYvVDwBIqtSOdg44/N92yFov+i5ds=;
        b=plAj8lDFGrOkz/zClv2WMZyO61ijEcw2M51OpRelIKKn1UdIHpzXGKmPVefOBWobuG
         EuZYlTv6U3Tx7WlLxKDYhi8iJuXTmWo3pvgUDSkGBDGfaTEiHA5CPAPSpHiZnPzF8xhC
         MRGhxAApgcRtYjcqFzWjqnRCRZ3DjGGkTw+hCmlHuX/jX01AOq2ZA3IpeHPSgQER7KKZ
         mBCLHaf729IoVZVIyJ3fRP7cmtet6Rf+3pRpiKQutsdVTWi4GPC1FCp1l2TdkQTFm6VB
         XFNY49eFStERJ7v2UWKrzAHTIFLYZxjHw9403DbV2AQTACMUubMnw6Vi4WBSYvvoBBjC
         IGqw==
X-Forwarded-Encrypted: i=1; AJvYcCV1kKZ8qfX2Zjkacahj/omAgTr4NnhiWs7fI0qyi9XTtQBKHabzOc3iL4MUGpJgRVfoWc/23Y9bvUX03W6i/J/db+/fzbFHF1Oe7Q==
X-Gm-Message-State: AOJu0YxM+ERB3Zy9cKe//Izbg6UTcg0PGy/zbEimnwIODsFiE4m/0x0H
	qes5+4PtAu6MjswvJBjvg5PZWcLzohYW4cOV9giKVzvdMU7UBHdH8a4Q6m8yV8TZBmuNHROl4Y8
	sRXLrDVr7jCdFZVJDht1i/Qz7MOz9RCwRAcOM+EVxgfKeSfZPRc4X7cn8rU8=
X-Received: by 2002:a50:c05e:0:b0:57a:346:970f with SMTP id 4fb4d7f45d1cf-57a364561a1mr4477991a12.36.1717335821850;
        Sun, 02 Jun 2024 06:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjHJF8h51U2Ld6jfM6qic61fW3G+bDsP4rtosPAInkdnE5hzzeMz5QT4+8+LuK/uWyG9UnNA==
X-Received: by 2002:a50:c05e:0:b0:57a:346:970f with SMTP id 4fb4d7f45d1cf-57a364561a1mr4477982a12.36.1717335821331;
        Sun, 02 Jun 2024 06:43:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4e36sm3683163a12.53.2024.06.02.06.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 06:43:40 -0700 (PDT)
Message-ID: <211dfd5e-339d-4398-a90d-b432f0246a77@redhat.com>
Date: Sun, 2 Jun 2024 15:43:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/2] leds: trigger: input-events: Fix locking issues of
 input_lock vs led-trigger locks
To: Hillf Danton <hdanton@sina.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org
References: <20240601195528.48308-1-hdegoede@redhat.com>
 <20240602023049.3651-1-hdanton@sina.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240602023049.3651-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hillf,

On 6/2/24 4:30 AM, Hillf Danton wrote:
> On Sat,  1 Jun 2024 21:55:28 +0200 Hans de Goede <hdegoede@redhat.com>
>> The input subsystem registers LEDs with default triggers while holding
>> the input_lock and input_register_handler() takes the input_lock this
>> means that a triggers activate method cannot directly call
>> input_register_handler().
>>
>> Move the calling of input_register_handler() to the already existing
>> delayed-work to avoid this issue.
>>
>> Here is a lockdep from having the input-events trigger activated on a LED
>> and then after that plugging in a USB keyboard:
>>
>> [ 2840.220145] usb 1-1.3: new low-speed USB device number 3 using xhci_hcd
>> [ 2840.307172] usb 1-1.3: New USB device found, idVendor=0603, idProduct=0002, bcdDevice= 2.21
>> [ 2840.307375] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 2840.307423] usb 1-1.3: Product: USB Composite Device
>> [ 2840.307456] usb 1-1.3: Manufacturer: SINO WEALTH
>> [ 2840.333985] input: SINO WEALTH USB Composite Device as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.0/0003:0603:0002.0007/input/input19
>>
>> [ 2840.386545] ======================================================
>> [ 2840.386549] WARNING: possible circular locking dependency detected
>> [ 2840.386554] 6.10.0-rc1+ #97 Tainted: G         C  E
>> [ 2840.386558] ------------------------------------------------------
>> [ 2840.386562] kworker/1:1/52 is trying to acquire lock:
>> [ 2840.386566] ffff98fcf1629300 (&led_cdev->led_access){+.+.}-{3:3}, at: led_classdev_register_ext+0x1c6/0x380
>> [ 2840.386590]
>>                but task is already holding lock:
>> [ 2840.386593] ffffffff88130cc8 (input_mutex){+.+.}-{3:3}, at: input_register_device.cold+0x47/0x150
>> [ 2840.386608]
>>                which lock already depends on the new lock.
>>
>> [ 2840.386611]
>>                the existing dependency chain (in reverse order) is:
>> [ 2840.386615]
>>                -> #3 (input_mutex){+.+.}-{3:3}:
>> [ 2840.386624]        __mutex_lock+0x8c/0xc10
>> [ 2840.386634]        input_register_handler+0x1c/0xf0
>> [ 2840.386641]        0xffffffffc142c437
>> [ 2840.386655]        led_trigger_set+0x1e1/0x2e0
>> [ 2840.386661]        led_trigger_register+0x170/0x1b0
>> [ 2840.386666]        do_one_initcall+0x5e/0x3a0
>> [ 2840.386675]        do_init_module+0x60/0x220
>> [ 2840.386683]        __do_sys_init_module+0x15f/0x190
>> [ 2840.386689]        do_syscall_64+0x93/0x180
>> [ 2840.386696]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [ 2840.386705]
>>                -> #2 (&led_cdev->trigger_lock){+.+.}-{3:3}:
>> [ 2840.386714]        down_write+0x3b/0xd0
>> [ 2840.386720]        led_trigger_register+0x12c/0x1b0
>> [ 2840.386725]        rfkill_register+0xec/0x340 [rfkill]
>> [ 2840.386739]        wiphy_register+0x82a/0x930 [cfg80211]
>> [ 2840.386907]        brcmf_cfg80211_attach+0xcbd/0x1430 [brcmfmac]
>> [ 2840.386952]        brcmf_attach+0x1ba/0x4c0 [brcmfmac]
>> [ 2840.386991]        brcmf_pcie_setup+0x899/0xc70 [brcmfmac]
>> [ 2840.387030]        brcmf_fw_request_done+0x13b/0x180 [brcmfmac]
>> [ 2840.387070]        request_firmware_work_func+0x3b/0x70
>> [ 2840.387078]        process_one_work+0x21a/0x590
>> [ 2840.387085]        worker_thread+0x1d1/0x3e0
>> [ 2840.387090]        kthread+0xee/0x120
>> [ 2840.387096]        ret_from_fork+0x30/0x50
>> [ 2840.387105]        ret_from_fork_asm+0x1a/0x30
>> [ 2840.387112]
>>                -> #1 (leds_list_lock){++++}-{3:3}:
>> [ 2840.387123]        down_write+0x3b/0xd0
>> [ 2840.387129]        led_classdev_register_ext+0x29e/0x380
>> [ 2840.387134]        0xffffffffc0e6b74c
>> [ 2840.387143]        platform_probe+0x40/0xa0
>> [ 2840.387151]        really_probe+0xde/0x340
>> [ 2840.387157]        __driver_probe_device+0x78/0x110
>> [ 2840.387162]        driver_probe_device+0x1f/0xa0
>> [ 2840.387168]        __driver_attach+0xba/0x1c0
>> [ 2840.387173]        bus_for_each_dev+0x6b/0xb0
>> [ 2840.387180]        bus_add_driver+0x111/0x1f0
>> [ 2840.387185]        driver_register+0x6e/0xc0
>> [ 2840.387191]        do_one_initcall+0x5e/0x3a0
>> [ 2840.387197]        do_init_module+0x60/0x220
>> [ 2840.387204]        __do_sys_init_module+0x15f/0x190
>> [ 2840.387210]        do_syscall_64+0x93/0x180
>> [ 2840.387217]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [ 2840.387224]
>>                -> #0 (&led_cdev->led_access){+.+.}-{3:3}:
>> [ 2840.387233]        __lock_acquire+0x11c6/0x1f20
>> [ 2840.387239]        lock_acquire+0xc8/0x2b0
>> [ 2840.387244]        __mutex_lock+0x8c/0xc10
>> [ 2840.387251]        led_classdev_register_ext+0x1c6/0x380
>> [ 2840.387256]        input_leds_connect+0x139/0x260
>> [ 2840.387262]        input_attach_handler.isra.0+0x75/0x90
>> [ 2840.387268]        input_register_device.cold+0xa1/0x150
>> [ 2840.387274]        hidinput_connect+0x848/0xb00
>> [ 2840.387280]        hid_connect+0x567/0x5a0
>> [ 2840.387288]        hid_hw_start+0x3f/0x60
>> [ 2840.387294]        hid_device_probe+0x10d/0x190
>> [ 2840.387298]        really_probe+0xde/0x340
>> [ 2840.387304]        __driver_probe_device+0x78/0x110
>> [ 2840.387309]        driver_probe_device+0x1f/0xa0
>> [ 2840.387314]        __device_attach_driver+0x85/0x110
>> [ 2840.387320]        bus_for_each_drv+0x78/0xc0
>> [ 2840.387326]        __device_attach+0xb0/0x1b0
>> [ 2840.387332]        bus_probe_device+0x94/0xb0
>> [ 2840.387337]        device_add+0x64a/0x860
>> [ 2840.387343]        hid_add_device+0xe5/0x240
>> [ 2840.387349]        usbhid_probe+0x4bb/0x600
>> [ 2840.387356]        usb_probe_interface+0xea/0x2b0
>> [ 2840.387363]        really_probe+0xde/0x340
>> [ 2840.387368]        __driver_probe_device+0x78/0x110
>> [ 2840.387373]        driver_probe_device+0x1f/0xa0
>> [ 2840.387378]        __device_attach_driver+0x85/0x110
>> [ 2840.387383]        bus_for_each_drv+0x78/0xc0
>> [ 2840.387390]        __device_attach+0xb0/0x1b0
>> [ 2840.387395]        bus_probe_device+0x94/0xb0
>> [ 2840.387400]        device_add+0x64a/0x860
>> [ 2840.387405]        usb_set_configuration+0x5e8/0x880
>> [ 2840.387411]        usb_generic_driver_probe+0x3e/0x60
>> [ 2840.387418]        usb_probe_device+0x3d/0x120
>> [ 2840.387423]        really_probe+0xde/0x340
>> [ 2840.387428]        __driver_probe_device+0x78/0x110
>> [ 2840.387434]        driver_probe_device+0x1f/0xa0
>> [ 2840.387439]        __device_attach_driver+0x85/0x110
>> [ 2840.387444]        bus_for_each_drv+0x78/0xc0
>> [ 2840.387451]        __device_attach+0xb0/0x1b0
>> [ 2840.387456]        bus_probe_device+0x94/0xb0
>> [ 2840.387461]        device_add+0x64a/0x860
>> [ 2840.387466]        usb_new_device.cold+0x141/0x38f
>> [ 2840.387473]        hub_event+0x1166/0x1980
>> [ 2840.387479]        process_one_work+0x21a/0x590
>> [ 2840.387484]        worker_thread+0x1d1/0x3e0
>> [ 2840.387488]        kthread+0xee/0x120
>> [ 2840.387493]        ret_from_fork+0x30/0x50
>> [ 2840.387500]        ret_from_fork_asm+0x1a/0x30
>> [ 2840.387506]
>>                other info that might help us debug this:
>>
>> [ 2840.387509] Chain exists of:
>>                  &led_cdev->led_access --> &led_cdev->trigger_lock --> input_mutex
>>
>> [ 2840.387520]  Possible unsafe locking scenario:
>>
>> [ 2840.387523]        CPU0                    CPU1
>> [ 2840.387526]        ----                    ----
>> [ 2840.387529]   lock(input_mutex);
>> [ 2840.387534]                                lock(&led_cdev->trigger_lock);
>> [ 2840.387540]                                lock(input_mutex);
>> [ 2840.387545]   lock(&led_cdev->led_access);
>> [ 2840.387550]
>>                 *** DEADLOCK ***
>>
> Given the locking order
> 
> 	input_mutex
> 			leds_list_lock
> 			input_mutex
> 	leds_list_lock
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/leds/trigger/ledtrig-input-events.c | 40 ++++++++++++++-------
>>  1 file changed, 28 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
>> index 94d5580ea093..813b5782b2d2 100644
>> --- a/drivers/leds/trigger/ledtrig-input-events.c
>> +++ b/drivers/leds/trigger/ledtrig-input-events.c
>> @@ -6,6 +6,7 @@
>>   * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
>>   */
>>  
>> +#include <linux/dev_printk.h>
>>  #include <linux/input.h>
>>  #include <linux/jiffies.h>
>>  #include <linux/leds.h>
>> @@ -19,6 +20,8 @@
>>  
>>  /* To avoid repeatedly setting the brightness while there are events */
>>  #define FL_LED_ON					0
>> +#define FL_REGISTER_HANDLER				1
>> +#define FL_HANDLER_REGISTERED				2
>>  
>>  struct input_events_data {
>>  	struct input_handler handler;
>> @@ -35,6 +38,16 @@ static void led_input_events_work(struct work_struct *work)
>>  {
>>  	struct input_events_data *data =
>>  		container_of(work, struct input_events_data, work.work);
>> +	int ret;
>> +
>> +	/* Handler gets registered here (from work) to avoid locking issues */
>> +	if (test_and_clear_bit(FL_REGISTER_HANDLER, &data->flags)) {
>> +		ret = input_register_handler(&data->handler);
>> +		if (ret)
>> +			dev_err(data->led_cdev->dev, "Failed to register input handler\n");
>> +		else
>> +			set_bit(FL_HANDLER_REGISTERED, &data->flags);
>> +	}
>>  
>>  	spin_lock_irq(&data->lock);
>>  
>> @@ -164,7 +177,6 @@ static const struct input_device_id input_events_ids[] = {
>>  static int input_events_activate(struct led_classdev *led_cdev)
>>  {
>>  	struct input_events_data *data;
>> -	int ret;
>>  
>>  	data = kzalloc(sizeof(*data), GFP_KERNEL);
>>  	if (!data)
>> @@ -181,6 +193,7 @@ static int input_events_activate(struct led_classdev *led_cdev)
>>  
>>  	data->led_cdev = led_cdev;
>>  	data->led_cdev_saved_flags = led_cdev->flags;
>> +	data->led_off_time = jiffies;
>>  	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
>>  
>>  	/*
>> @@ -191,20 +204,15 @@ static int input_events_activate(struct led_classdev *led_cdev)
>>  	if (!led_cdev->blink_brightness)
>>  		led_cdev->blink_brightness = led_cdev->max_brightness;
>>  
>> -	/* Start with LED off */
>> -	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
>> -
>> -	ret = input_register_handler(&data->handler);
>> -	if (ret) {
>> -		kfree(data);
>> -		return ret;
>> -	}
>> -
>>  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
>>  
>>  	/* Turn LED off during suspend, original flags are restored on deactivate() */
>>  	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
>>  
>> +	/* Handler gets registered from work to avoid locking issues */
>> +	set_bit(FL_REGISTER_HANDLER, &data->flags);
>> +	queue_delayed_work(system_wq, &data->work, 0);
>> +
>>  	led_set_trigger_data(led_cdev, data);
>>  	return 0;
>>  }
>> @@ -213,10 +221,18 @@ static void input_events_deactivate(struct led_classdev *led_cdev)
>>  {
>>  	struct input_events_data *data = led_get_trigger_data(led_cdev);
>>  
>> +	/*
>> +	 * Ensure work queued from activate() has registered the handler
>> +	 * before unregistering it.
>> +	 */
>> +	flush_delayed_work(&data->work);
>> +	if (test_bit(FL_HANDLER_REGISTERED, &data->flags))
>> +		input_unregister_handler(&data->handler);
>> +
> 
> this change ends up with the deadlock intact.

Right I already mentioned this in the cover-letter, this is why this series
is RFC. I mostly still posted this upstream despite it not being a proper
fix to document the troubles of the complex problem of LEDs or LED triggers
getting registered by subsystems while holding a global lock from that
subsystem vs the activate / deactivate method of the trigger calling
functions of that same subsystem which require that same global lock.

I wanted to document my attempt at fixing this because this is basically
the same LED trigger problem as this 6.9+ regression:

https://lore.kernel.org/regressions/42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info/

which is a somewhat more complex version of the same base issue.

>> +	cancel_delayed_work_sync(&data->work);
>> +
>>  	led_cdev->flags = data->led_cdev_saved_flags;
>>  	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>> -	input_unregister_handler(&data->handler);
>> -	cancel_delayed_work_sync(&data->work);
>>  	kfree(data);
>>  }
>>  
>> -- 
>> 2.45.1
> 
> One option looks like adding .pre_deactivate cb to trigger, and invoking it
> in the deactivate path. It breaks the lock chain above by taking input_mutex
> outside leds_list_lock.

Thank you for the suggestion.

As I also mentioned in the cover-letter (and have implemented in the mean
time), I have fixed this by moving to using a simple input_handler registered
at module_init() time + calling input_trigger_event() on the trigger to set
the brightness of LEDs which have this trigger active.

Compared to the old code this looses the ability for the user to configure
a different brightness for the on state then LED_FULL, but that is something
which I can live with and since this trigger is only in for-leds-next atm
loosing that functionality is not a regression.

I'll post this fix for the locking issue to the list soon.

Regards,

Hans









> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -323,6 +323,9 @@ void led_trigger_unregister(struct led_t
>  	list_del_init(&trig->next_trig);
>  	up_write(&triggers_list_lock);
>  
> +	if (trig->pre_deactivate)
> +		trig->pre_deactivate(trig);
> +
>  	/* Remove anyone actively using this trigger */
>  	down_read(&leds_list_lock);
>  	list_for_each_entry(led_cdev, &leds_list, node) {
> 


