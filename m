Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD46F644229
	for <lists+linux-leds@lfdr.de>; Tue,  6 Dec 2022 12:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiLFLc3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Dec 2022 06:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiLFLc3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Dec 2022 06:32:29 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD762712
        for <linux-leds@vger.kernel.org>; Tue,  6 Dec 2022 03:32:27 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id n1so16887492ljg.3
        for <linux-leds@vger.kernel.org>; Tue, 06 Dec 2022 03:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cwq7jnTJOGf4tYvL5VrOxvehozq8GPJ+PWBXNEF2VY=;
        b=cR4UlJYDZgswaJiaCiTYnl8li5T5EqYdi/Wc98Rt7aVdDZH16/8/EnJoTdHNZAMtAm
         pe27QIc7DIO6/JXtccVd156W8kRAUE3D7ics31WnofLxyW+a+MM34aWUiwnDI9P9Jz0D
         ZKljNDaRFVxnVb4iGmtWz+5plmRHMeGdRZg1NTqcW2oFESjzfpbA0WVejkeeU1AICGrR
         27KchoEN0e9jC2MNDitwo4Io1JD7mZc6xU1Y4tuvOElDzBE8Ic5VW+8vl1GwWAMLyd01
         gcENbsgV7yPEG+hStWW4CAbr0pShJSkDpaxWiQQUDBxH56MZgcKL3JsD1UzaXohAb6z3
         OqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cwq7jnTJOGf4tYvL5VrOxvehozq8GPJ+PWBXNEF2VY=;
        b=kIzAVFK/cvcFQhZ82oWb2qrTKrVTJUUroizrfVrvgHtZFKklNHQpfXFRRgW98unsfT
         TnO9kgIe+tOexCFFwcvudzUTD61fBZ43A/8kkFNoNLrerlwIAfLf9/3IeQJ38hUkIROm
         jJD9HwCK8O5TYn0+tjEaRkx+n0VslC6/IYw5kaYB7kXawvlJykLlZEB9EKg47UakNVIc
         rx0JtZmeivwq0WTIuEGyCYurLUnaEXpgZTzvqjcr6O7d7r+8NBWa+5QL0rP8dm6u8ha8
         S49Br5pMqJ7X5VbE6kq5kj1HZocoiLjM7KhyEVqMmNuyRHbfoBy58JKKnhvAX+7LI/Dy
         0sKQ==
X-Gm-Message-State: ANoB5pn9VFvgcLKJtDn7z3JJ+7r6D8dZqnqMiIFIpMBpHNowz1Eb4Qdc
        oTXPEySuL1tJbs8yz53yUT8QTI5Jn3Ah+kxV5oA=
X-Google-Smtp-Source: AA0mqf7d2LEc0l8jQcxaw5gHN7vboY1ypKAed422N7YaheCFvcHdvJ+x2VkL0mO7d9WvYJjpWIZW/w==
X-Received: by 2002:a2e:964c:0:b0:279:f197:440d with SMTP id z12-20020a2e964c000000b00279f197440dmr3909362ljh.517.1670326345718;
        Tue, 06 Dec 2022 03:32:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v1-20020a056512348100b004b575d239besm727863lfr.237.2022.12.06.03.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 03:32:25 -0800 (PST)
Message-ID: <704cd868-4577-d30e-9736-52186bc46d01@linaro.org>
Date:   Tue, 6 Dec 2022 12:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/1] MAINTAINERS: Add additional co-maintainer to LEDs
To:     Lee Jones <lee@kernel.org>, pavel@ucw.cz
Cc:     andriy.shevchenko@linux.intel.com, gregkh@linuxfoundation.org,
        linux-leds@vger.kernel.org
References: <20221206104510.123817-1-lee@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206104510.123817-1-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 06/12/2022 11:45, Lee Jones wrote:
> Add myself as co-maintainer for the LED subsystem,
> in support of Pavel during busy times.
> 
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

I think it is a good idea to distribute the load. FWIW:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

