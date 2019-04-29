Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 152AEEAA4
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 21:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfD2TKb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 15:10:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33035 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbfD2TKb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 15:10:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id z6so618305wmi.0
        for <linux-leds@vger.kernel.org>; Mon, 29 Apr 2019 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MAWq2a4HGBmrJm0PxO318bCeMG86hbh09Rp7ieHtLqs=;
        b=YcZVcf9d0BVmDmXIkltQMriC9JW/KxsddvDIfH8jN3A+LoPhv6kYyjogOtC3OYQXkO
         oDRuJ4PnV0Dg1WTYQ3SFGBXxzLHDMKDBVw3oD9JR/4Jl+aXbFJ1EGIS0Le976LVJ6URq
         08C3y9clCrG7CuBtUli2YL3cKWB45cmGw0iDCDGy+oGvlkRGjVmKzj7iu4VpaXapKlIs
         vKuplxBM1bFbL+XXsRiw2vqewQekGdU4XXBeSazDr7AlHC2GiVlC8zphQIEha3iH++un
         1NrP2aCzYQODOqmpNhVwBvYKTqlj+9Oswt2GvmQOG69GVw1HY0ZXk9zjMWPtMvOO4mm9
         h0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MAWq2a4HGBmrJm0PxO318bCeMG86hbh09Rp7ieHtLqs=;
        b=cG8/dxbFHFq6tOMUpXEOaByU/BIjLr41PXhg9T3vW/BEbC8iSYzdJzK0o57BJZe9b1
         G9GXKAdf56coHtwpTFQ9eJEZ1vsyfUWoN9ZgLw/8T0H5RKmgnIZhPbEjMM1E/KocvG2t
         +XZqc1j/vX8F7Vn+CftJaaRXWueiJuAENcIKpGvpSO+IFzif+ebiW4fkuJpwcnzV1L+P
         zeKq/N++vey2/e2S+mtC683YEHYoOIXOsdNMSS+RV2+xORYmO33ubHFYtWK7NAgck/PQ
         onaIMcZgf2EVGlTjY8SkUP3c1Feuri8fMJEerBP86iug3/AU762oV0N+ihqHvBAQFwRG
         H0tw==
X-Gm-Message-State: APjAAAVfOEQObOOJGCDzXTMDPllpjKTYlTHRoTkWgA8X/8P1CXidLlj1
        DHkgUHC7Rd7p4W2Cee2HaI8=
X-Google-Smtp-Source: APXvYqzyFUbco2yPp75t8Sx8wi5faPZ5wR2FkqyB1QSh1xCEGk02ToGI2MpV6MG6JaFpQg1Cu/CvRA==
X-Received: by 2002:a1c:b48a:: with SMTP id d132mr425765wmf.92.1556565029505;
        Mon, 29 Apr 2019 12:10:29 -0700 (PDT)
Received: from [192.168.1.19] (ckl137.neoplus.adsl.tpnet.pl. [83.31.87.137])
        by smtp.gmail.com with ESMTPSA id 11sm229145wmk.17.2019.04.29.12.10.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:10:28 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v3 1/1] leds: turris_omnia: add I2C and
 MACH_ARMADA_38X dependencies
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>
References: <20190429183226.14078-1-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <90580b7b-fc6d-b422-8c36-9ed435509898@gmail.com>
Date:   Mon, 29 Apr 2019 21:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429183226.14078-1-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek.

Thank you for the patch.

On 4/29/19 8:32 PM, Marek Behún wrote:
> This driver depends on I2C. There are linking problems otherwise, if for
> example CONFIG_LEDS_TURRIS_OMNIA=y and CONFIG_I2C=m.
> 
> Also add MACH_ARMADA_38X dependency, since it is unlikely that some
> other device will ever have a microcontroller with software compatible
> to that of Turris Omnia microcontroller.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>   drivers/leds/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d5b31a71a112..6b555d31c1be 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -131,6 +131,8 @@ config LEDS_CR0014114
>   config LEDS_TURRIS_OMNIA
>   	tristate "LED support for CZ.NIC's Turris Omnia"
>   	depends on LEDS_CLASS
> +	depends on I2C
> +	depends on MACH_ARMADA_38X
>   	depends on OF
>   	help
>   	  This option enables basic support for the LEDs found on the front
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
