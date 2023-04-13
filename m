Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DCC6E0B26
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 12:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjDMKMp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 06:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjDMKMV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 06:12:21 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DDC9776
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 03:11:49 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso9676743wmb.1
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681380705; x=1683972705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rh1gldBq6zKF54NhdToFqztzBsv3VTQhW4I1lS7ak3s=;
        b=cd/3lqYYREcX6JZjYJCzZcFEiAlsmLK9yPaLNG2ggAfQWA03NDHYlNe6RFe5ctjv9j
         qkE5Cf1F+oJYzQo3r73M21KKBaPIzK3KyQFLDTKYYiBkxV5Q356zFVhXMe5hyo1ilEoX
         qyGs1bAiedY+adpUXbxa1aaOjAzy4huTTBHKeWvcHoFd2EWjO4UiZMMDFIfFLr5scngV
         d38urRIbk2oz8ofRbz43x2+gQIRnGxFCRxeiPsgvEjT/ikUExlhCMUQ+YQW52jtDV8TR
         owvkvvgib9FfCWgDC/jd3QaVLUOmQKeQd7MXLeZQdehb2kkpHs4EYCf22Z4waE/Y2o4J
         FEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681380705; x=1683972705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh1gldBq6zKF54NhdToFqztzBsv3VTQhW4I1lS7ak3s=;
        b=PQ7QEQUrAMw8UrXTlGRwxUnYxpzDsCg9S2ny5jc2we1WV12zXJ6Yd44iTGyc1kNRw6
         tCiG+2xBi1oNQpOz2E0PB0ntKahGk/wRpiwcvbnmn8UHNKbK7MlH76YLQ4yCji9KMcTs
         1bU6WhSez0WGU/DzYO21QmDDIEYyu0tkbQOhUhDsFqe3WKAul0D2QPpBSP6OVNj8Zoli
         Xg8xMwbJIzyHBhtHYW3rG+W9QDvm87sWc+tdP16zeFClaaIT7oDgVPQ/uLlrRVTDLAQP
         OtVJyTNggzUOl2E6VccD5M/X61BBTmrHHgqDYpdCMP+1AVZuaUZIK1cE2P100Ov3LJpI
         k9WQ==
X-Gm-Message-State: AAQBX9d4b0uL0n/f/5XpPESPlZMKfaCnz9/S/eHZIN0akqTvPUYX2Arz
        2jWCoWHlQOuJgE9r7pIiPA4kCw==
X-Google-Smtp-Source: AKy350ZFAT71PMZf5H+HAkQEk6xT99x0FuglrvXuwh0ry9ycBGd2Dz0LsyxMOMG0AoEOw6ril9Fmig==
X-Received: by 2002:a7b:ce88:0:b0:3f0:7ddf:d8e4 with SMTP id q8-20020a7bce88000000b003f07ddfd8e4mr1279283wmj.17.1681380705280;
        Thu, 13 Apr 2023 03:11:45 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c228800b003edef091b17sm1381662wmf.37.2023.04.13.03.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 03:11:44 -0700 (PDT)
Message-ID: <40f79e51-db8b-7105-5cc1-4465ca818416@baylibre.com>
Date:   Thu, 13 Apr 2023 12:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/7] leds: leds-mt6323: Specify registers and specs in
 platform data
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, pavel@ucw.cz
Cc:     lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-4-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> In order to enhance the flexibility of this driver and let it support
> more than just one MediaTek LEDs IP for more than just one PMIC,
> add platform data structure specifying the register offsets and
> data that commonly varies between different IPs.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/leds/leds-mt6323.c | 145 ++++++++++++++++++++++++++++---------
>   1 file changed, 112 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
> index 17ee88043f52..a5b2d06e9d63 100644
> --- a/drivers/leds/leds-mt6323.c
> +++ b/drivers/leds/leds-mt6323.c
> @@ -37,18 +37,16 @@
>    * Register for MT6323_ISINK_CON0 to setup the

Comment should be changed.

>    * duty cycle of the blink.
>    */
> -#define MT6323_ISINK_CON0(i)		(MT6323_ISINK0_CON0 + 0x8 * (i))
> +#define MT6323_ISINK_CON(r, i)		(r + 0x8 * (i))
>   #define MT6323_ISINK_DIM_DUTY_MASK	(0x1f << 8)
>   #define MT6323_ISINK_DIM_DUTY(i)	(((i) << 8) & \
>   					MT6323_ISINK_DIM_DUTY_MASK)
>   


After that, it should be ok.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

