Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD681067A
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 11:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfEAJpp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 05:45:45 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52080 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfEAJpp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 05:45:45 -0400
Received: by mail-wm1-f68.google.com with SMTP id t76so2759029wmt.1;
        Wed, 01 May 2019 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xUDmUA+ta1A8+ZzMN2QQ5gPy8NIraQiuCwNXfvnc3LU=;
        b=EIcjNNDrIAAlYhvhmHymJLhL+XLLnJY1aBq0L0DvAaxpUfIhRnILNAzyf276LJyLGj
         D3xOO9ZlOCaFbCYzLT0u9hWY+RDMfe5mUhj3iBmxbJds2O+og07K/tewFZr2r5PoveHB
         TY646FY/E3s9al13kNvogIzxx+chLkCCSLa9C8r5qlx0876VwaOL1oUrUS8Gki8/1u8o
         UVHgulvV2ExDgbKxGzTjAHhMzqgSIKDoaPfzCa/Z5m0xZXHogMtyAV+ejWk48Y2ng/b5
         508DTd81QDQX7O3PT+Xw6yPs+XK+CuG5Ks+0UPNoQWtiSRc3nwiACILVCt0Hnv/gowrG
         nqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xUDmUA+ta1A8+ZzMN2QQ5gPy8NIraQiuCwNXfvnc3LU=;
        b=DA2zs1g5chGjTv1vHV/K/do3pKN3hH556jPkP/gYRWwPqIufCD7hWu4uG5AhVcxcUF
         PHEItcU5xRECGeIga/f4/qQKi3r9TtRaZJzox4xYjNof5FZnfQGNgzTeUBR7FfuKaixl
         LiuKhL9ljQBv78ReDQPA/00mXdaAKQXasdqaWWzvj+OvbTwMcZejRMRzXsKa2qKCA/Tm
         S/jy6/KjeLNDFsFBW6LHE0wz7rz+NFgQ1sd7ujpaUi525eHry7RhUzqJKw3daig32ASv
         HumSABftuIjIWnJEQThWL8R7UCrJ+k5MOY0Pnv5RUlARTbx4ob9fiZG2zPo5odza7Ys3
         LQGw==
X-Gm-Message-State: APjAAAVAQA/Ww9Vw5PaIfWk9x/B+QPznD3LkuvLA+dGOMh7ffC9pEvGK
        SgVDRJ5WwQhCZkE+BIU99Qif9UaJ
X-Google-Smtp-Source: APXvYqx0kSkYbFSFBuSRwlNKOJIivQ2x22eh3PljcjtDR78OCSwKn00bZUOPJwu09jPtlBD3ljmlvg==
X-Received: by 2002:a05:600c:1191:: with SMTP id i17mr2598746wmf.84.1556703943200;
        Wed, 01 May 2019 02:45:43 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id d11sm4542656wmb.39.2019.05.01.02.45.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 02:45:42 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] LMU Common code intro
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
Message-ID: <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
Date:   Wed, 1 May 2019 11:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ekhm, I forgot to add the main recipient.

Adding Lee.

On 5/1/19 12:05 AM, Jacek Anaszewski wrote:
> Hi Lee,
> 
> This patch set has dependency on the previous one for lm3532, which
> also touches ti-lmu.txt bindings, and for which I already created
> immutable branch. Now if I created another immutable branch for
> this patch set we would have to resolve conflicts between the two,
> as they would both be based on 5.1-rc1. Adds much overhead and
> is error prone. Therefore I propose to apply this patch set on
> top of my merge of LED tree with the immutable branch for lm3532.
> 
> Please let me know if you see it differently. I'll wait for your
> response until Friday, and then proceed with the above as I think
> it should be harmless for MFD.
> 
> Best regards,
> Jacek Anaszewski
> 
> On 4/30/19 9:17 PM, Dan Murphy wrote:
>> Hello
>>
>> I have added the Reviewed-by for dt bindings as well as made the 
>> Kconfig change
>> pointed out for the common code flag
>>
>> Dan
>>
>> Dan Murphy (7):
>>    dt-bindings: mfd: LMU: Fix lm3632 dt binding example
>>    dt-bindings: mfd: LMU: Add the ramp up/down property
>>    dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>    leds: TI LMU: Add common code for TI LMU devices
>>    dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>>    mfd: ti-lmu: Remove support for LM3697
>>    leds: lm3697: Introduce the lm3697 driver
>>
>>   .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
>>   .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
>>   drivers/leds/Kconfig                          |  15 +
>>   drivers/leds/Makefile                         |   2 +
>>   drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
>>   drivers/leds/ti-lmu-led-common.c              | 155 +++++++
>>   drivers/mfd/Kconfig                           |   2 +-
>>   drivers/mfd/ti-lmu.c                          |  17 -
>>   include/linux/mfd/ti-lmu-register.h           |  44 --
>>   include/linux/mfd/ti-lmu.h                    |   1 -
>>   include/linux/ti-lmu-led-common.h             |  47 +++
>>   11 files changed, 712 insertions(+), 95 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>   create mode 100644 drivers/leds/leds-lm3697.c
>>   create mode 100644 drivers/leds/ti-lmu-led-common.c
>>   create mode 100644 include/linux/ti-lmu-led-common.h
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
