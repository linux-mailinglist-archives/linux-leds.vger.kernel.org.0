Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A825365282
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2019 09:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfGKHbR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Jul 2019 03:31:17 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45319 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKHbR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Jul 2019 03:31:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so2482697pgp.12
        for <linux-leds@vger.kernel.org>; Thu, 11 Jul 2019 00:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YnECMvo698uCKzBDF7OHL3sVzqZkrbTnu8Va9G5GhPI=;
        b=Ff2zcxivfn3/Z6XR7/lA1EALqOGVHGpAke1O3OVLBv2gjK6oxV7qMkgqHg+ULUCK9S
         GSmOITVqs6IwthIjsF2zBguwVSUI5zfSQSwV1/rLSyFtowWbz6RwxRyFNlLBwjLBP8Go
         sfO6VZLY+FLys6lkR8jH+h4WiiCKYctmskQzoaoWdDeuAIJSXjUQTIxbh7aVGR9BPBiZ
         e6X9L5KkdSq/GEAhTunac1neIKuMZE1Nj6Z11b4gVlpPK7OKranRrW5HzAaq5MGCeFbK
         SDwv30NSKKJ20+tasyPym11xQioMiBmo+dtvTwAczltWvNnygEJdrpZSPGsHDG55+n2N
         jYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YnECMvo698uCKzBDF7OHL3sVzqZkrbTnu8Va9G5GhPI=;
        b=pG5KdIuFCgbUijhhhLbaWRsrBGSjYERLxRByWG5R46aaCJg1fittBLEua8yIE+9nLO
         kEc+ogvj5LuhhCes+t3qOLUVkSMgqhbJ4/4csJh4GJTL15HwpAOfUXXm23o2IqStZ18K
         URdFT/ofBMJLRthC/e49hL1a/dQmKFsGrUWSKUeYTJFC15t3ci3Wd8tXTabwgoP2qfFA
         uWI0oYU8DAI4d22O9ikWt88P9s4WeJkbHir4JmzHw0EmztbIfuWmD30z15StvyHHdmBG
         3Ium0UX7dZ826kXq96nr+PDg60ApeCDyllZubIuCgFZVtAECYnTRc/RSLFfMX8041RXC
         ICcQ==
X-Gm-Message-State: APjAAAV1Cl0Mprx2kbd1VHAZtyLl4/04p3yIIRWce+fvSlCov0btWRVk
        WHZE8QSQ3PxqIfnwXOfC8J2JXzUe
X-Google-Smtp-Source: APXvYqyIxxxfyvhab2MYGbce1rZrTW3AMDOZ7JO0FjyZp2NHM/gJpfd83bElaszFFcqCJxcVPgxhiQ==
X-Received: by 2002:a17:90a:bd8c:: with SMTP id z12mr3195300pjr.60.1562830276294;
        Thu, 11 Jul 2019 00:31:16 -0700 (PDT)
Received: from [10.0.2.15] ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id z4sm7530794pfg.166.2019.07.11.00.31.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 00:31:15 -0700 (PDT)
Subject: Re: [PATCH] leds: leds-max77650: Add of_node_put() before return
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20190709173509.14016-1-nishkadg.linux@gmail.com>
 <CAMpxmJX82_ur2uySoSwOUYruZT1kvvZHMTGKYbkQpH4O238-Rw@mail.gmail.com>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <c12259b3-1300-9479-c9bd-596ccbe788d5@gmail.com>
Date:   Thu, 11 Jul 2019 13:01:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMpxmJX82_ur2uySoSwOUYruZT1kvvZHMTGKYbkQpH4O238-Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/07/19 12:40 PM, Bartosz Golaszewski wrote:
> wt., 9 lip 2019 o 19:35 Nishka Dasgupta <nishkadg.linux@gmail.com> napisał(a):
>>
>> Each iteration of for_each_child_of_node puts the previous
>> node, but in the case of a return from the middle of the loop, there is
>> no put, thus causing a memory leak. Hence add an of_node_put before the
>> return in five places.
>> Issue found with Coccinelle.
>>
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>> ---
>>   drivers/leds/leds-max77650.c | 20 +++++++++++++++-----
>>   1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
>> index 6b74ce9cac12..417820f77c32 100644
>> --- a/drivers/leds/leds-max77650.c
>> +++ b/drivers/leds/leds-max77650.c
>> @@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *pdev)
>>
>>          for_each_child_of_node(of_node, child) {
>>                  rv = of_property_read_u32(child, "reg", &reg);
>> -               if (rv || reg >= MAX77650_LED_NUM_LEDS)
>> +               if (rv || reg >= MAX77650_LED_NUM_LEDS) {
>> +                       of_node_put(child);
>>                          return -EINVAL;
>> +               }
>>
>>                  led = &leds[reg];
>>                  led->map = map;
>> @@ -109,24 +111,32 @@ static int max77650_led_probe(struct platform_device *pdev)
>>                  } else {
>>                          led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
>>                                                          "max77650:%s", label);
>> -                       if (!led->cdev.name)
>> +                       if (!led->cdev.name) {
>> +                               of_node_put(child);
>>                                  return -ENOMEM;
>> +                       }
>>                  }
>>
>>                  of_property_read_string(child, "linux,default-trigger",
>>                                          &led->cdev.default_trigger);
>>
>>                  rv = devm_of_led_classdev_register(dev, child, &led->cdev);
>> -               if (rv)
>> +               if (rv) {
>> +                       of_node_put(child);
>>                          return rv;
>> +               }
>>
>>                  rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
>> -               if (rv)
>> +               if (rv) {
>> +                       of_node_put(child);
>>                          return rv;
>> +               }
>>
>>                  rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
>> -               if (rv)
>> +               if (rv) {
>> +                       of_node_put(child);
>>                          return rv;
>> +               }
>>          }
>>
>>          return regmap_write(map,
>> --
>> 2.19.1
>>
> 
> How about a label at the end of probe instead of adding this before
> every return?

I'll do that and send a version 2.

Thanking you,
Nishka

> Bart
> 

