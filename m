Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CABB2B9DA6
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 23:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgKSW07 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 17:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgKSW06 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 17:26:58 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B02C0613CF;
        Thu, 19 Nov 2020 14:26:57 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id 7so10193240ejm.0;
        Thu, 19 Nov 2020 14:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LbNQsMFkK1yV1B1LtL5N3Qufx4e03bP9/878SJx99ZY=;
        b=LfNizfWwMJlvsDK7TkuVLjpZmsZJ47u3qRc+5tuIayvySsP/F42X1P3q7d0Y2Tjryi
         r4N/ChZgBGa/Lvda+9kRXn4gKMr4m8DUqTNqQSdbcxr3GLh3hknmKq3Z6iGP3ckt+r38
         1OQz+W7d2W71tTvoQxBsAHoAlPShWNceF7OzdXcqyPScS0SLoLLfUhn+S9KuOssyetwI
         Oy46k9O5vCnntSmz4qHUzKnNiUujMgL9dl+Gr4ON7tdPTyBRATASB+c8Nl0r5Fwb8UnU
         2ckq6uegVBO91pPF6UvKFXij9vVmqJ754lnSyoAau+yoWZejMp6T2s3AZoEF8HY7fzfR
         q6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LbNQsMFkK1yV1B1LtL5N3Qufx4e03bP9/878SJx99ZY=;
        b=lB1cR9/svtjyxEGdEmfzLghSfIEryXc1+H5YijcuHHZb/hWsnMzGOkdT8RQsiibhjs
         g0ewQe2EDYX86c27WsU1TZXqaeTMy2UL1g9/RvplEgrViXe2VlvaMEGKmNUI2wTjkKs7
         p5p6u54g2dW5rWLDPfvN/uv0TSfZF2r24SwTbgmGtlvUbZ+pQrVbpWCs7Ye23H83d0AG
         qTeyYC/PZRBjTsEjpOMAz51/T/LJBcjQj30YGqiedYfWQfVWuM/AGPAPpT8AU4+VcDTj
         v7gCm9O8mfanM7h7/CDZ8FftcHWJI2XKZK3hWTXBwHXpmeiFf7YxF4Pje3OssmIgzL4F
         pVKA==
X-Gm-Message-State: AOAM532p/VzZGsB4GYj9rUG+yQxRcmGTSyeh+WB15MRn01DholqjO4UZ
        ndZxhvchimd4cm9bFtu+KRI=
X-Google-Smtp-Source: ABdhPJxm/T3wnrw3Zcv7cp66ZFcGtFhRT7XBaN1zQUgG4VBx5/eLl4bxa8i8fMHRnq6Y0sVcIldDog==
X-Received: by 2002:a17:906:6b86:: with SMTP id l6mr30525271ejr.524.1605824815814;
        Thu, 19 Nov 2020 14:26:55 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be? ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
        by smtp.gmail.com with ESMTPSA id n22sm342031edr.11.2020.11.19.14.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 14:26:55 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
Date:   Thu, 19 Nov 2020 23:26:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201119215721.GA5337@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/19/20 10:57 PM, Pavel Machek wrote:
> On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
>> Hi Pavel, Gene,
>>
>> On 11/18/20 10:37 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>
>>>> Add LED_COLOR_ID_MOONLIGHT definitions
>>>
>>> Why is moonlight a color? Camera flashes are usually white, no?
>>>
>>> At least it needs a comment...
>>
>> That's my fault, In fact I should have asked about adding
>> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...
> 
> Aha, that makes more sense.
> 
> But please let's call it "torch" if we do that, as that is already
> used in kernel sources... and probably in the interface, too:

I'd say that torch is something different that moonlight,
but we would need more input from Gene to learn more about
the nature of light emitted by ML LED on his device.

Please note that torch is usually meant as the other mode of
flash LED (sometimes it is called "movie mode"), which is already
handled by brightness file of LED class flash device (i.e. its LED class
subset), and which also maps to v4l2-flash TORCH mode.

> ./arch/arm/mach-pxa/ezx.c:    	       	  .name = "a910::torch",
> 
> Best regards,
> 							Pavel
> 

-- 
Best regards,
Jacek Anaszewski
