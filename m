Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319A31254C2
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2019 22:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfLRVeD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Dec 2019 16:34:03 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35302 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRVeC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Dec 2019 16:34:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so3876825wro.2;
        Wed, 18 Dec 2019 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=STZ56yZR0FyLqtnDNnCylPfbTjTW9NUz5F63r8OnOuY=;
        b=XO47kqpnbPF/U5xo28jAvPvWFyZJ4xOCSDxNLc9P6dAqeJ0X1kTx9WHM4cWULDAybM
         8+ArQ9MbuPanizQjDB2jPZbYS6NiohUtEiqFW9e8TVa7JcWcEy3mcv3CaNKkzpHzXT6s
         IIREz00G6B2+DXQ1rvkwpG9vAFQHemOFP+p/Q7NI3x7t40oA/M6d26tCD6031bHxdSL1
         VcdJXlAQE28JeBuqSTyzCbeuZripZ+lYwL1CgQnea98eK+x7C0PyWu0+aB1ncY26JyrS
         R2C+XGdyPFAUMpDkIjbIQick1uYaLX1vvC4KDsWeCnRnPDbK8oKS/wn449UYkuYyAkS+
         66rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=STZ56yZR0FyLqtnDNnCylPfbTjTW9NUz5F63r8OnOuY=;
        b=oYKMSyxauADWnGiXgW8flGZYZZSJHzyUP0jbs5HHvLwub+GIDnL+9hz5glWpmNnvm7
         uSxOozRVAf+UYg1JgfYgwx9jsJXxIXJjoGsGXHK7nsEfAiKJ3f6iur7uPMQhtRQHk4SZ
         M3aJq9BZ4u+QqLyCJSQqZoporKRg3wBUZiAQ4Mp3w2kqf1yztDLSTDjpel0MTnDcQ8AS
         4ZUFlqPw0x1FL3mCcNHfkpfKq54gLlKN9Cwgjx+3wfR4V1N4+mTTMR0/yobZ5e6OalSl
         nsaHYVebbgvN+WsESrh1Gr1bXUODd6Vl3Njfwpma0Y2a0aBRGAdJmuVEtzFFtVmakytv
         VXMg==
X-Gm-Message-State: APjAAAVxMay4IIAV55iCekx/jSbso/kNiMTxEHaa+eUwPpDD5PRZBar9
        jx3o6kvno3UQzgUF2aIi2m8B15qP
X-Google-Smtp-Source: APXvYqxpKrK7TMKfoBG8Ro3vObyFqkSZvKhmkcSROvnR8DZSCnTrG2Na0cRZL5tVHMIU6DmueSQDBQ==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr5173664wrq.63.1576704839381;
        Wed, 18 Dec 2019 13:33:59 -0800 (PST)
Received: from [192.168.1.19] (cke242.neoplus.adsl.tpnet.pl. [83.31.80.242])
        by smtp.gmail.com with ESMTPSA id p18sm3997616wmb.8.2019.12.18.13.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 13:33:58 -0800 (PST)
Subject: Re: [PATCH v3 3/3] leds: trigger: implement a tty trigger
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        kernel@pengutronix.de, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
 <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
 <20191217152724.GA3667595@kroah.com>
 <20191217162313.5n3v7va5nw5lxloh@pengutronix.de>
 <20191217172102.GB3829986@kroah.com>
 <b2844f63-d580-ddc2-b4ed-817eaa89a2c6@gmail.com>
 <20191217210818.rbwmrz3fsnobo7nj@pengutronix.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <86ad555f-671a-cb0e-6000-30580f688be1@gmail.com>
Date:   Wed, 18 Dec 2019 22:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217210818.rbwmrz3fsnobo7nj@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/17/19 10:08 PM, Uwe Kleine-König wrote:
> On Tue, Dec 17, 2019 at 09:27:13PM +0100, Jacek Anaszewski wrote:
>> On 12/17/19 6:21 PM, Greg Kroah-Hartman wrote:
>>> On Tue, Dec 17, 2019 at 05:23:13PM +0100, Uwe Kleine-König wrote:
>>>> On Tue, Dec 17, 2019 at 04:27:24PM +0100, Greg Kroah-Hartman wrote:
>>>>> On Tue, Dec 17, 2019 at 04:07:36PM +0100, Uwe Kleine-König wrote:
>>>>>> Usage is as follows:
>>>>>>
>>>>>> 	myled=ledname
>>>>>> 	tty=ttyS0
>>>>>>
>>>>>> 	echo tty > /sys/class/leds/$myled/trigger
>>>>>> 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
>>>>>
>>>>> Is this the correct instructions?  Aren't you looking for a major/minor
>>>>> number instead in your sysfs file?
>>>>
>>>> This is correct, yes, at least it works as intended on my machine.
>>>>
>>>> /sys/class/tty/$tty/dev produces $major:$minor and that's what the
>>>> led-trigger consumes.
>>>
>>> Ugh, nevermind, I totally read that wrong, I was thinking "echo" instead
>>> of cat.  My fault, what you wrote is correct.  Should that be documented
>>> somewhere in a Documentation/ABI/ file so that people know how to use
>>> this new sysfs file?  How are led triggers documented?
>>
>> LED triggers have their corresponding entries in Documentation/ABI.
>>
>> Uwe, you already did that for netdev trigger:
>>
>> Documentation/ABI/testing/sysfs-class-led-trigger-netdev
>>
>> It would be nice to have one for this too.
>>
>> There are also less formal docs in Documentation/leds, e.g.:
>>
>> Documentation/leds/ledtrig-usbport.rst
> 
> I'd put into Documentation/ABI/testing/sysfs-class-led-trigger-tty:
> 
> 	What:           /sys/class/leds/<led>/dev
> 	Date:           Dec 2019
> 	KernelVersion:  5.6
> 	Contact:        linux-leds@vger.kernel.org
> 	Description:
> 			Specifies $major:$minor of the triggering tty

Yes, that should be fine.

-- 
Best regards,
Jacek Anaszewski
