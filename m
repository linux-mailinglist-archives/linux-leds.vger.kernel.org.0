Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B086653CE4
	for <lists+linux-leds@lfdr.de>; Thu, 22 Dec 2022 09:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbiLVIVg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Dec 2022 03:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiLVIVf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Dec 2022 03:21:35 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F04B11807
        for <linux-leds@vger.kernel.org>; Thu, 22 Dec 2022 00:21:34 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g13so1631586lfv.7
        for <linux-leds@vger.kernel.org>; Thu, 22 Dec 2022 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAkQvA3Xh+SnjA47mehnFmJrTToVnvQtaeVXifEV6Rk=;
        b=RWoSYDbQMlbQ088uebiL+ygAsoUptTfvNBo/L9++PXhJBblh7qqCm3Pkse0QCPQZiL
         4AY+M34sAYZQ+4L7HQAqxkQKj5CMynrip2kJjQY2Cr8U325dXsQ5RecP7HhGinSFL6ed
         2HbQ0qRnU+tHTRl8ngGZWqVnWJtYco8xJyhFZEhmcrdHX5s3YrI+CNid2TP3zkK4Fjks
         IqT1xSblZ4pEegrPQeWidY3bCu1QW2QidkTFbdXFsns6KhABy42c38Up6mjlnRohFnqv
         VQ/CEnyafMBkl9DKHjnoYJnwXFA3HQW0GfGzTPaekHk2ZU2vAttm4pv6Tn2yEa7wKzlu
         CoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAkQvA3Xh+SnjA47mehnFmJrTToVnvQtaeVXifEV6Rk=;
        b=RnvFGXkt8VEGjrUJJOEFyQcu/LFBnhtIASkLqfeqIp0BYrNTCHdTTpjzZQxmBe0WJX
         OHbqh/KSrwAcZ8qLLYGUARee9rvEm5KTvweqopWcOr2Pj1oDdTvkX4Ubjpja7Y9ijH+G
         +gd9OtfW9oIAJ4sr1O5Uhve6W9wNeYDaExXj5khIlX/GlkSuB58O5/wYdxdDvMsWJVvg
         Y0SgkX1GzhRIDdqUJM+ZvxVRAtIN2fTe8pBllGBoEBrI0Ez955LdLXh8bPJnQ/KBWVNi
         8ho/wp8yY+BCGAL7166jPEuAWwXDQ76Cr0CkCxMdxJX3SK4LaRwCvWifXq65hHxIe2bk
         TMPw==
X-Gm-Message-State: AFqh2kotvPhTYvj/s0e+e4uWDF5jgYzYHS98/W8ByvgaNYjxiyNwBiYY
        qRNrOOqQXSfq2otT+nGqqdWT3g==
X-Google-Smtp-Source: AMrXdXt37+6z3xr5biGtW60g1/enVSSlhcb6yauFfDNgy4Ip6QuFAVRlBq+qGgvqP00SOsqek4NptQ==
X-Received: by 2002:a19:f713:0:b0:4b6:bc3c:f457 with SMTP id z19-20020a19f713000000b004b6bc3cf457mr1272077lfe.34.1671697292821;
        Thu, 22 Dec 2022 00:21:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651205c900b00497aa190523sm2110812lfo.248.2022.12.22.00.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 00:21:32 -0800 (PST)
Message-ID: <e2b0f5e2-8681-10e7-8924-a1bf5040f7d0@linaro.org>
Date:   Thu, 22 Dec 2022 09:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Helge Deller <deller@gmx.de>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20221221153154.25411-1-lujianhua000@gmail.com>
 <20221221153154.25411-2-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221153154.25411-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 21/12/2022 16:31, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

