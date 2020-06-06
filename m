Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BAC1F086D
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2020 21:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbgFFT7m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jun 2020 15:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbgFFT7l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jun 2020 15:59:41 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B64C03E96A;
        Sat,  6 Jun 2020 12:59:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k11so13896714ejr.9;
        Sat, 06 Jun 2020 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n5XWxTbu49klTKh2OV1xwSrup891qcSS3M98k2q6wzs=;
        b=bSGIPCGFYpQplqdBDclrszoeF5pyhcx6S+wIRfcQu/G4/SFH80rDHzkwmphCDZ6UFO
         m01JiC8oKBG8tGDEVHlbV2efJOLblFM+rMVn7GwbM8XdnGHflCJtCXR3OSjy3HegQ/4A
         Jsqn0+nmWUDhqmAuZoX/p749Bint1svFLDUaDQarA8WSiddXJgj+lwJJP3siqfhp5v51
         FaRKnlAV9GmiZVG/CpeRJ8FEkMnIN9HKeeTZMq5rj4UP2Rvr2KWGLEN2M9XgyErxch7G
         UtY+oinumc93T8wm2lD1niYj7yivi6oTUEG7fM5Quz68ah0BY8NOc1MWAqVGIT7iM26B
         +UTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n5XWxTbu49klTKh2OV1xwSrup891qcSS3M98k2q6wzs=;
        b=buZOWWJc/h2oYzO/oDX8oh6gzvgX2d0ofX5NkqPl9sS6xZ1TW6FVvZAHwrlz2hyblc
         fnf6qtJrjQy/DAA//a/1BjcYm0PT+lGU6RxevQPkztxaznuflKK27VJdNPa3g6xpgTsg
         fEcCZ33IrhWS0REorZEAi3DtNXT+ogBEQh3K9xhCp+LWKm3LJ5Pfp9ksKGXVYz7K8thZ
         /WSfrVxeW/+bn/ffDUFYRepv2szIxl6U+8C+Qz4J+psvSvJIrHf0QEtA65WFERWCgcqy
         /EpvTZ0hhpGeVGJMDjRvWIjn9XTX4FnuelulAkdn6z8fe1v+o57rtTjpZzNwYWI+MUXD
         RtbQ==
X-Gm-Message-State: AOAM530ur93Rk8ld3PXRlXXU3vEDAvJvLm2R32bfTue1UPeiu2a72GV7
        ceP6DWjyQWkG2yDnpacy+BGLxtXL
X-Google-Smtp-Source: ABdhPJwXMA7ZLUaMLk1avqpZMTY4TtEV3VlReQVsStdY4Z2Tyn0cFunI//SB1V20iNokJijzxpQZfg==
X-Received: by 2002:a17:907:4096:: with SMTP id nm6mr14445477ejb.4.1591473579565;
        Sat, 06 Jun 2020 12:59:39 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e442:880b:6e2c:2ebd? ([2a01:110f:b59:fd00:e442:880b:6e2c:2ebd])
        by smtp.gmail.com with ESMTPSA id cd17sm6726607ejb.115.2020.06.06.12.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2020 12:59:38 -0700 (PDT)
Subject: Re: [PATCH v26 03/15] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-4-dmurphy@ti.com> <20200606155324.GA21130@amd>
 <92d71058-a75b-fd3f-59b1-5133be1c21b5@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a8cb3d33-7a7d-82ee-e598-0f48368677cd@gmail.com>
Date:   Sat, 6 Jun 2020 21:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <92d71058-a75b-fd3f-59b1-5133be1c21b5@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/6/20 6:39 PM, Dan Murphy wrote:
> Pavek
> 
> Thanks for the review
> 
> On 6/6/20 10:53 AM, Pavel Machek wrote:
>> Hi!
>>
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The multi color class groups monochrome LEDs and allows controlling two
>>> aspects of the final combined color: hue and lightness. The former is
>>> controlled via the intensity file and the latter is controlled
>>> via brightness file.
>>>
>>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor 
>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> new file mode 100644
[...]
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -9533,6 +9533,14 @@ F:    Documentation/devicetree/bindings/leds/
>>>   F:    drivers/leds/
>>>   F:    include/linux/leds.h
>>> +LED MULTICOLOR FRAMEWORK
>>> +M:    Dan Murphy <dmurphy@ti.com>
>>> +L:    linux-leds@vger.kernel.org
>> I'd like to be mentioned here, too. "M: Pavel Machek
>> <pavel@ucw.cz>". And I'm not sure if I should be taking MAINTAINER
>> file update through a LED tree. Should definitely go to separate
>> patch.
> 
> Oh definitely.  I thought it was implied that you and Jacek are both 
> Maintainers as well.
> 
> I will add you but will wait to see if Jacek wants to be added.

Actually I don't think that we need to add this separate entry
for LED multicolor class. This is still under LED subsystem,
and I didn't add anything for LED class flash.

> I will separate this out and make it a separate patch

-- 
Best regards,
Jacek Anaszewski
