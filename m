Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6610E3241A4
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhBXQHD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 11:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbhBXPqp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 10:46:45 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC69C06174A;
        Wed, 24 Feb 2021 07:45:53 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id e9so1589021pjj.0;
        Wed, 24 Feb 2021 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9mcIs48YnQ0B0jfxm+Ftd8IGk+lfKlv4DImWEhLknTU=;
        b=LKcLH3OTt+vMu4jB/6XyKOhF7yoOZC2CqwGBGkQQOgtTL0508Igr7YfAtWkECMvBjI
         hmy1wFv6tXY/OHtN4CiwCoiHDKsnTtpqFZfIBoxV164XagZEkGKLGB0tsx0v1e5PV+7C
         CBWjtCLN3MvnvXhflmzzAEan/pez3fKNmyIb4xHxFq1VeTJrNh3UPR3CtC7EShNNa/gF
         eAs5rlsuJFYAvGnAxVGXpnBmYY0SJ0Ie/c/esBAbW0MfJxNTxyGEugbE/+9Xl0IYpCqS
         2tIMwK9sIRM37fGBCW6P9ZVZoACuWVqCyTYD5j19FkFVzmkT9Pv5P4Cv8kWuLUGZYCfA
         RqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9mcIs48YnQ0B0jfxm+Ftd8IGk+lfKlv4DImWEhLknTU=;
        b=Z4uNDparyti5Y51b04zRQFY3gzZ/kculWa5S8bwLOmRl7vuEZ5/RVveQyCgFiWI/rQ
         0ZCAb3C+B2YP91CS5mWfIvP01u4GOl2/P8zQxVR+WlUQekogO7E6ion10yAyeHvYjQKC
         I+na/40Lp2L6QxXdSoTJVxKkYRCqI2RgT823usmUrTFGNun2O+WJqTo7fKSoKZzigO/y
         LGdNTgHsGuwQ4hSm1anAg6Wuwo38rOuKGEVi+OQpiBpmVFYBzMujBoM3EAs3e82jWn40
         UgjrziGlhPgjWbnBzIwJ4bNm/y3gIbv0Y3iBzBsZ67AXaPzxuS1VfysuTy7aIUG5cCVm
         ms0A==
X-Gm-Message-State: AOAM531rKgtjX67XaqwyivtuizIVmhH6Vhl/kW8k7LmyegqEtBeWb58J
        d846pmgZQq6EwjeQQ7yrdI+BvF90dZk=
X-Google-Smtp-Source: ABdhPJwMslgfC76N523d/GxrIDheKqx78jiDmZzGbKa1CvkO6uOO08FmVpU1NYsew9NvwsD0N4E8hg==
X-Received: by 2002:a17:90b:3892:: with SMTP id mu18mr5088239pjb.143.1614181552593;
        Wed, 24 Feb 2021 07:45:52 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j3sm2769665pgk.24.2021.02.24.07.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 07:45:52 -0800 (PST)
Subject: Re: [PATCH v2 0/2] leds: bcm63x8: improve read and write functions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        jonas.gorski@gmail.com, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210224101110.20179-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a9a9fb30-2d90-33ff-9b80-af9d03b69c69@gmail.com>
Date:   Wed, 24 Feb 2021 07:45:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224101110.20179-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2/24/2021 2:11 AM, Álvaro Fernández Rojas wrote:
> This code is proven to work in BMIPS BE/LE and ARM BE/LE.
> See bcm2835-rng and bcmgenet.c:
> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88

What is the motivation for doing this? bcm2835-rng and bcmgenet are used
across MIPS and ARM platforms therefore they need to be compatible with
both, but these two LEDs drivers are super specialized, are you working
on porting the 6328 LED driver to the newer ARM-based DSL SoCs such as
63138 and 63148?
-- 
Florian
