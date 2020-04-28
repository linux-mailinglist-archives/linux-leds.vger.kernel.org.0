Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C8E1BCD71
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 22:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgD1Uay (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 16:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726284AbgD1Uax (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Apr 2020 16:30:53 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CE3C03C1AB;
        Tue, 28 Apr 2020 13:30:52 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h4so195237wmb.4;
        Tue, 28 Apr 2020 13:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EfCALQsisEWExBul5hRZQyex6oqNrlHX2cTncObwOtQ=;
        b=OlWmcw+pwrmTksUvBEvTcL6bU648KdxiZRkP1YS5OC8dtjPsFgkAqgJVCAnLf3zKDO
         MGvD3+yG1B+ej5Sw2knl22eY0sidMcHAqro1N1/9UMl74Sla1UpqLkYl4K3mXmizNHex
         x1Jg8i/Al5dMNASvu+fQLv9iEQosinR0glhY+WTHHYNtt3VRvJwJYZ1S1miNSLG7bpZe
         P60hEeVBXUnobCR48dQwEGntJCNO/EvpLR+zEn2OINnKAmiMg43ahDr0ltWZwoqjLB3j
         Oj2mc0qUgvWLwtf5FHeh9q022nfVLAa3xFF503QFyEHhGxq39OHzsYuKdBoZMfaGVXtO
         h17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EfCALQsisEWExBul5hRZQyex6oqNrlHX2cTncObwOtQ=;
        b=uGxJvNnPwEkT+oRRzkyP2HrvXrBgmSqv+ZU7Vaf+kOzq7EzqFrpX2OJxcUTb8UgiXA
         5SSONPVV8QUDNCWW3KEcRBRpAhoOxrZjj5GpmwyiGsefQlKebos9STvldFo/RDV+LcNg
         dRPpTQcyc95GgxmqkXL8XNodcazzlpceMWDorsK1srspouFBdgtldmCwcX39XzOv8FM+
         1rqWn8PYNdnB6Rr6+oXnCtwSomGhuJo/Kwzaqu+nGyvG+85z8pAXbQRk1yDKASkN9TUk
         SdGUQU9K0n9mW+cOvoZXTUdRosaMxHT/OZF+8xfNIOjFNv8oJNG19+g7eVzewpfuKR7U
         7DzQ==
X-Gm-Message-State: AGi0PubLlvNAxzRJLHoO3GoDOPtuFTisAWvnqaoAdClC5V9eWky6p0NZ
        hmSS/Is8RCalNcKI1NBUbD0=
X-Google-Smtp-Source: APiQypISI2zzH3TIvD4uM63Re8kNkFo2dbW58vzuUVbRx8SSABu3Z23VJehBNO76vGxmipJqvh4AxQ==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr6449020wmr.34.1588105850883;
        Tue, 28 Apr 2020 13:30:50 -0700 (PDT)
Received: from [192.168.1.23] (afcs235.neoplus.adsl.tpnet.pl. [95.49.70.235])
        by smtp.gmail.com with ESMTPSA id 36sm28040257wrc.35.2020.04.28.13.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 13:30:50 -0700 (PDT)
Subject: Re: [PATCH v21 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-2-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <919e7c4d-0b4e-4335-0a9b-670752fd4845@gmail.com>
Date:   Tue, 28 Apr 2020 22:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428160338.2793-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 4/28/20 6:03 PM, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
> 
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../bindings/leds/leds-class-multicolor.txt   | 98 +++++++++++++++++++
>   drivers/leds/led-core.c                       |  1 +
>   include/dt-bindings/leds/common.h             |  3 +-
>   3 files changed, 101 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> new file mode 100644
> index 000000000000..4b1bd82f2a42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt

Why isn't it yaml?

-- 
Best regards,
Jacek Anaszewski
