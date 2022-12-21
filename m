Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208716532D8
	for <lists+linux-leds@lfdr.de>; Wed, 21 Dec 2022 16:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbiLUPDu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Dec 2022 10:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiLUPDt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Dec 2022 10:03:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2092422295
        for <linux-leds@vger.kernel.org>; Wed, 21 Dec 2022 07:03:48 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f34so8686830lfv.10
        for <linux-leds@vger.kernel.org>; Wed, 21 Dec 2022 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2l6cewJUPRniIKeMkNSdCkIiOTYnjbP46uLNNT69g4=;
        b=MudIaipiKdBALhnv3xCVHFsTmKEK5Lgprh4ZlztzuNrWekMnRO39wSGC545djVUghZ
         z1gvH+QA1cvj4WFt2k72u7d5kUNTT7nKm28L8mw9LlcBCskuJb0yxipq6GJWvjhEEwko
         P0WIlDAJ+bh/x9Hg1epyyLywpYy/dIvRHdoYNM7xCS2Wvx4Qm2T+PIAQusAoE+c72H+e
         /A8o9+zLQZ/cEJCscQk7L13ZWvAVWinAX7c8UJpV3J0Fej+vV6xu6wDDhLkyhE0oW83n
         U4KQUFBJsy6jEdMrqBcxtdkTpeYQMvQ1iuDfx+qZHJRcOXSfBriAaZ6CYw8HVm3c82VR
         ycfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2l6cewJUPRniIKeMkNSdCkIiOTYnjbP46uLNNT69g4=;
        b=jKbFYYHr7B/gPdhAGdYE3kJPHNchCTMoRld+JAcCGXbP8JDKyUrqiGrGpd9iebJz1N
         yH/Z/kl4n4K9IQl08yxWkvt3da3cRPw6vWyBjWF8EubIrm2yZiTW70UfVFuJZBOx+Mfu
         cWaTqY1HAL+GUtTtxZ52Y7Lv3a2OSbr35nBh/OGAzmfC0mU9ZPS5dPNdu+4jmm8QmfWx
         fcNs/NWloDjP1Dr+CmgHXvzZDbV7SVvM2y8iwpi1KeyO1bMjJqhuBth2NcWppTAFGRsD
         GDeREorDxCFbJhEZx1DK3v3Apt0H6rhF9kPOuMHUmPRW1r+FjidRXKraP7juoXQLBnTm
         m48g==
X-Gm-Message-State: AFqh2kqzlm8bInIsFgmJOX4r9Ry+0EqsUZVWYCzMBCF273c9wIwxvUBM
        ecr9rlfqTrolshIACCWnL39a/w==
X-Google-Smtp-Source: AMrXdXtbhO7QRkUe2U864JJ/dN3IRzN7x/8klCacqm4gLMX785oEXfttZCalrmBUBMRIxAHk4cKL9g==
X-Received: by 2002:a05:6512:224d:b0:4ab:d632:788b with SMTP id i13-20020a056512224d00b004abd632788bmr823628lfu.54.1671635026489;
        Wed, 21 Dec 2022 07:03:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r7-20020a19ac47000000b004b58ebf0399sm1866078lfc.132.2022.12.21.07.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 07:03:45 -0800 (PST)
Message-ID: <4c37d74d-aaa2-242f-a25f-bf5f92d50756@linaro.org>
Date:   Wed, 21 Dec 2022 16:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
To:     Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <20221221132428.702-1-lujianhua000@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221132428.702-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 21/12/2022 14:24, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Do not resend. You need to fix everything, test and send a new patchset
(entire) with the changelog.

Best regards,
Krzysztof

