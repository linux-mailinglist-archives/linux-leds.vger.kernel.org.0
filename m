Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34FA84CF1E4
	for <lists+linux-leds@lfdr.de>; Mon,  7 Mar 2022 07:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235543AbiCGG2u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Mar 2022 01:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235547AbiCGG2s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2022 01:28:48 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DF7617F;
        Sun,  6 Mar 2022 22:27:54 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g17so936015lfh.2;
        Sun, 06 Mar 2022 22:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=RXvSF5PPqX/AJr1eUEGpLvV9dSVW9b88AcbQSFrOFDw=;
        b=GtiwXi+OA03rnUu+6AhoLosNuBEaGLli68h72T0mGjzlJmTMDrDfkQDvEyKxaQUeXR
         x8NxhmeK+eEPah2dLbXI8Gc1tJTIkz0XatFldnLjm4SY5JXH/joPD//+ipMIUbxzyvR9
         JXFgfhO4VT68F3amNOvfRny5GjQ9XrDf5y63/9/ZEp1xxz7yvqAbYZJ35NFKZjUZBmwd
         mEm67Dt/EQEu+59NPpnhS7AtgXx7MbbHwJFGEQpLZFEk6bcxm58R3DapuuJEI97vBhSg
         Cs8Mdcc5gA4y7AOcG3463OlbOoqwpZxUasZzgeDVxHsqd2Ujbhm6VQ/3uzq9LHX8xcxU
         vGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RXvSF5PPqX/AJr1eUEGpLvV9dSVW9b88AcbQSFrOFDw=;
        b=fvV9n+6zDh6BKlQMvQEUwd2hnwRP+kutJXyzIqn09b62lP6W4HhIA1tHxBo8LVcsWN
         wsZn4oYyGbyItxNAQQ7TwnE8B3beLBDyUPf3ZGkNPfIAF2pMcj1JpVNjTInheDQApxUn
         4Qmp1OQQHAbyYomrW5jPn79QK/LwIMo4oFaWQM+w8CNOorI2qp2vegJb7fm1BueFAlGG
         gdKv5vW8JvyjMegJtB3M71LtZFySoMdVa8yMu+sbVicnBP2Xrgdtit7kvw6bA+G++C75
         TbBFtgwYf0YO2421IQRENnM1+L4OoYKlX3592778MJLq+hqRHip1k/JZnoRbaKLaSbRc
         yysA==
X-Gm-Message-State: AOAM530fvd1J9S7n57u9FcaaOywVMI12001R+JxqhiA4CABusXTBCZ+s
        CvWklf92tNsnf4mG6T4ZAzQ=
X-Google-Smtp-Source: ABdhPJy27nT0AsdmjVaspUe7ODTrN5pPXXiZW+Wxt59sk6jm9bj2gB8mbnunAmOeqVK/fFFwsjYuzQ==
X-Received: by 2002:a05:6512:a93:b0:442:5d43:7b21 with SMTP id m19-20020a0565120a9300b004425d437b21mr6828367lfu.427.1646634472332;
        Sun, 06 Mar 2022 22:27:52 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id i27-20020a0565123e1b00b00443b9eb1b58sm2673604lfv.99.2022.03.06.22.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 22:27:51 -0800 (PST)
Message-ID: <1ca1d83d-9803-77a3-e5bb-2380a2dc03b0@gmail.com>
Date:   Mon, 7 Mar 2022 07:27:49 +0100
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
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20211227145905.2905-1-zajec5@gmail.com>
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

On 27.12.2021 15:59, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
> 
> The newer one was also later also used on BCM4908 SoC.
> 
> Old block is already documented in the leds-bcm6328.yaml. This binding
> documents the new one which uses different registers & programming. It's
> first used in BCM63138 thus the binding name.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Ping?

Pavel: can I get this patchset finally accepted, please?
