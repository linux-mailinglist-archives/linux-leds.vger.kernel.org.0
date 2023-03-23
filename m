Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9E96C6690
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCWLaT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjCWLaS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AD7AD27
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679570973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=js36nSxk0Nrz0SxEFH/VJVPg2fSxnsapjFyVpVQIiw0=;
        b=Bw12L4sGA1vPyW1BNs8K6yMVi+QXcyEh8EXebSqcZD2g6lNuov/s+C0hyW6MCcaI81CWPU
        QLGInwBi4JxEAMLPHnG/88KpWivE/8mfYbq+N0gsiOZqQkBUE0dojdLi5qWCYT8buR5j+b
        dXiQAU1o+EU/vZ5VKqhzx4kNRIwqtOo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-wNib-wuuMxytskabI_JYSg-1; Thu, 23 Mar 2023 07:29:32 -0400
X-MC-Unique: wNib-wuuMxytskabI_JYSg-1
Received: by mail-ed1-f70.google.com with SMTP id c11-20020a509f8b000000b00501e2facf47so11098377edf.16
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=js36nSxk0Nrz0SxEFH/VJVPg2fSxnsapjFyVpVQIiw0=;
        b=qGall2yIQiIXpXjR0C/h1cf2BF135PrUVdqLrQTM1Dtf29xZKo1aw1G11XGnvNRDF8
         eCFwUVpKgoOgGZ619wj8gasraS3cBdmkZsD++uRLm11ddXc35aTLpy1IZvPFJDUplYml
         bra76NmlUSiGnD1g/zhfQW2gMhRhTKe01kE+JKptYlp986oP7k1Pvv4HgGf3J/Mp1LUU
         2DXmOnsDNcPtnZAoO5rYdebIOaEzwoRriY8ljFLqlC6htfX7IJihpEnGR5SZSZwqccp1
         hB1mxm9l5I+MZs31NWuEjqMaiZEwfG5M1ZYfqipxSpGnMCFPuoaAL+Ni2vIlc6jBuLGY
         ZT1A==
X-Gm-Message-State: AO0yUKWj0qasGggbHE/QKMxbos530wOUzDDhT1u8hwMwgGzpTgCVjagz
        TgKIhmWuGVPIkCHS81V9u2+symBM0kyDku0fjPSKnLiAlZjqk73AXaugAkxAzUrDa/iaEzxWYag
        qgPczUTDcY5GmG9+1XbRTXA==
X-Received: by 2002:a17:907:11c3:b0:91f:6679:5581 with SMTP id va3-20020a17090711c300b0091f66795581mr5532818ejb.21.1679570970934;
        Thu, 23 Mar 2023 04:29:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9K4NOEuDHcNliIa5UfsAqbhtHJF6kiUa5TKydrj50LgW+3yTyxHpPJcTyNj+aSxviVS2DaHg==
X-Received: by 2002:a17:907:11c3:b0:91f:6679:5581 with SMTP id va3-20020a17090711c300b0091f66795581mr5532799ejb.21.1679570970707;
        Thu, 23 Mar 2023 04:29:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a27-20020a170906245b00b008d173604d72sm8682670ejb.174.2023.03.23.04.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:29:30 -0700 (PDT)
Message-ID: <1a90d0b8-d82d-a31d-3977-43caed9c7a57@redhat.com>
Date:   Thu, 23 Mar 2023 12:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US, nl
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com> <ZBw0wiFztPs/LP6r@duo.ucw.cz>
 <c85b376a-e5ff-a2e1-1bea-a9d436b8f42b@redhat.com>
 <ZBw3boAn8j8W8cy7@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZBw3boAn8j8W8cy7@duo.ucw.cz>
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

Hi,

On 3/23/23 12:26, Pavel Machek wrote:
> On Thu 2023-03-23 12:24:05, Hans de Goede wrote:
>> Hi Pavel,
>>
>> On 3/23/23 12:15, Pavel Machek wrote:
>>> Hi!
>>>
>>>> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
>>>> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
>>>> tps68470 provides four levels of power status for LEDB. If the
>>>> properties called "ti,ledb-current" can be found, the current will be
>>>> set according to the property values. These two LEDs can be controlled
>>>> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
>>>
>>> If the LED can have four different currents, should it have 4
>>> brightness levels?
>>
>> No this was already discussed with an earlier version. This is in
>> indicator LED output. The current setting is a one time boot configure
>> thing after which the indicator LED is either on or off.
> 
> Current levels are exponential in that driver. That will result in
> rather nice four level. Surely LED does not care if you set it during
> boot or later?

Well for one there is no guarantee the LED can continuously handle
the maximum configurable LED current and as you rightly point out
elsewhere in the thread we don't want to be blowing up hw.

Regards,

Hans


