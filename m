Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABC56E0E66
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjDMNTp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 09:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjDMNTo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 09:19:44 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD1A1FFE
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 06:19:23 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso9985370wmb.1
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681391961; x=1683983961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uZ2L6Z2WT9YlA2M5FGrOlxdAqlFCV2dHB/1lrAHpy8=;
        b=Ov3hk06jdZM9d+LdbrIweTCN7GSwWPVPVn8K7uK0TKIk+ttnUmCxFAYbX4B6Qow0v+
         3yxNPHKSoX2xPg9VEAaI3ryZWdl4wWd/HpP2FFf1eXrfTpZR4R0T+KRJvq+SAkW4ypn4
         rmgp4zxq7aKbyPsofkCGIkZkYE/9WOE9S8AlekWZERnszbZxr3jypF8yuwgsit2BKiYG
         wJZrp/pLgjCxK0TxZCADbqdMrY/1YuvexbDG5OEcrI5YL2x7RqFPzNKG/UEEGOT9mLe/
         bhE4rgwiO9H+h5ViytfFeTrueDyueuH0RrL/moWptinT8DITBsTLuN+LUJ2b+22rugnl
         oHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391961; x=1683983961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uZ2L6Z2WT9YlA2M5FGrOlxdAqlFCV2dHB/1lrAHpy8=;
        b=lQl5JVzyr3MpR31oTSU7sxuBXH4ZRMbW2aex2EsX7jNwUKm4In1Lugp+4+dBAtEunk
         bkb2iFlONTgxF5FdMHtnf9eQgX7p3DX+0G5yefd/Vgr1QB7HGYQlnMH8SuTT5xLL1Nga
         Bv2G4qb9uB3pVnxf33JRO0Wq2Y/viLrXpl1etKUdazdlSD+CbaV6j60lu9l6sJehFqge
         ezhnWQ6oZZrKxHP1+EkT4HEnIvk8TNxv91jAbXRj8QiltagwR9HshPaRyNPhHveezf7f
         tLZ4DlW4hhb6/SmE0bGEv5lSTm6k27r9aC412hUz7oUq59BFNm/Hgq4Uyxu4qxnWZhTP
         +CpQ==
X-Gm-Message-State: AAQBX9co1z/2EOLxcyMb4IIaTUTBrexOfDFAKv5HdBoYpGUl6d0GhkOZ
        1A16siQG1rwDHJxOjYWafofsKw==
X-Google-Smtp-Source: AKy350ahHJ2R0u9+ILirA6SYvVmLljxqBN6oqzCFoHvHTKwkDlxy0i7/480WgJIzYZwsrG2RkQgdPg==
X-Received: by 2002:a7b:cd15:0:b0:3ed:c468:ab11 with SMTP id f21-20020a7bcd15000000b003edc468ab11mr1819189wmj.28.1681391960810;
        Thu, 13 Apr 2023 06:19:20 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b003f0652084b8sm5463491wms.20.2023.04.13.06.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:19:20 -0700 (PDT)
Message-ID: <32450a66-78ff-8ec8-2f31-6e5d91e38a5b@baylibre.com>
Date:   Thu, 13 Apr 2023 15:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 6/7] leds: leds-mt6323: Add support for MT6331 leds
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
 <20230412153310.241046-7-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-7-angelogioacchino.delregno@collabora.com>
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
> Add the register offsets for MT6331. The hwspec is the same as MT6323.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

