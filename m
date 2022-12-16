Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D0464EE1B
	for <lists+linux-leds@lfdr.de>; Fri, 16 Dec 2022 16:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiLPPrH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Dec 2022 10:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbiLPPrG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2022 10:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A13A58BE3
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671205581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9miN79vuneG4+xiAXBKAhjQmKbcytEgoN1Q0VxUiPr0=;
        b=VeOJ2TdaftxTqRXvPDC7/znNZ8PBG3PyAmzFaFgRaIj1yzI7NrHqNPpZAdzoi5AEp9REhr
        HdO1m4FqbWUYmvK1YaJq8gNsV7Nr+PsG14TUC8cvifU2QDrnTCExEsaikYZIrda9OMDXqu
        z0C4wadQEqaFfEb+kqg3XZ1NkIUHHTU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-wDjDCqBkNACpF5R7_Ct7Aw-1; Fri, 16 Dec 2022 10:46:17 -0500
X-MC-Unique: wDjDCqBkNACpF5R7_Ct7Aw-1
Received: by mail-ed1-f72.google.com with SMTP id x20-20020a05640226d400b0046cbe2b85caso2163986edd.3
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 07:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9miN79vuneG4+xiAXBKAhjQmKbcytEgoN1Q0VxUiPr0=;
        b=8HLEkEZ8AG5/yJZH5ziGTgQgQIIIrDNM1sIwtMy2WFMQRRamRyp1epdyIqaN33FaO4
         UHN5O79YfAtNibHNp0e387m40w7Bt5kwos4ZRDLNWKH+CgTZk9tfvu626NMHtPwMTNIG
         HxfhufNTstwuc27uFKxHZbWO2Ns8jFAE20hdjtpi1G3431zwcp9Hwjm/noBjL+Xa+Osf
         0VUitL2aGCgu/ONApcmd/o0sBKwBbPVIy8kW77wQrf4k4CANZ+jSrJ2CrVl57wE3KokE
         fqqhK1SwgoPUkPnq4zB7vm+99FHJzcpfYbTa5aPgScIe0RDWXNvp9L8K51d+/qTww1xn
         acLQ==
X-Gm-Message-State: AFqh2krb6sIo7OMT448uGSTAsLfE0CuN0Dhp4O1/jI+CJt4E8FSpTcMm
        1plav9KibNI9uKNJczp/HXJwwxS5dtKDCJpfRXyf5Z5z5Aa7uABs9MvX/7c8uF766x8uqN/G4ey
        hHvBqXbQhvja+lpmaF5tbMw==
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id q19-20020a1709066b1300b007ae29faba8fmr18501451ejr.2.1671205575484;
        Fri, 16 Dec 2022 07:46:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1F+qGVMz5rlxsdm1cVTC00+hNjjzyZuB6NkuP4nyFnjpBc63rkQq2R/tNIbj6f9TJ3hqZGA==
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id q19-20020a1709066b1300b007ae29faba8fmr18501435ejr.2.1671205575286;
        Fri, 16 Dec 2022 07:46:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906308500b007be696512ecsm965332ejv.187.2022.12.16.07.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:46:14 -0800 (PST)
Message-ID: <143dc036-ed98-871f-57d9-e94bfa84ea5d@redhat.com>
Date:   Fri, 16 Dec 2022 16:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/11] leds: led-class: Add __led_get() helper function
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-3-hdegoede@redhat.com>
 <Y5x4mcv4rft2Wc+l@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x4mcv4rft2Wc+l@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 12/16/22 14:54, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:04PM +0100, Hans de Goede wrote:
>> Split out part of of_led_get() into a generic __led_get() helper function.
>>
>> This is a preparation patch for adding a generic (non devicetree specific)
>> led_get() function.
> 
> ...
> 
>> +static struct led_classdev *__led_get(struct device *led_dev)
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!led_dev)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	led_cdev = dev_get_drvdata(led_dev);
>> +
>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
>> +		put_device(led_cdev->dev);
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	return led_cdev;
>> +}
> 
> If I'm not mistaken, the entire series leaves this function as is.
> At the end I found three _get functions:
>  __led_get
>  led_get
>  __devm_led_get
> 
> 
> As far as I can see the above can be named more precisely, i.e.
> led_module_get(). Or alike if this sounds not good either.

led_module_get() sounds good, I will rename this for v4.

Regards,

Hans

