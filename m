Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA96E73400E
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jun 2023 12:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbjFQKM0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Jun 2023 06:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233938AbjFQKMX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Jun 2023 06:12:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601861FE2
        for <linux-leds@vger.kernel.org>; Sat, 17 Jun 2023 03:12:21 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5183101690cso5542167a12.0
        for <linux-leds@vger.kernel.org>; Sat, 17 Jun 2023 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686996740; x=1689588740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgP7Xo0/BI+q/hHqVMJMUYkrnaQIXgCa1ZtLOmCe39I=;
        b=WY/Al9fg2u/uL7+ehIIXuN3VmIYDiGimoYGFQeZU7j8AvPZCB+bcbRw/+WqHtBruYr
         ETErEbysbq115pvxQot3y8VruE74oD1UwQMYIRagJLyOxXLehg4EwLAlNRfH0kRRSkDz
         wSLNCUUueHDn9G0f2kA7bNDD86wzffQKqbq5sO3Ow2jlbhRsG0hn646D5aEmZre6NfVe
         s4SOKzNa4tdpcPXF8+sMQGyOQSUfUytKGY9n8FPEaGDgKgEeSfm5ddwC9IlXMquMhlL1
         84g4IDdebc+bMhNpNSMw1kE0850ioi+5VEaN9QcNCz4LhNBPQ2QCw83m1zPCHLrb82xI
         JWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686996740; x=1689588740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgP7Xo0/BI+q/hHqVMJMUYkrnaQIXgCa1ZtLOmCe39I=;
        b=AMjmYZaJSlTzJ9ib/19joMZ1gQJYC8tpJBn30dwCTlDliISz7kOAWfX2llxQVpRBE8
         cWwb0P2q+InwcSd8AktG9HSL7M3w5B9tSyXn1/z+/IAH3NDDOZGHXwyApWWZ18cum1XP
         TtCYSEKE6gdAVJdDkw17IOEFDhvunqE1y6O/lUqCv7DV98eJ3dH3dUu66p+VDtRw/I1K
         k0b3fKTNjQdU76IC35meBgZy/nlvYcT+kdW5KktR4qjWw9h+B6+qcua5zXCJ0czs4JW0
         731Ghxp7pWjE/COv2r4hPaUBWcUOHLXPJI0nz7OrWzKAeYf9p6otiDZoNgJuKtFHoERZ
         OC/Q==
X-Gm-Message-State: AC+VfDxL1bqtD7g0EDkDyuJIJ93YGoKaXttv0NG6K/WMbdMXVmXuVi6A
        K+3xsMBL8ZZu/mrD0NLHIIRYVw==
X-Google-Smtp-Source: ACHHUZ6Yrsd8H0C60FMXwj8vhCdlHIXessbhg49bscbUVgRS9oFYMYBeaKA0rC+pw4cm1EFHhY8Ygg==
X-Received: by 2002:a17:907:d26:b0:977:d468:827 with SMTP id gn38-20020a1709070d2600b00977d4680827mr4767373ejc.17.1686996739862;
        Sat, 17 Jun 2023 03:12:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906115800b0098642e99c26sm1980189eja.174.2023.06.17.03.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 03:12:19 -0700 (PDT)
Message-ID: <17576d81-a342-0b77-367a-eb9f2b97b734@linaro.org>
Date:   Sat, 17 Jun 2023 12:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] dt-bindings: backlight: lm3630a: add entries to
 control boost frequency
Content-Language: en-US
To:     Maximilian Weigand <mweigand2017@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Maximilian Weigand <mweigand@mweigand.net>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
 <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14/06/2023 21:08, Maximilian Weigand wrote:
> From: Maximilian Weigand <mweigand@mweigand.net>
> 
> Add 'ti,boost_use_1mhz' to switch between 500 kHz and 1 MHz boost
> converter switching frequency, and add 'ti,boost_frequency_shift' to
> activate a frequency shift to 560 kHz or 1.12 MHz, respectively.
> 
> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
> ---
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index 3c9b4054ed9a..ef7ea0ad2d25 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -33,6 +33,18 @@ properties:
>      description: GPIO to use to enable/disable the backlight (HWEN pin).
>      maxItems: 1
>  
> +  ti,boost_use_1mhz:

No underscores in property names.

> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      If present, change the boost converter switching frequency from the
> +      default 500 kHz to 1 MHz. Refer to data sheet for hardware requirements.
> +    type: boolean
> +
> +  ti,boost_frequency_shift:
> +    description: |
> +      If present, change boost converter switching frequency from 500 kHz to
> +      560 kHz or from 1 Mhz to 1.12 Mhz, respectively.

So just make it a property choosing the frequency, not bools, with
proper unit suffix.


Best regards,
Krzysztof

