Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026BB4A8290
	for <lists+linux-leds@lfdr.de>; Thu,  3 Feb 2022 11:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiBCKno (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Feb 2022 05:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39682 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231520AbiBCKno (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Feb 2022 05:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643885023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kTRlikWNsk8qWf/8PN2xx5z6ktNWL74a8jVFp65fRis=;
        b=Z+ktYtMiNSa9bC0WePsmexrSsWcmz1tB7oiShOKzvXCa+lXoW8eomk6Rm2mLoq97vJSIY7
        w0yNBOGJ4Zo/I9JGH7+GE1antPCleevGQfJ+yVhYwhqnEwXWChymtPu74LEw/bbQtxAm0B
        lsczEdKKTT/3/fpwzUZGIkiKzqMHroI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-AdxcktjNOZKzDiRv7vnqEQ-1; Thu, 03 Feb 2022 05:43:42 -0500
X-MC-Unique: AdxcktjNOZKzDiRv7vnqEQ-1
Received: by mail-ed1-f71.google.com with SMTP id k5-20020a508ac5000000b00408dec8390aso1223010edk.13
        for <linux-leds@vger.kernel.org>; Thu, 03 Feb 2022 02:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kTRlikWNsk8qWf/8PN2xx5z6ktNWL74a8jVFp65fRis=;
        b=XkJ/xdv/S3sWJ5WhPLiyUsr+8esixStP6H4jhno4PW9Cu2tyklTgSXkAZ6Y47HWI+Y
         VvF6CVNpS56MgPu6QKVAyvzJAZa/BAk8CuPoJL41iGCrtc5cZHNZZ2kmQKJZMg+9DjUm
         kX8/XzW6eQO93iWqNQQFRG5rp/ZUsYuZ9SZYaduwZhZuufTEBhIc8BGaUYIgZhTEQMft
         FHO+VqYicjToPAlxa2zVVDxnWGVhdYqtr18lu95y1+0fOd5WrffcCgP7tNNCb3ZSa6O0
         okBFK4tvgUTad0Bc/jRRy8cM0jaenBHg16U+GeAa+EER86M7Jb22sncEJnQ3Zh38PDe/
         9EYw==
X-Gm-Message-State: AOAM531lgNUTAnf1nHlgsJwg4w7BcXebf95Fp9fimbHUCPXCMP6L7iQm
        mEK2unEhFsZxFo6x+RfLANRZpJZK/LrZC+p5UoC4GwWmOzShBWX8Fj88Fkby36DsdWVzutUwSRC
        4DNr7vouPdRgUjKUVIyM5nQ==
X-Received: by 2002:a50:8a89:: with SMTP id j9mr34362605edj.111.1643885021455;
        Thu, 03 Feb 2022 02:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVTH4x15dn4aMFa48pGSUUvqqopMpy5NaeluMMhNK87FFqVODDlJUFqIS98z58lSbZ2FetAA==
X-Received: by 2002:a50:8a89:: with SMTP id j9mr34362595edj.111.1643885021226;
        Thu, 03 Feb 2022 02:43:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id d22sm8582135ejr.138.2022.02.03.02.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 02:43:40 -0800 (PST)
Message-ID: <1f4d4bd7-b9f0-462a-594d-fe677163d876@redhat.com>
Date:   Thu, 3 Feb 2022 11:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] leds: simatic-ipc-leds: Don't directly deref
 ioremap_resource() returned ptr
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     gerd.haeussler.ext@siemens.com, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Henning Schild <henning.schild@siemens.com>
References: <20220117112109.215695-1-hdegoede@redhat.com>
 <20220117112109.215695-2-hdegoede@redhat.com>
 <20220128102907.2bf438e2@md1za8fc.ad001.siemens.net>
 <a6c629fa-1b47-803d-9f16-a0d1df70dda9@redhat.com>
 <20220128162629.27cf98ee@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220128162629.27cf98ee@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 1/28/22 16:26, Henning Schild wrote:
> Am Fri, 28 Jan 2022 10:37:36 +0100
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi Henning,
>>
>> On 1/28/22 10:30, Henning Schild wrote:
>>> Hi Hans,
>>>
>>> this looks fine but also looks like someone should test it. What is
>>> the timeline on that? I would want that tested but will need a few
>>> more days to actually sit next to boxes and look at LEDs.  
>>
>> It would be nice to get this fix in before say 5.17-rc5, so testing
>> this a couple of days from now is fine.
> 
> Gerd was so kind to just it done quickly today. He confirms its working
> as expected.
> 
> Thanks guys. I guess you could add a 
> 
> Tested-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> 
> if you want.
> 
> regards,
> Henning
>  
>> Talking about merging this...
>>
>> Pavel, since the original patch has landed through the pdx86 tree
>> in 5.17-rc1 and since these 2 patches are LED patches I was sorta
>> expecting you to pick these up.  But if it is easier for you,
>> I would also happy to make these patches part of a pdx86 fixes
>> pull-req for 5.17 .

Pavel, since this has also been tested now, I would be happy to pick
this series up as fixes for 5.17 (since the original simatic-ipc-leds
driver was merged for 5.17 through the pdx86 tree).

Since the original driver is in 5.17-rc1 this could also go upstream
through the leds tree though. Regardless this should be queued up
as fixes for 5.17 to fix the sparse warnings introduced by the new
driver.

Pavel, please let me know how you want to proceed with this ?

Regards,

Hans



>>> Am Mon, 17 Jan 2022 12:21:09 +0100
>>> schrieb Hans de Goede <hdegoede@redhat.com>:
>>>   
>>>> Sparse (rightly) currently gives the following warning:
>>>>
>>>> drivers/leds/simple/simatic-ipc-leds.c:155:40:
>>>>  sparse: sparse: incorrect type in assignment (different address
>>>> spaces) expected void *static [toplevel] simatic_ipc_led_memory
>>>>  got void [noderef] __iomem *
>>>>
>>>> Fix this by changing the type of simatic_ipc_led_memory to void
>>>> __iomem * and use readl()/writel() to access it.
>>>>
>>>> Cc: Henning Schild <henning.schild@siemens.com>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Note this is not tested on actual hw, since I do not have the hw in
>>>> question ---
>>>>  drivers/leds/simple/simatic-ipc-leds.c | 32
>>>> +++++++++++++++----------- 1 file changed, 18 insertions(+), 14
>>>> deletions(-)
>>>>
>>>> diff --git a/drivers/leds/simple/simatic-ipc-leds.c
>>>> b/drivers/leds/simple/simatic-ipc-leds.c index
>>>> 179110448659..078d43f5ba38 100644 ---
>>>> a/drivers/leds/simple/simatic-ipc-leds.c +++
>>>> b/drivers/leds/simple/simatic-ipc-leds.c @@ -41,7 +41,7 @@ static
>>>> struct simatic_ipc_led simatic_ipc_leds_io[] = { /* the actual
>>>> start will be discovered with PCI, 0 is a placeholder */ static
>>>> struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0,
>>>> SZ_4K, KBUILD_MODNAME); -static void *simatic_ipc_led_memory;
>>>> +static void __iomem *simatic_ipc_led_memory;
>>>>  
>>>>  static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
>>>>  	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
>>>> @@ -92,21 +92,22 @@ static void simatic_ipc_led_set_mem(struct
>>>> led_classdev *led_cd, enum led_brightness brightness)
>>>>  {
>>>>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
>>>> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
>>>> +	u32 val;
>>>>  
>>>> -	u32 *p;
>>>> -
>>>> -	p = simatic_ipc_led_memory + led->value;
>>>> -	*p = (*p & ~1) | (brightness == LED_OFF);
>>>> +	val = readl(reg);
>>>> +	val = (val & ~1) | (brightness == LED_OFF);
>>>> +	writel(val, reg);
>>>>  }
>>>>  
>>>>  static enum led_brightness simatic_ipc_led_get_mem(struct
>>>> led_classdev *led_cd) {
>>>>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
>>>> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
>>>> +	u32 val;
>>>>  
>>>> -	u32 *p;
>>>> -
>>>> -	p = simatic_ipc_led_memory + led->value;
>>>> -	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
>>>> +	val = readl(reg);
>>>> +	return (val & 1) ? LED_OFF : led_cd->max_brightness;
>>>>  }
>>>>  
>>>>  static int simatic_ipc_leds_probe(struct platform_device *pdev)
>>>> @@ -116,8 +117,9 @@ static int simatic_ipc_leds_probe(struct
>>>> platform_device *pdev) struct simatic_ipc_led *ipcled;
>>>>  	struct led_classdev *cdev;
>>>>  	struct resource *res;
>>>> +	void __iomem *reg;
>>>>  	int err, type;
>>>> -	u32 *p;
>>>> +	u32 val;
>>>>  
>>>>  	switch (plat->devmode) {
>>>>  	case SIMATIC_IPC_DEVICE_227D:
>>>> @@ -157,11 +159,13 @@ static int simatic_ipc_leds_probe(struct
>>>> platform_device *pdev) return PTR_ERR(simatic_ipc_led_memory);
>>>>  
>>>>  		/* initialize power/watchdog LED */
>>>> -		p = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
>>>> PM_WDT_OUT */
>>>> -		*p = (*p & ~1);
>>>> -		p = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
>>>> PM_BIOS_BOOT_N */
>>>> -		*p = (*p | 1);
>>>> +		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
>>>> PM_WDT_OUT */
>>>> +		val = readl(reg);
>>>> +		writel(val & ~1, reg);
>>>>  
>>>> +		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
>>>> PM_BIOS_BOOT_N */
>>>> +		val = readl(reg);
>>>> +		writel(val | 1, reg);
>>>>  		break;
>>>>  	default:
>>>>  		return -ENODEV;  
>>>   
>>
> 

