Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D644688C
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2019 22:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfFNUCd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jun 2019 16:02:33 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45950 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFNUCd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jun 2019 16:02:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so3547663lje.12
        for <linux-leds@vger.kernel.org>; Fri, 14 Jun 2019 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ngI5MxXveWFjL5es1HVK3K/U1lhkniBArST+QJn+q3g=;
        b=tncVnxFlebmailaU9JliW6mgg9QO/PpjjsqmcP6hoD9HWt7oeJOWldWG6r648vQIqx
         sVHwHiMpEzkt4NR6jRhrSaWWnEyLh2ls1QjPfGkCOQ8BzDEhglbpTpPgGIQf8NNBEr1K
         itIwdTVwi8sqvEAM3R5mDrzdoN8c3IyiG380+YP3fxrEFX4A4j9M3uK/sPHwKhaAtNyD
         N4/mV8ogMgjsa8cg0lhS15jQvZG9UAp4UY7nmQfuuLCRrvyogA+nPrTfnvO0N0XqEB/u
         wPXlDyToplGwq+JcbdqSIqLD4+edznAoUgXEPgUZNf/ntfVJqzr4O0CWIOx2g6klzruK
         8Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ngI5MxXveWFjL5es1HVK3K/U1lhkniBArST+QJn+q3g=;
        b=kUJWKMq7S1nk/3TquyvxYI3KscLcdOjhOK/cTixEy/3ZhIzWPoq+eMErmhxF3xaFW1
         A25a8Vj6HCuvC/j0isoKTqLpfnAMhspzP0snx2L9hsOCOKACp7T1J+OJpnH8Wi9QYyqi
         rLnrKE5C0LwF/Iax+aG/QpeN0tFuLqzPk+TSgbo+YD9VXKjUayWTpJXNULhU6RySBkzb
         Gn8WQZzjRUuYOlMa5XRsieaqCCdgV1b+3IBrvspcbm9zkoXjG0q1gl8tzA8wIGGx2i6I
         Y6aFHbFO/dpMODHLNaNXrcYSiQ54tYskjpxo9rytYrvjHAq/KZoKx8FCDx2HHRTke6ak
         Pf5g==
X-Gm-Message-State: APjAAAV2oaNXyKzcWe3Qe/Z1Vf/h5VO8akHyE1QDDd11SD7XcDX23MhN
        fzmf52wVuZjKnepCLSgYj6ouZIRk
X-Google-Smtp-Source: APXvYqyn9VY2RYAPvXe1ych5mD/v6sUUBpwTqROEsXKh84EZE6/0Yo6ZoieGCmokOpNnCWOWB0kN8g==
X-Received: by 2002:a2e:80c8:: with SMTP id r8mr2039248ljg.168.1560542550770;
        Fri, 14 Jun 2019 13:02:30 -0700 (PDT)
Received: from [192.168.1.17] (chs71.neoplus.adsl.tpnet.pl. [83.31.16.71])
        by smtp.gmail.com with ESMTPSA id h23sm759002ljg.17.2019.06.14.13.02.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 13:02:30 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com> <20190611120156.GA1161@amd>
 <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
 <18e0c91d-d258-37ae-e46a-0f42f148eacc@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1d90cd7b-c108-c14c-df05-64110922020e@gmail.com>
Date:   Fri, 14 Jun 2019 22:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <18e0c91d-d258-37ae-e46a-0f42f148eacc@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

On 6/12/19 12:58 PM, Oleh Kravchenko wrote:
> Dan, Jacek and Pavel,
> 
> Let me also describe blinking effect for Screen Frame LED tube,
> because looks like blink_set() doesn't support smooth blinking.
> 
>> brightness
>>      ^
>>      |        ***               ***               **
>>      >      **   **           **   **           **
>>      |     *       *         *       *         *
>>      >    *         *       *         *       *
>>      |  **           **   **           **   **
>>      >**               ***               ***
>>      |
>>      +----^----^----^----^----^----^----^----^----^----> time
> 
> So it's actually never go to OFF state, when effect is set.
> It is always in ON state, just brightness is smoothly changed from min to max.
> It all handled by LEDs board itself, there are no way to control it from SPI master.
> 
> Please advice how it can be implemented to pass review?

In this case you need to leverage pattern trigger and implement
pattern_set op that will enable this hardware effect when certain
vales are given. You need to document those values in ABI documentation
file.

Please compare Documentation/ABI/testing/sysfs-class-led-driver-sc27xx.

-- 
Best regards,
Jacek Anaszewski
