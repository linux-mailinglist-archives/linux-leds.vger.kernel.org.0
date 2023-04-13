Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44696E0907
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 10:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjDMIgT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 04:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjDMIgP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 04:36:15 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3182293ED
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 01:35:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id s12so4922712wrb.1
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681374956; x=1683966956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjH7nhGdWOv9qeyX+wHaW2Tx80LijSTnzNr+7mKBAuk=;
        b=W73ulSQRJKYT4gJUb7YNAcstBidLbTyQ3w6d+J/2HWLLSJsGIqpO8cBwjCTh/y3CP+
         djCQqgwfz+UZYPS2FGWs6PUFDq4ogwwJqLWJPCItRQ2TDYN2zQ83Vd8UaQbXRXpKJQlz
         pYdY/Kjv0RfjbBvvl9BEJYGGJdzmXZU78u9GhxDNwG12qDlz9qx18/GaAHUboSdEMb0v
         Zi7j3tJpml46h4/0KRWefPFAtEyhBDfFYPcu/KDsfYqDY08T6Sfk9k9NHPsmu47HLCuk
         xKMCGIkq5fD0zwaMlrAI+o2T7jRCG0lAMmNON+0sLquyBJ6O8GPmq+lGt4WaU8nOJsJj
         uLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681374956; x=1683966956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjH7nhGdWOv9qeyX+wHaW2Tx80LijSTnzNr+7mKBAuk=;
        b=Vr4aCqDvd9tobyS0Jd/06Q7xItx66LC0tP1A+7Dj6GVaiE6BQL+S636E6JaczK8vlr
         8lKmJ5hEnO8mbvK4obWj4xE461KGAa6o9MHJ0PcFfNDdNuAw2MQmdBuuAd6PGy2rcpTV
         SQkCKMjGHvQnnekz2pZasw0Tr5dk6264vlpAn0SR69zCpsIvTrbBNe4ledhq4JfvaZyA
         awXxLxyUhgmcWaolm6aNYz61+cyiSRt48I2v7zInbmsQITVVgUzyxIAgwRKjiF8FB8s/
         I1UO23VyU4Eug0AwHExnsxfXDA31O3JoLwPdl0oimNMCCkx/C4UTAN5A+IeO7qSU1bfe
         NkjA==
X-Gm-Message-State: AAQBX9dFCMoV1pBdirAenZMW3N+m95yWBvqu4lxH4aTCAtrjZvQknjjs
        qCBkKuwFDyQjoM9ek9OYbjfQlg==
X-Google-Smtp-Source: AKy350Z+TlsVs6i2UnAW4a5xD8ts3Fbq8yFX7GeMxaxMkTqOmJx/k1gtnqvpgXLJJDILOXj63b0c2w==
X-Received: by 2002:a05:6000:1a52:b0:2ef:b63d:6a6a with SMTP id t18-20020a0560001a5200b002efb63d6a6amr851327wry.61.1681374956602;
        Thu, 13 Apr 2023 01:35:56 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d54c4000000b002c3f81c51b6sm747306wrv.90.2023.04.13.01.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 01:35:56 -0700 (PDT)
Message-ID: <54d7444e-26ff-da2d-833b-57dd5b8ca679@baylibre.com>
Date:   Thu, 13 Apr 2023 10:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/7] dt-bindings: leds: leds-mt6323: Document mt6332
 compatible
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, pavel@ucw.cz
Cc:     lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

