Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A6B2533B5
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 17:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgHZPav (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 11:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgHZPav (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Aug 2020 11:30:51 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08BCC061756;
        Wed, 26 Aug 2020 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=xlfXHnuuH2gInBuzkBHVhLFG54fPY1/qexAoARTTtw4=; b=RaQnXZB20d4JOEFetCvG5MTO5c
        m6j1A2coIXyNV4KKTq3oTb8hkh9riRf+BmXobcnLKbvwdpC/wA/mc4Yi4CMHhXjjKfx2O1vRA+kYt
        NOu7FaDqiOl1OMZZPrsNQqb9AJf+Glllx9hjPwHnYZki+JcM9MVqtULJK8GIVpF/xyr/JaxPczdrp
        2m0LnJ6mtqKdDS74P929XjsyCn0JKWATMoTJdR6qk1tnnrPe+rBebTU5adIMFEya7FvRVOiDA5KnR
        rzlWZ/o9XTQwZCWxpEDUt9OZpt4s2sXniVTLUMjthgf6jHQ8DpeeMERpsrEm7xz+I0ZAoQlfVsNTz
        4d4DeJTA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kAxNs-0004uD-AB; Wed, 26 Aug 2020 15:30:44 +0000
Subject: Re: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f35bf9c1-6397-3369-954d-fe05d77438cd@infradead.org>
Date:   Wed, 26 Aug 2020 08:30:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/26/20 4:37 AM, Gene Chen wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..ce95ead 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,17 @@ config LEDS_MT6323
>  	  This option enables support for on-chip LED drivers found on
>  	  Mediatek MT6323 PMIC.
>  
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Support Torch and Strobe mode independently current source.

	  Supports                      independently of current source.

I'm guessing on that ending; I wasn't sure what was intended, but it doesn't
make sense as posted.


> +	  Include Low-VF and short protection.

	  Includes

> +
>  config LEDS_S3C24XX
>  	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>  	depends on LEDS_CLASS


thanks.
-- 
~Randy
