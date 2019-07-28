Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C190780C6
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 19:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfG1RqS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 13:46:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40199 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfG1RqR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 13:46:17 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so51532246wmj.5;
        Sun, 28 Jul 2019 10:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rDXxJQ+dG4QCU9nGvI3i3ZK8Pexg6wjvSNaJezti8Ow=;
        b=Vj5B0zAjEcE8k/QKd++pkcPZe9RW3+B2OkS7fV4aNHEH/9tez9WkWwdVeRN80QTYDB
         8NkI7V1hnB8UuhwR2rLyIeIobBVfuTsBvbdfF/zTAzql6PT3Ylp+hluHqU1D154icjci
         sSTJMSUyMCeDxVaHnn3nECEez44I4/1C+SSh/+c45c8ucSKDQOMsNquKLMYeiohEQw49
         TFkIIgjgWmpeeUUommllIjUS6KfLi7mf5kczi/hMo508iA0ORN4mtSrQLhWKzABJZynE
         ZQ6xlJ8LntamPipD5s3hREUhHEj71l/RPIqJr4KJlILhKvDqnnpGLOMYwozB+6PoJ5dH
         EQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rDXxJQ+dG4QCU9nGvI3i3ZK8Pexg6wjvSNaJezti8Ow=;
        b=NxR4tRPDEtRlMiG9nsTbvplHwA8o5dZceMyx55joW6zBdMG5n7CBu+VmbYuH2Fn4PV
         bsWErWiFnJxOQnH0Hwla2dXFQMtMecVt6eRyHkCzbfYU0VecQqFx+9fJp1+omf5JvFer
         lb5R8NMQwcq0N4+Iz+qKaUUgYq6thUVxNiRY9GtntvAfOxYIUA8I8q1LsQ4896wUf2l9
         lgnkL1FaK3RACpqLXRFGWZ9YG60l3uHV6kZAYSb6uFuPTojOFfODGSmwTjDoPNE2wzux
         uBzUbkDoLtCmH7zjNmwAZ4WVfV35N+my7KEPuGOTKabA9LSPDBDB7/KpLnqCpElgWKx/
         SN5g==
X-Gm-Message-State: APjAAAXj8jZIUaIxzZZgaqo1slOL0tkXU8zc6W3qbRKJHf0iK7luJw4c
        qg1XTdp2jPlboUyM/TYiyms=
X-Google-Smtp-Source: APXvYqx6nnjgnqualgcHafYQwrZF1uz01rBZZ3/8EBSayOlTht65DcE2XIfW182Z/2+EQ5PhD7Hr5Q==
X-Received: by 2002:a1c:a686:: with SMTP id p128mr33288864wme.130.1564335975321;
        Sun, 28 Jul 2019 10:46:15 -0700 (PDT)
Received: from [192.168.1.19] (chm157.neoplus.adsl.tpnet.pl. [83.31.10.157])
        by smtp.gmail.com with ESMTPSA id o6sm120593861wra.27.2019.07.28.10.46.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Jul 2019 10:46:14 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] block: introduce LED block device activity trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
 <1563807552-23498-2-git-send-email-akinobu.mita@gmail.com>
 <44a6093f-7df7-9442-c33b-5827eb5f187b@gmail.com>
 <CAC5umygzNj=7LjzrzrVgOyLiZrKckaCgH68j0COFuWvX1yZAzA@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5630049e-7ab7-e48e-894d-b07a87fe6c25@gmail.com>
Date:   Sun, 28 Jul 2019 19:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAC5umygzNj=7LjzrzrVgOyLiZrKckaCgH68j0COFuWvX1yZAzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Akinobu,

On 7/28/19 3:51 PM, Akinobu Mita wrote:
> 2019年7月27日(土) 6:22 Jacek Anaszewski <jacek.anaszewski@gmail.com>:
>>
>> Hi Akinobu,
>>
>> Thank you for the v2. I've checked and it works as expected.
>>
>> One thing is missing though - ABI documentation.
>>
>> Please add Documentation/ABI/testing/sysfs-class-led-trigger-blk
>> and document read, write and discard files.
> 
> OK. I'll add document like below.
> 
> What:           /sys/class/leds/<led>/interval
> Date:           Aug 2019
> KernelVersion:  5.4
> Contact:        linux-leds@vger.kernel.org
> Description:
>                 Specifies the duration of the LED blink in milliseconds.
>                 Defaults to 50 ms.
> 
> What:           /sys/class/leds/<led>/read
> Date:           Aug 2019
> KernelVersion:  5.4
> Contact:        linux-leds@vger.kernel.org
> Description:
>                 Signal data read on the block device.
>                 If set to 0, the LED will not blink on data read.
>                 If set to 1 (default), the LED will blink for the milliseconds
>                 specified in interval to signal data read.
> 
> What:           /sys/class/leds/<led>/write
> Date:           Aug 2019
> KernelVersion:  5.4
> Contact:        linux-leds@vger.kernel.org
> Description:
>                 Signal data written on the block device.
>                 If set to 0, the LED will not blink on data written.
>                 If set to 1 (default), the LED will blink for the milliseconds
>                 specified in interval to signal data written.
> 
> What:           /sys/class/leds/<led>/discard
> Date:           Aug 2019
> KernelVersion:  5.4
> Contact:        linux-leds@vger.kernel.org
> Description:
>                 Signal data discarded on the block device.
>                 If set to 0, the LED will not blink on data discarded.
>                 If set to 1 (default), the LED will blink for the milliseconds
>                 specified in interval to signal data discarded.
> 

Looks good, please submit it officially.

-- 
Best regards,
Jacek Anaszewski
