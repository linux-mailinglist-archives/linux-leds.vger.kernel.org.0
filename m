Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED5424190
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 21:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfETTyo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 15:54:44 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34370 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfETTyo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 May 2019 15:54:44 -0400
Received: by mail-lf1-f68.google.com with SMTP id v18so11265678lfi.1;
        Mon, 20 May 2019 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UESajbzwoIV7sMA5C+7AZ1ywo1ID3f49/T5tv1zMMAc=;
        b=U35XLBS+00Wp11dB0WmdlhX5fC7qQvVBmRcS2pQJdolUFVu24/piOp7c5W+QifiaUJ
         ljWpZeqTyfdbW6piVzuHJDRp6r0B/9KiHjzN8EEzKbgheriznbg0MqxYYrBXdbfbJUNa
         vR5xEqwiz9XmOfFvcaVD7cbmS9/I0nucT2HReKRKs6i00rncUcm6m9VgoSkQzjpd6tX6
         UoFjquGdgWqxF93uboybTBb5FVxXeNPPYGk/JdY+74HRGm/W3Wf7Xo0nQxMsSEKijmNo
         HUbMN7Pj6OqMFxNoCE1fQl+T8L7Cg9qpXWdujqoGTOyfSwEyif5MJh9SeSL/yHzU3bwC
         0FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UESajbzwoIV7sMA5C+7AZ1ywo1ID3f49/T5tv1zMMAc=;
        b=jX392KzhWwdofnEfae2SV/uvayE6R40kqWmsaJPIH5w6U1cXJUqvcVqpKq1ckNArn+
         clPO3GiapLbh4Gw8Lasa/G0Qci8C6JLzxK/SAWLanfx7Rboe6oRHklYZco20sXV7Aji3
         Gs7KKL1WVS2bhJZU6GoFUX2/U0bRArlTEnaRWTHFqxKCIVTiDOfAZpH7c8xV8gZInJac
         1f9kCLOFnIoPjvKKFNJZnvcHXGURGscQzPX/fR1MC5ySctvK0gtce16CC4afFCUXEbI2
         JxtlDI1Wt3DQGhDuhyib+KEDo6WzvOO87StTxFEr6DPU6aNqJaV7nTmvj7/uMCpqzasZ
         pLlQ==
X-Gm-Message-State: APjAAAXoTt2517KT8SGS+H9hqRaqYTeA/d4mQvo2GLDiXoA8OAXzrf39
        ZeT5wA33pfNi6dPH4k91piMDDRty
X-Google-Smtp-Source: APXvYqwq7Wq+zz3PIo2nZE5pLqXdDJVRF4BkRjASGcq2JMc05sk/lkEnhebCoil4YFLtTDCZYqCCIg==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr9128012lfa.57.1558382082112;
        Mon, 20 May 2019 12:54:42 -0700 (PDT)
Received: from [192.168.1.17] (blc206.neoplus.adsl.tpnet.pl. [83.28.196.206])
        by smtp.gmail.com with ESMTPSA id n196sm2903868lfn.18.2019.05.20.12.54.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 12:54:41 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     lee.jones@linaro.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
Date:   Mon, 20 May 2019 21:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507201159.13940-7-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 5/7/19 10:11 PM, Dan Murphy wrote:
> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
> MFD driver to probe this LED driver.  The driver configures only the
> LED registers and enables the outputs according to the config file.
> 
> The driver utilizes the TI LMU (Lighting Management Unit) LED common
> framework to set the brightness bits.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/Kconfig        |   7 ++
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 182 insertions(+)
>   create mode 100644 drivers/leds/leds-lm36274.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 255fdd5e8491..db83a3feca01 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -791,6 +791,13 @@ config LEDS_LM3697
>   	  Say Y to enable the LM3697 LED driver for TI LMU devices.
>   	  This supports the LED device LM3697.
>   
> +config LEDS_LM36274
> +	tristate "LED driver for LM36274"
> +	depends on LEDS_TI_LMU_COMMON

Shouldn't we have "depends on MFD_TI_LMU" as well here?

> +	help
> +	  Say Y to enable the LM36274 LED driver for TI LMU devices.
> +	  This supports the LED device LM36274.

-- 
Best regards,
Jacek Anaszewski
