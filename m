Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A4E1423A
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 22:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfEEUJG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 16:09:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39394 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbfEEUJG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 16:09:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id q10so9339747ljc.6;
        Sun, 05 May 2019 13:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yIbbSlhMTQrOZJfjeGycfkdqYYDq+6JCh5QHCIaafjU=;
        b=RdSO59fgdfAdxKnlTJYcCaJV7HVKp6d7BzKgtLXLBd4af4h8vK7dsu6jhMOYmMRa5v
         4JnGG5eTukvkDXDbrNVU5YMUqSGEzY71abIwChoiLg4x8evspH/fqdehf64AFUSL7d7x
         Lvespe1gIK3q+HqmSoXQi/ta+KcjpOWAscgi0n0or0jlC6JLeOKnMbs0ncB7hsorF4kx
         XBEgeddw+f+YmApyq5ECTObIT5sgJ4IkNZqIzOHeawEokLpdd0H1sWoRYDetnwXogZ6a
         d3VZQY8RL65Oo7C1lokr0ZBkJEwLkHbs9tVgpTK03vlXxF6s1YBM3Kf7FjsTk0JGbtwa
         +2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yIbbSlhMTQrOZJfjeGycfkdqYYDq+6JCh5QHCIaafjU=;
        b=de95Je3XWu3eeG/8S3/uEpI6hVZJ41oZ/+juaI5KatUf1xOozKmcPxN2f4mYNAVMFW
         zDswgGLHfS5ZaC45lX+ETR1pDDp5+4lpD8wvfT7/+kJJ4nZYBYP7KjqfK0KUDttaThqs
         rpG9F2JCnPe1qlrpLIxRnYWoyVbPVK24xqyMtVrR5Qqo8ZBvY8fYugDfG8RIuR0XrKxT
         Odlrn9Q3UCmRoYRBPZ4DRLaHm89J4c962mSr6q40LLtdNO5AgfzEYdRhuvT6zQIF986+
         ScsQwcWsBqXneQtBo5sRNh3iBgoQgE31eWChVGdguJ/nCkNBM7r64ucFsFGSLLIz+IY5
         9mbg==
X-Gm-Message-State: APjAAAWEdj2EGjbB4TJ2QWhgkFnZ7nq3Gls7becTY/qWnRya4pgVL/Y6
        SR+6RJbtIllgX/nzUkUkenxTyNtB
X-Google-Smtp-Source: APXvYqx/0YzyxDC1XO9vR0KE/XJL/k9jFwPgkuZmV7cPCfKiBSRwpR6NEHME7ID6Gb5ZjBCnTae2yQ==
X-Received: by 2002:a2e:8787:: with SMTP id n7mr11565851lji.31.1557086944323;
        Sun, 05 May 2019 13:09:04 -0700 (PDT)
Received: from [192.168.1.19] (dnn153.neoplus.adsl.tpnet.pl. [83.24.95.153])
        by smtp.gmail.com with ESMTPSA id q29sm1694241ljc.8.2019.05.05.13.09.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 13:09:03 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
To:     oss@c-mauderer.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a473e4ec-10f7-6261-1fc3-8164677ac36b@gmail.com>
Date:   Sun, 5 May 2019 22:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505200022.32209-2-oss@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Christian,

Thank you for the update. One thing left after switching
to devm API. Please refer below to the remove op.

On 5/5/19 10:00 PM, oss@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
> 
> This driver adds support for simple SPI based LED controller which use
> only one byte for setting the brightness.
> 
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
> 
> Changes compared to v2:
> - use "if (ret)" instead of "if (ret != 0)"
> - don't initialize ldev-fields with zero
> - use devm_led_classdev_register instead of led_classdev_register
> - check for error instead of good case with the last if in spi_byte_probe
> 
> Changes compared to v1:
> - rename ubnt-spi to leds-spi-byte
> - rework probe to get all parameters before allocating anything -> error checks
>    all collected together and initializing all fields of the device structure is
>    more obvious
> - fix some unsteady indentations during variable declaration
> - rework comment with protocol explanation
> - handle case of off_bright > max_bright
> - fix spelling in commit message
> - mutex_destroy in remove
> - change label to use either use the given one without a prefix or a default one
> 
> 
>   drivers/leds/Kconfig         |  12 ++++
>   drivers/leds/Makefile        |   1 +
>   drivers/leds/leds-spi-byte.c | 134 +++++++++++++++++++++++++++++++++++
>   3 files changed, 147 insertions(+)
>   create mode 100644 drivers/leds/leds-spi-byte.c

[...]
> +
> +static int spi_byte_remove(struct spi_device *spi)
> +{
> +	struct spi_byte_led	*led = spi_get_drvdata(spi);
> +
> +	led_classdev_unregister(&led->ldev);

This is now not needed - devm, means "device managed", i.e.
all resources claimed with it will be automatically reclaimed
on device destruction.

> +	mutex_destroy(&led->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id spi_byte_dt_ids[] = {
> +	{ .compatible = "leds-spi-byte", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
> +
> +static struct spi_driver spi_byte_driver = {
> +	.probe		= spi_byte_probe,
> +	.remove		= spi_byte_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= spi_byte_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(spi_byte_driver);
> +
> +MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
> +MODULE_DESCRIPTION("single byte SPI LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:leds-spi-byte");
> 

-- 
Best regards,
Jacek Anaszewski
