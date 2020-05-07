Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D521C9C9E
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2020 22:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEGUpj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 7 May 2020 16:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726093AbgEGUpj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 May 2020 16:45:39 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA544C05BD09;
        Thu,  7 May 2020 13:45:39 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 188so8034126wmc.2;
        Thu, 07 May 2020 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EgSenpJ9WdkZ8OKwBXP2DgQKftDc5f3xLrRoRS99rrY=;
        b=LENSQd08QX5NaqMQv2LT6RIu0jqhyK1RA9jx74+JCuyjPGutBwzMG1dggwylsZeGry
         zcHma3C9ZM9PMeoGg8/AEkpAaDsrbTW6jSpiysq1eAo7nnR72upnpLcCWRgbNMWb5i2+
         FLcoKaTjjpl2+IVGe+jWgpwcac4SNjKsDq79VncKZlK5ZNsPMff5Qu5U62EsBlmn6hAP
         +PPd57+B2mw4lwDsHNlkjO/y6IttDvZOqt5mvLdgcaiZY0XL3i4kKV83/PvOGtop+nfz
         rN3Q+1gp1pJq4fDV/qddFhuTepVjeKqMlcabI5hUhhsHr5sih40lklDBoxgLn3gXNaq+
         zHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EgSenpJ9WdkZ8OKwBXP2DgQKftDc5f3xLrRoRS99rrY=;
        b=DpejmjBt+E5HIGgMCaXpkHEAYvY9qQ7t06V9dTxF4RBK7TxJ/FP4hVF3MIfvcXCckT
         SfNctV+IB4iMgX7kuCRmfIY8BHs7MlxCUqQ9biaLReNW2h+FeVM/0QNlBFlxw56rZ4pB
         IADdo7K4gPyN5hnv5DhjATp7cT7AwfL14IFX4GklZSbmvdrBrBjnd+5EWc69RKbHxEPX
         G86ABpD81ZdtjP7gu+FIb6hFDvPmpzq7bJcR4HaHX/nLJbtFldrcX/BgIWqMXFcFryVn
         sJi5TAd/ZzJJvA3lKPFkDNEW5smoQRQqTNU2eT/GyHwYrzOn5Tj1e5j8j9/wdysPG5w4
         udzQ==
X-Gm-Message-State: AGi0PuZutK0pavTz7exCQbJAeh8B8JAhPGBeeqUfWS9j/1FngIRtEm3R
        FxKpclizP9BAgkmgJXUNglpQ9kh3/Rk=
X-Google-Smtp-Source: APiQypJDPtO7u5KS/TvTk4SarG2mbA6/1SMRO98Kuhx1nMuJH/xjhRVJBu9DL7rHxZEaEaKeYQlR3Q==
X-Received: by 2002:a05:600c:2941:: with SMTP id n1mr12743483wmd.25.1588884337413;
        Thu, 07 May 2020 13:45:37 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:5df1:24f5:998f:ae84? ([2a01:110f:b59:fd00:5df1:24f5:998f:ae84])
        by smtp.gmail.com with ESMTPSA id 19sm9451068wmo.3.2020.05.07.13.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 13:45:36 -0700 (PDT)
Subject: Re: [PATCH v1] Add support for MediaTek regulator vibrator driver
To:     Pavel Machek <pavel@ucw.cz>, Xing Zhang <Xing.Zhang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
 <20200507174519.GD1216@bug>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <49089bf3-d64b-2a50-269c-623a6ea9c14c@gmail.com>
Date:   Thu, 7 May 2020 22:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507174519.GD1216@bug>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 5/7/20 7:45 PM, Pavel Machek wrote:
> Hi!
> 
>> This patchset add regulator vibrator driver for MTK Soc. The driver
>> controls vibrator through regulator's enable and disable.
> 
> We'd prefer not to have vibrators in led subsystem.
> 
>>
>> Xing Zhang (3):
>>    dt-bindings: add regulator vibrator documentation
>>    arm64: mediatek: Add regulator vibrator support
>>    Vibrator: Add regulator vibrator driver
>>
>>   .../bindings/leds/regulator-vibrator.txt      |  39 ++
>>   arch/arm64/configs/defconfig                  |   1 +
>>   drivers/leds/Kconfig                          |  10 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/regulator-vibrator.c             | 450 ++++++++++++++++++
> 
> OTOH, connecting LED to regulator might make some sense. I can take the driver with
> vibrator functionality stripped, provided it is named the usual way...

We already had an attempt of solving this in more generic way [0],
but you opposed then [1]. Just for the record.

[0] 
https://lore.kernel.org/linux-leds/20170913175400.42744-1-dtwlin@google.com/
[1] https://lore.kernel.org/linux-leds/20170914205804.GA24339@amd/

-- 
Best regards,
Jacek Anaszewski
