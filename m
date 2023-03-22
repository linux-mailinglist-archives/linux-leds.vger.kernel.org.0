Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97B56C52B4
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjCVRk6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCVRk4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68DDAD3D
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679506808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q1IxHW5Bl/aeX6GiY6onFCTzhilEByIwhwFJS8HzHEk=;
        b=PyE0QWivnbgWB/m/9jwwownsgambNImXkmS0GcaD0XZNyAYhE59QU8AmxeWbx4CT7nqwX5
        cqd2Or+zBivSPBq9PU90dU7xCTLs2/B7iQfkTahcRy3iFNa+OQ89tzQ9oplLSPMWFXs7aJ
        Lm+GvomxyhByBB3U6FVn068IiR26Uqo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-kzJM6ckbNJ6IqeWofYt_OQ-1; Wed, 22 Mar 2023 13:40:07 -0400
X-MC-Unique: kzJM6ckbNJ6IqeWofYt_OQ-1
Received: by mail-ed1-f69.google.com with SMTP id k12-20020a50c8cc000000b004accf30f6d3so28288403edh.14
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1IxHW5Bl/aeX6GiY6onFCTzhilEByIwhwFJS8HzHEk=;
        b=p7tdEfrANPAWXOUPjve515uFGRm/PAqL2bG5dxwO4Zf0DjqhB/sgo+9QZAHW2+5212
         C27KGBpaimyjRk/zTG96Wyban2VO7LItoqGLy+teBbuLbDBPvJrGB859tENNEvYCDCzL
         mNXVkAWJaPwjGd01BbQNQ5n32GDnoRX1iSM2cJY3DdmdDaJdJieTbYyV7tbQg65CvdcP
         GkTTWwGxTw86Icxx/b2dGBHFnCMUTpscfqzydH5HuMNkhPAH58VsI9IA37Dl+I+S6QIT
         eRgVVCKkYnu8PxWzRkxQCE4YUOcWlrSjjM8YIKMX4MUpRUoIgHxxhrmmbUfY0a8/gjVD
         Ft7g==
X-Gm-Message-State: AO0yUKWVqcNDa6mmVKUuoJHkFXXwyx3Getaby5DGJAWy7TJFALUcT9qu
        4CoE4w4FftAaO+0rpEmuzFbVTrKx1YsW1oh/nNhh9QXoDdeslgvi4Q5Rdg/ID6tWeJWzZf+Wh9r
        mUH9w2tM0HE+Dbrl9d6LT/Q==
X-Received: by 2002:a17:906:e95:b0:937:4001:6eda with SMTP id p21-20020a1709060e9500b0093740016edamr7974788ejf.38.1679506806074;
        Wed, 22 Mar 2023 10:40:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set/KRWGcMV00Lnp5HTo5pZKXaIDPobcH3haI4pEKStCH8MczPNvKCsZnFoDchwrVxewemwpFLA==
X-Received: by 2002:a17:906:e95:b0:937:4001:6eda with SMTP id p21-20020a1709060e9500b0093740016edamr7974772ejf.38.1679506805771;
        Wed, 22 Mar 2023 10:40:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ch19-20020a170906c2d300b00933d64cd447sm4850136ejb.121.2023.03.22.10.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:40:04 -0700 (PDT)
Message-ID: <c8c81a00-fb89-8c35-ac3f-951dc999e8e4@redhat.com>
Date:   Wed, 22 Mar 2023 18:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] Add WLED support to TPS68470 LED driver
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Daniel,

On 3/22/23 17:09, Daniel Scally wrote:
> This series relies on the recent "leds: tps68470: LED driver for TPS68470" set
> from Kate Hsuan [1]
> 
> The TPS68470 provides two additional LED outputs on top of the indicator LEDs.
> Add support for those to the driver. The configuration of the chip is drawn from
> platform data which is expected to be passed to the driver. Additionally update
> the int3472-tps68470 driver to register led lookups from platform data so that
> the right LED is driven for each sensor, and finally define those lookups for
> the Microsoft Surface Go line.
> 
> Kate, Hans, this is the changes I made on top of the tps68470-led series to
> enable the IR LED on my Go2 (plus one additional patch to media). #5 could
> probably just be squashed into the other series though.

Ack for squashing 5 into Kate's patch.

> The last two patches
> cover how I think the LED lookup should work - I unfortunately can't see an
> automatic way to guarantee the right LED goes to the right sensor.

I did not get around to replying to your review of my lookup patch. I believe
adding this to the board-data as you have done here is fine.

I had a few small comments on your patches and I believe that Kate's patches
are ready for merging now.

So I believe that for the next version it would be best to merge the 2 series
into 1 big series. Putting all "leds: tps68470: ..." patches first. Then once
they are all reviewed Lee can merge the entire drivers/leds/ part of
the series and send me an IB branch to pull from before I merge
the drivers/platform/x86/intel/int3472/ parts.

Kate, is it ok with you if Daniel includes your patches (keeping you as
author of course) in the next version of this series ?

Regards,

Hans





> [1] https://lore.kernel.org/platform-driver-x86/20230321153718.1355511-1-hpa@redhat.com/T/
> 
> Daniel Scally (8):
>   platform/x86: int3472: Add platform data for LEDs
>   platform/x86: int3472: Init LED registers using platform data
>   platform/x86: int3472: Add TPS68470 LED Board Data
>   platform/x86: int3472: Add tps68470-led as clock consumer
>   leds: tps68470: Refactor tps68470_brightness_get()
>   leds: tps68470: Support the WLED driver
>   platform/x86: int3472: Support LED lookups in board data
>   platform/x86: int3472: Define LED lookup data for MS Surface Go
> 
>  drivers/leds/leds-tps68470.c                  | 170 +++++++++++++++++-
>  drivers/platform/x86/intel/int3472/tps68470.c |  31 +++-
>  drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
>  .../x86/intel/int3472/tps68470_board_data.c   |  31 ++++
>  include/linux/mfd/tps68470.h                  |  12 ++
>  include/linux/platform_data/tps68470.h        |  11 ++
>  6 files changed, 248 insertions(+), 17 deletions(-)
> 

