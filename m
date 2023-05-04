Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B6D6F67DA
	for <lists+linux-leds@lfdr.de>; Thu,  4 May 2023 10:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjEDI51 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 May 2023 04:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjEDI50 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2023 04:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8413F358A
        for <linux-leds@vger.kernel.org>; Thu,  4 May 2023 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683190597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eJRmhVLVAJ7qh57c4H8j1SfvgyUPIUuSY5hqsMMOaY=;
        b=O69zt3mLB4ARqXyzVOmfQPdBUEDjP0h1Ypgdpm/WiKizhAp+cZPr4frldZ7l3eERMvGzTv
        42bh6HHwIZYCucARzLraSVtXddrm5HbKh3FxK7QdeS2GHEc7vY1yCsL1Q9C91z9OwsvINp
        hQzc6CeOVBM8QIc/zxrl6giAJrFutxw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-CNKWqAX9Nje6vXoWxeti-A-1; Thu, 04 May 2023 04:56:36 -0400
X-MC-Unique: CNKWqAX9Nje6vXoWxeti-A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9532170e883so25185466b.3
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2023 01:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683190595; x=1685782595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eJRmhVLVAJ7qh57c4H8j1SfvgyUPIUuSY5hqsMMOaY=;
        b=dNh18NYYTuGznYpQ0slsgPQNvZafiqrCxUThIXVcO+5nmI2XVZOfoad84dwbPbLRYF
         bguBGoOu8fUcT/dWM9m7sP3OS21n+axkV80sVjf2735LC7D6gTh9EK6QG6o5JPD4Fh4p
         otpt24lWU8b/cgkc/PEvNDR/qeJYaWsE89H724v1nlYgwLtgsou5vzjYAkz531iewAL0
         9B7HDOB0W6LXfxVJZGDzrrPdoTXgaU3XY9M1IB2KIh2rALBk3qpMU9IKjEjcUHbRJs6E
         SXXWSsTUo7n4mrglLHvcFmx2RwY691Vc6dlq4zSsl9+KGTHyedzYNZPBq7WJDCC2qBGp
         +71A==
X-Gm-Message-State: AC+VfDyWWd5ymMsiJEayJ5fNTDCPtKwybK9LXcZ+gn4ZMFIw7jJiFt9s
        epWD80UEUEMQGriFE+wLNLZkbVD7xRgLmrJo1So2DS4lTuUf275DG96p0aNO0fpprqTkT1i14Nw
        mrDHc7MK11RiP1N8ifV6Y+Q==
X-Received: by 2002:a17:906:dacd:b0:94f:1c90:cb70 with SMTP id xi13-20020a170906dacd00b0094f1c90cb70mr5051958ejb.66.1683190595148;
        Thu, 04 May 2023 01:56:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ78s3PswDRhXhGJhnS8o0TeQRNkSQzk1PqX5olfXpJVvDR+HBkG8L768t98LJ39vN72SCfLYw==
X-Received: by 2002:a17:906:dacd:b0:94f:1c90:cb70 with SMTP id xi13-20020a170906dacd00b0094f1c90cb70mr5051951ejb.66.1683190594856;
        Thu, 04 May 2023 01:56:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv11-20020a1709072bcb00b00960005e09a3sm9638928ejc.61.2023.05.04.01.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 01:56:34 -0700 (PDT)
Message-ID: <e630f209-3fc3-7fb4-726a-f65125fa6b3d@redhat.com>
Date:   Thu, 4 May 2023 10:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
References: <20230430195952.862527-1-hdegoede@redhat.com>
 <ZFNnVPXFLNVDwYSc@jeknote.loshitsa1.net>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZFNnVPXFLNVDwYSc@jeknote.loshitsa1.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Yauhen,

On 5/4/23 10:05, Yauhen Kharuzhy wrote:
> On Sun, Apr 30, 2023 at 09:59:47PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v3 of the patch series to add support for the LED controller
>> on Intel Cherry Trail Whiskey Cove PMICs.
>>
>> Changes in v3:
>> - Some comment tweaks and s/LED_OFF/0/ and s/LED_ON/1/
>> - Refuse to load on the Yoga Tab 3 as it turns out the LED1 driver output
>>   is connected to a haptic feedback motor there (and LED2 is unused)
>>
>> Changes in v2 (of my version of this):
>> - Address Pavel's small remarks on patch 1/5,
>>   see patch 1/5's commit message for details
>> - Improve/extend pattern docs in Documentation/leds/leds-cht-wcove.rst
>>
>> This is based on the original patch for this from Yauhen Kharuzhy,
>> with additional work on top by me.
>>
>> This addresses the review remarks on the v2 posting from Yauhen:
>> - Since the PMIC is connected to the battery any changes we make to
>>   the LED settings are permanent, even surviving reboot / poweroff.
>>   Save LED1 register settings on probe() and if auto-/hw-control was
>>   enabled on probe() restore the settings on remove() and shutdown().
>> - Add support for the pattern trigger to select breathing mode
>>
>> This makes the charging LED on devices with these PMICs properly
>> reflect the charging status (this relies on sw control on most
>> devices) and this also allows control of the LED behind the pen
>> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
>> 1 models.
>>
>> Regards,
>>
>> Hans
> 
> Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Works at my Lenovo Yoga Book YB1-X91L.

Thank you!

I assume you have tested with my LED class/core series which avoids
the oops/WARN() you were seeing before:

https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@redhat.com/

If yes, can you reply with your Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
to that series too please ?

Regards,

Hans


p.s.

I think on an earlier version of this series you mentioned that you
are still carrying some patches locally for the yogabook ?

If I remember that correctly can you share those patches with me/us ?

Then if I can find some time I can see if I can submit them upstream
(or find another way to achieve their goal and post that upstream).

Also while on the subject of the yogabook have you looked into
getting sound to work ?


