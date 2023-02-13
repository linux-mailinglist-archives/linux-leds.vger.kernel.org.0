Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7976942E1
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 11:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjBMKch (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 05:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjBMKcg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 05:32:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B639760
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:32:35 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id c1so8394702edt.4
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9X23+s7hHlbhB82N6CQ/+F/G2nzZwrS8GJLQ4tLSpRU=;
        b=KkAyOXt0lEnqX6VodSdKJGUKaxxBnGfRxf9K4nXdSnaP6+XrLi32zkyMoP4ktbnEXt
         a7doKUyPyShS25W847vHIs8Cdv3EdoHCrnQfwqQhem8p5kYuLajeei7tkApELtf8+VZA
         dzIaSXsBlJVWfjapc39CKj//4XOMEpedArEUsMP+d92kuS1ROqh4RIqI1dY9a5Zgc3AY
         YGWHPs+o+yrgTWkG0lUVVCprBA0zj4RTPTEGIsCnbfIbMuMIdHqUtqXHRynh86GClreo
         v0TlPDAXMH+B3JmnLX+kOufxBqvYWHwTo+cYfVg3tmXGgcKGYbuZOeyB6xPuVwD35YLz
         3ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9X23+s7hHlbhB82N6CQ/+F/G2nzZwrS8GJLQ4tLSpRU=;
        b=XjlwWg9ciNnxvA48wgiMvFRY9MsPMl+uplU0oqshmiBswContRQ5T9d02ViWmivzQ+
         jeXmvhBefr7aIM4DoEnU0VzG0MfrJJa96EkX38ciJx/cEoDAJG1IZcWHsgU5m/r1aNNr
         GJSqiXihP8eT+gEmAN9jRAmS11gR5mIKEIOHVkJ7qXfT0CCnadlJWGlgxAZ1dyuSUA83
         TlAWoq+Hht+TyxOzhN7tBRe5ssIyIfgO7CuA5JbKzyP4jWttCaNKzlo0nH6omGFRKEVU
         tp4qvBuQrTQqp6LmHj0prviRwy7+3/6iV7HZ8MJnVSF90aKHVrhm1ZEvIKjmY/AdZOgn
         +yPg==
X-Gm-Message-State: AO0yUKUNCKdjur/H/wifk7scYzraaaV1nUXzez4Arl/a4YnIspR8m6an
        C/u5mF13fXJKh0by6rbN5IBqmdybBg6QWrLu
X-Google-Smtp-Source: AK7set+B/KZYeFOYcsW0ZdOOknS317xRGbPEC0PbC9tBM+EhTJSs80E57htlVX4975TSOu7YDmXcYw==
X-Received: by 2002:a50:a44d:0:b0:4aa:b7ac:e0d2 with SMTP id v13-20020a50a44d000000b004aab7ace0d2mr22568904edb.19.1676284354401;
        Mon, 13 Feb 2023 02:32:34 -0800 (PST)
Received: from [192.168.2.9] (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id q8-20020a50aa88000000b004acc77efd4asm1214559edc.37.2023.02.13.02.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:32:34 -0800 (PST)
Message-ID: <4fc0f90a-36b1-bc48-6842-fb64c3d1b7c5@mind.be>
Date:   Mon, 13 Feb 2023 11:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 1/2] dt-bindings: leds-lp55xx: add ti,charge-pump-mode
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213102027.29961-1-maarten.zanders@mind.be>
 <20230213102027.29961-2-maarten.zanders@mind.be>
 <1a8268a1-e656-10b2-8ca5-495867e521e7@linaro.org>
From:   Maarten Zanders <maarten.zanders@mind.be>
In-Reply-To: <1a8268a1-e656-10b2-8ca5-495867e521e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 2/13/23 11:22, Krzysztof Kozlowski wrote:
>
> While technically it is almost equal to BSD-2, any particular reason for
> using different second license than the binding and generic
> recommendation (checkpatch)?
>
>
No, no specific reason. I'm happy to adapt.

Br,
Maarten


