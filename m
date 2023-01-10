Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D58663D4C
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jan 2023 10:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236528AbjAJJwS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Jan 2023 04:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238328AbjAJJwC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Jan 2023 04:52:02 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D335004F
        for <linux-leds@vger.kernel.org>; Tue, 10 Jan 2023 01:52:00 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so9373273wms.4
        for <linux-leds@vger.kernel.org>; Tue, 10 Jan 2023 01:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mL52V0hiw5s6j6RURYRdd0rmxiZQUXrI8X6eC4ie48=;
        b=LrbCjKFnuKo7ttwtUPe/asf9UwwYtRprFGZoK+iZhqpwGmGkG30XJY9dHAMYsJ11xx
         qejyK+59PToQMIvBa7xXtwubyIjBkvX3qRCGMeBGsT2Eqjqo1bxOYE/fdSKx2c5HLZBU
         UGoF/J9O5MlTCxGwzOytiGfPj0M3wznDqYJ5UC+Q6N56abtOyinWJQRG7GWKEJalhm0y
         mTeki1m3UihKztFZt6lsj3Y8x776bpM46JsLiH6tbmTapg0WS0Lxpvk0ggpbepx4lfix
         a2lrYiR70ZO+GPjByFHg+I7uxd1jzH+DoGUVHUfy52ABId5a8Be14IHU+FS1c3mOSy3Z
         dRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mL52V0hiw5s6j6RURYRdd0rmxiZQUXrI8X6eC4ie48=;
        b=ZK0Yb2lmiLPlLw/XWmw/aTJIuICcHo6x6FL85spXcGfsII7DX227K7qjTu0s4Qt+N0
         s6JmCSiKIi5hR4EwgaLOBe2HFbqIKetiPIlE0HFGopzvawVOqGOkPfrT7bnJ4dnknb91
         KDhDayMNksnQV/ZBPs0hQl28fl5/JvgE+59OEUgdCe4FZyd8fdzxpZmhXitMpAIpe9fO
         Tzgwe2prsidpE2p2dKoswfx8+MMvArLL9X76dJw6GMF4DIyxzNdmzgi2Zl1koU3JPoGx
         unN31RHkZW5CB/P6io7vqfjGTKnzwFnRpxsX6RWTHukwVYtr8k7Y7YwVOt/EuQM2K0wu
         n26Q==
X-Gm-Message-State: AFqh2kre74VQVY2L0rH1HlMDeeDCYs4Ud5Ir/Y15S4WFM74TiEs0638o
        VB89IWVHarmMlNf1tBgqXI8bFw==
X-Google-Smtp-Source: AMrXdXu3no3DhuE6ENuZRZq3ejegxmFk49fvykU744b3FH9Ql5EQKUYEFWmXG3shvtWLjIfuMsF3LQ==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id 8-20020a05600c024800b003d35d47271cmr47807041wmj.12.1673344318932;
        Tue, 10 Jan 2023 01:51:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c3b0700b003cfd4cf0761sm21094739wms.1.2023.01.10.01.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:51:58 -0800 (PST)
Message-ID: <6d8bd401-db46-f0b6-4944-a7ede13d64e3@linaro.org>
Date:   Tue, 10 Jan 2023 10:51:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/2] leds: lp55xx: configure internal charge pump
Content-Language: en-US
To:     Maarten Zanders <maarten.zanders@mind.be>
Cc:     devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
References: <20230110092342.24132-1-maarten.zanders@mind.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110092342.24132-1-maarten.zanders@mind.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/01/2023 10:23, Maarten Zanders wrote:
> A new option in the devicetree "ti,charge-pump-mode" allows the user to
> configure the charge pump in a certain mode. Previously it was defaulting
> to automatic mode.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

