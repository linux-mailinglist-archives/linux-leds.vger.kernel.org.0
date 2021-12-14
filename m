Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9469473BA2
	for <lists+linux-leds@lfdr.de>; Tue, 14 Dec 2021 04:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhLNDlv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Dec 2021 22:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhLNDlu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Dec 2021 22:41:50 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D264C061574;
        Mon, 13 Dec 2021 19:41:50 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id z6so16711470pfe.7;
        Mon, 13 Dec 2021 19:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wy7ceoEgta6CXIkkv89vXEH3t9l9DvMVjY7ckw43c6o=;
        b=kxPHJv9oqfMPVqIjYMSGMy/x8UM+F30A6FP+T8/hNWFm0kZ+YXTqo0rkdP2sPwI+7v
         dZitd/gHgfSHpOvM9R3NOrhkaPVJKyMKVkLQPz+lczBBUlqWT0XfLj4ejNpxksPu88x/
         L69ORYDT8vbsBGrugEOrvfrlOb4nDVhsOb9UzZ3HKx+UvzDxoAcwEQ5TFA4y90iVbXYc
         i0N/IwBrypquP25M78GsOUjhPv3AdsbP79tgJzaoqzdk3+PJ9eg9G22AzDt8ks4hO7Z0
         kihq2o6+FaHNv0o9LwTMjC+sCoL/A87enrsGsgQu4zyS+BnZ7msgY6yxg43OTMwoOsYh
         DTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wy7ceoEgta6CXIkkv89vXEH3t9l9DvMVjY7ckw43c6o=;
        b=U9ir2RHEqFg5QRf9nc4KbFKezzMIZYnS1mdKSU7Mw7M/XN1OZ49jCX3JyyPhl9qioi
         skO5ofpnJmA+7MHIoMWS+AKiNeZnu0bZcEfIEEozD7O+XLW9fqqTgG986D5IWxhvdNff
         auQb8Ap/4uVPAmh6fySHO5eiQvM10Vvtr6cvgQbTre2bqcU4VUFop+MW1n23b5gvGWxg
         Cg5bBIuXoCfWM5cal0lCdnEF79jxgZBMdtKmy+ZziHvaovu96HEpvv7LNx0jGWFv57h5
         4LfSynTenLAdzEYo95E5kh8byoUu27JEWLJkG+4rKK57DfDwcqxE7a6c7p5pmREytAT7
         DaXg==
X-Gm-Message-State: AOAM5328h0Z3iIvzmcE6hLM33yafo1sunALhbhWUj2ksqcWLCQgtNvbK
        BFoODPFwv/DeEEa5T6KsgQw=
X-Google-Smtp-Source: ABdhPJx9UAI1M9DiulbemFSfeACtrKf5Z3F4T5T1bIVgZ5L/Ekw1rDjLBm1WsV+vW/aQZsfCyWXGEw==
X-Received: by 2002:a65:4381:: with SMTP id m1mr1906885pgp.375.1639453310054;
        Mon, 13 Dec 2021 19:41:50 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id lb4sm560961pjb.18.2021.12.13.19.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 19:41:49 -0800 (PST)
Message-ID: <88d8cdbd-736c-c171-c6ff-2f46f2d8a643@gmail.com>
Date:   Mon, 13 Dec 2021 19:41:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: add Broadcom's BCM63138
 controller
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211124111952.22419-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211124111952.22419-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 11/24/2021 3:19 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
> 
> The newer one was also later also used on BCM4908 SoC.
> 
> Old block is already documented in the leds-bcm6328.yaml. This binding
> documents the new one which uses different registers & programming. It's
> first used in BCM63138 thus the binding name.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
