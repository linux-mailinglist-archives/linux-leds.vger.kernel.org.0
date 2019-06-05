Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 420E4364BB
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 21:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfFETbm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 15:31:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36488 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFETbm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 15:31:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so17623738wrs.3;
        Wed, 05 Jun 2019 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CR6XFeOMZJQM4BGrbFMgzErRWLAloeGJOms2+4HdXsU=;
        b=Do2WkLTKCC2BzOuOF05cX/F6fgrfuLHV7G9WQbaceoXMyM6B9QM2lXqEOTOavv55V3
         xurN/EW7jPT37o9v4oLDZflJsF99O/M/mBrp++9R5gcY5SpyUoIakgx2kCg1B1BSQ6uP
         nEYQO9/epO87yvq6UiihlaDKmuKIfF9L7g2ly79KY6aXBizTRxjMVKEXAmmt0XwdbGde
         PZW5yrldiO/v+T4EUm3G3Q61b+CIYcOohSUkUETLDjA7AmDivB8lX42nGfUuz/SrU6FH
         Rx7oo12EwoOQPPnFtjrTi4K/Eop59CkEq1Nq2WsT2kI/zN77qq2k41REZdqM1Snq5t6u
         Q1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CR6XFeOMZJQM4BGrbFMgzErRWLAloeGJOms2+4HdXsU=;
        b=FgZLy/61Fd5odn8snXgqGpTJ3fKF8hzYqOccPvXSXIjsDzo6KqEtqXOxOg6/xzgpfb
         HCiCa0kaSRNe3EGZUBzYYg4q0kKROfHAOiLj35yGQ4zB/zU/up7gHL8oHgqtSzhitc86
         4nKSWi3FDFX0neRw3l+HlBsa/SjWu14zLZPOADsQKDiwlVUs2hfeQEo9GtUYegzWGqs1
         8hR470E6+XfwpbC9JCEFNwBZ/e7XtsxlbEq9Mwkv0PP4B+65MyNr75Eq+wKCeEoNOZ4k
         zglSEtuDpEJmr9Robb3DWuYUuiYSW2KDKl9fEMeuI2B4w3sW9lJNoVVtVpmshfTTXGq+
         HzOg==
X-Gm-Message-State: APjAAAVp41IYt621PHYCrwlIDruR47D7bIoClEQJp9rwaHu0py0kJ1kw
        Qtw4eIGnXCnJOOG7iSZ6CIFS6Lxg
X-Google-Smtp-Source: APXvYqyqmdfv4Ii73UGu3DMUeTitvp1egPp9n/55aT0sroqdrSMGsgKyNK3L1IVTjJUPVL51dly4cQ==
X-Received: by 2002:adf:8065:: with SMTP id 92mr9453584wrk.222.1559763100285;
        Wed, 05 Jun 2019 12:31:40 -0700 (PDT)
Received: from [192.168.1.17] (ble215.neoplus.adsl.tpnet.pl. [83.28.198.215])
        by smtp.gmail.com with ESMTPSA id z14sm17991014wrh.86.2019.06.05.12.31.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 12:31:39 -0700 (PDT)
Subject: Re: [PATCH v6 0/5] LM36274 Introduction
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, broonie@kernel.org,
        lgirdwood@gmail.com
Cc:     lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190605125634.7042-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <cb41fea8-4cc6-bf0d-8006-6441ba8f2213@gmail.com>
Date:   Wed, 5 Jun 2019 21:31:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605125634.7042-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the v6.

Patches 4/5 and 5/5 don't contain amendments I made to
the respective patches on the ib-leds-mfd-regulator branch
(that address issues raised by Pavel), so I just kept those
unchanged. Besides that I updated the remaining ones.

Please check the ib-leds-mfd-regulator branch. I'll create a pull
request once I get a confirmation from you saying that everything
is as expected.

Best regards,
Jacek Anaszewski

On 6/5/19 2:56 PM, Dan Murphy wrote:
> Hello
> 
> The v5 patchset missed adding in the new validation code.
> Patch 1 of the v5 series was squashed into patch 4 of the v5 series.
> So this will reduce the patchset by 1.
> 
> Sorry for the extra noise on the patchsets.  The change was lost when I converted
> the patches from the mainline branch to the LED branch.
> 
> This change was made on top of the branch
> 
> repo: https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
> branch: ti-lmu-led-drivers
> 
> 
> Dan Murphy (5):
>    dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>    mfd: ti-lmu: Add LM36274 support to the ti-lmu
>    regulator: lm363x: Add support for LM36274
>    dt-bindings: leds: Add LED bindings for the LM36274
>    leds: lm36274: Introduce the TI LM36274 LED driver
> 
>   .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>   .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>   drivers/leds/Kconfig                          |   8 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>   drivers/mfd/Kconfig                           |   5 +-
>   drivers/mfd/ti-lmu.c                          |  14 ++
>   drivers/regulator/Kconfig                     |   2 +-
>   drivers/regulator/lm363x-regulator.c          |  78 +++++++-
>   include/linux/mfd/ti-lmu-register.h           |  23 +++
>   include/linux/mfd/ti-lmu.h                    |   4 +
>   11 files changed, 437 insertions(+), 8 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>   create mode 100644 drivers/leds/leds-lm36274.c
> 

