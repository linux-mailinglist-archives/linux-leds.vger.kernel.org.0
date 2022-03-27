Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31CC4E8717
	for <lists+linux-leds@lfdr.de>; Sun, 27 Mar 2022 11:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbiC0Jag (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Mar 2022 05:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiC0Ja0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Mar 2022 05:30:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9F01ADAF;
        Sun, 27 Mar 2022 02:28:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e16so20072014lfc.13;
        Sun, 27 Mar 2022 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=FD+QvKtFZFyfqQW7MMku4+lDaR5ZcLb3FnBreUMKRQk=;
        b=e7JbEIGYBfXwQHAMquINvrDjMmp1Zbo7vbKzfnmVjC+qJ4LuA3jJXFFz91vo6it2yz
         65DmoQJE+6MQs/lTSX2BcnLSeTE1y/bpWkpFcU2SZSY9PcAbWuB6OJ6mUsLPaLUCm0dy
         dkRWTV0zEJStM8w3fgpJdG6Xj4dENonY11i58jmC+Jp6Q2Cswdh5egn3e6gW/Ro6hmNr
         yE7f/6ft6YNZ4VQi7s8drBtq9yDiB1j7N9O8b/G/D9P77jGjX8EC2mccaY+sphng0Cdy
         CHYSvLwoGztwrqf+iExITewtcwE/DPOdHWKCa6SLhu4hNYaC1fIeDGto7wTNY3s6DoE1
         cDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FD+QvKtFZFyfqQW7MMku4+lDaR5ZcLb3FnBreUMKRQk=;
        b=BCfH2UeZqxKhWdOlQ9ztW1orVu0hjkvprk+dQx2YWABpr9Q9JeEP7of3dr+pPUn+TL
         HUoCOnRMDgZ3YtFpSUOmdMeP9AIQtJeqUNWxzsVsHR+4ByTe9J5FppGxXFyDCuGMJHI2
         LmGDHdXxMCo6Ct6qsY/wedjFRm+186ztGVPTQNGhkX8wTB1y1mbJmnTlBZlxjMtyaBjG
         iODMM5ZY+4ewu+LSNpVUegrxEG7w5/kHlDuMWSspZr+nHs5ceCBED5E+1oM99Hx3aPEu
         MG8lVp2r2GfSjxonuSHE+KYTDLG6UkoFrEFjZU/lnkWMdA91OntOW7B3Z+KljaM+gYfL
         2zAA==
X-Gm-Message-State: AOAM530O5CRmi8K6xdnapfEt2Ht9aJ4TkDbh4Z6jpfjApK7j0g6gFrQF
        7X7MSCaEtaaJsK1QiFKViOO5bbF6AK8=
X-Google-Smtp-Source: ABdhPJzdXGSCOOuYy3zqQ6W21ZuzAW6CTGRMer8n9JdvVsrrhO7M6MP7k1cdWZ1Oh9C+NQkAt8ZBig==
X-Received: by 2002:a05:6512:159e:b0:44a:31d7:3711 with SMTP id bp30-20020a056512159e00b0044a31d73711mr15102986lfb.40.1648373325352;
        Sun, 27 Mar 2022 02:28:45 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id v1-20020a2e7a01000000b0024ac272d727sm575856ljc.79.2022.03.27.02.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 02:28:44 -0700 (PDT)
Message-ID: <223aabc8-7ec3-2719-866a-8f35ab97a11f@gmail.com>
Date:   Sun, 27 Mar 2022 11:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] dt-bindings: leds: add Broadcom's BCM63138
 controller
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <20211227145905.2905-1-zajec5@gmail.com>
 <1ca1d83d-9803-77a3-e5bb-2380a2dc03b0@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1ca1d83d-9803-77a3-e5bb-2380a2dc03b0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 7.03.2022 07:27, Rafał Miłecki wrote:
> On 27.12.2021 15:59, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
>> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
>> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
>>
>> The newer one was also later also used on BCM4908 SoC.
>>
>> Old block is already documented in the leds-bcm6328.yaml. This binding
>> documents the new one which uses different registers & programming. It's
>> first used in BCM63138 thus the binding name.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Pavel: can I get this patchset finally accepted, please?

It has been 3 months now. I kindly pinged you in January, February and
March. Please let me know how can I get those patches accepted.
