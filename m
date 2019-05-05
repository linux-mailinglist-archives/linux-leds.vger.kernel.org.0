Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2F014247
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 22:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfEEUPB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 16:15:01 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:56585 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbfEEUPB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 16:15:01 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id AC3352380B88;
        Sun,  5 May 2019 22:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557087300;
        bh=Scy3H3gQ7X4kRt8j/8Uozf+VxK0b/KFkB168DKHQOGo=; l=3194;
        h=Subject:To:From;
        b=iMymyUFRG7BzJP2b2CFYgDjOt6u3XgS3j2wE9HOaef57TDu9hvQh6D0plVn6Huwp3
         RmGeiTG7pD+qbmsUWmNy8h7kkFU9L27NTTXwsKrBTrjfNVdpiycXaobcT1Kz3UEPJK
         ZTmu7dVPJqJo6gXk7cwPTrd+TdUGQsDXqJc3vlKU=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <a473e4ec-10f7-6261-1fc3-8164677ac36b@gmail.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <3017c83c-3931-aa90-8bbb-b60263500a9d@c-mauderer.de>
Date:   Sun, 5 May 2019 22:14:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a473e4ec-10f7-6261-1fc3-8164677ac36b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155708730004.8444.5493085400538980709@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/05/2019 22:09, Jacek Anaszewski wrote:
> Christian,
> 
> Thank you for the update. One thing left after switching
> to devm API. Please refer below to the remove op.
> 
> On 5/5/19 10:00 PM, oss@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This driver adds support for simple SPI based LED controller which use
>> only one byte for setting the brightness.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
>>
>> Changes compared to v2:
>> - use "if (ret)" instead of "if (ret != 0)"
>> - don't initialize ldev-fields with zero
>> - use devm_led_classdev_register instead of led_classdev_register
>> - check for error instead of good case with the last if in spi_byte_probe
>>
>> Changes compared to v1:
>> - rename ubnt-spi to leds-spi-byte
>> - rework probe to get all parameters before allocating anything ->
>> error checks
>>    all collected together and initializing all fields of the device
>> structure is
>>    more obvious
>> - fix some unsteady indentations during variable declaration
>> - rework comment with protocol explanation
>> - handle case of off_bright > max_bright
>> - fix spelling in commit message
>> - mutex_destroy in remove
>> - change label to use either use the given one without a prefix or a
>> default one
>>
>>
>>   drivers/leds/Kconfig         |  12 ++++
>>   drivers/leds/Makefile        |   1 +
>>   drivers/leds/leds-spi-byte.c | 134 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 147 insertions(+)
>>   create mode 100644 drivers/leds/leds-spi-byte.c
> 
> [...]
>> +
>> +static int spi_byte_remove(struct spi_device *spi)
>> +{
>> +    struct spi_byte_led    *led = spi_get_drvdata(spi);
>> +
>> +    led_classdev_unregister(&led->ldev);
> 
> This is now not needed - devm, means "device managed", i.e.
> all resources claimed with it will be automatically reclaimed
> on device destruction.
> 

Thanks for the hint. I've read that the devm functions are some "free
automatically" functions. But I haven't drawn the conclusion that I have
to remove this function. Seems I still need to learn a lot about the
Linux API.

I'll wait for further feedback over night and then remove it in a v4
tomorrow. Otherwise I'll spam the list with lots of new versions.

>> +    mutex_destroy(&led->mutex);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id spi_byte_dt_ids[] = {
>> +    { .compatible = "leds-spi-byte", },
>> +    {},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
>> +
>> +static struct spi_driver spi_byte_driver = {
>> +    .probe        = spi_byte_probe,
>> +    .remove        = spi_byte_remove,
>> +    .driver = {
>> +        .name        = KBUILD_MODNAME,
>> +        .of_match_table    = spi_byte_dt_ids,
>> +    },
>> +};
>> +
>> +module_spi_driver(spi_byte_driver);
>> +
>> +MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
>> +MODULE_DESCRIPTION("single byte SPI LED driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("spi:leds-spi-byte");
>>
> 
