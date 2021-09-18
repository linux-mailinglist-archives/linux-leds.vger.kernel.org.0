Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69C541071A
	for <lists+linux-leds@lfdr.de>; Sat, 18 Sep 2021 16:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbhIROo4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 18 Sep 2021 10:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238165AbhIROo4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 18 Sep 2021 10:44:56 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1FAC061574;
        Sat, 18 Sep 2021 07:43:32 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso16994692ots.5;
        Sat, 18 Sep 2021 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a6FtsXt8FRaob/TTCEZKvL8sXiNm89kkIlCc0h30xZU=;
        b=LIyiSB3ljq97JFE43AxJJ9uiBAoYKEkQdwytpPs83E9hENsucCcnSlEwY2hFqMcFdN
         2G7mG2ZAG3G0hWKS8gDklj+1TmISomBkHKucJ0SOBRdP+0wMAGGea9HNMUty8xTdyyvl
         JURCZAW7c8/njL/nSHJoOr/T5+ZzKAB/aPT2Oylo/PHu+NA1QdpdHtK+C2zRZ+Aplmob
         +y2Zggsimufm2QX066wbf5FYgkkb1Fo80PesAKjjR7VKJoOZOtE+3NbPej3JmMKj3GGO
         192Rs9DriBgB1QOQmnoeq8ozqbfJCvpqVebRkRe83oSUsyHGUTFMgB1IaO21nnF8B0R2
         eqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a6FtsXt8FRaob/TTCEZKvL8sXiNm89kkIlCc0h30xZU=;
        b=w8yGa/Yeh3HpkWmFklhVcKIjExbWw4vKTIXPHtkMNeR+jT9sebu7wB82AVJbuDzhLM
         dEPqaoGq7Svp/CZTXCOhDASTlwRBp3CPRMuuaX5iIcLIj6TH4wcqvj2QidLyK9gNRaPz
         Bro0lw8X/P6e8KS79BZOFcGZPJUNvSkEQc6MyQHGTe/WN5SSSvD45s2E2/SVw61LyI3o
         Cny7dWstFkatqnl9Bps12EY9no7n2hu91ocu12AnQOhDezFWD0NJqu35z9POJO416+4E
         lRMgRgXS85H+wImbGzHw2bn5+6PLCzZML5qJZql0SRs7BVx6l0nFPjypB3140M4l2Fex
         Wepg==
X-Gm-Message-State: AOAM532xJ52QxXhX/B8JqjXgSlfCnPZcL+QyZmDW3kXkAkbN9BcPG9uA
        AxFPbQWp0ty8P+459TBUoZ8=
X-Google-Smtp-Source: ABdhPJySjr4NHbqaXBMbjVTBy8WhRXLZCj9NwR5MUxkEaqaa2IUOEmQaR09w914R5ZznRTMdGFiRZA==
X-Received: by 2002:a9d:6192:: with SMTP id g18mr13965936otk.314.1631976212032;
        Sat, 18 Sep 2021 07:43:32 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id s24sm2248090oic.34.2021.09.18.07.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 07:43:31 -0700 (PDT)
Message-ID: <27568193-170d-af8e-9667-b6cce97c27df@gmail.com>
Date:   Sat, 18 Sep 2021 09:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hch@infradead.org, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kabel@kernel.org
References: <20210916202127.1216994-1-arequipeno@gmail.com>
 <20210916202127.1216994-2-arequipeno@gmail.com> <YUQzdyG+WWoiJ2I9@kroah.com>
 <e09257e0-ce95-623c-3a04-cc033aa9fec2@gmail.com> <YUWQSlXjIb58eCJZ@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <YUWQSlXjIb58eCJZ@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/18/21 02:07, Greg KH wrote:
> On Fri, Sep 17, 2021 at 03:46:55PM -0500, Ian Pilcher wrote:
>> As far as using kernel names, that would be my preference, but I simply
>> don't know of any way to do so with the existing block API.  To my
>> knowledge, there simply isn't anything like a blkdev_get_by_name() API.

...

> Just use the kernel block device name and that way you do not have to
> parse anything as it is unique and no paths are having to be followed.
> 
> That's the way that other LED apis are working, right?

Greg -

There are 2 existing LED triggers that have similar functionality (i.e.
they allow LEDs to be "associated" with devices by name), and they both
use subsystem-specific APIs to "resolve" those names to the actual
kernel objects on which they operate.

   * The *netdev* trigger uses dev_get_by_name(), which is specific to
     network devices (despite its name).

   * The *tty* trigger uses tty_dev_name_to_number() and
     tty_kopen_shared().

As I've been saying, I simply don't know of any similar API for block
devices.  The block API provides blkdev_get_by_path(), which I am using,
and blkdev_get_by_dev(), which takes the device number (dev_t).

If you know of an API that will allow me to resolve a block device (or
dev_t) by its kernel name, please share that information.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
