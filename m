Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578636E0F11
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 15:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjDMNne (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 09:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjDMNnS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 09:43:18 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1338BAF17
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 06:41:39 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id v10so1876192wmn.5
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681393287; x=1683985287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/uJoEfdBrHkM8umj9Qzq6MjpEIPQ75HXLhRcJDJNhI=;
        b=qSaoqkqkXL6KGFFgIvLODD2VAFqyodvQSgU3JqfWiN448FpeIYuzdy7SuHZZEsBeFR
         Qj5dZ7MZ/gFqSKI5yYikfFNmI/SFl3LnEbdxO1Kh5l27EFL5y00P0ts79XVTatBUjxMd
         X9PqfQqBaa0dp2JARMfHxT5hwo+Ru0T25lpk+MtMnJ1Gri/TqB+K4rck/fANnMKJGSDi
         G11D7L8Ds7426Iya87fZYsH1rIFI0NwD5eoF9mUqkR70pO/hYdDGOuN1PWGQUnQw2q1i
         zexerlbyF6t9bADh1BfBpoSK960IU68mOsrjJySi0NI44F5PMhX0837tf5z5l77jg+GJ
         tBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681393287; x=1683985287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/uJoEfdBrHkM8umj9Qzq6MjpEIPQ75HXLhRcJDJNhI=;
        b=doCmwQIN6W+LsyeZ5w/fV5a0M90ItuB/pHuEQCq8bBYiqwXyhAZXQlPaFg41/i0oL7
         hmmvBfFr02W2yA/kqkjSlwyDnKR/SgtDPfACGzJ7Vtr06BP20ZqcLvC6hpPc5ECB3eTx
         AyfsusTx7Bg1lS2FK2ai/Rey21cjO+feVvA3FJHzVi5AwlifC9Y7qnMhN5JO8btH34CF
         7SM/Jig0+8jfxb8WxXzI2ngu9RmXjsHiQiQTLWTrpqJgXbgIW1y8DHVCiYf3g41YXbst
         t/aQCbuDf4A4qLx1uSkfzqY8zgHU4T1HU6HuMj1ZmkFmoAEPq+MTbbD6tqlK2h5mVf9V
         r8dg==
X-Gm-Message-State: AAQBX9ekB9PWPKmYYcrArRen9ysHn70o2d6MSRHJi/KjOXNXN5xgOgWK
        mZa1sTV4ABEufa8cf/rmVLDSYw==
X-Google-Smtp-Source: AKy350ZTQwiWfW3YM7pVVGvdZnslX3wudj8JovNDzaTTKOlXEzGpDqVhqmlxUMJSphB5wrVujBhi6w==
X-Received: by 2002:a7b:cb06:0:b0:3f0:9564:f4f6 with SMTP id u6-20020a7bcb06000000b003f09564f4f6mr1908290wmj.1.1681393286675;
        Thu, 13 Apr 2023 06:41:26 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003f04f0c5a6fsm1837156wma.26.2023.04.13.06.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:41:26 -0700 (PDT)
Message-ID: <f4ffb7ab-7f61-df0a-fca8-54585fca16d2@baylibre.com>
Date:   Thu, 13 Apr 2023 15:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/7] leds: leds-mt6323: Drop MT6323_ prefix from macros
 and defines
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, pavel@ucw.cz
Cc:     lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-6-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-6-angelogioacchino.delregno@collabora.com>
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
> This renames all definitions and macros to drop the MT6323_ prefix,
> since it is now possible to easily add support to more PMICs in
> this driver.
> While at it, also fix related formatting where possible.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

