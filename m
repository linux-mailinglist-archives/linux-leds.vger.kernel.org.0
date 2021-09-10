Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EBE406F4B
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 18:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhIJQPE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 12:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhIJQOz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 12:14:55 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEFEC06175F;
        Fri, 10 Sep 2021 09:10:30 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so2912833otf.2;
        Fri, 10 Sep 2021 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZpN0iIGii/dNNt/92JOfuMuOZnTWraO3oqP936hLCa0=;
        b=C37HAF5Kpldyo9cgCEo5cokWpShbQuujvpcAiv3xZgJrttVoAKbXjP06UxSTwledVS
         JCBHZv5N/NqKEFFNQ3Qoxn+UHe+zf26//N9vqqIRvvJwev8RzN9D1BM+JTJzfu1r58eZ
         p9EVw13W8NbT0AkLcqNgYKJcCT85lc7xmWNYzTnixx8vhJrE4D823KVyrBQaEX+pahKI
         ulR7ZIpwIkPXqNAnHgnAhIDhbxlgWHm4OCIn9TcWJPxXT+01/SGJmQAGUcmYgmMtJsSu
         BKM0eI7gZjLvNFrXDBxu8SZ/h4Oo3zR9f68RPP79zeUpQ5gXvsMhFE5NL4jWD8CDSlKi
         DF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZpN0iIGii/dNNt/92JOfuMuOZnTWraO3oqP936hLCa0=;
        b=fo20tVKVXdxcHkw3NvaGepPKixmtjruucXPT1nK7M6T2WB50L2rzwXssOsg95stu7b
         Glgfe/0fXnpfJUzNuT9HFtlceBARy/GSP3QXyZmKEw7tv4l23id2gInklkrZvOsSZami
         uPPTQ+QHedlfnAat6gyEEOqymLaYuWyAUP0mcNfZdEYb3qLrA1DvHb+f6A/Mm4YPwz48
         /hfdQKRvTq/3DcQS+We1CUHjFgHV6lD89IxRMay9Xy4nCidR7hd8cE1+fQWwET1/ACaj
         S4ca2MQD7ZdhmEL/4SHX+BxKIzLJdF78x7UR234MN1/cWPjr99Ll78kzz9nJZO2C6BQE
         z0lQ==
X-Gm-Message-State: AOAM531U2Sy8EDSqdNBFBNInrQDF8+0H1kCV6j+5voUBx7oaFv31bXzG
        FsEWR/XZSHL9wEmuzzsKrtE=
X-Google-Smtp-Source: ABdhPJw9KPrwtW1zzQhTKpK1nmI/rC3Q+YmmOB5kCS15jG/aMfTrpDHjUJkOxzdV9OwDAtWUjiwqvg==
X-Received: by 2002:a9d:7f90:: with SMTP id t16mr5149490otp.269.1631290229750;
        Fri, 10 Sep 2021 09:10:29 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c14sm1323480otd.62.2021.09.10.09.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 09:10:29 -0700 (PDT)
Subject: Re: [PATCH v2 10/15] leds: trigger: blkdev: Add LED trigger activate
 function
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-11-arequipeno@gmail.com> <YTr/iQBYclqjFri2@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <8ef9f5c7-ce5c-26ce-b076-35716a15fed8@gmail.com>
Date:   Fri, 10 Sep 2021 11:10:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTr/iQBYclqjFri2@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/21 1:47 AM, Greg KH wrote:
>> +	/* Don't allow module to be removed while any LEDs are linked */
>> +	if (WARN_ON(!try_module_get(THIS_MODULE))) {
> 
> That pattern is racy and broken and never ever ever add it to the kernel
> again please.  All existing in-kernel users of it are also wrong, we
> have been removing them for decades now.

OK.  (I was misled by the instances that you haven't gotten to yet.)

> You have created a "raw" kobject in the device tree now, which means
> that userspace will not be notified of it and will have a "hole" in it's
> knowledge.  Why not just create a named attribute group to this device
> instead?

What would I pass as the first argument to sysfs_create_link() in that
case?

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
