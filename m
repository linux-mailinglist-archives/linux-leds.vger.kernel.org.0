Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE0E6E7A3D
	for <lists+linux-leds@lfdr.de>; Wed, 19 Apr 2023 15:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbjDSNFM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Apr 2023 09:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjDSNFH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Apr 2023 09:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB94855BE
        for <linux-leds@vger.kernel.org>; Wed, 19 Apr 2023 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681909458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rUImfWG8G6lNv0OY6On+z7XxquNQlIyNb/cgsWs9FBM=;
        b=eDpMWrFv3c5gfZSmfDEb/m44lkclXq9w3jtkYocnwNaN3WGdG2G2RfpUGqpaUOPZhbHnAx
        F9I3F5ZIERjVlw8EYLvwhQ1JL8AecfaBhs9MPli7jQZ9WJzJWUlQydrSM6/s4RJA4ex7Ed
        oQLzarcyNccOhX6/v+CK3wAM94pO8m0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-NQfI43-gM02dzLzqES3_RA-1; Wed, 19 Apr 2023 09:04:16 -0400
X-MC-Unique: NQfI43-gM02dzLzqES3_RA-1
Received: by mail-ed1-f71.google.com with SMTP id k24-20020a508ad8000000b005068d942d3fso7038477edk.2
        for <linux-leds@vger.kernel.org>; Wed, 19 Apr 2023 06:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681909455; x=1684501455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUImfWG8G6lNv0OY6On+z7XxquNQlIyNb/cgsWs9FBM=;
        b=D3asZMZRB738rtQt0ZcF33fZw7BA01tbRR5+yEJQLRwVU+DVY3RcdyRmdvseFah6iI
         gg9lo614pVqCG2rKHYj3I6KMXn3lcVS1xg2wTxwjyoldhI9/jkPNRalPgh1hSxTtM9kJ
         tfRWyZrKZMfzb6whCyIWuhAFYR6vWvY2CNfTPsHp4Hi14e6oD6jusbNjVx7WNjgixEcd
         Jjyga0RD95xvTLzew4OqkHRKSH6pHfJoa7+Zif08Won4M9Ags1fNnejFH9fhpODoilmE
         9QzSJlk2qX3Wo05kwgVVNvEQLFexDl1jnqKt6wZti2K1o2ykDvXthrSMdh5xaiLx1cNC
         DpOw==
X-Gm-Message-State: AAQBX9cCgyq4DF7WgF/8CFXnt4+NG4eJr8r1Ti8EEtWO6mj1Gjp/xGGm
        FK2uucbwbQQX5Wy6QyklmZdPkI2haDRNGgT7Zg3P8uDUzgBztldwATTPCuwpUSPS1yteUHlkMrr
        ghEOvjEGU4WZDhGtRu3SjlQ==
X-Received: by 2002:a17:906:304a:b0:94e:dbf7:2dfe with SMTP id d10-20020a170906304a00b0094edbf72dfemr12872448ejd.11.1681909455259;
        Wed, 19 Apr 2023 06:04:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYDxp4vVHdZw2/7SxE8H9RvgRaAKx2nDsaGllvX0soKm2wby1XKKQPJKGIFxKA/IXGyZ6pwQ==
X-Received: by 2002:a17:906:304a:b0:94e:dbf7:2dfe with SMTP id d10-20020a170906304a00b0094edbf72dfemr12872426ejd.11.1681909454913;
        Wed, 19 Apr 2023 06:04:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kq25-20020a170906abd900b0094ecf61289esm8385188ejb.152.2023.04.19.06.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 06:04:14 -0700 (PDT)
Message-ID: <1a189e3a-523d-8a5d-c686-07bf3b924c75@redhat.com>
Date:   Wed, 19 Apr 2023 15:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
Content-Language: en-US, nl
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>,
        linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-2-hdegoede@redhat.com> <ZDlKyq0tLAbFGS8P@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZDlKyq0tLAbFGS8P@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Thank you for reviewing this.

On 4/14/23 14:44, Pavel Machek wrote:
> On Thu 2023-04-13 17:18:04, Hans de Goede wrote:
>> From: Yauhen Kharuzhy <jekhor@gmail.com>
>>
>> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
>> PMIC. Charger and general-purpose leds are supported. Hardware blinking
>> is implemented, breathing is not.
> 
> leds->LEDs.
> 
>> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
>> new file mode 100644
>> index 000000000000..06447804d050
>> --- /dev/null
>> +++ b/drivers/leds/leds-cht-wcove.c
>> @@ -0,0 +1,368 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
>> + *
>> + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
>> + * Copyright 2023 Hans de Goede <hansg@kernel.org>
>> + *
>> + * Based on Lenovo Yoga Book Android kernel sources
>> + */
> 
> "sources." Should copyrights from Android be copied here?
>
>> +static const char * const cht_wc_leds_names[CHT_WC_LED_COUNT] = {
>> +	"cht-wc::" LED_FUNCTION_CHARGING,
>> +	"cht-wc::" LED_FUNCTION_INDICATOR,
>> +};
> 
> No need for "cht-wc".

I should put something there right, iow not just
"::" LED_FUNCTION_CHARGING" if it should not be
cht-wc should I put "platform::" there then, or
maybe "pmic::" ?

> Mention color.

This PMIC is used in multiple designs at
least both white and red LEDs are used in
2 designs I know about. AFAIK the norm is
to leave out the color if it is different
per design? 


> At least charging LED is
> going to be common - document in Documentation/leds/well-known-leds.txt. 

That already has:

* Power management

Good: "platform:*:charging" (allwinner sun50i)

So you want me to extend the (allwinner sun50i) bit with ", cht-wc" ?

Ack to all the other comments, will fix for v2.

Regards,

Hans



> 
>> +static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
>> +				      enum led_brightness value)
>> +{
>> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
>> +	int ret;
>> +
>> +	mutex_lock(&led->mutex);
>> +
>> +	if (!value) {
>> +		ret = regmap_update_bits(led->regmap, led->regs->ctrl,
>> +					 led->regs->on_off_mask, led->regs->off_val);
>> +		if (ret)
>> +			dev_err(cdev->dev, "Failed to turn off: %d\n", ret);
>> +
>> +		/* Disable HW blinking */
>> +		ret = regmap_update_bits(led->regmap, led->regs->fsm,
>> +					 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_ON);
>> +		if (ret < 0)
>> +			dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
> 
> This overwrites previous error. Not sure if it is big deal.
> 
>> +static int cht_wc_leds_blink_set(struct led_classdev *cdev,
>> +				 unsigned long *delay_on,
>> +				 unsigned long *delay_off)
>> +{
>> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
>> +	unsigned int ctrl;
>> +	int ret;
>> +
>> +	mutex_lock(&led->mutex);
>> +
>> +	if (!*delay_on && !*delay_off)
>> +		*delay_on = *delay_off = 1000;
> 
> That's really slow blink; I'd do something faster by default.
> 
>> +	/*
>> +	 * LED1 might be in hw-controlled mode when this driver gets loaded; and
>> +	 * since the PMIC is always powered by the battery any changes made are
>> +	 * permanent. Save LED1 regs to restore them on remove() or shutdown().
>> +	 */
> 
> Fun :-).
> 
> Thank you.
> 
> Best regards,
> 								Pavel

