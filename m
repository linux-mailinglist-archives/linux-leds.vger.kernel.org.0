Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE0249F67A
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jan 2022 10:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243746AbiA1Jhr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jan 2022 04:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45096 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243717AbiA1Jhk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Jan 2022 04:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643362660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XnMqf5ueBAX7qn8w/qDvIbW+km/lT1uvtpvnYce/Nkg=;
        b=HqKSqVaEJC85PUxcsHBgtG8KmnC5EzZVRzjMGo+qbyxba4JGMWczEbZK5r3E6ZyILvMP3W
        5CdVKNzvGUIu0gtN9Pnqx2+TVPhJlJ6WE8PangLkLU9A7NtqBRmdBIypTSvbkDN0b4k8A0
        DBS5nHciK2/mXoQ3SPnVm5ZE9O0QBp0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-Hauksd7yMsWvfvb4VxhL9w-1; Fri, 28 Jan 2022 04:37:38 -0500
X-MC-Unique: Hauksd7yMsWvfvb4VxhL9w-1
Received: by mail-ed1-f70.google.com with SMTP id w15-20020a056402268f00b00408234dc1dfso2778439edd.16
        for <linux-leds@vger.kernel.org>; Fri, 28 Jan 2022 01:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XnMqf5ueBAX7qn8w/qDvIbW+km/lT1uvtpvnYce/Nkg=;
        b=SGCjm37jcy/a685GIMlxE0Rve37cTqLVTtRe5xKswSk46vqdPPybHvkAoHgKoNgihU
         d5vjce2QxElngLaANs82apDeddjsV3Ibyp6W8vjrL/UyPZBufa0JLLfGLJftQFG4cFpU
         QWJBE1iYnrVh5J6zXGUh4rWOnUzyIgAh0FokEo8CWUzf47LnQuxOU+aVcogQN5zlpkpk
         JVn2QCa59SyreBSYV4e3olir2YqOMlcNY94jIDJFXdck6mHHvFAYDgqhPTl6L35ehfpj
         xY+wh+Bz4gbMIVbTQizDbGsEA5Z4DM41jaZ2ijNkagNzIpBf9ZEr/k9U81unpLzOujup
         Nnwg==
X-Gm-Message-State: AOAM533jr6CA1pEeeFLbaNDdneaZcmQeAk4+MdUs8HaYdW0TCFXKbZOD
        bq+gF3xcPqOEy2wxpdYDLgLuXDS1b5BsVGCmSotzd1XgUmGQkgNDuNA0hD84nvbQHvMNiPRh15V
        pvMWJeniAyPWr4gAM6G/L0Q==
X-Received: by 2002:a05:6402:f0f:: with SMTP id i15mr7230581eda.327.1643362657446;
        Fri, 28 Jan 2022 01:37:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUsuFJLDnEGrln5fVuSCketfcyca7os8CbFTdpkmLBu7155FaDqLMmUCBBKmRRuhzb9h4QBw==
X-Received: by 2002:a05:6402:f0f:: with SMTP id i15mr7230561eda.327.1643362657193;
        Fri, 28 Jan 2022 01:37:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id bo19sm11368433edb.56.2022.01.28.01.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 01:37:36 -0800 (PST)
Message-ID: <a6c629fa-1b47-803d-9f16-a0d1df70dda9@redhat.com>
Date:   Fri, 28 Jan 2022 10:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] leds: simatic-ipc-leds: Don't directly deref
 ioremap_resource() returned ptr
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        gerd.haeussler.ext@siemens.com
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220117112109.215695-1-hdegoede@redhat.com>
 <20220117112109.215695-2-hdegoede@redhat.com>
 <20220128102907.2bf438e2@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220128102907.2bf438e2@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Henning,

On 1/28/22 10:30, Henning Schild wrote:
> Hi Hans,
> 
> this looks fine but also looks like someone should test it. What is the
> timeline on that? I would want that tested but will need a few more
> days to actually sit next to boxes and look at LEDs.

It would be nice to get this fix in before say 5.17-rc5, so testing
this a couple of days from now is fine.

Talking about merging this...

