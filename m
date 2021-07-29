Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED583DA7E1
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 17:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237851AbhG2PwN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhG2PwM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 11:52:12 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BE7C061765;
        Thu, 29 Jul 2021 08:52:08 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id v8-20020a0568301bc8b02904d5b4e5ca3aso6277573ota.13;
        Thu, 29 Jul 2021 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ggudXBKBG+mZkoKUCRIvn4jywWI6nv9ReIVf6rwOFM=;
        b=tv39JsgncGFBeHS30VsHiX/zWucJ6YM9HZuj/+LXC6ReWc5/57+JQvOiaC/WRWwcCY
         OdBQ6hRg7LJUmCj+MLPZrcpL1laZ0MTDDtxXVt8RAr+y8iYAqzxh5rLELQqgswJroPLe
         Efxzr/RxUHnnG5SHgMZ0IfxCSr22FPuiFP9yP3XZS0VmG1L75qrgvvDkOR4ykxamjvSc
         lkAYl6PIhpb6iH/ZtH48IEl2Td6nGljG1VlD2cjHGUDSiWhBtM+rKyXJ4jQhq93XeA6t
         Tb5T8EFt5FZes55EgWaKSKLFGesHiQxabS2fKwsD7UWNhJWGXyo4qjB9lUb8KsrDPJVq
         L5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ggudXBKBG+mZkoKUCRIvn4jywWI6nv9ReIVf6rwOFM=;
        b=QH0XesM+V6hCKlu7XD8514PaUA/ThZnE4T5G+HLV/ppRlVgfmELU2XRXefkmcK7oh5
         7me30m3Po9ih1VRyBzYK4VFykgRW5e5Wv1+s2kgKLDte4JmDrENnz9zrLNPuaiDRAwRT
         gZ1BYKpgSw7TofczJ6bvr2yGJzdJdW0UR/H0mug8lSVtLE0GSgLtj3Km655cpsgMg/lE
         yUuXig3PLdgZ8+nagThOSYJzSf4Uzid8VqMDFTNfDaX2o1eV5ZoN7KstcMP/qJUe6c68
         n+d4hyjcSMXfZJFxqh/wZhnKQIu5TxZKAdmeG7TpG4gYTJGdo3YPO9EiEmI5+6TZWEdC
         VPwA==
X-Gm-Message-State: AOAM5307B0OIudvzdQ/9Lh41oyoVVXnDvqsje6OfoH7sw/GmzuLVe+rF
        FAYbFddyqD/XqKwVyEWt8TtImJfjGvgfdVxz
X-Google-Smtp-Source: ABdhPJxYivceaUUzZVLbIYBm71r6OlTgt6MvSU6cllWXNnCb/c8aN7E9Yl4KuRtrjmivqmJz0N/VMA==
X-Received: by 2002:a05:6830:1f3b:: with SMTP id e27mr3873661oth.311.1627573927585;
        Thu, 29 Jul 2021 08:52:07 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id b14sm645195oic.58.2021.07.29.08.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 08:52:06 -0700 (PDT)
Subject: Re: [RFC PATCH 1/8] docs: Add block device LED trigger documentation
To:     =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-2-arequipeno@gmail.com>
 <108629.1627528155@turing-police>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <ee56510e-e8ef-5e92-3e29-4e290bfad9b2@gmail.com>
Date:   Thu, 29 Jul 2021 10:52:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <108629.1627528155@turing-police>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/28/21 10:09 PM, Valdis Klētnieks wrote:
>> +	# cat /sys/class/block/led_trigger_list
>> +	baz: 0
>> +	bar: 0
>> +	foo: 0
> 
> This looks like an abuse of the "one entry one value" rule for sysfs.
> Perhaps this should be a directory /sys/class/block/defined_triggers/
> and separate files under that for foo, bar, and baz?  That would probably
> make reference counting a lot easier as well....

Indeed it is.

Funny that you should mention using a subdirectory.  I originally wanted
to put all of the trigger-related stuff into
/sys/class/block/led_triggers/, but I couldn't find any API to create a
subdirectory for *class* attributes (only for device attributes), nor do
I see any such subdirectories on my system.

   # find /sys/class -type d | egrep '^/sys/class/[^/]+/'
   (no output)

Is is possible to create subdirectories for class attributes?

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
