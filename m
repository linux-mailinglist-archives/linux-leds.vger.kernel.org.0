Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F50019CC32
	for <lists+linux-leds@lfdr.de>; Thu,  2 Apr 2020 23:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389346AbgDBVAp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Apr 2020 17:00:45 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55332 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgDBVAp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Apr 2020 17:00:45 -0400
Received: by mail-wm1-f68.google.com with SMTP id r16so4900952wmg.5
        for <linux-leds@vger.kernel.org>; Thu, 02 Apr 2020 14:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UWSf9jr+sXbjj3oIhfkZDfOvuvIBW3P0BOtEowBwjcM=;
        b=NNOE8txoF8p5ErjiPaCxwMqcDZhc0aKSZdJ1SyEXRoPcw9WCpdgSwHlsqYIKMceVgj
         NVuTsj800WAamlQ9QmDx6+AS8iIimG4XjaomBuq2a/riQBUJoCpt4WnUVTOope/wlqJP
         LgC5sgy2z8MU59nSNEEnUnmCjsaqKSWk/nXitGb4noHI46TIZV5SvIaAL4FLoCuh+Uft
         jt5a971j5hjSHlomOrTNUVW4pTYq5/dI+TOL0NoasGRdzb7jk1A9hXU96ZNW88JHX6xA
         ljazl7DETnGSfbwCd1SiognXUHUqFhffmk/ulefO19e2y0RWqwI1Kb1nBMXr6eUojaFN
         TDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UWSf9jr+sXbjj3oIhfkZDfOvuvIBW3P0BOtEowBwjcM=;
        b=MLtNpXMJw959FykQ2egroDzuW+Gugh+IF92y4LB0CaMK82iQ2hMqSwyptfBr49NOgH
         N1PieXuwuw9IwuoeisVhIEE3UJTetnHTUwFvnirgMA23pSOKFuoO2YHDJAISxI/Pj/3J
         e5gnC6heEt1ofK3gN75o6fjRHG/qwj51u8LOGRafkC2ud4/JjfzjyEHHZglp6ZLgla1E
         zyhay72weT5iCMBQevFM1YGujm+TlmavBeAtErC44vfLDyRWifU0o6VxIJjYHKoxFcQN
         gkwyf4hgp0PVMvv4Ll2qnbYGKOWiYAdHqMPQrqDVnyKbj2HyuXWyhH5eK1cJ3mS/iXe9
         U52g==
X-Gm-Message-State: AGi0PuYGpTa1yHlMFvDiW2etwwHRPFmRsLL4Xe9WqDk4Z/traLADRVhS
        kD3iIbjPFPhk8ZvGfSbm2aK8Z5B9
X-Google-Smtp-Source: APiQypI7W6iB4IoTRf0Ls7ifcz0JJt/1YGO5sGOVN2AjY3YF0PUwTyceIehToz0HpvpJHANBspiBqA==
X-Received: by 2002:a1c:8103:: with SMTP id c3mr5030702wmd.166.1585861242644;
        Thu, 02 Apr 2020 14:00:42 -0700 (PDT)
Received: from [192.168.1.23] (acfs99.neoplus.adsl.tpnet.pl. [83.9.220.99])
        by smtp.gmail.com with ESMTPSA id c4sm8761267wmb.5.2020.04.02.14.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 14:00:42 -0700 (PDT)
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321153325.GD8386@duo.ucw.cz>
 <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
 <20200328132729.5e628fe6@nic.cz> <20200328133629.79603fe3@nic.cz>
 <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
 <20200328182025.0b33200e@nic.cz>
 <7a12c510-605c-b31f-79e6-cccf3e29c682@gmail.com>
 <20200402162950.5c2847be@nic.cz>
 <f7e641a1-c113-9c33-f6bb-256a8e59b92e@gmail.com>
 <20200402225730.2e6d9154@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <34c7c829-b478-1c13-ead8-12c6577febfe@gmail.com>
Date:   Thu, 2 Apr 2020 23:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402225730.2e6d9154@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/2/20 10:57 PM, Marek Behun wrote:
> On Thu, 2 Apr 2020 22:19:50 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> On 4/2/20 4:29 PM, Marek Behun wrote:
>>> On Sun, 29 Mar 2020 14:53:57 +0200
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>   
>>>>> in the case you mentioned there is a one "global" brightness setting per
>>>>> each RGB LED. On Omnia, all 12 RGB LEDs have just one "global"
>>>>> brightness property. Ie. I press the button, and all 12 LEDs glow get
>>>>> dimmer. So there could be a 13th LED device with color LUMA, but what
>>>>> function should it be given in DTS?    
>>>>
>>>> Then, in this particular case, adding devicename prefix for the whole
>>>> family of LEDs would be justified. The question is whether it should be
>>>> hardware related name or rather something different.  
>>>
>>> Hi Jacek,
>>>
>>> so now we have
>>>   device:color:function
>>> what if we made it so that there was a 4th part of LED name, ie
>>>   group:device:color:function
>>> ?
>>>
>>> Would this be a problem?  
>>
>> Indeed, the device alone would not be a sufficient differentiator
>> since it is possible to have more than one LED controller of the
>> same type on the board.
>>
>> Nonetheless, I'd rather avoid the addition of a new generic section.
>> Probably we would have to make it specific to this device.
>>
> 
> Ok, in that case I will do it so that devicename is "omnia".
> devicename_mandatory should be set to true, yes?

If you want to have four sections then you must compose LED
name yourself and not use new *ext() API. But please hold on,
since I suppose Pavel will have something to add to that.

-- 
Best regards,
Jacek Anaszewski