Pavel, since the original patch has landed through the pdx86 tree
in 5.17-rc1 and since these 2 patches are LED patches I was sorta
expecting you to pick these up.  But if it is easier for you,
I would also happy to make these patches part of a pdx86 fixes
pull-req for 5.17 .

Regards,

Hans






> 
> Gerd maybe you can try that? Should affect 127E only and can probably
> be applied onto our out-of-tree repo.
> 
> regards,
> Henning
> 
> Am Mon, 17 Jan 2022 12:21:09 +0100
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Sparse (rightly) currently gives the following warning:
>>
>> drivers/leds/simple/simatic-ipc-leds.c:155:40:
>>  sparse: sparse: incorrect type in assignment (different address
>> spaces) expected void *static [toplevel] simatic_ipc_led_memory
>>  got void [noderef] __iomem *
>>
>> Fix this by changing the type of simatic_ipc_led_memory to void
>> __iomem * and use readl()/writel() to access it.
>>
>> Cc: Henning Schild <henning.schild@siemens.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note this is not tested on actual hw, since I do not have the hw in
>> question ---
>>  drivers/leds/simple/simatic-ipc-leds.c | 32
>> +++++++++++++++----------- 1 file changed, 18 insertions(+), 14
>> deletions(-)
>>
>> diff --git a/drivers/leds/simple/simatic-ipc-leds.c
>> b/drivers/leds/simple/simatic-ipc-leds.c index
>> 179110448659..078d43f5ba38 100644 ---
>> a/drivers/leds/simple/simatic-ipc-leds.c +++
>> b/drivers/leds/simple/simatic-ipc-leds.c @@ -41,7 +41,7 @@ static
>> struct simatic_ipc_led simatic_ipc_leds_io[] = { /* the actual start
>> will be discovered with PCI, 0 is a placeholder */ static struct
>> resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K,
>> KBUILD_MODNAME); -static void *simatic_ipc_led_memory;
>> +static void __iomem *simatic_ipc_led_memory;
>>  
>>  static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
>>  	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
>> @@ -92,21 +92,22 @@ static void simatic_ipc_led_set_mem(struct
>> led_classdev *led_cd, enum led_brightness brightness)
>>  {
>>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
>> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
>> +	u32 val;
>>  
>> -	u32 *p;
>> -
>> -	p = simatic_ipc_led_memory + led->value;
>> -	*p = (*p & ~1) | (brightness == LED_OFF);
>> +	val = readl(reg);
>> +	val = (val & ~1) | (brightness == LED_OFF);
>> +	writel(val, reg);
>>  }
>>  
>>  static enum led_brightness simatic_ipc_led_get_mem(struct
>> led_classdev *led_cd) {
>>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
>> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
>> +	u32 val;
>>  
>> -	u32 *p;
>> -
>> -	p = simatic_ipc_led_memory + led->value;
>> -	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
>> +	val = readl(reg);
>> +	return (val & 1) ? LED_OFF : led_cd->max_brightness;
>>  }
>>  
>>  static int simatic_ipc_leds_probe(struct platform_device *pdev)
>> @@ -116,8 +117,9 @@ static int simatic_ipc_leds_probe(struct
>> platform_device *pdev) struct simatic_ipc_led *ipcled;
>>  	struct led_classdev *cdev;
>>  	struct resource *res;
>> +	void __iomem *reg;
>>  	int err, type;
>> -	u32 *p;
>> +	u32 val;
>>  
>>  	switch (plat->devmode) {
>>  	case SIMATIC_IPC_DEVICE_227D:
>> @@ -157,11 +159,13 @@ static int simatic_ipc_leds_probe(struct
>> platform_device *pdev) return PTR_ERR(simatic_ipc_led_memory);
>>  
>>  		/* initialize power/watchdog LED */
>> -		p = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
>> PM_WDT_OUT */
>> -		*p = (*p & ~1);
>> -		p = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
>> PM_BIOS_BOOT_N */
>> -		*p = (*p | 1);
>> +		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
>> PM_WDT_OUT */
>> +		val = readl(reg);
>> +		writel(val & ~1, reg);
>>  
>> +		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
>> PM_BIOS_BOOT_N */
>> +		val = readl(reg);
>> +		writel(val | 1, reg);
>>  		break;
>>  	default:
>>  		return -ENODEV;
> 

