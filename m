Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B243B396870
	for <lists+linux-leds@lfdr.de>; Mon, 31 May 2021 21:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhEaTur (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 May 2021 15:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhEaTup (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 May 2021 15:50:45 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13DBC061574
        for <linux-leds@vger.kernel.org>; Mon, 31 May 2021 12:49:04 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r5so18244009lfr.5
        for <linux-leds@vger.kernel.org>; Mon, 31 May 2021 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=okHNmua5GJpjYnKscQDiZ7SOb62fC7Q6mFEaM01PMa4=;
        b=hzis1dg3gJP1aJ3l6XvZaSqr+5UbS7qFn0tcS080ULrIFhVnZhnK8jfo/MX/5+8gey
         e8FFsqVtlZAf5dln/6AwHnqcPma/qq1EOlI+lew79W+EiY9fRDR2stmlrbp1AxJHpehO
         ZTTPdzkRzbPEyGxomp2RQ/z8xh6tGS4pvnjnFaJxVMeRTfWSkrb7ptkfdeH2kln5Ss/9
         N5gY5Q+3W2/w7Xyp0pSf+SQNHbVENiVKk2F6M5ye5CXecI+4FMI2WCYTpcXIZRInfB5C
         XIcrMNAQvq9Gj3xBqF7jGfkprK/IwkgHUtVNfipfcpNjgRazGM+1tGMv82ceiew/jfh2
         XTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=okHNmua5GJpjYnKscQDiZ7SOb62fC7Q6mFEaM01PMa4=;
        b=ojhD3ygIBQ+Tmk1RER9VKBeSAKE5EjBKGTVS8LoDnWBsmanoP3rsU/dqZn3zD211Q5
         KSjO/XID1t16Gm9hPtnLRcQWj/eCrPs2mLUFjlPt05rGZa3U+lIHZ/P7f/GofXNIUW4j
         YU3Ofd9u24vF+wiDQLbR0nQIj8QkHlwvq9s0LRigVrewkhQ5ejEa3PGiIZ+03zomhDSP
         3U6/AdXDh6mdl9B6pnSemMFwgKFcIY2lcBziZheVuNezcpL1O4wpwfhOAEpxugBrbxFd
         no0ivKNjW29hlrqOz3JYSTrzsiUWAuumnfaLyzWqJd8E2u4YoD/SlNnDhWmULJ06Me1J
         K01Q==
X-Gm-Message-State: AOAM532nxeswc3mkndAesxcFpNen5ulDu+Qygy+HKsV/wH5Ho/dmvCNy
        i6osYq7zfJByZc+8rHZC9LRFW/QZTDc=
X-Google-Smtp-Source: ABdhPJxNgfIkdzKFmgLbkgYf1kkVKbXAYmu9KzN47Rf56mHSVp2OEYr7jgaAPU7Dcq/BfXhlrIYR0g==
X-Received: by 2002:ac2:5e6d:: with SMTP id a13mr7649164lfr.201.1622490542846;
        Mon, 31 May 2021 12:49:02 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id i10sm1017171lfc.206.2021.05.31.12.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 12:49:02 -0700 (PDT)
Subject: Re: [PATCH 1/6] leds: aat1290: Move driver to flash subdirectory
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <20210528202404.431859-1-linus.walleij@linaro.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <56e9391a-2465-2a7a-0d13-6f99636900ef@gmail.com>
Date:   Mon, 31 May 2021 21:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210528202404.431859-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

On 5/28/21 10:23 PM, Linus Walleij wrote:
> We created a subdirectory for LED drivers that depend on
> CONFIG_LEDS_CLASS_FLASH, and this driver does so let's
> move it there.
> 
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/leds/Kconfig                    | 10 ----------
>   drivers/leds/Makefile                   |  1 -
>   drivers/leds/flash/Kconfig              |  9 +++++++++
>   drivers/leds/flash/Makefile             |  1 +
>   drivers/leds/{ => flash}/leds-aat1290.c |  0
>   5 files changed, 10 insertions(+), 11 deletions(-)
>   rename drivers/leds/{ => flash}/leds-aat1290.c (100%)

For 1/6 and 3/6:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
