Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E843273B24C
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jun 2023 10:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbjFWIEx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Jun 2023 04:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbjFWIEw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Jun 2023 04:04:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2F2212F
        for <linux-leds@vger.kernel.org>; Fri, 23 Jun 2023 01:04:47 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EDC806607135;
        Fri, 23 Jun 2023 09:04:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1687507486;
        bh=wU3COEvvTx4nFaqAnosOYGf9sIPS0XZKMWTKQM1B8fI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FkHTmFBGZjhmkIy2vJ2HIV541nVjVMa0FjD00n5HTl38Sn+biTJQudQDQRr9nP9x5
         Q9w5r/ElT3w0sPXXi0Tnlk5FugU2bYSraJ9bc3/mdpay2siJnU083xzam4fe5AU5hn
         y/ImTXO41+jx6L2AtyHHrLBZeyJkqw0VY+IEmnO4xf/419epZzJt16XKplD+nAMRb7
         N7/zrj5XAaAqS0bJDDpRtUhC0EvV3npPkUNNpnTQudDKC2X2+66xDy5ToU8LIIsHwX
         D9bWFzhhMaS3PJyTJijNtgT5RRJhTmYEokxVJoDu7x0ct02nwtvn5VVxjsy0QVYr9W
         cANoHjJEsztqQ==
Message-ID: <57be8178-e4f9-3908-745f-bc02657e0b3a@collabora.com>
Date:   Fri, 23 Jun 2023 10:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] leds: leds-mt6323: Adjust return/parameter types in wled
 get/set callbacks
To:     Nathan Chancellor <nathan@kernel.org>, lee@kernel.org
Cc:     sean.wang@mediatek.com, pavel@ucw.cz, matthias.bgg@gmail.com,
        ndesaulniers@google.com, trix@redhat.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
References: <20230622-mt6323-wled-wincompatible-function-pointer-types-strict-v1-1-6ad256f220e8@kernel.org>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230622-mt6323-wled-wincompatible-function-pointer-types-strict-v1-1-6ad256f220e8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Il 22/06/23 18:12, Nathan Chancellor ha scritto:
> Clang's kernel Control Flow Integrity (kCFI) is a compiler-based
> security mitigation that ensures the target of an indirect function call
> matches the expected type of the call and trapping if they do not match
> exactly. The warning -Wincompatible-function-pointer-types-strict aims
> to catch these issues at compile time, which reveals:
> 
>   drivers/leds/leds-mt6323.c:598:49: error: incompatible function pointer types assigning to 'int (*)(struct led_classdev *, enum led_brightness)' from 'int (struct led_classdev *, unsigned int)' [-Werror,-Wincompatible-function-pointer-types-strict]
>     598 |                         leds->led[reg]->cdev.brightness_set_blocking =
>         |                                                                      ^
>     599 |                                                 mt6323_wled_set_brightness;
>         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/leds/leds-mt6323.c:600:40: error: incompatible function pointer types assigning to 'enum led_brightness (*)(struct led_classdev *)' from 'unsigned int (struct led_classdev *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>     600 |                         leds->led[reg]->cdev.brightness_get =
>         |                                                             ^
>     601 |                                                 mt6323_get_wled_brightness;
>         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   2 errors generated.
> 
> While 'unsigned int' is ABI compatible with 'enum led_brightness' (hence
> no warning from -Wincompatible-function-pointer-types) and the callers
> of these callbacks use/pass the values as 'unsigned int', the mismatch
> between the prototype and the called function will trip kCFI at runtime.
> 
> Change the types in the implementations to match the prototypes, clearing
> up the warning and avoiding kCFI failures.
> 
> Fixes: 9bb0a9e0626c ("leds: leds-mt6323: Add support for WLEDs and MT6332")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

leds need to deprecate said enumeration for real, since it's marked for
deprecation but, in the meanwhile, we can't have kCFI failures on this driver.

For this reason,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
>   drivers/leds/leds-mt6323.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
> index e8fecfc2e90a..24f35bdb55fb 100644
> --- a/drivers/leds/leds-mt6323.c
> +++ b/drivers/leds/leds-mt6323.c
> @@ -76,7 +76,7 @@ struct mt6323_led {
>   	int			id;
>   	struct mt6323_leds	*parent;
>   	struct led_classdev	cdev;
> -	unsigned int		current_brightness;
> +	enum led_brightness	current_brightness;
>   };
>   
>   /**
> @@ -451,7 +451,7 @@ static int mtk_wled_hw_off(struct led_classdev *cdev)
>   	return 0;
>   }
>   
> -static unsigned int mt6323_get_wled_brightness(struct led_classdev *cdev)
> +static enum led_brightness mt6323_get_wled_brightness(struct led_classdev *cdev)
>   {
>   	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
>   	struct mt6323_leds *leds = led->parent;
> @@ -471,7 +471,7 @@ static unsigned int mt6323_get_wled_brightness(struct led_classdev *cdev)
>   }
>   
>   static int mt6323_wled_set_brightness(struct led_classdev *cdev,
> -				      unsigned int brightness)
> +				      enum led_brightness brightness)
>   {
>   	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
>   	struct mt6323_leds *leds = led->parent;
> 
> ---
> base-commit: 7bd932d9adbcc5c5370d968bdb0b00385606bf3a
> change-id: 20230621-mt6323-wled-wincompatible-function-pointer-types-strict-334f06d92ffb
> 
> Best regards,


