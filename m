Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2151B64EDCB
	for <lists+linux-leds@lfdr.de>; Fri, 16 Dec 2022 16:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbiLPPXF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Dec 2022 10:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiLPPXA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2022 10:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96D3532E1
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 07:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671204132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XLjDVQMOaQDf9kCy2gWjQIFoZeoTcfdAcAIX6l6ffTc=;
        b=fQUp+oBYQMRPjYw1iHgIg0BQwMq0tjl/niWAkF4pznW9zbaSrCXX+hRksnUNuAX7LzP/+9
        tcFMJIPNIDdyI0xi+rTsTLftP4PqqP3umNcnHvM1qLLD5X070Tgma5zzjWLnOJxKyy16qy
        JFuQqelyHhLMIYnSwzcGDx720Qcpd84=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-t2TlVzyKPRCH5Mrwf7h2wg-1; Fri, 16 Dec 2022 10:22:09 -0500
X-MC-Unique: t2TlVzyKPRCH5Mrwf7h2wg-1
Received: by mail-ed1-f69.google.com with SMTP id y20-20020a056402271400b0046c9a6ec30fso2096519edd.14
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 07:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLjDVQMOaQDf9kCy2gWjQIFoZeoTcfdAcAIX6l6ffTc=;
        b=4Mfw+D6H0Nk3PcnZSyv4PsuR3q2GFeR5WlJuaFKEaFnyZdz7oem4/q0+HrTHWS4QaW
         MBLuuitR+gNFq5544rPMlvJBWUdXY1jYbKgY79xBAVNBLep/ECnYK2vI8rR9b156H6in
         nhY7TblSoXwi3O5M6Pdjr48SN5tvFk04ODa7XrM50Ec39dSvmq3PqIvyKfzn177te56n
         QJdudVi2H+TjBxqJdqxZEJyw+mb4l1U1PtjQkd6OLzhyP4AArWplWK771jsEuIz/Be7h
         mUTVr0MJAzaadoOH5HSDaBNpoweIOFBo9YgIU1f9c7h2BObsfUbR5WFisvym7fh7exV3
         XrqA==
X-Gm-Message-State: ANoB5pmx+WEH3+mR7RHRWfGp/rEyc+wjYIRtJbweAK9QCNKIo0jXEY/b
        yaGjn6ZoCfuw9twWq1Z0Pj8vgWZoQp6Kl1FJE16FQ/WGrCWjFt8yfR6uMOHhhXWKVPNakvejyX8
        PmjZerQmN3yt+zDm0+dIf8A==
X-Received: by 2002:a17:906:3890:b0:7b2:8a6d:e946 with SMTP id q16-20020a170906389000b007b28a6de946mr28045633ejd.30.1671204128012;
        Fri, 16 Dec 2022 07:22:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YYX/dyJtVTWTDIjqC/iuZkmA+xylzHt6PG1KRCEos6AnmV3ZVyXX7leNzo2uc0QR61mFheQ==
X-Received: by 2002:a17:906:3890:b0:7b2:8a6d:e946 with SMTP id q16-20020a170906389000b007b28a6de946mr28045612ejd.30.1671204127847;
        Fri, 16 Dec 2022 07:22:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id kv5-20020a17090778c500b007b29eb8a4dbsm987367ejc.13.2022.12.16.07.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:22:07 -0800 (PST)
Message-ID: <1f784f94-cbb1-79db-3796-ec5c21c9e8e2@redhat.com>
Date:   Fri, 16 Dec 2022 16:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 01/11] leds: led-class: Add missing put_device() to
 led_put()
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
 <20221216113013.126881-2-hdegoede@redhat.com>
 <Y5x0IdXiczdc73qV@smile.fi.intel.com> <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
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

On 12/16/22 14:55, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 03:35:29PM +0200, Andy Shevchenko wrote:
>> On Fri, Dec 16, 2022 at 12:30:03PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>  	led_cdev = dev_get_drvdata(led_dev);
>>>  
>>> -	if (!try_module_get(led_cdev->dev->parent->driver->owner))
>>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
>>> +		put_device(led_cdev->dev);
>>>  		return ERR_PTR(-ENODEV);
>>> +	}
>>>  
>>>  	return led_cdev;
>>
>> ...
>>
>>>  void led_put(struct led_classdev *led_cdev)
>>>  {
>>>  	module_put(led_cdev->dev->parent->driver->owner);
>>> +	put_device(led_cdev->dev);
>>
>> Hmm... It was in the original submission.
>>
>> https://lore.kernel.org/linux-leds/1443605522-1118-2-git-send-email-tomi.valkeinen@ti.com/
> 
> ...
> 
>> Nevertheless, shouldn't you put device before putting module? (It may need to
>> save the owner of the driver, I think.)
> 
> I think this is wrong, the symmetry is kept correct in your patch.

Right, the line above dereferences led_cdev->dev, so the put()
must be done after that line.

Regards,

Hans

