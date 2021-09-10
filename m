Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975F2406E0C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 17:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhIJPSQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 11:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbhIJPSQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 11:18:16 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF28C061574;
        Fri, 10 Sep 2021 08:17:04 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id b5-20020a4ac285000000b0029038344c3dso704159ooq.8;
        Fri, 10 Sep 2021 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9/r2jFAF4fuZAXe9z2au/VDKOW/roOtkXIYaWUHqNEQ=;
        b=MRNzLsl01ylX1469VXO/mhaaKWOlvmn20MilD8o+Al777Clc1lvBd5xV/VOAYg/RQU
         ucU2dDpbSXfRAnnwwceYdd0bXu8NLmfoAp4o9xGR2XnartOOaRrnzSH0saF6M7o9U5U+
         qpy4NSpZ9lxuCPhAGDfAE3358iIZWx3nMjfugwHaCdd8SJwcv50EKxplNb3PfQJ4pVAl
         yAaDbRB5YlX/m1ejbEqq3GHJk33WcvJk8kfmZt42BF8WFELMKwQ1Yi7NEX30jN4T5GGg
         OAysjLdoAG42C2JwM9cN5VQOXMjENBnI+4IxOYqPTQMaKqLTMOY888gVci7vDS8iA+Ci
         WIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9/r2jFAF4fuZAXe9z2au/VDKOW/roOtkXIYaWUHqNEQ=;
        b=aei++pyOwIitNgQImHvrsIjy2jQLKvrGUm0uqbVgDzxqlW/VmBZV5nXHypDXh3j2Oh
         iCvhc6ENf9zj1/4wSclKLS0OUo5gvlotvmKG/QrLDAHhTdCDLJjtc8egk1jVG2q9K6/g
         DZE2CEQ6ilso3ZRwy5/6Hhl2ZT/7V5l4dyLLYBVWRBhWWOQt8YMLrR6H994YETowpq8R
         9vevSueoMc7nXSGCAYzd4UOx+yVOH59IlmJ5Zv+U3LXI5oQ6ZBIa9olYGOp8FiN+63Dq
         1ycp+Y3vT0x71fKDJy/0iVCfsgf5+rAX233/X/HbZ0ICiTz1m1U8yQheVXUcDU58PYea
         v/Eg==
X-Gm-Message-State: AOAM5328bVmtxjqKbBTn+H1hWI/3pbKJOU7smmfrdtzTxOP1P+qqmyoX
        HrX8MNu6o0Qrkx8G5f8zXZQ=
X-Google-Smtp-Source: ABdhPJzRqGjJ2f+RtawEC/78yoBOy2c9ViQ17o3jLlbSchEtcI43aAHDJ5T79P874BofaMKJXmoHhQ==
X-Received: by 2002:a4a:2a09:: with SMTP id k9mr4795173oof.79.1631287024039;
        Fri, 10 Sep 2021 08:17:04 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id u194sm1375492oie.37.2021.09.10.08.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 08:17:03 -0700 (PDT)
Subject: Re: [PATCH v2 06/15] leds: trigger: blkdev: Add function to get
 gendisk by name
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-7-arequipeno@gmail.com> <YTr+8h12z7kMLlV/@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <d4c6bc27-6595-2e95-cae8-d3e8e349955e@gmail.com>
Date:   Fri, 10 Sep 2021 10:17:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTr+8h12z7kMLlV/@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/21 1:45 AM, Greg KH wrote:
> You now have bumped the reference count on this structure.  Where do you
> decrement it when you are finished with it?

That happens when I "unlink" the block device from the LED in
blkdev_disk_unlink_locked() at ledtrig-blkdev.c:410.

(And also in the error path of link_device_store() at
ledtrig-blkdev.c:372.)

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
