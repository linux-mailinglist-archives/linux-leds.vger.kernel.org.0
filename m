Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7836E12A1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 18:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjDMQqN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 12:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjDMQqK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 12:46:10 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB53F9019
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 09:46:05 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id xd13so5067699ejb.4
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681404364; x=1683996364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJjsgRCQD3nGxpiqV9+CyK3OuB9Sivj/PeOsh4G53K0=;
        b=tbTLXzbzcv/o5pdEVu8hXh8qsR/QKdo5wTXCVHdcMPRA2kdNFcqA8au3eexDMx1JtQ
         phFtLfgut2lwbhtF6krr/JIpgqpGdAI9Vmo5kwKuAJxPI9vgkzdknD9H4dX/2Yu7/5uM
         gwc0sYHNp31yNLVSAa9s10Y8oEhrZcNAQXDH2XvPu0OYyFSQb15Ke44yPJ6t/PYj+Nfu
         s9rXhfcULJiNnCnyFmB2A6KaXxGHn1DfCnSpj8qe4bPN+Vi3foSuqn1KP/BENfKWSYWq
         vqpyNstVNGuFoJUGURqB6J3Nagl7KMU7xsUTqaQB/R4ReJL7qLuSnS1VqT8uB9wm7TAo
         8u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681404364; x=1683996364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJjsgRCQD3nGxpiqV9+CyK3OuB9Sivj/PeOsh4G53K0=;
        b=EUKpmdPsZudv6f6D5NYbQ5jd8UHsEc924FZCjgJAGNrGJCGv5GdRd6fuvGdbYfPNio
         64gyvO8J70D1oPcJhXq/pyVuIL0LuZjt+cuBHG714YXtyc3Mi7jLfCQj4i11hmmrug/n
         WKJhRfYfEJajZWSlyJP6GS59u0hWfS2S4cnuHcqZZTnTFYzCYXzhgPFuNW7PKKNFruIK
         wSQzWI+vucT099XMBJPmWovBXkrugfO5seTChqLKzEozVhuN+2KN8opValOd6PJWoklQ
         TkVUL/vrcNfj2UAZ+wHrdTNrU76cTa7N2aILcp0FyqsxPVzOIkYp3OB2GXU4SFvLS4BW
         9Ejg==
X-Gm-Message-State: AAQBX9fer+qJVGcafABHnrA0plkEPcCZeVYJpkll/Tal7LOSJm8Tf6JB
        +qXMY5LC1V0I7VtirHb6XpmWrw==
X-Google-Smtp-Source: AKy350b86CRvvHjujWrh5zEZaxFDPZ1LMnS6r8Jmu7VbtmHIdAhO4+sD9YnyfvCTt1v+etjXJVIQ2w==
X-Received: by 2002:a17:907:3a03:b0:94c:784f:7569 with SMTP id fb3-20020a1709073a0300b0094c784f7569mr3282936ejc.30.1681404364433;
        Thu, 13 Apr 2023 09:46:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5032:d2d4:ece5:b035? ([2a02:810d:15c0:828:5032:d2d4:ece5:b035])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906b08600b0094e6db4d4a1sm1198394ejy.186.2023.04.13.09.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 09:46:03 -0700 (PDT)
Message-ID: <24c6d4fe-128a-2fe1-1e35-d124e5f9c265@linaro.org>
Date:   Thu, 13 Apr 2023 18:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3] dt-bindings: leds: Convert PCA9532 to dtschema
Content-Language: en-US
To:     Wadim Egorov <w.egorov@phytec.de>, upstream@lists.phytec.de,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     riku.voipio@iki.fi, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, lee@kernel.org, pavel@ucw.cz
References: <20230412140552.451527-1-w.egorov@phytec.de>
 <20230412140552.451527-2-w.egorov@phytec.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412140552.451527-2-w.egorov@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/04/2023 16:05, Wadim Egorov wrote:
> Convert the PCA9532 LED Dimmer to dtschema.
> While at it, update the example to match recommended node names and
> the link to the product datasheet. Also add GPIO properties since
> the driver allows to use unused pins as GPIOs.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

