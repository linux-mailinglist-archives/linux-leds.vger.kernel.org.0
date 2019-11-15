Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E96CFE0B0
	for <lists+linux-leds@lfdr.de>; Fri, 15 Nov 2019 15:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfKOO5h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Nov 2019 09:57:37 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39093 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfKOO5h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Nov 2019 09:57:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id l7so11302151wrp.6
        for <linux-leds@vger.kernel.org>; Fri, 15 Nov 2019 06:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LhVSGfEhFzAltpE8aRiy3vpD2H1oU8Mhp/p8hqjjUJk=;
        b=eFp7WM7WqUS0dAkxY6zmVayqvN0U6ecqQ2z9n4gKEkYjfdgWqfOUJ6SRplWsNH267a
         GeHWvBzZMtMYR52ly7SOrP4Mfw16hJYy4r1l6lMJwNdXO2jJ95OFpcZRKt1MU5GXXycX
         08wu9HCqA0m9nv2zsmbePJCDfeQwBhrp6wPFYkN9j9BeIxZmWyWEcgmOj8Vwz1LB03dH
         3SbG7jA3F3X7uzg54TzU6pLSRmYdE6ts1OOsD4MoEEqbEI8kt+gNma+lKr0ux6RKbtX8
         gC8cvNt6g7mSf1kvegxJlC2Judje44+s4PXXRWwYNr8c9cxAg1YNBwJth92O7is8ZrPP
         YIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LhVSGfEhFzAltpE8aRiy3vpD2H1oU8Mhp/p8hqjjUJk=;
        b=V7rbHyKurOtK9UG538ypXXwYPCcz+8C1qw2p5xR3ecfEWZgR6BlR0lqftvRiyg/61c
         B/L4X1n6SOp/b/wcjb5fjBIIFqOFfGwD9pKXLVoJk/iVQmVWNg3zr9wEsCr+/yrana5p
         5D13Q/pLpeGlz01wXpOkOywmSgZK7pQeFzMlCAsKySMPOl0PjpKK3iFhbYCGDxnX+LBJ
         ZmWUENQDSPQMXYazD8GyiYizfN+ALAVSxYHCGkMZZXTk4KXfFlp4xDoxiBBHtWYdVonZ
         flhOlQf/UlgW/u4zJlNWn7UL2VATpPKJScBqQ5DZWVuZqUsoMsYA4e3Z34UAaUPvBulX
         qb8A==
X-Gm-Message-State: APjAAAV1+cNTexbGhvhak8tR59BpmHZEWhn5+5Y44XmEbDAYXhOZdeSw
        XIg9wapeJf6EW/fCmV0IyEPN1O+IX5lddg==
X-Google-Smtp-Source: APXvYqwqOQ7MLMABPEV4GiRIClcn1AxUx+OW8p5Iv5Mb6AIt0bAoEipWbmZXhyVfMmLkxa6wYMd/bA==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr16585766wrc.150.1573829855230;
        Fri, 15 Nov 2019 06:57:35 -0800 (PST)
Received: from [10.32.51.158] ([185.149.63.251])
        by smtp.gmail.com with ESMTPSA id q15sm11782035wrs.91.2019.11.15.06.57.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Nov 2019 06:57:34 -0800 (PST)
Subject: Re: [PATCH v17 00/19] Multicolor Framework
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191114133023.32185-1-dmurphy@ti.com>
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
Message-ID: <55c6a873-9ed7-0c00-b85b-7a0f7ae7046e@flowbird.group>
Date:   Fri, 15 Nov 2019 15:57:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14/11/2019 14:30, Dan Murphy wrote:
> Hello
>
> Simple fix in the multicolor code where the extended registration call was not
> called in the devm_* function
>
> Thanks Martin F. for finding this issue.
>
> Hopefully this will be pulled in for the 5.5 merge window.

For patches 2, 3, 4

     Tested-by: Martin Fuzzey <martin.fuzzey@flowbird.group>

I have applied patch 1 to my tree too but, being just documentation, 
it's not testable.

I don't have a lp50xx but have written my own multicolor driver on top 
of this patchset (for a custom LED controller implemented in a MCU).


Martin


