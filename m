Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498A04B9E76
	for <lists+linux-leds@lfdr.de>; Thu, 17 Feb 2022 12:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiBQLRu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Feb 2022 06:17:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239671AbiBQLRt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Feb 2022 06:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F1921114FD8
        for <linux-leds@vger.kernel.org>; Thu, 17 Feb 2022 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645096653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uXEdvuS7wkNQjgkEy+ziB5EL/qlby+QRx21RMTe4sgc=;
        b=RjbcREqtF1MBEwFR7JMZ06/hE3jM3V959+rhUETrA13sWLvDairDHp7qTRaPF+uX3syzYe
        0wJF89EN3SunK64J8prEw3UgARcXElAZXaA+VonkazEXEkz6awPfhJStTAgsspK1CR2gDJ
        hPXqX+hx03mElal5J/vLL+vikwadIGM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-juWGG1ECNY2kaLtqiDfZOw-1; Thu, 17 Feb 2022 06:17:32 -0500
X-MC-Unique: juWGG1ECNY2kaLtqiDfZOw-1
Received: by mail-ed1-f70.google.com with SMTP id m11-20020a056402430b00b00410678d119eso3290257edc.21
        for <linux-leds@vger.kernel.org>; Thu, 17 Feb 2022 03:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uXEdvuS7wkNQjgkEy+ziB5EL/qlby+QRx21RMTe4sgc=;
        b=RwaHSA4y+LNgW5wCZTIQp5r7hvu4ByiNssEX6bhaI/Pi/V5ksALQl92nFgQMCMFtQc
         vYaYJIDz90MRwioUMr4gF66XV6S5ZEwKesA+2J0+AXp8pAkHR4xZ+QfvSDi4J2Wuhhkb
         Re0NKj+81qoOSlV/2KE1+bMudk1vEt3Tqh//8M79l9ZlfKUuq97LNHQ6CbgIow/ZJC5M
         9WY8z1b0p04UQl7b8TYJKn5BB4hEaHO6tF7+aF1tebh+5Yy5kmyOiW+DRqVUWAhNPvcX
         BHlpDNHEANd32wSnJ/8RCrSakBghv6l/vMRFGbQjtJNNB6g5FdxDQDCyxSD1kEaY1jyx
         4PcA==
X-Gm-Message-State: AOAM531LuyBX1eKm7sbnwlqLmB96Mq9c3N0OTo5rvim8VBVPwqngHo1j
        2AklIcngxSjQl7eqePZTJjjZYpLTOfVkGgFElUXPVU6cLE4Ur9QjkUsTQ+ppI1G1ziq9N+6eMR1
        kTi1yBWs6KG7iCcPX3WR7WA==
X-Received: by 2002:a17:906:b351:b0:6ca:8d27:526a with SMTP id cd17-20020a170906b35100b006ca8d27526amr1978762ejb.289.1645096651497;
        Thu, 17 Feb 2022 03:17:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1RAMj97k5/1k4gLBMXNwpqDp1C1IHxFmlqrePnxkYAxtYOfF60XKiypTz3ooH9dWFHS/nig==
X-Received: by 2002:a17:906:b351:b0:6ca:8d27:526a with SMTP id cd17-20020a170906b35100b006ca8d27526amr1978749ejb.289.1645096651284;
        Thu, 17 Feb 2022 03:17:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id a20sm1068802ejs.85.2022.02.17.03.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 03:17:30 -0800 (PST)
Message-ID: <86d6278c-3c96-2240-e358-8bda3112fc2e@redhat.com>
Date:   Thu, 17 Feb 2022 12:17:30 +0100
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
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi All,

Pavel, ping? What is the status of this series?

Regards,

Hans


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
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>
>>>
>>> Gerd maybe you can try that? Should affect 127E only and can
>>> probably be applied onto our out-of-tree repo.
>>>
>>> regards,
>>> Henning
>>>
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

