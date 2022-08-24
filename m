Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF0F59FD27
	for <lists+linux-leds@lfdr.de>; Wed, 24 Aug 2022 16:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239138AbiHXOYy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Aug 2022 10:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239134AbiHXOYx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Aug 2022 10:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA73BD4C
        for <linux-leds@vger.kernel.org>; Wed, 24 Aug 2022 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661351090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tQke1uAFyf+l+gfskjhrFENVwnZBGyDHLkVnYKpq0b8=;
        b=SS+xMMTftpLu0QQYDHV4u7WWwukEnS6dF4ciYr+gAJ9wzpn7O5OufvYvxWpfp2ORRKcdoJ
        u6+bD4KDYkKitfddMQTtQHdWmyBFwkZ5qzu5XKSZsdi7PgtydVXGd3sXUR807BlbcOBJYn
        ywm5Qi8VNCg2XJ8oVfyJD8NCHZs21YA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-JY4KgtB8O2-Dllaf5hGjTg-1; Wed, 24 Aug 2022 10:24:48 -0400
X-MC-Unique: JY4KgtB8O2-Dllaf5hGjTg-1
Received: by mail-ed1-f69.google.com with SMTP id y14-20020a056402440e00b0044301c7ccd9so11000237eda.19
        for <linux-leds@vger.kernel.org>; Wed, 24 Aug 2022 07:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tQke1uAFyf+l+gfskjhrFENVwnZBGyDHLkVnYKpq0b8=;
        b=v4Paw06F4xBBTpkAECeWKCJKVgJOE+TZKAbPkWnT758XianKG7QEV5qZ/wlnIJ7VQU
         DbO1I1XWuvOSmPY3z9l1jEktuG9HVgdwDds8Jk3mnh+G0VwVHzyPQ99BO+eFBsHg0ifb
         ssiX+ozCN8W4HrscQGSxWjDg0/1+1zY8YC9k8bUEOPQN8LU8kgnToAsNXI1hnIV/8GAt
         a4NmyU9ZQV5dWCzGJncwAF+c/wADO5nsBkqFfJZ+Ta8mIemZ2zywBcxx9YFY3qMhGN9v
         oQOwzLRqlcjjGdBooGwnX++NdlYpW3bK3XoEwH3ibQZpghhliNM/tqZ+tWOH9hpR0rME
         2I0A==
X-Gm-Message-State: ACgBeo2qbOP9K41naMyb9RSYy2FII0I8LsxKphESQZCLJZ9ZkPYmK4Zu
        5F7HxRpdf0EWb8cY5AC5OcCLorTdJSWEN9ypzZffUBYpxYFkA1sY1yrVHRO5aqFVx4GZtPemtMP
        EvPIHA3YBwuSX5kflWaJSdg==
X-Received: by 2002:a17:907:9625:b0:730:ad62:9c86 with SMTP id gb37-20020a170907962500b00730ad629c86mr3011138ejc.281.1661351087758;
        Wed, 24 Aug 2022 07:24:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bv/Po/N8M1a0SF9Ql41Lt+GukBkl+BsrHt2uxtwsEvwijMYkrGatSVB5OWU9bIY5pkkWNYQ==
X-Received: by 2002:a17:907:9625:b0:730:ad62:9c86 with SMTP id gb37-20020a170907962500b00730ad629c86mr3011123ejc.281.1661351087546;
        Wed, 24 Aug 2022 07:24:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090653c700b0073d68d2fc29sm1185239ejo.218.2022.08.24.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 07:24:46 -0700 (PDT)
Message-ID: <3ec46cab-c775-824c-6bad-6fdddeea6e6a@redhat.com>
Date:   Wed, 24 Aug 2022 16:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/5] gpio-f7188x: Add GPIO support for Nuvoton NCT6116
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>
Cc:     simon.guinot@sequanux.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>
References: <20220823102344.17624-1-henning.schild@siemens.com>
 <20220823102344.17624-2-henning.schild@siemens.com>
 <YwToilxquEZGqzQD@smile.fi.intel.com>
 <20220823165459.143e1c30@md1za8fc.ad001.siemens.net>
 <YwYjXzsSHNe+J3aO@76cbfcf04d45>
 <20220824155038.5aa19495@md1za8fc.ad001.siemens.net>
 <a001efb5-95a3-d89d-32bd-557b6f11bb80@redhat.com>
 <20220824161757.4ca3bb97@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220824161757.4ca3bb97@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 8/24/22 16:17, Henning Schild wrote:
> Am Wed, 24 Aug 2022 15:54:28 +0200
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi Henning,
>>
>> On 8/24/22 15:50, Henning Schild wrote:
>>> Am Wed, 24 Aug 2022 15:10:55 +0200
>>> schrieb simon.guinot@sequanux.org:
>>>   
>>>> On Tue, Aug 23, 2022 at 04:54:59PM +0200, Henning Schild wrote:  
>>>>> Am Tue, 23 Aug 2022 17:47:38 +0300
>>>>> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:    
>>>>
>>>> Hi Andy,
>>>>
>>>> Thanks for this new version. It is looking good to me.
>>>>  
>>>>>     
>>>>>> On Tue, Aug 23, 2022 at 12:23:40PM +0200, Henning Schild wrote:
>>>>>>   
>>>>>>> Add GPIO support for Nuvoton NCT6116 chip. Nuvoton SuperIO
>>>>>>> chips are very similar to the ones from Fintek. In other
>>>>>>> subsystems they also share drivers and are called a family of
>>>>>>> drivers.
>>>>>>>
>>>>>>> For the GPIO subsystem the only difference is that the direction
>>>>>>> bit is reversed and that there is only one data bit per pin. On
>>>>>>> the SuperIO level the logical device is another one.
>>>>>>>
>>>>>>> On a chip level we do not have a manufacturer ID to check and
>>>>>>> also no revision.      
>>>>>>
>>>>>> ...
>>>>>>     
>>>>>>> - * GPIO driver for Fintek Super-I/O F71869, F71869A, F71882,
>>>>>>> F71889 and F81866
>>>>>>> + * GPIO driver for Fintek and Nuvoton Super-I/O chips      
>>>>>>
>>>>>> I'm not sure it's good idea to drop it from here. It means reader
>>>>>> has to get this info in a hard way.
>>>>>>
>>>>>> ...    
>>>>>
>>>>> Let us see what others say. I wanted to keep this in line with
>>>>> what Kconfig says and the oneliner in the Kconfig was getting
>>>>> pretty longish. Hence i decided to shorten that. Other drivers
>>>>> also seem to not list all the possible chips in many places, it
>>>>> is all maint effort when a new chips is added and the list is in
>>>>> like 5 places.    
>>>>
>>>> I agree with you that we can drop this line. It was already
>>>> incomplete and the information is quite readable a few lines below
>>>> in both the define list and the chip enumeration.
>>>>  
>>>>>     
>>>>>>> +#define gpio_dir_invert(type)	((type) == nct6116d)
>>>>>>> +#define gpio_data_single(type)	((type) == nct6116d)
>>>>>>>  
>>>>>>
>>>>>> What's prevents us to add a proper prefix to these? I don't like
>>>>>> the idea of them having "gpio" prefix.
>>>>>>
>>>>>> ...
>>>>>>     
>>>>>>> +		pr_info(DRVNAME ": Unsupported device
>>>>>>> 0x%04x\n", devid);
>>>>>>> +			pr_debug(DRVNAME ": Not a Fintek
>>>>>>> device at 0x%08x\n", addr);
>>>>>>> +	pr_info(DRVNAME ": Found %s at %#x\n",
>>>>>>> +		pr_info(DRVNAME ":   revision %d\n",      
>>>>>>
>>>>>> Can we, please, utilize pr_fmt()?
>>>>>>     
>>>>>>> +			(int)superio_inb(addr,
>>>>>>> SIO_FINTEK_DEVREV));      
>>>>>>
>>>>>> Explicit casting in printf() means wrong specifier in 99% of
>>>>>> cases.   
>>>>>
>>>>> For all the other comments i will wait for a second opinion. I
>>>>> specifically did not change existing code for more than the
>>>>> functional changes needed. And a bit of checkpatch.pl fixing.
>>>>> Beautification could be done on the way but would only cause
>>>>> inconsistency. That driver is what it is, if someone wants to
>>>>> overhaul the style ... that should be another patch. One likely
>>>>> not coming from me.    
>>>>
>>>> About the int cast, I think you can drop it while you are updating
>>>> this line. It is unneeded.  
>>>
>>> Ok two voices for doing that one fix along the way. I will send a v5
>>> and hope nobody insists on me fixing the other findings in code i
>>> never wrote.  
>>
>> You did not write it, but you are using it to do hw-enablement for
>> your company's products. So being asked to also some touch-ups
>> left and right while you are at it really is not unexpected IMHO.
> 
> Sure thing. Dropping a few characters from a line i touch anyhow is
> easy enough. But i.e a refactoring to pr_fmt would feel like asking too
> much in my book. That feels like work of the author or maintainer.

Right, but that assumes that the original author / maintainer is still
around and actively contributing which unfortunately is not always
the case.

Regards,

Hans

