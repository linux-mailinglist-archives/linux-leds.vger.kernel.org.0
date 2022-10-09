Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205845F8BF7
	for <lists+linux-leds@lfdr.de>; Sun,  9 Oct 2022 17:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiJIPUz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Oct 2022 11:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJIPUx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Oct 2022 11:20:53 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E803899
        for <linux-leds@vger.kernel.org>; Sun,  9 Oct 2022 08:20:51 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id cj27so5336135qtb.7
        for <linux-leds@vger.kernel.org>; Sun, 09 Oct 2022 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtmFqjT+2Uw9ekR8AQKScDoSKoJcTvA+kcZCIeG6oq4=;
        b=KqX/KN6P3M3yYlcrPJy87hfLLJLTpKsHGIXEuOlV+wCttQCJCqYUbKN18EFkuopl+w
         H/3BC3oFnO4o/vK6/8raD7nP1z4+ODRMuGfJ67KxOneGnD03rMZ3i5aNHENMdlm6Bg48
         N2y8dcqZ2mWXMC9Be4RzwdxIR3+HRLEeO0mQ8O4jLeLH1u/car72310lZH7T8yShEZXj
         j/Yz26laBngA4pFM18mFD9ZSYw25yYNbnjmMdOEvJ2ERI1T+pcm1UfydkHjOBtyMXywP
         +C7DLFHmoylhAgrwVvAv2N6dI8Gs7EqXEU9q4rwBRyVQjcPDk/vXbN778MIL2fAjI6Fu
         djkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtmFqjT+2Uw9ekR8AQKScDoSKoJcTvA+kcZCIeG6oq4=;
        b=Xv1SfwTsWVptUbl+2m/s/zPFFx4JABsMlCVpHaTnqNALQ3JT7dHStoLHlXSWeNgqbo
         CinNLMWEaWrvU+VCi9C5aSbLH44JtxV+ty28HdMdZZK4UL/9GkHcBvkfPluMmpBg5dW+
         lQa26wxxYviAKPoGL/u4hFz7MEjXfMayyjPRdej2M8kbE/e1ki8s+bV4aqL2Qa1liBln
         ThXuKp9G1B9RymgRDjD/AjmUdaM/AtTC6xQ0tUYwmAsNRtbT3MoFWBmzSrKESUBD1z6D
         9fPzBr5pONE3+lCwhD86D0tJVgIRv/CxZkOHMC+I6K0wX8DfTOxXZPvHlTBpwOZMwrxH
         yzjg==
X-Gm-Message-State: ACrzQf0DoXmhO1kLXO90K0fe+mJOPTMULAc7LpZJRU3poQqlUZA9eDWf
        jxtuS3HWrSu9gYDkr933nl9wcg==
X-Google-Smtp-Source: AMsMyM4coSDJb1c+NpjvnMGN/zXpDh8x3svdOrktycy8QY05hsF4bT7iUQWvuAjK0cE7Rn9wKhj9Qg==
X-Received: by 2002:ac8:5786:0:b0:35c:aa82:303 with SMTP id v6-20020ac85786000000b0035caa820303mr11751749qta.343.1665328850288;
        Sun, 09 Oct 2022 08:20:50 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id bl23-20020a05620a1a9700b006ce30a5f892sm3628926qkb.102.2022.10.09.08.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 08:20:49 -0700 (PDT)
Message-ID: <dc79648b-fccd-dce8-11d0-1ad53204b1f4@linaro.org>
Date:   Sun, 9 Oct 2022 17:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/3] arm64: defconfig: Enable pattern LED trigger
Content-Language: en-US
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        phone-devel@vger.kernel.org, kernel@puri.sm
References: <cover.1665318256.git.agx@sigxcpu.org>
 <bdfeb1419eee32feb4b68f317423b7df7068569d.1665318256.git.agx@sigxcpu.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bdfeb1419eee32feb4b68f317423b7df7068569d.1665318256.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 09/10/2022 14:26, Guido Günther wrote:
> This allows devices to easily use LED patterns from userspace.

Devices could use LED patterns even before. You need to explain why this
should go to our defconfig which is used mostly by us, kernel
developers. Not by end-users.

> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---

Best regards,
Krzysztof

