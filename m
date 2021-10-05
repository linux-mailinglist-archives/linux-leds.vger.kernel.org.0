Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3AD4230D1
	for <lists+linux-leds@lfdr.de>; Tue,  5 Oct 2021 21:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhJETe6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Oct 2021 15:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhJETe5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Oct 2021 15:34:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCB0C061749;
        Tue,  5 Oct 2021 12:33:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r19so349464lfe.10;
        Tue, 05 Oct 2021 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mnw929F+QI2LJCOMHvncA5yXLsxHMMtEgXZ8YjCURP0=;
        b=LOkaoCOgIJr/xRS71R/aGAl16ufAufpmQ6LQa9PSMe1IkxPWbhUMT9y9KVDXPnlAlb
         g8cm0s0TzWU7cp28BV8qCiKosF0KefkIHWSLiL/YRITiXRg4ueMabBFHLdtstcelVLoV
         FfdUDXpDfSl2222FxMvvQdg3Tz84BHANry18dE/7fE+RTWh7BNFTnlAduXayKgmzL+/Q
         h/qEIgr0iMl6h5WAuiH67Vj1Hqnr8mNGo+GBi62+EU+LMhRk+hpF8l0NsHRrHmIakOSo
         WG1aRsWrdbdutuGftaTAyENWv4X6ZMn3EVcPU1IdyrZT8ClZOGUc/DF6vTVEbC+7F8AY
         BswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mnw929F+QI2LJCOMHvncA5yXLsxHMMtEgXZ8YjCURP0=;
        b=qsCo4X9xj5LlHxpnro53MsBQbbNvAaRMn26zRcxsYnHgt/2KXBkp7iDQ85XSrd2rcJ
         SfA5ESMRxGK3q3Old27rwWZGrgdCirwNTYTbTeBZliowrTK4WPEdWHuqClfr8eG4g3Mm
         h0aC/dhxhuk2E+p4oaHR4Na1vp4GCyOr0YceleA/Q30/DTjFnqTMSlO/ym0S+JvlVnjY
         7IjeJa6i0YfSNvKgOYB6qy4DP913JOVsM9a+u0WCWyNvZnDyi9edfNdE+dSzmAFA+WHd
         mi3gOklrXECY4slj41HTmAVRdlITQhoGuNc8SVzNPUf7AbVMWx2shWicT1sSYgT4o8IW
         lakA==
X-Gm-Message-State: AOAM530+CeqNCe18h2yIyeWLgm7ddSRcJFUGBZ59Bo7M0TvLPt+/ty4R
        ykGst1fuuyjA8b+1wfF6Dd0=
X-Google-Smtp-Source: ABdhPJw6jz+UwRuXxIZNsejqH598H90/HYL7Ur7sw+6Sq7kBCBP9Q3ncqHKUUiZEMVYXyLv2v5Cp+w==
X-Received: by 2002:a19:c70b:: with SMTP id x11mr5373363lff.57.1633462384164;
        Tue, 05 Oct 2021 12:33:04 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id e30sm122581lfc.112.2021.10.05.12.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 12:33:03 -0700 (PDT)
Subject: Re: [PATCH v15 0/2] leds: mt6360: Add LED driver for MT6360
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
        ChiYuan Huang <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
 <CAE+NS34qtKgQYiCLQDupLK8L84SVS9EsztOpQFtS_CoOPzNwzQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <417ee2ca-daf3-3559-5ea5-7f08c655f16b@gmail.com>
Date:   Tue, 5 Oct 2021 21:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS34qtKgQYiCLQDupLK8L84SVS9EsztOpQFtS_CoOPzNwzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

On 10/5/21 11:21 AM, Gene Chen wrote:
> Gene Chen <gene.chen.richtek@gmail.com> 於 2021年7月16日 週五 下午4:33寫道：
>>
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

Do you see Gene's emails or maybe they land somehow in your spam folder?
It's been four months since last version addressing your remarks.

-- 
Best regards,
Jacek Anaszewski
