Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A1A45970D
	for <lists+linux-leds@lfdr.de>; Mon, 22 Nov 2021 23:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbhKVWD3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Nov 2021 17:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhKVWD2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Nov 2021 17:03:28 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98642C061574;
        Mon, 22 Nov 2021 14:00:21 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d11so6858375ljg.8;
        Mon, 22 Nov 2021 14:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=Ch6i7ZTbtYuB1NsvUbp8i0GzVOlf28nOvYrYtHgEz0c=;
        b=bmNftXfE9u08yZgbzOjzc1qwh7CNRWoxzLJ/yLbuwR9/SToq9y58BKEwHK64NDugyQ
         7BVWQQ6UFF08QYHT80ca9HVQYG+hxx4pOKza3tJPmIFQkGtymWO3OhQIEazivZn+c6m0
         ISB16/VsOYryaeLN6e9TP+0SGuj0NglESI4Rjb0tj43pyUyPjOejB81sFR7cHmy6fZUb
         I/sQpTTh28VyIMfOzSkJI50D5IbXQEiCL2j9TK8bzz8ckBfqoOJJ16bMxEIUpPlQCugp
         U3WkH1UjkfTF9aM9E02xaYW8W9XybIyQsObAFlxE4FjN6jSO7D6BQcgjeCxhpm3+Awl5
         b2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ch6i7ZTbtYuB1NsvUbp8i0GzVOlf28nOvYrYtHgEz0c=;
        b=7JUVljslUkbElVe6PECD2+AgPlY4Z7Rc8aCangVS2WPdwNrQzFLt4YWdK7FflLp+kt
         WyNrdFs166WY+GcR941pNvfz8a1ow9w0kWMNXTeeGv8JYYOx2e5Y5QKkaPeAa2/wXczr
         f/5YWAI+LAJJ4zkt2qXo7SNWGfdVV6foFdTG9h5u8IxrrGkc/exA8BpsFNArrI2Af27B
         QCTuOZE3NLVXbSR1ffW+KA+FsI9DjezkAes4Y810wLhw0fSfPhdZVzmaxPtJH4IcrcVw
         IYuQmvxouwlrocXH/O2otOBJShEVfuoSfKWcayzFtH/uP3HtdrdXH6sEK2vw2Gfi9Y9E
         SoiQ==
X-Gm-Message-State: AOAM531XGYokXPWifhBXUo55O7KDOgMhhmOVk2AAf7nr8gXuhtB1ljI6
        VhyDmnZCvLlFc1WzZk33CYzyRLtI4M4=
X-Google-Smtp-Source: ABdhPJx5dZyjRnBhj5hZQ7O5Ow87ANTakgy2Wn2eI8VimYdVwF387cIOYKGWu6N2lCBCiMjfz2ZMmg==
X-Received: by 2002:a05:651c:28e:: with SMTP id b14mr434081ljo.440.1637618419871;
        Mon, 22 Nov 2021 14:00:19 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id z4sm1080088ljj.26.2021.11.22.14.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 14:00:19 -0800 (PST)
Message-ID: <5113880f-d37d-0835-c140-c3749048c519@gmail.com>
Date:   Mon, 22 Nov 2021 23:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Broadcom's BCM63xxx controller
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211115091107.11737-1-zajec5@gmail.com>
 <495a94ce-984e-f5c5-f5a2-74dc1b61e345@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <495a94ce-984e-f5c5-f5a2-74dc1b61e345@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 22.11.2021 22:51, Florian Fainelli wrote:
> On 11/15/21 1:11 AM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
>> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
>> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
> 
> Just so the existing pattern/regexps continue to work, I would be naming
> this "bcm63xx" to be consistent with the rest of existing code-base.

The problem I saw with "bcm63xx" is that it seems to match all SoCs:
those with old block and those with new block. So I guess both groups
have the same right to use that "bcm63xx" based binding.

To avoid favouring old or new block I decided to avoid "bcm63xx".

Given above explanation: do you still prefer using "bcm63xx" based
binding for the new block? I'm OK with that, I just want to make sure
you're aware of that minor issue. Please let me know :)
