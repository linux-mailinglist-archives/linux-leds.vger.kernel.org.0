Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2D6426C52
	for <lists+linux-leds@lfdr.de>; Fri,  8 Oct 2021 16:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhJHOGp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 8 Oct 2021 10:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbhJHOGo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Oct 2021 10:06:44 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC85C061570;
        Fri,  8 Oct 2021 07:04:49 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so11823312otx.3;
        Fri, 08 Oct 2021 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bnuVqqxOBt79qU5yMi3m5uMYBT207yIq6iyAndMFY4o=;
        b=iwRII4SdYezkjcECKUQnVi0sY5AW4/m+Da7UKOjg0jGvskAs9YTTqfQXjgoXYIvk0b
         45/3RJg2X+FW3gg5opoh+MXUom4175HV3BUI4bX/0fNZTrWoodvOHpiiIPnQ1sKcW1ml
         j9aGHqZQqKNruCDFFtZl3oVsB89Em+SlAo8rcEzSb/MQl9OuqjAaIuaTDFNOAHXETU4E
         XTQJ3EeiPWJovFFIqz6Q2p0gF+K9N9ZR41cCuRJKMnyrLBYjJduZxJgyXnOsXRnOhlGq
         BXGrw8PA65uJ1JduzVlTnxQgnCrtq2RnVBRGnq/aI8jkE1/zlQ4+swktxIlPOe+TsEoj
         DGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bnuVqqxOBt79qU5yMi3m5uMYBT207yIq6iyAndMFY4o=;
        b=PC296LcmuLhNZLmA3NeVibY68epMnquvjuTl2SbFeS6aGVd0a+vT4WJA3Or1FwNOyX
         v8YHxDVFFIazv4OMFolCngWKIO2hcKiybE1/UtlT2x0QOoTm6WewkRht26Ge9zsMkK1s
         bThusPBXv3mOvKyd1Eo3CbcPKSXJ6DViDpsbRRlN09PzH6+pE+/18xjTR4d2g9V1E1Wg
         Mh/Eok7Dq6+1GHd0pLQ2bayDIPyi8tkZ1wx0YLvCri/WsdP/SUbk+h5Q5Snop8Jqex21
         ng70e9UsN1/79Xsvf1oZuyZDl7WJqkUiVZRbGP9IVb5eMptqL15S7CUkxA4iy5+i4hjl
         Fhzw==
X-Gm-Message-State: AOAM530kOFjwm7sUH1t5Sj5yLd2WcfChiMGsnXZwIXZuWeUQ/F1vwxT9
        42HvCpWu55Prd4RBYnrFDZQ=
X-Google-Smtp-Source: ABdhPJxG5N4hJ/XdoVm3eRhbnB3taI4dkVTJfRD3NYfj0EbZcA7GPq0E1hpIYkFjbU49dyXAvQJntA==
X-Received: by 2002:a9d:1ab:: with SMTP id e40mr9196139ote.64.1633701888636;
        Fri, 08 Oct 2021 07:04:48 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c9sm599279ots.30.2021.10.08.07.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 07:04:48 -0700 (PDT)
Message-ID: <857be92d-1f7b-dee6-56cb-6138e07c2717@gmail.com>
Date:   Fri, 8 Oct 2021 09:04:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RESEND PATCH v5 2/2] leds: trigger: Add block device LED trigger
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        hch@infradead.org
References: <20211004155546.1120869-1-arequipeno@gmail.com>
 <20211004155546.1120869-3-arequipeno@gmail.com>
 <20211005232738.371df6b8@thinkpad>
 <749c46a3-5d02-08ef-2a45-e785d65999c7@gmail.com>
 <20211008120116.65aec469@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <20211008120116.65aec469@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/8/21 05:01, Marek Behún wrote:
> On Wed, 6 Oct 2021 11:07:06 -0500
> Ian Pilcher <arequipeno@gmail.com> wrote:
> 
>> I have feeling that per-LED work items are likely to cause contention
>> for the mutex, since they will probably all have the same (default)
>> interval and they will usually be set up at about the same time (i.e.
>> at system boot).  Instead, I would propose to have a single work item
>> that is simply scheduled for the next time work is "needed" and then
>> checks all LEDs that are due at that time.
> 
> What about creating one work struct for all different interval values?
> 
> That way if the user never changes the interval, there will be only one
> work struct.
> 
> I wonder if this can be done in a sensible (i.e. not overcomplicated
> code) way.

I've been working on this (along with the other changes), and it's about
ready to go.  I'll send it out later today, once I've had a chance to
write up the changelog.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
