Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86EC8663E15
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jan 2023 11:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjAJKZE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Jan 2023 05:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238018AbjAJKYV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Jan 2023 05:24:21 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283421DDF4
        for <linux-leds@vger.kernel.org>; Tue, 10 Jan 2023 02:24:09 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bs20so11207199wrb.3
        for <linux-leds@vger.kernel.org>; Tue, 10 Jan 2023 02:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLuOyy3s/0baMT8hoAYpR+YXI8ZPhEsWih1Yp+EEAhQ=;
        b=pi3Oh+ribc/7TS0Nv6nUkkgM7Wph4SIDHFUakaFGzg16lXtD9WH1xxl+4Z8UM4T6VA
         qvq8DLCJ6lm8xfuHxayBC7XK7+XyYFC4pI3j6LO9IRTnB8qY6+gFuPC29ZaSCuZkBi/U
         FxrzoZjc3Vv6C7n2ISLjtxFJWTNZfXDJ4T2rj82oxNBqVZjQ8Do5IUkMIywZ0knD2932
         ON3/G8M857odxTh9bNnAYg14gc/eDKWMYbjtI35YTbmeSTwRPr/InWQHabpToX1Dd/Co
         3OgmsBW+vYsa9c9IFc0nErqRVHJD/4bTU4GLlvLm3FW01vWzX1xTQb5SaMX6KVZa0YWU
         HDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLuOyy3s/0baMT8hoAYpR+YXI8ZPhEsWih1Yp+EEAhQ=;
        b=N8W9RKtNnJCeSdowCOCNitbOX8IaVHSjdLFEvqfodZgUxv3sG8zuIsZMQbuAzSYOoD
         Eya3O+gR88YHRoQGL9G39EvIu7L07dTgsC6yAfy5+IXM5YAjPrs/INr5TDgDLpKtjAh8
         scVXxQoloFYbqB230Iyqc3bz2CUwSKtM7NRjVrSxhs+ug/ftOHoyiKXQadIc0kjvpvMI
         R7kaeGsVgKFj4DBI+XmYsqidRVd63lvUTLks55jOZP/Hklm1qCoN4cHPS0h+5TUihrUm
         wzEKGDXxRndQDyYZdUi7TQUVIuU1KpoHWA1gCB8Vj4N/1NXi5z+iijMXUE0Hv/U7VVfr
         2Quw==
X-Gm-Message-State: AFqh2ko41wnD0D+0VlGl6zWtVe1jW5FI7cl3aCjOCpXuvzewbCCrye6/
        yNCFaWXu81W8AUblBHnvpxno9w==
X-Google-Smtp-Source: AMrXdXuhBtSofMAb4pe/KhOs/hoE2XHHPja+Es5fHCB2f8hxEWzT6s1BovuMVbKotq8AOJTVPf4gIA==
X-Received: by 2002:a5d:4dd0:0:b0:2bc:8057:acc with SMTP id f16-20020a5d4dd0000000b002bc80570accmr3077205wru.7.1673346247753;
        Tue, 10 Jan 2023 02:24:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t17-20020adff611000000b00236488f62d6sm10633857wrp.79.2023.01.10.02.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:24:07 -0800 (PST)
Message-ID: <f27f5487-785b-5366-8de4-6df991fab8b4@linaro.org>
Date:   Tue, 10 Jan 2023 11:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: leds-lp55xx: add ti,charge-pump-mode
Content-Language: en-US
To:     Maarten Zanders <maarten.zanders@mind.be>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230110092342.24132-1-maarten.zanders@mind.be>
 <20230110092342.24132-2-maarten.zanders@mind.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110092342.24132-2-maarten.zanders@mind.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/01/2023 10:23, Maarten Zanders wrote:
> Add a binding to configure the internal charge pump for lp55xx.
> 
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

