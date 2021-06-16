Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C0B3A8D6E
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 02:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhFPA0W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Jun 2021 20:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbhFPA0W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Jun 2021 20:26:22 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331E4C061574
        for <linux-leds@vger.kernel.org>; Tue, 15 Jun 2021 17:24:17 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f70so798348qke.13
        for <linux-leds@vger.kernel.org>; Tue, 15 Jun 2021 17:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oCM9AZZ4yGdIuE0IFXRCADnpIOQSrGcB2qvMMLB3nDY=;
        b=CSfTNYfqEkCO03cuXkuqmseuhHxpZ7BX9s2VNPsdln4DDTuxbYJlYgfpE0LgXnV/dP
         Tp0fTXKWw6sJgc4dB3XuzAAQS5MV+xxiHX7yjMgUx7hUu6E84r5yeKAnzgF/B6jDk97v
         VdS+sNHpu/pJJw85DbkT2IbluWD52icrtW3fgpIo8kLPH/28z8wWkmlnlIJj7VKr4GTw
         tjLSH03Xsyh82js10qjPObVJDcYR5HsQ540gNhuH7+h41SigPtcc/48oMWI4vp7dtYHc
         Kl/EAT2IJW9WtW4OWEK/8s7Fkjyd0n7ff54GUO+uUZ7hnFo31m/z0LrXSOprpYJSm4My
         P2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oCM9AZZ4yGdIuE0IFXRCADnpIOQSrGcB2qvMMLB3nDY=;
        b=SoYaYDV/6UhqK+zz56QNLnginSh10KWu5Z5XReWYOWjc7bARaCgNLqTjkh+q+OGpWD
         dbD01THupT4OHvUm92g/OF6/7zolmLJIwXJf73WEbwuYuCbEO9ATIDgFOHX8k9pP16KA
         UFillpImfL2vlXdSGA8lXEzR5fNkR7TPcWhT5TnnxRNrTdc3csRMNOO3NqpK9MY2Pv9g
         PXZzOI/ck3mnN98tZX6CQi9VNJlLMRybeRIDqh9gm+MBTsJVa6YUFwqVKl29bTJhLguj
         0+IEOPBVfMacRQgIWiVu6iUWMFX6laZ0GWtIkaxyqBnEVNvXindP444k3zpd3tYLGuXN
         +/Pg==
X-Gm-Message-State: AOAM532TPKB7pTbaj7EojWJI+8evRQLwjdqeSGB9S/eXP/7hK0ME/VUn
        jjonXkBHyexqxbVPWKDl7I8H5w==
X-Google-Smtp-Source: ABdhPJwEZ6CEoG2/NFd8wKqduV4VZSlGykM4ULXZpUzzmQKqHxRYY66RdYpzxIFOa5/PnLg2MatvwQ==
X-Received: by 2002:a37:a115:: with SMTP id k21mr2389973qke.255.1623803056427;
        Tue, 15 Jun 2021 17:24:16 -0700 (PDT)
Received: from [192.168.1.107] (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id t139sm467632qka.85.2021.06.15.17.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 17:24:16 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
References: <20210615221931.18148-1-leo@60228.dev>
 <YqTP_mhFNQj00M90V9BqAinqDdpQt3Wuu7i6OmgckNDSo0l7htySl7jVBDbA4pHJ5DEH_SGAEGCHgBN1ubghTAcc7ct9AOfD8Nd-KLZFeyc=@protonmail.com>
 <CAPRrO0xZunTfYYSOg-Gvk18FMHPufAURZ=fWjQN1bmP=RuuzGA@mail.gmail.com>
 <3f55eOZ-dLlO0h_YujLrKA1nb5Eg7ztJv6xAse-hRh4_KB8FnidmSGpbkq6KbfpWWAKgG2iU1oziplZWlnPJzAd_on96IFXR6SpuTzPlG9A=@protonmail.com>
From:   leo60228 <leo@60228.dev>
Message-ID: <2e3b08fb-8066-9898-789e-4e4abd8b4bf2@60228.dev>
Date:   Tue, 15 Jun 2021 20:24:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <3f55eOZ-dLlO0h_YujLrKA1nb5Eg7ztJv6xAse-hRh4_KB8FnidmSGpbkq6KbfpWWAKgG2iU1oziplZWlnPJzAd_on96IFXR6SpuTzPlG9A=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/15/21 8:21 PM, Barnabás Pőcze wrote:
> please use "reply-all" in the future when replying so that all participants
> receive the email.

Will do.

> I'm not entirely sure what you mean. I'm not aware that LED multicolor class
> devices would be instantiated from 3 ordinary LED devices - although it's possible
> I have missed it.

I misunderstood the docs, I looked a bit more into it and I've figured 
it out. I'm working on moving the driver to use that, thanks for the tip.
