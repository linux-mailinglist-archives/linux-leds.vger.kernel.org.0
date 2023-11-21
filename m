Return-Path: <linux-leds+bounces-71-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 593337F34FE
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 18:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC18B2120E
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 17:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0619D54F84;
	Tue, 21 Nov 2023 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AgYch6cU"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D56AA4
	for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 09:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700588083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ByVZEV/reknZ3Zg3wcfs0e7TZbUblroVpHLSlR/l4z4=;
	b=AgYch6cUGguWhrnwfC0XMFcj+o7DHnmzsu+LV/cl3ZXoyakI47OcTxSNH2y7zUPHWQk4pc
	DS1abEz5vcQgrEcgk+pDLOs3g8+neI06gv3iNCroBHUhGG3FzteFlt2/5PyHoZu933nCTh
	+SSkc/GfjqqEhRrqvk/mym4dUhrr4Z0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-rGKosZ6wMEupPquXWHSzAQ-1; Tue, 21 Nov 2023 12:34:38 -0500
X-MC-Unique: rGKosZ6wMEupPquXWHSzAQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9fffa4c4f28so148336266b.3
        for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 09:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700588077; x=1701192877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByVZEV/reknZ3Zg3wcfs0e7TZbUblroVpHLSlR/l4z4=;
        b=n4PyxBgRohTzFLvyBD30LGkRoHJkR1JvZWH3GJCz5CRXuvtDL6foELFxeCmS7kw6u+
         dG4MMQgQbo9WfzRoTiZvFXWTwbkYIRrCRdgLYeA98MmH9eQ8Hf/dQApjBKf5DlSewRx8
         VHEBKu8Z5sWg6q1VBnLAy2Kj+4yJqlCjVeswthyMgWnFhHq7fRlvbngar2HfmdSfxadM
         rvBKDAafGxbIb+WgCxeZ01SARdzZkrUokGU8q7QewPOIp8DG0eDpwUzt0Ke4dBny9XvZ
         qtZceEXWvABJjf8z/4PMBhyk/RRNUwsVrRmqwUEBBMTe70aQFHg9vqkc9OKtBHb8sd+H
         uFQw==
X-Gm-Message-State: AOJu0Yx+qvrzR69UYuKilE7qMNL18nBslufdRS8YEX620wnuCZbDlyuv
	H7+IyuYgC3xjPBOTD6kxMlMqEfz206YhOVgJlLMXnR0Xh4777DUlI0SVLmMo9H4HglQvV78/9Ra
	iUfD2H6tc1Q381jJ5rt4G0Q==
X-Received: by 2002:a05:6402:b39:b0:543:5789:4d6c with SMTP id bo25-20020a0564020b3900b0054357894d6cmr36675edb.2.1700588077103;
        Tue, 21 Nov 2023 09:34:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKy8N59BGr+oQU2hwAvNDbYNuGAordRcRchCTrTK1v3eBt/CRoZoAT1IrqLNq4wWxfcNcfxA==
X-Received: by 2002:a05:6402:b39:b0:543:5789:4d6c with SMTP id bo25-20020a0564020b3900b0054357894d6cmr36656edb.2.1700588076759;
        Tue, 21 Nov 2023 09:34:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id k26-20020a056402049a00b0054855988fedsm4544787edv.37.2023.11.21.09.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:34:36 -0800 (PST)
Message-ID: <6a4134f1-4075-43d6-b238-56a31197f7fc@redhat.com>
Date: Tue, 21 Nov 2023 18:34:35 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: class: Don't expose color sysfs entry
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 =?UTF-8?Q?Johannes_Pen=C3=9Fel?= <johannes.penssel@gmail.com>,
 Jeremy Soller <jeremy@system76.com>, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20231121162359.9332-1-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231121162359.9332-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/21/23 17:23, Takashi Iwai wrote:
> The commit c7d80059b086 ("leds: class: Store the color index in struct
> led_classdev") introduced a new sysfs entry "color" that is commonly
> created for the led classdev.  Unfortunately, this conflicts with the
> "color" sysfs entry of already existing drivers such as Logitech HID
> or System76 ACPI drivers.  The driver probe fails due to the conflict,
> hence it leads to a severe regression with the missing keyboard, for
> example.
> 
> This patch reverts partially the change in the commit above for
> removing the led class color sysfs entries again for addressing the
> regressions.  The newly introduced led_classdev.color field is kept as
> it's already used by other driver.
> 
> Fixes: c7d80059b086 ("leds: class: Store the color index in struct led_classdev")
> Reported-by: Johannes Penßel <johannes.penssel@gmail.com>
> Closes: https://lore.kernel.org/r/b5646db3-acff-45aa-baef-df3f660486fb@gmail.com
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218045
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218155
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1217172
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thank you for taking care of this, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
> 
> This is a sort of v2 patch, as it turned out that the full revert
> leads to a build error.
> 
>  Documentation/ABI/testing/sysfs-class-led |  9 ---------
>  drivers/leds/led-class.c                  | 14 --------------
>  2 files changed, 23 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index b2ff0012c0f2..2e24ac3bd7ef 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -59,15 +59,6 @@ Description:
>  		brightness. Reading this file when no hw brightness change
>  		event has happened will return an ENODATA error.
>  
> -What:		/sys/class/leds/<led>/color
> -Date:		June 2023
> -KernelVersion:	6.5
> -Description:
> -		Color of the LED.
> -
> -		This is a read-only file. Reading this file returns the color
> -		of the LED as a string (e.g: "red", "green", "multicolor").
> -
>  What:		/sys/class/leds/<led>/trigger
>  Date:		March 2006
>  KernelVersion:	2.6.17
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 974b84f6bd6a..ba1be15cfd8e 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -75,19 +75,6 @@ static ssize_t max_brightness_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(max_brightness);
>  
> -static ssize_t color_show(struct device *dev,
> -		struct device_attribute *attr, char *buf)
> -{
> -	const char *color_text = "invalid";
> -	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> -
> -	if (led_cdev->color < LED_COLOR_ID_MAX)
> -		color_text = led_colors[led_cdev->color];
> -
> -	return sysfs_emit(buf, "%s\n", color_text);
> -}
> -static DEVICE_ATTR_RO(color);
> -
>  #ifdef CONFIG_LEDS_TRIGGERS
>  static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
>  static struct bin_attribute *led_trigger_bin_attrs[] = {
> @@ -102,7 +89,6 @@ static const struct attribute_group led_trigger_group = {
>  static struct attribute *led_class_attrs[] = {
>  	&dev_attr_brightness.attr,
>  	&dev_attr_max_brightness.attr,
> -	&dev_attr_color.attr,
>  	NULL,
>  };
>  


