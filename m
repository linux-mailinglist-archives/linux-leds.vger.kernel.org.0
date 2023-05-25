Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1A5710990
	for <lists+linux-leds@lfdr.de>; Thu, 25 May 2023 12:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240804AbjEYKMP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 May 2023 06:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240785AbjEYKMD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 May 2023 06:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E044812E
        for <linux-leds@vger.kernel.org>; Thu, 25 May 2023 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685009477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jp/SVeiGCmaKs6UW+b11J6WubNV/huB/Y1oH54gpyiY=;
        b=He0PII3e3R1kf4i3E7cjy67C3ymwh+E0LisGMpRiY5mIP+39mGzG3tr1ghPpcMAjFJglec
        e9s28oveLLGJKDUmcNODmrvoI1tqfPaHSXvOi25EyB+zi3Pajd8+YaER/mq51VWTV0cZYk
        +BZPnXZgPDTpmJ7YecSLI8CvVlS0YGQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-eMtL4plYMKSJtIU-Cj5_NA-1; Thu, 25 May 2023 06:11:08 -0400
X-MC-Unique: eMtL4plYMKSJtIU-Cj5_NA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso53085766b.2
        for <linux-leds@vger.kernel.org>; Thu, 25 May 2023 03:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685009467; x=1687601467;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp/SVeiGCmaKs6UW+b11J6WubNV/huB/Y1oH54gpyiY=;
        b=Kn16AFEUrMYeHEAt6zIAzZVGm/iWsILMZvzEbsaf3RjoiOlX7jbg/BREqTsWFqGs6k
         c2pevYXTBz2GfUO3fy/Vpv4SBiF1+rcWBcJQhMV7alkiwPEoKkMMujOybh0RTPXSwbce
         yYTSUYPurW3TjBjFXUzffVB+xdCovm5o/mD+wCKMhD6doLAI7nZCmyhEdYTSI+hgBaJO
         HTkMt8x2F7/79kdBXY/OLx8gyEAaOfRfeQiH+HECHInvGQhZQWP3gSI9WlCc1KY9u4F7
         kWnXLV0C8K5gPNWawfFj0DxihSsaG7WKKRbxmgX4QlHGgJiOqMz/wy0sY5esZbquGsFA
         DhkA==
X-Gm-Message-State: AC+VfDzfDYkQ++o/F2x6N1TcQisGWVqNsT1G7Q2zcggi6ISy1TVGXRO9
        QccXcoPs8mE+U9+usK4WObNlinejTeKoiC2UKrRAo40oS6MizYoZfRCE1oopiq6qr+/fiYRsyAv
        D3J1IgrxTtMDOmhKxDcCT1g==
X-Received: by 2002:a17:907:6d97:b0:973:bb6f:83ef with SMTP id sb23-20020a1709076d9700b00973bb6f83efmr940100ejc.77.1685009467307;
        Thu, 25 May 2023 03:11:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ658RP8jZmcIMUzcThnJ/vJ+cV2iR7KINpxkNGBprL89ouE7x4cDA88Ks6OjOD5LZw3hH4SqQ==
X-Received: by 2002:a17:907:6d97:b0:973:bb6f:83ef with SMTP id sb23-20020a1709076d9700b00973bb6f83efmr940076ejc.77.1685009466994;
        Thu, 25 May 2023 03:11:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z26-20020a170906715a00b00959b3c30f2csm627263ejj.222.2023.05.25.03.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 03:11:06 -0700 (PDT)
Message-ID: <ef9d5bf4-8269-fa29-0d9d-b9774497a138@redhat.com>
Date:   Thu, 25 May 2023 12:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 0/4] leds: simatic-ipc-leds-gpio: split up
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230524124628.32295-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524124628.32295-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/24/23 14:46, Henning Schild wrote:
> changes since v3:
>  - add terminator entries to all gpio lookup tables as new p1

Thank you. The entire series looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

for the entire series.

Regards,

Hans





> 
> changes since v2:
>  - some more style changes from review
> 
> changes since v1:
>  - move from header- to -core.c-based implementation
>  - style changes from review
> 
> This series mainly splits the one GPIO driver into two. The split allows
> to clearly model runtime and compile time dependencies on the GPIO chip
> drivers.
> 
> p2 is kind of not too related to that split but also prepares for more
> GPIO based drivers to come.
> 
> p3 takes the driver we had and puts some of its content into a -core,
> to be used by the two drivers.
> 
> p4 deals with more fine-grained configuration posibilities and compile
> time dependencies.
> 
> Henning Schild (4):
>   leds: simatic-ipc-leds-gpio: add terminating entries to gpio tables
>   leds: simatic-ipc-leds-gpio: move two extra gpio pins into another
>     table
>   leds: simatic-ipc-leds-gpio: split up into multiple drivers
>   leds: simatic-ipc-leds-gpio: introduce more Kconfig switches
> 
>  drivers/leds/simple/Kconfig                   |  31 +++-
>  drivers/leds/simple/Makefile                  |   5 +-
>  .../simple/simatic-ipc-leds-gpio-apollolake.c |  66 +++++++++
>  .../leds/simple/simatic-ipc-leds-gpio-core.c  | 104 +++++++++++++
>  .../simple/simatic-ipc-leds-gpio-f7188x.c     |  66 +++++++++
>  drivers/leds/simple/simatic-ipc-leds-gpio.c   | 139 ------------------
>  drivers/leds/simple/simatic-ipc-leds-gpio.h   |  22 +++
>  drivers/leds/simple/simatic-ipc-leds.c        |   1 -
>  drivers/platform/x86/simatic-ipc.c            |   7 +-
>  9 files changed, 293 insertions(+), 148 deletions(-)
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio-core.c
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
>  delete mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.c
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.h
> 

