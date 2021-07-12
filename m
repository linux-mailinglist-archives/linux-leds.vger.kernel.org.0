Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47E03C64E8
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jul 2021 22:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhGLU04 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Jul 2021 16:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhGLU04 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Jul 2021 16:26:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7BCC0613DD;
        Mon, 12 Jul 2021 13:24:06 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y42so45832040lfa.3;
        Mon, 12 Jul 2021 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yYeY2rP+pjFQVV1qgjvzt4BYgK0J1gLR1rodhNcaD0s=;
        b=tvmjz300FQjJ3UYJdTBVRH5Br20ucCK/I3ge2oOSCKYfC1tyolE7JTQZrQZ+cv/XJf
         /45Camoi0EXo+64MEprAndyxnh5SaUVWXJHGIpr18TW75ncn2Z+94+dpkSX3+jmFNoiX
         hblAWhdrDmXxMr6s21IWV/6rda0rK24gwHsfsfwy7fGjJ8vYmAo9oq0E2shlBvjtS6Be
         dzVtwDqHDSrSfHcHR5lxxgR1O5/N4Ay7OP0QibtVFE3ka2/IVtifv2Q4xQLdCaQOzaly
         SoD6DwzjJWa0Wd9x2bOxlF49xV9KDdTJPLgbGKupSDYp+q4X4uqrtybWQDNw5tq2AtIl
         1wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yYeY2rP+pjFQVV1qgjvzt4BYgK0J1gLR1rodhNcaD0s=;
        b=SnmgcHf5OwnR7mOeiC+lgFno4qpT7Kmvul6VuMy7+Yzo6WcNeoFlXkAAKjxNSeFxjU
         M9cWqQ+HrfwV7qrBEK4exMU2vXjJ/7npuY4O0R49FW3XrZoXVaF8qJzWbMdzwC6KU+Kp
         GQX+LqIwDJTRW1eN0IuWv7uQXi+jhFQ9oEnLLpzOTayk7NMngn0L5FfWqIoDBRhn7SqL
         3tbUvCsqI0QCdjn4JenBZDQzChN9ZOHjheFHFXO2Q5+Beo+0K3Fe/Sc+tWdom198J8Oj
         hscvpZiTbZlbMW9UmGtPi1LxdiixW37WxADJpB75HQvyCwCkAxP6PpWvZz3weI1zmGnr
         H6Pw==
X-Gm-Message-State: AOAM533rlu6e0rZjuiwTYRk8RDOQgcKzyM96qImljdEk9vEZHYWBm0rr
        BfYL0JxTq5XxdkL+wL2y+PQ=
X-Google-Smtp-Source: ABdhPJzwgG7yKBZI6BuET4vQUu1NaGRvQQhFGAiTNcIfxyF+s0zZuoAL0naEC3wNmacXr0WekYC/DQ==
X-Received: by 2002:ac2:50d6:: with SMTP id h22mr447041lfm.306.1626121444804;
        Mon, 12 Jul 2021 13:24:04 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id u3sm1288582lft.236.2021.07.12.13.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 13:24:04 -0700 (PDT)
Subject: Re: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
 <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <019cde8b-e4db-6ad4-fd71-5ed03f174da3@gmail.com>
Date:   Mon, 12 Jul 2021 22:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

You still can carry my ack:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

On 7/12/21 10:33 AM, Gene Chen wrote:
> Gene Chen <gene.chen.richtek@gmail.com> 於 2021年5月24日 週一 下午11:24寫道：
>>
>> This patch series add MT6360 LED support contains driver and binding document
>>
>> Gene Chen (2)
>>   dt-bindings: leds: Add bindings for MT6360 LED
>>   leds: mt6360: Add LED driver for MT6360
>>
>>   Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 ++
>>   drivers/leds/flash/Kconfig                              |   13
>>   drivers/leds/flash/Makefile                             |    1
>>   drivers/leds/flash/leds-mt6360.c                        |  910 ++++++++++++++++
>>   4 files changed, 1083 insertions(+)
>>
>> changelogs between v1 & v2
>>   - add led driver with mfd
>>
>> changelogs between v2 & v3
>>   - independent add led driver
>>   - add dt-binding document
>>   - refactor macros definition for easy to debug
>>   - parse device tree by fwnode
>>   - use devm*ext to register led class device
>>
>> changelogs between v3 & v4
>>   - fix binding document description
>>   - use GENMASK and add unit postfix to definition
>>   - isink register led class device
>>
>> changelogs between v4 & v5
>>   - change rgb isink to multicolor control
>>   - add binding reference to mfd yaml
>>
>> changelogs between v5 & v6
>>   - Use DT to decide RGB LED is multicolor device or indicator device only
>>
>> changelogs between v6 & v7
>>   - Add binding multicolor device sample code
>>   - Add flash ops mutex lock
>>   - Remove V4L2 init with indicator device
>>
>> changelogs between v7 & v8
>>   - Add mutex for led fault get ops
>>   - Fix flash and multicolor no-ops return 0
>>   - Add LED_FUNCTION_MOONLIGHT
>>
>> changelogs between v8 & v9
>>   - reuse api in flash and multicolor header
>>
>> changelogs between v9 & v10
>>   - add comment for reuse registration functions in flash and multicolor
>>
>> changelogs between v10 & v11
>>   - match dt-binding reg property comment to the functionality name
>>   - remove exist patch in linux-next
>>   - dicide multicolor channel by color definitiion
>>
>> changelogs between v11 & v12
>>   - Fix print size_t by %zu
>>   - Fix dt-binding name regular experssion
>>
>> changelogs between v12 & v13
>>   - Fix kbuild test rebot build error
>>
>> changelogs between v13 & v14
>>   - Move driver to flash folder
>>   - Remove LED FUNCTION MOONLIGHT
>>   - Keep 80 char per line
>>
>>
> 
> Dear Reviewers,
> 
> Please let me know if any update.
> 

-- 
Best regards,
Jacek Anaszewski
