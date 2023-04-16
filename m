Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE236E39BC
	for <lists+linux-leds@lfdr.de>; Sun, 16 Apr 2023 17:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjDPPRv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Apr 2023 11:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjDPPRu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Apr 2023 11:17:50 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDAC212F
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 08:17:48 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2a8b3ecf59fso8035301fa.0
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681658267; x=1684250267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAqvZ67qnEVKEF8yJpsvBW4lNXaQ4i0XMQr0TXN9uVE=;
        b=Qw996GQ7yaKVkOnTHfqxuhZowpMqCwik5yUNxJKpZGTsn/xlUMgrB6EwNitddvnX7v
         3GOpgGv4v0lNxuLPUVXOft2ItQYH1zvAep5mspyrdtKraDJbee57CP05ZzZsqSE3mIVM
         NGdD9bTMKsl+3vU7b4Is6NGUaZJ3xwTIGrfGdeBm8RYSQpuzHXOeRNdHgenQYU72EqPq
         kUA26tr8Mt6zf/xiLJdhoIfkZwu8hReDdhxoyDPucnTwT/5ComJwOaS7Peo6ljOM93o2
         egw698BnPgrt+Ln8wG2+XGULzVdzKDCn2zfzcvA2O6AnfE9uwIFhxAqFwS72EeIZNtSQ
         9e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681658267; x=1684250267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAqvZ67qnEVKEF8yJpsvBW4lNXaQ4i0XMQr0TXN9uVE=;
        b=XjEn5TjB5vuiKZrtGcdPwsNT0KH7lSZUx1j2RpJEoeyzd8iPHqdDZXwLLgVcm6TMZa
         +YGsRD32agPnFBLqQLgvSLW47GuSxQE/v+h9QOASPEk1uzTstgxIP+RY1oC+J8iGVcpi
         IFXPrU/QKksYkUcEK5z6GNYK643qcaVEW6GxSj+C4TNIIqFXjDxGvXnZxBQ/i9XbO6q6
         xNiD921JlonC7XWmilCSVskDJ8OUkk9pE8sBTVrB2KNpEzmd7OP6kwGlNNskkerCZmHr
         sB/RpmIhyabKpKNuOzMFJxrK0OR04maYkaEIcpNNbqcMl2mNlp0+0VVo3Pu5IBeSAA+I
         GJgQ==
X-Gm-Message-State: AAQBX9d/pv11V9uuUVAj4G4cLisJhTRBYm6U7jiX1k9ptOv4wlWZAGbI
        8Th48ZZJa9bw0hOP5qS/fUI=
X-Google-Smtp-Source: AKy350bMWkoc1FrQHQTaSH+N/dGqUAXTtDmP8sxFp0pv+aKGz0VSP9B/2eAKtRK1JmydwLBKsRfIyg==
X-Received: by 2002:a05:6512:98b:b0:4ec:9ef9:e3d with SMTP id w11-20020a056512098b00b004ec9ef90e3dmr1450345lft.26.1681658266805;
        Sun, 16 Apr 2023 08:17:46 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id e13-20020a2e9e0d000000b002a798d12cdbsm1853831ljk.116.2023.04.16.08.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 08:17:46 -0700 (PDT)
Message-ID: <40704530-4242-8d3a-91d3-4c6f4e375808@gmail.com>
Date:   Sun, 16 Apr 2023 17:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] leds: cht-wcove: Add support for breathing mode use
 hw_pattern sysfs API
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-4-hdegoede@redhat.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230413151808.20900-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Hans,

Thanks for the patch.

On 4/13/23 17:18, Hans de Goede wrote:
> The hw-blinking of the LED controller in the Whiskey Cove PMIC can also
> be used for a hw-breathing effect.
> 
> As discussed during review of v2 of the submission of the new
> leds-cht-wcove driver, the LED subsystem already supports breathing mode
> on several other LED controllers using the hw_pattern interface.
> 
> Implement a pattern_set callback to implement breathing mode modelled
> after the breathing mode supported by the SC27xx breathing light and
> Crane EL15203000 LED drivers. The Whiskey Cove PMIC's breathing mode
> is closer to the EL15203000 one then to the SC27xx one since it does
> not support staying high / low for a specific time, it only supports
> rise and fall times.
> 
> As such the supported hw_pattern and the documentation for this is almost
> a 1:1 copy of the pattern/docs for the EL15203000 breathing mode.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Link: https://lore.kernel.org/all/6beed61c-1fc6-6525-e873-a8978f5fbffb@gmail.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   Documentation/leds/index.rst          |  1 +
>   Documentation/leds/leds-cht-wcove.rst | 29 ++++++++++++++++++
>   drivers/leds/leds-cht-wcove.c         | 42 ++++++++++++++++++++++++---
>   3 files changed, 68 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/leds/leds-cht-wcove.rst
> 
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index b9ca081fac71..c92612271e25 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -17,6 +17,7 @@ LEDs
>      uleds
>   
>      leds-blinkm
> +   leds-cht-wcove
>      leds-el15203000
>      leds-lm3556
>      leds-lp3944
> diff --git a/Documentation/leds/leds-cht-wcove.rst b/Documentation/leds/leds-cht-wcove.rst
> new file mode 100644
> index 000000000000..fa79d8fd7ef8
> --- /dev/null
> +++ b/Documentation/leds/leds-cht-wcove.rst
> @@ -0,0 +1,29 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================================================
> +Kernel driver for Intel Cherry Trail Whiskey Cove PMIC LEDs
> +===========================================================
> +
> +/sys/class/leds/<led>/hw_pattern
> +--------------------------------
> +
> +Specify a hardware pattern for the Whiskey Cove PMIC LEDs.
> +
> +The only supported pattern is hardware breathing mode::
> +
> +    "0 2000 1 2000"

Why 1? What is the peek brightness in this mode?

> +
> +	^
> +	|
> +    Max-|     ---
> +	|    /   \
> +	|   /     \
> +	|  /       \     /
> +	| /         \   /
> +    Min-|-           ---
> +	|
> +	0------2------4--> time (sec)
v);

-- 
Best regards,
Jacek Anaszewski
