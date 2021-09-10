Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06997406D44
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 16:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbhIJOFc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 10:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbhIJOFc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 10:05:32 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F80DC061574;
        Fri, 10 Sep 2021 07:04:21 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id c79so3029432oib.11;
        Fri, 10 Sep 2021 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vJjeudOkWUoFMSYNX0QtgVnYF0e2Ukp7ANPKWtsKcPo=;
        b=XzXUNAqK+4M64tKFY0hbT/X2Z36aB3SvtQ2iXS+xf40NT2o/MUn7/Y/L4apOgEC3+H
         ImL/YY0+6QKRUz1gKzvbRMr5yjWo9eQN2FHV3wbmsGmNgAL/fGtaFOqJRdEDqg0XwiJE
         eZvavNm93obhHRDnFkUnCQGGiIygHnzuwvpYSHeiTJMxzwfPBjv/kA7RbzetOUkA8qnO
         pqwWKYeO3fjWUfu8+xyCrAzLYYebydHuBcWtNvLqwTy3O/rfsiDxa/maD0u1ngjotPIO
         nxkFh1/lrjMM5xiQXTfgYLHuOP4aPH6DDuF8ZINu6dIrhB+WdaO+CqfCykB+aJ02wRlX
         TXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vJjeudOkWUoFMSYNX0QtgVnYF0e2Ukp7ANPKWtsKcPo=;
        b=Yn9Es5u76qDu5CndU6+KI0MjqvaGVhaADd2xDIKOGSYl5eH6i2zjwPzfEqjyGWoEnJ
         yF47srlPU6dJ9XlLGDmvu4gNNjsW+HRNvPpUTJEJJiinip95ZGiVmS82bTb3U8aLOWjz
         zyMDGvd1RmuU7BdIkVlxXsA7508VGclEr5n5jwM+BRFRMpjlEr+VwxRPj5AG/HJPpgTv
         6kddDv5cm/LR0jLH+YruHpGv1Hrqf4Af00FJTZAX3GxCpDVp7wp+TLVG2dAUR+elA93y
         d3aOTlpk6dRI4wVzsKQgvQ29LhZKoEe+8Ldo0+kc5m7hfaiepUYcqko7dALzo9ArTv7H
         3G/g==
X-Gm-Message-State: AOAM530weKuEi3MHwJZxzH1tovCgMM0DI60nVyrG6DQhoGEsf+gltoQE
        LVTYAv8pK31V5rZb0OG+kaI=
X-Google-Smtp-Source: ABdhPJzhnP8E1dPJ7nnLfS0dCdEpiHopVOlubF63RgNWlNbCTmR+QU2i8f/qhLi0XfDy9Mfo/ixqVw==
X-Received: by 2002:aca:eb97:: with SMTP id j145mr4277157oih.33.1631282660571;
        Fri, 10 Sep 2021 07:04:20 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id x12sm1245856oie.56.2021.09.10.07.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 07:04:20 -0700 (PDT)
Subject: Re: [PATCH v2 00/15] Introduce block device LED trigger
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210910040959.5ae4a6a1@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <06581fe9-f9b2-5bee-07d6-e5b276a5e7f8@gmail.com>
Date:   Fri, 10 Sep 2021 09:04:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910040959.5ae4a6a1@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/9/21 9:09 PM, Marek Behún wrote:
> I have tried to look into this and replied to some of your patches.
> 
> There are still many things to do, and I think the reviewing would be
> much easier to review if you sent all the code changes as one patch
> (since the changes are doing an atomic change: adding support for blkdev
> LED trigger). Keep only the sysfs doc change in a separate patch.

Marek -

I'll try to get a simplified version out as soon as I can.  It will
probably be 3 patches, because I do think that the block subsystem
changes should be in a separate patch.

(I agree that it will be simpler to review - not to mention easier for
me to create.  Past experience does tell me that there are likely some
folks who will object to that format, however.)

> You are unnecessary using the const keyword in places where it is not
> needed and not customary for Linux kernel codebase. See in another of
> my replies.

I did see that.  I'm a believer in declaring anything that should not
change as const (to the extent that C allows).  It documents the
fact that the value is expected to remain unchanged throughout the
function call, and it enlists the compiler to enforce it.

So while it's true that they aren't necessary, they do result in code
that is at least slightly less likely to be broken by future changes.

> You are using a weird comment style, i.e.
>    /*
>     *
>     *	Disassociate an LED from the trigger
>     *
>     */
> 
>    static void blkdev_deactivate(struct led_classdev *const led_dev)
> 
> Please look at how functions are documented in led-class.c, for example.

Well ... that comment isn't documenting that function.  It's intended to
identify a section of the file whose contents are related.  If there's a
different comment style that I should be using for that purpose, please
let me know.

I'll respond to your other feedback separately.

Thanks for taking your time on this.  I really do appreciate it!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
