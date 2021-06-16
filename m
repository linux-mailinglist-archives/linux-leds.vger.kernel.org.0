Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F833AA2A8
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 19:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhFPRwe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Jun 2021 13:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48722 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230291AbhFPRwd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Jun 2021 13:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623865827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9vFsoaVhirzwZutCLqdeJ5X6zDH2UXTDC/gHzEnPo6M=;
        b=YODqgIX6hH/o4sghL4ID8Duci8gO3a5bMqG0RA4T/rlgcoQAx7MNe50+Nl0GdUFBDNiF+p
        cNcwER7xtMkE/JURhLX1eaVR/Yz+QiGMTDBT+wDZwaVfvKG2a5jkwuiCt6x2DzqDBDC5hs
        hRKrPK5Ej6YXdjAfFzg4oDKtIOxCWC4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-MgY8V_dZNkaVsmzmP6rPmQ-1; Wed, 16 Jun 2021 13:50:09 -0400
X-MC-Unique: MgY8V_dZNkaVsmzmP6rPmQ-1
Received: by mail-ej1-f72.google.com with SMTP id q7-20020a1709063607b02903f57f85ac45so1246218ejb.15
        for <linux-leds@vger.kernel.org>; Wed, 16 Jun 2021 10:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9vFsoaVhirzwZutCLqdeJ5X6zDH2UXTDC/gHzEnPo6M=;
        b=SEnJfI+PDNohferYi2T9EKbgPMo75xd2izPKAfsI06N8WSUzg6xuFxCQosyzW0F/qp
         IydEZ8ntAjzGi2mJanblUf+Q7O0LdExrQMlj7+jQ+AdzNQ+Jz19mtiwlcvTkQqpzf3d1
         1SXM3SwaqVUQ34v7CVBW/Ta/7Buw7/G8I1oXRqjKAXd9Az1DSi6EZb7hixEV+dW9nSuu
         YyHxLK1Bnoqhq9bq2FnyEaL5XsLiYMbt61ErG3ojkl8P7bLu2bRvKawrSpx1JAP+TI52
         mcfZk0/BwVlrsZ4yHEbadWXZyuLIRcKknDxo5CrKyZptpIAcxTflAG1+xtjPIVxXDOJt
         Tzkw==
X-Gm-Message-State: AOAM530pFT1jzOhrTpeRg8Pq1TDWqXJXgyAEJccHuBmjQKGIBQYuDc6l
        BgdI3CNW/Lu/sMcgPxMNuK2s/xZ21G3FYmpzHplYyMZ9jOXNggCAFvZMPdXd1Nf6IwC/7HXWK2D
        yL+zRWhxi1ADGDp7HbKz9tg==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr1057021edw.217.1623865808752;
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPVQRfLVZ6xrhMEJJgDbjLbUmkGN3zjTjUbkoi+Hf7VGNx/AgCRErmc8Bbn1LonQqtQfB8hg==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr1057007edw.217.1623865808581;
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id au11sm2089496ejc.88.2021.06.16.10.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
Date:   Wed, 16 Jun 2021 19:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 6/16/21 7:20 PM, Enrico Weigelt, metux IT consult wrote:
> On 16.06.21 17:56, leo60228 wrote:
>>> Can you please tell a bit more what these LEDs are actually used for ?
>>> Do they have some names or symbols ? Are they also controlled by
>>> something else (e.g. numlock or shiftlock leds)
>>
>> They're used for the keyboard backlight. This functionality is pretty common on gaming laptops.
> 
> hmm, keyboard backlight ... don't we already have something for that
> in input subsys ? I believe that some lone LEDs aren't the right subsys
> for those stuff.

Actually the standardized userspace API for exporting keyboard backlights
is using the LED class sysfs API, e.g.:

cat /sys/class/leds/tpacpi\:\:kbd_backlight/brightnes

And the same for Dell and other kbd backlights, also the upower
daemon even has code for dealing with kbd-backlights:
https://gitlab.freedesktop.org/upower/upower/-/blob/master/src/up-kbd-backlight.c
exporting them over its dbus API so that non-root users can
control them.

Basically using the LED class for kbd-backlight functionality
basically is the defacto standard under Linux, so exposing this
through the LED class is definitely the right thing to do.

Since these are zones however, we probably wat to avoid the
kbd_backlight suffix of the name, otherwise upower will
pick the first device it enumerates and control that, while
leaving the other zones alone, which is not what we want.

Regards,

Hans

