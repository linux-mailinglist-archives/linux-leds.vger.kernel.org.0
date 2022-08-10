Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A8358EB2F
	for <lists+linux-leds@lfdr.de>; Wed, 10 Aug 2022 13:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbiHJLW2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Aug 2022 07:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiHJLW0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Aug 2022 07:22:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF51D75FC0
        for <linux-leds@vger.kernel.org>; Wed, 10 Aug 2022 04:22:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x19so12507138lfq.7
        for <linux-leds@vger.kernel.org>; Wed, 10 Aug 2022 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KJVvJs/hdcnNTEwCF+Y2HOBUXT3s0+UCv0dsySn/kTc=;
        b=Wc6xwPj14r6834HGH06kBOKr+qJOUEjLLLFWPKNrfoTPN8zWQS2+uRj1SPdiGIof0z
         s64Fqt86/H8ud+6jATOixEykMP5zx4babwJaLYHxvxOjOz1pGnMiVFuAUwdrNsvWIPoI
         tlerqScsK+OTQy52wmGf6Zp48yDF29XG4dCPb4zUOEt0/L+Z9lfN4x2x0K1+36JCe6/M
         qlVFDwlPllTgTSxO8ft/gctYqGJ2xJeiktkCEliPjW2O+5WYwHsP4SUS6qqxv2fB2oiM
         rqjFES6VXDuYcgTmSafmFIX8ovwakhhEAlic102vVpYtp6bFSbgpFLjf5IJ1kX5pB2uw
         DiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KJVvJs/hdcnNTEwCF+Y2HOBUXT3s0+UCv0dsySn/kTc=;
        b=wBTlRMwy8OXbj7rxyECBz7teaWjVEG1mLgQnAT9WSnJXc1RgyZTG2JwHwrbYadipkP
         beslvpTIOSDEHCkHctEJVpeCxwd9tEaJ/pZQwXzZCtAl6dRe2RkSsMAsj0EiT97jgBBj
         uwuNPPiwoFOKBMaMOcqsjNjSfFYu/eUm1ZjQifhsgeA1P3GUiSPXqdVgBYd9L4nh3TZ7
         Bhi8AQ4S+s2t0o9FlzFdgNFos90okGRFmoDgd15Iaa3wgi41ROIwbz+YwvyTwnmmDKGm
         HERfoJQR6N2NH9KyzmWCRJxPtePN84LYFw144vFZ5YgdO/glyUTVdqhCH12U2Ro0f/9W
         Xs3w==
X-Gm-Message-State: ACgBeo3HBBYFbepAmQsP1bItU3Sd4YjflOQV+HMoCr+p2Rw/14gqIkl8
        r2gvgPFYEPHX55O3X645v00wzA==
X-Google-Smtp-Source: AA6agR5sBpeeQBdFjzS2wtiHcwYuXfYhIEICyKLtIACFba5DjV5ePna+qqSY3kuQDsfF0uLZsjdGdg==
X-Received: by 2002:a05:6512:c13:b0:48b:3b30:637d with SMTP id z19-20020a0565120c1300b0048b3b30637dmr8195257lfu.447.1660130543208;
        Wed, 10 Aug 2022 04:22:23 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id u18-20020ac258d2000000b0048af464559esm299979lfo.293.2022.08.10.04.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 04:22:22 -0700 (PDT)
Message-ID: <f69bf678-0188-7178-7542-9773c15c1463@linaro.org>
Date:   Wed, 10 Aug 2022 14:22:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/5] dt-bindings: Drop Robert Jones
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Andrew Davis <afd@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
 <20220809162752.10186-5-krzysztof.kozlowski@linaro.org>
 <YvOP9qr2CR9n1FCe@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YvOP9qr2CR9n1FCe@google.com>
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

On 10/08/2022 14:01, Lee Jones wrote:
> On Tue, 09 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> Emails to Robert Jones bounce ("550 5.2.1 The email account that you
>> tried to reach is disabled").
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
>> ---
>>
>> For maintainers entry see:
>> https://lore.kernel.org/all/20220808111113.71890-1-krzysztof.kozlowski@linaro.org/
>> ---
>>  Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml | 2 +-
>>  Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml    | 1 -
> 
> Any reason to submit these as one patch?

Less work for me, less work for maintainer applying and sending fixes. I
think this could go via Rob's tree as fixes for current cycle.

Best regards,
Krzysztof
