Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92953539E64
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jun 2022 09:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345528AbiFAHgd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Jun 2022 03:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345924AbiFAHg2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Jun 2022 03:36:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BDA91594
        for <linux-leds@vger.kernel.org>; Wed,  1 Jun 2022 00:36:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gi33so1956243ejc.3
        for <linux-leds@vger.kernel.org>; Wed, 01 Jun 2022 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1NLbj63p78gaZ8WaajEU8PUTCmU7WPY2qFfR3aIc2H8=;
        b=gqBcGcAkA8yHXLTni7MKZcgZpIkQHVSVTHhr/karxr9ZXi7QXpOby0C1PSZ+CxEZHD
         evRMSrT6rKpG0jp6FBf4/F3CtsD6yYFKugM2+mCp9sxULDIupq2sV2HELbPhFFrDdKKG
         /VGVXv3DC8CNS2Qw3WoAsYRy75CVYWNW6iOIREj8ldQTYzWrJpxg0ayoLYYT6jwf22ok
         ZobxHbs9TcZh+0Glo6CkNmSg+6C/msfP1yuxPMVsnlj7w1XFRuq/lxp3KCYGxaMEtUWE
         bGMsEcGgoiyKOp6LUmB9IWp43dbJtxGQypSvfWhG013S0VgyBqar2nl8/XQxPEiQEFHr
         mt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1NLbj63p78gaZ8WaajEU8PUTCmU7WPY2qFfR3aIc2H8=;
        b=dEujZPfaKfJ6j2re36qokv8dPSOWjiNdDPDVWtcpTSdMHEHbWosLO5/+oaGf1OUH3Y
         AHnJQcJ6enuezv+hxBnbUsdzwar6+X3/yaGPMStsYp4N9RrzqAV3UFGFehMIRK6dI8FJ
         4ZtGqajcP42KtVyp3vjyuCB2x5WJg2DefrArkhc1TeNyeXVCmPNXSosXEsX24i/D1CoE
         HdXDpYepinJqpYHs7M3Mqagp+zs10d343rT+E7k/ihUZOkZ7rLCpxFt9SIE5zy9eSyx2
         4B3Ys+2sjTlr7IZBUZ0KFYKuENIiF3Ei4rAIkM29PmNV+GqAHeW5j6mVs0wc+Sqj8jrZ
         gQoA==
X-Gm-Message-State: AOAM532WaxA+g979Lg9uztMnj7RCu2tRmVtMb7H8JTP5oHZ0fhD5mPFP
        dTlAqaoA336rF1WBuZcBASXJGw==
X-Google-Smtp-Source: ABdhPJxg0SzgI+t9GI5poUsf996ZK2hzQvgWSQYGKBMZk4wcTKUZeLadLadxYiaP5JO/Z+O8cYDoXw==
X-Received: by 2002:a17:907:d13:b0:6fe:ece3:64e1 with SMTP id gn19-20020a1709070d1300b006feece364e1mr40377450ejc.584.1654068986057;
        Wed, 01 Jun 2022 00:36:26 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bv3-20020a170906b1c300b006f3ef214ddesm374169ejb.68.2022.06.01.00.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:36:25 -0700 (PDT)
Message-ID: <92708b65-231a-68db-f624-02a6e76cb49d@linaro.org>
Date:   Wed, 1 Jun 2022 09:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 02/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding
Content-Language: en-US
To:     ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     cy_huang@richtek.com, alice_chen@richtek.com,
        chiaen_wu@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-3-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-3-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 

Please apply my previous comments.


Best regards,
Krzysztof
