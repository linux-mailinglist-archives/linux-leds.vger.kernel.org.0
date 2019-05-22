Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BD427107
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 22:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbfEVUst (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 16:48:49 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41329 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729844AbfEVUst (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 16:48:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id q16so3378153ljj.8;
        Wed, 22 May 2019 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=smckmYiROd8TfrSlooS1zTGOXnlqxP3nKtXXuWXW1/w=;
        b=cKc2UJHG/VNOdoqg3/aPA5d8s8mZerYxr/ngfA7kUj9qG8etw1VgQrgqUHClEt78kN
         1VEpMABpiOoGTO9NymwafOeCFTaEeFbtN9M1/eQ1s/rzHxLuL+A2ccaNgOU9vV8VcD/q
         Izp7yiWxaHt0eqvMFlJ3OIEY+ytZjtKbDYtAtbBHLTQg6rNyJsCaif2HXLtQ3OInVdzp
         AsPb5Cs3RkCeZzVjvE0ej6phCyrLrnTsi19xYsBGr41XNbouv9lhekaQdDgQ/sWpW078
         FZ4KWFYf/nCxGCNtRUw0ds12uz4T3NngYRkNpcv6i1LrQtLvD9e/S75Vv8zo6i8p+pjK
         Sz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=smckmYiROd8TfrSlooS1zTGOXnlqxP3nKtXXuWXW1/w=;
        b=A6jff4Fvb374e5/ts8c0x0y24yUIwPfq59WxsUrfSK22qVwGN6k6G+vpYRqn/FgSR8
         yxMe0P5b0esIVCYdn1SXUsb/BCxQh44vA7BhBviqPwvSKaabifgLa8k9mZoaRCVVfcBe
         yqWo4W0KCOsTNT7xwnnUyQQPJA9uwcy7tV/bmdaazm7G/2MJs9IIhm/z3usNo8SRpHts
         MHkC6O847qXcUxy800iQ4SPu0ucjJ2aCscGpGmx2NwT7PD16lOGhySr1GvERkkQl8VU4
         vsNgI+5mBFziLkpmWImYc05HQ0drethzOaZl+yAlCPO1vnCK8Dt/RBIhVwa6JO6yb0hf
         6Qag==
X-Gm-Message-State: APjAAAXfUXajgrnASc09qjCvOnIIuEgGZTsy+/JD5X1eHOfzBFlrvoBp
        FCa9ZhbIkw0bHyvQZ2JpSQ6E+e5u
X-Google-Smtp-Source: APXvYqwVtcVCyb7sG+hTvRvcE9aLBetcccRb/2nMei/ndConFgTNMXsTkLyq/ngxorSZjBGhF9rXVA==
X-Received: by 2002:a2e:1284:: with SMTP id 4mr16169111ljs.138.1558558127032;
        Wed, 22 May 2019 13:48:47 -0700 (PDT)
Received: from [192.168.1.17] (dma4.neoplus.adsl.tpnet.pl. [83.24.56.4])
        by smtp.gmail.com with ESMTPSA id r3sm3238139ljr.76.2019.05.22.13.48.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 13:48:46 -0700 (PDT)
Subject: Re: [PATCH][V2] leds: TI LMU: fix u8 variable comparisons with less
 than zero
To:     Colin King <colin.king@canonical.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190522101745.21828-1-colin.king@canonical.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1dab790f-0b82-5fac-2081-7943379ccc54@gmail.com>
Date:   Wed, 22 May 2019 22:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522101745.21828-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Colin,

Thank you for the patch.

On 5/22/19 12:17 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The u8 variables ramp_ups and ramp_downs are being compared to less
> than zero, this will always be false.  Fix this by making the ramp
> variables ints.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 9a8e66ebeaa2 ("leds: TI LMU: Add common code for TI LMU devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: make u8 vars ints rather than removing the comparison. Thanks once
> more to Dan Carpenter for spotting my clearly stupid V1 version and
> correcting my mistake.
> 
> ---
>   drivers/leds/leds-ti-lmu-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
> index adc7293004f1..c9ab40d5a6ba 100644
> --- a/drivers/leds/leds-ti-lmu-common.c
> +++ b/drivers/leds/leds-ti-lmu-common.c
> @@ -84,7 +84,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
>   int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
>   {
>   	struct regmap *regmap = lmu_bank->regmap;
> -	u8 ramp, ramp_up, ramp_down;
> +	int ramp, ramp_up, ramp_down;
>   
>   	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
>   		ramp_up = 0;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
