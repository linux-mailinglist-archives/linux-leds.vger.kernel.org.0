Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2364C45B64F
	for <lists+linux-leds@lfdr.de>; Wed, 24 Nov 2021 09:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241261AbhKXIO4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Nov 2021 03:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238955AbhKXIO4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Nov 2021 03:14:56 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2F5C061574;
        Wed, 24 Nov 2021 00:11:46 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id r26so5004977lfn.8;
        Wed, 24 Nov 2021 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=0wpb/GmH3krp5sd4d3dj9SMvHwi+ieQieDd5ivPYH/c=;
        b=nCRSGFOTxQUhtUNVAKOi+r1MlRYyq+DxICasN+JM8obb/++PjEn6jp0yPo/IQKTur1
         tOWGnSGZcKAiq2l+LBQOyTAR/P2MyjRBIzNHM5073dKBAfdbr7tAY7KBYkfZ+5PyaMwT
         hwvkpcsBpaukvOB7Gqmudufq1ttjMyFaR9h4ZrmoKCxS0GwHD0H8T95SZcAYT26yD4xO
         6KjnMSi5SObol2zJhtAFAyFNg+lZX0f9WCx3kJrI+j+1PURVNwGRLNeNXbP36gyzVFXo
         DPt/zRmM5N3GJ8ZpWDnP1tUUov18L0YiPIzuy0qO9bA4a4Zml7/RuUmDvkcT0fcMiK4l
         5GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0wpb/GmH3krp5sd4d3dj9SMvHwi+ieQieDd5ivPYH/c=;
        b=xn305BC/WnhXRt36Nc4T6kSCZ5UsoLyMeIRIjK4QHV1pb3xDmeVCVtClraeyknLDmO
         gsSYj9QxvFpq9XLUrvcS3YYktRPBoYav7W9FLdQGUx1RDEJodvXQbPZAkqlZIk1pEO90
         8QbuRlsqTpqhS+hmF8kIh2PVztQ3J5acaktAz1fUXiB+DE4T9kD512WQ6JUsTbt8v+Mi
         KQ2pOC7haI7sns0JBf6GLQkcn/eb+E+5Sf7ItgHwmcV1+bk9CzTdsT6MWVeNYg1HDx57
         IQkAXtc62cOmIadEVEA8ecJlLXgxyW+s/HhisE17c8dMOkYQyRE+SvKNvWbXX2h0JviM
         5/Dg==
X-Gm-Message-State: AOAM5323gqYFbE0pO2K2h+6rjnXjFmnXKHtTnHY+OCb12ctYe7i9d6lD
        SvGCfUuDiRtEd7cZvyn+eFQ=
X-Google-Smtp-Source: ABdhPJzrSiY5FuPH6L2pJlHCcT2wG30CJelePlSrJrZGFmCR9xDsWMmp95oxVrl25MYud45WzhHivw==
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr11918177lfg.63.1637741505024;
        Wed, 24 Nov 2021 00:11:45 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id j22sm1535571lfu.155.2021.11.24.00.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 00:11:44 -0800 (PST)
Message-ID: <7ef000b2-2247-2d38-2973-10e017a3dfb3@gmail.com>
Date:   Wed, 24 Nov 2021 09:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 2/2] leds: bcm63xxx: add support for BCM63xxx controller
To:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211115091107.11737-1-zajec5@gmail.com>
 <20211115091107.11737-2-zajec5@gmail.com>
 <02a2dbb7-6ae0-af28-e852-ee66bb3d66f1@broadcom.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <02a2dbb7-6ae0-af28-e852-ee66bb3d66f1@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 22.11.2021 23:04, Florian Fainelli wrote:
> On 11/15/21 1:11 AM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> It's a new controller used on BCM4908, some BCM68xx and some BCM63xxx
>> SoCs.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Same comment as the binding, please s/bcm63xxx/bcm63xx/ for matchign
> existing drivers/patterns.
> 
> [snip]
> 
>> +
>> +#define BCM63XXX_MAX_LEDS			32> +
>> +#define BCM63XXX_GLB_CTRL			0x00
>> +#define BCM63XXX_MASK				0x04
> 
> This define appears unused.

Just like few other registers. I think it's still worth to define all hw
registers.
