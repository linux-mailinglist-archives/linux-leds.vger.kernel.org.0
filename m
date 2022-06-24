Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D91559888
	for <lists+linux-leds@lfdr.de>; Fri, 24 Jun 2022 13:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiFXLWs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Jun 2022 07:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiFXLWr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Jun 2022 07:22:47 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26D87A19C
        for <linux-leds@vger.kernel.org>; Fri, 24 Jun 2022 04:22:45 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id cw10so4082101ejb.3
        for <linux-leds@vger.kernel.org>; Fri, 24 Jun 2022 04:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tgk54MZ41PYHuB/Q4rLG9CYyOFNJDlQyyrk8XZCCg1U=;
        b=Oyq5vCrpAPNrAziFwKaF2lBkP2jNPRprPBFhuec6kn+YBvz5ss6Ytk/6xOrQO/eBwu
         8UKDIPAUP6m6QKDwOkcCGfwGNqMMxj9Lv7iBjtxheUp1JumjXMSZ4zVxBlNGypmVpEqE
         rkZQ2ZzxgmeGxcd64+Xm8PtvF/Gz27BFOwtrwgIu/RMjXfaTDMz9EPeA2d4u1lmmICyn
         4KerevADvvaCxSCLcYbGGjd9pacaZOPd29c512UV7Arvp0wI01ZPoIHagcw9J526IEi1
         /ltWhsiXxxeRXLwQk4upL1m46Xm4SElptteEJwp2Izm5+pob1ZNsb1mH67hFZj4mlfb4
         sjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tgk54MZ41PYHuB/Q4rLG9CYyOFNJDlQyyrk8XZCCg1U=;
        b=lycuTDXAuk8PSyf9SBX85drSyn+zprcjQPnipzoTpcBtYDDIV17rYdHazxJaxEeiAk
         Nw0jrpSY6fkBIvpphuw4Ibal2XLVFCxOwE5FBqzxbmGR1fgHQ83GySEYHYwjuey/JZNi
         PPHaZZhbCJh+10uRV4lkOeKBdgZ2LuTlWSLy8IZCUh4NDWqDCvGymkub3mh0sErDdqxo
         1leGKKO6J++mStSd2zOlcXjz/cFdvZ40oa7nlD3Hgy8ZxNmWa5NBrmru7nTwAaxLl9xp
         Uqu+pRIxPgriyhrHpgXwf2oi+tb6t82xz1vxVrDU+/TN/IjjgNH6aHHo9g4zeQnmixqJ
         jRcQ==
X-Gm-Message-State: AJIora8Yej1BlOeeqHMwXqPEpR54y6LOmsjatAjCAQb/o9mRfnDuW7fa
        RME/GT40mBq42MKti0kzMFaimQ==
X-Google-Smtp-Source: AGRyM1sYtcDa5bMUak2KZgL6+/Fc5vtdSfpUcIOTo5XhIbe5rtkcGY4Iq23VRgOKO7sKLDlaVq/HbA==
X-Received: by 2002:a17:906:4c9a:b0:726:38df:6f6f with SMTP id q26-20020a1709064c9a00b0072638df6f6fmr495588eju.485.1656069764388;
        Fri, 24 Jun 2022 04:22:44 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7dc4a000000b0043567edac3csm1795392edu.61.2022.06.24.04.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 04:22:44 -0700 (PDT)
Message-ID: <5cfb502d-951e-2b5a-aaec-a2ef4c71d5e0@linaro.org>
Date:   Fri, 24 Jun 2022 13:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 04/14] dt-bindings: leds: Add Mediatek MT6370
 flashlight
Content-Language: en-US
To:     ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     chiaen_wu@richtek.com, alice_chen@richtek.com,
        cy_huang@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-5-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-5-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 23/06/2022 13:56, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
