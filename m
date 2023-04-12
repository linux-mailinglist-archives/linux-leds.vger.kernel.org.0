Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22BB06E007B
	for <lists+linux-leds@lfdr.de>; Wed, 12 Apr 2023 23:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjDLVG4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Apr 2023 17:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjDLVGz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Apr 2023 17:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099337A84
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681333574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yrnKHlrl6y09FHQyO1AnY118pk9R47m1lXpkXewp9c4=;
        b=gaWSUarnFAThEspw5sVGD9uzx+lI7z4ZxQb8T20TGHGMir9N/7+uXgR1mOIinq1cqTXmM6
        hyT6K5jxZNkqecTMzUJcbzW4nD3nGL9NSdF1ijcqspxbd9EwPTisCd47CTzxaLqx1z+Yg3
        xv36vHeetcEwdvk8Gmxp2pNjQDrj2e8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-qBSm0qhxPN6y6HrIWsbU7g-1; Wed, 12 Apr 2023 17:06:12 -0400
X-MC-Unique: qBSm0qhxPN6y6HrIWsbU7g-1
Received: by mail-ed1-f71.google.com with SMTP id x1-20020a50ba81000000b0050234a3ad75so5891113ede.23
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 14:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333572; x=1683925572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrnKHlrl6y09FHQyO1AnY118pk9R47m1lXpkXewp9c4=;
        b=K9+i7r4w2SrEPYl3gl70op3KWXPkYHx7NJJ9ICm4gmltxf6sfow4Nb7PJDi/xdBiiO
         M7l+1kn8vkaNxjggx/XMeXIG8gBa/dzolfkYPojCwlUSL5+2ru2Rd9lP3Fp0L29zmtJc
         8FJee8rbz9V5YNtKDC37wDIpHhto9UfosAi1OYoe6Oqs6NojvbiQqCYUTFAGCW806Cqw
         LS3MvEVdpTgv02tujhZKKQveZfdd+f5nuqU9Kp2Nw+8LG8SSsg5orFE7ATTPv5Drbhz9
         l8418y3tFjZZC69W5L0VfvibZEckwEOmXV4nJtOd5kaP3GKbT+EjaFzaBT9z6kVn4inn
         6REg==
X-Gm-Message-State: AAQBX9eBLFdnBzdLr9P8yYpxrHvgwbX6C5r6C7kr31l3sU5TXI1UcW6P
        QsbaBorD0yk4f+r0Gyugpt6Wd9ZFsRd28yrGQ3Vj9ii/h0S8gJku7zNTJuow4Nj4Vx5yE4p2JIS
        eCKcuzHcFyhRTSavLubN6tA==
X-Received: by 2002:a17:906:1c91:b0:94b:28dc:e748 with SMTP id g17-20020a1709061c9100b0094b28dce748mr215902ejh.64.1681333571718;
        Wed, 12 Apr 2023 14:06:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnOY2/8OmziTqtJx1zTm6KraNb3L4vDlmeHRkXCOwgXGtcmNzqVF/8RbNkcqBZPrxYJ2sdDw==
X-Received: by 2002:a17:906:1c91:b0:94b:28dc:e748 with SMTP id g17-20020a1709061c9100b0094b28dce748mr215890ejh.64.1681333571407;
        Wed, 12 Apr 2023 14:06:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wz10-20020a170906fe4a00b0094a6e7075eesm4098706ejb.41.2023.04.12.14.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 14:06:10 -0700 (PDT)
Message-ID: <3bd58e16-53c7-0a81-45be-26fe1443b65a@redhat.com>
Date:   Wed, 12 Apr 2023 23:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: "leds: trigger: use RCU to protect the led_cdevs list" triggers
 RCU error checks
To:     Johannes Berg <johannes@sipsolutions.net>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <600cc06e-081d-cd90-947d-f8988f1af194@redhat.com>
 <b449dda32e0f3bb0adeeda4fd0e1e7f58a29b43f.camel@sipsolutions.net>
 <73428542-6aaf-5db3-9d67-f73cf1082695@redhat.com>
 <0e0bf2a681db18c20eb9913b23d8ff2d5fddfe90.camel@sipsolutions.net>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0e0bf2a681db18c20eb9913b23d8ff2d5fddfe90.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Johannes,

On 4/12/23 10:13, Johannes Berg wrote:
> Hi,
> 
>> So I just checked and the following LED drivers all have
>> a blink_set() implementation which calls mutex_lock()
>> and/or does I2C transfers:
> 
> <snip>
> 
> Yay ...

<snip>

> So not sure. Clearly it's a long-standing issue, and given that many
> drivers are affected probably better to fix it in the LED core, but I
> don't really know my way around it very well either.

I think I've come up with a solution for this.

I'll Cc you on the patch-set for this when it is ready.

Regards,

Hans

