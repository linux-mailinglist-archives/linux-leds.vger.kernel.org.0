Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5EA48BF2C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jan 2022 08:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237622AbiALHm4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jan 2022 02:42:56 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48858
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231359AbiALHm4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 12 Jan 2022 02:42:56 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 52F4C402EB
        for <linux-leds@vger.kernel.org>; Wed, 12 Jan 2022 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641973375;
        bh=epu2LRZE4ho4WW6edxeyHFTEV0S/nG4S9x7fJoxh1S0=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=AUbbDMM9n7HXSgC33STLujBHyRbc5bJr7Kgl3e0lXmR9ZL4F5dIqYJ6+IZd7zKnGU
         lAhfAKq15ZoP5usbS4BX0nRCC/F4WZVxx1etYavO+3WDHi5uWjH6bK56gPt+klyJLq
         9GO5vnQF4xKyLw6EQUTvjE0/F5gEUFOzavaieT+J+46j2+7etoCVtCUMiDI2qVMHKS
         nKV8bLfQIHKg0MULhNOqTNw2aTWAxpdoX2+bqCpSek8DN1OM6zsI7Aoc4OnNQF6hhv
         vL6NdJbLgXDXVtBIJIDrJh0Q9g5qXekndWhcwXwsZbvp6qY27oVkzMrLO7LBSjjcIs
         aRUBz32/CrS6A==
Received: by mail-ed1-f69.google.com with SMTP id y18-20020a056402271200b003fa16a5debcso1477091edd.14
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 23:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=epu2LRZE4ho4WW6edxeyHFTEV0S/nG4S9x7fJoxh1S0=;
        b=kE9tZ54EQRGLjXxAdwLbZzt1qh/6tpRsgvCHb+N9TbdrmP2y/hh+AOpR2UtdbWgqnw
         HmVnUALZCxQxIhZFP+7r0u09OuFJK8ag4dF7XSmgKMBWQ7E3K9MtidIBDJXL5auS3yRU
         qbzXjVZdAJJ0QM6vY1qlEcOhBrD0ikvoVNDuAeAJuvUbYUPN3P+S5bNIG6WGIuJit7lm
         ZA9tSTyqgaHFhBi+gKqswMUe+pi6bhEWTniy06InDMNptvL448kHMXmSawXfURmB0RJc
         lgLg0r7fqr0u9goIEPUe20sJ+MrUhy/oinUkgJkEbcd1nedeGM2Uf76C01iTYqATINj8
         Z8LQ==
X-Gm-Message-State: AOAM530RgfAHqmm6BwLrsoWS9cdYuxC3zEK6+VlRpabUr48c21ssbbgO
        JMAneQvQUunIFUukxaOyyTzZ85YcYBgh1T1dWApxCpV1Kd8SbpI9syVJ570+vvsO/h9OHmcULSR
        FI7BOcgaf81xdMz/o/X30+lultPuHkKAYG1K4NC4=
X-Received: by 2002:aa7:df13:: with SMTP id c19mr7689772edy.233.1641973374240;
        Tue, 11 Jan 2022 23:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0NbbWSBowvR9ILzXQnO9GdhgSKLG97/LSzMoBz0Gaauz3kd508ZNjLoLgXl9i652kC+N/dw==
X-Received: by 2002:aa7:df13:: with SMTP id c19mr7689756edy.233.1641973374107;
        Tue, 11 Jan 2022 23:42:54 -0800 (PST)
Received: from [192.168.0.26] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id hq29sm4265184ejc.141.2022.01.11.23.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 23:42:53 -0800 (PST)
Message-ID: <783a67ad-ee7e-c75a-a52c-672cd355bd37@canonical.com>
Date:   Wed, 12 Jan 2022 08:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 3/3] dt-bindings: leds: common: fix unit address in
 max77693 example
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
 <20220111175430.224421-4-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111175430.224421-4-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/01/2022 18:54, Krzysztof Kozlowski wrote:
> The max77693 LED device node should not take an unit address, because it
> is instantiated from a max77693 I2C parent device node.  This also
> splits all examples to separate DTS examples because they are actually
> independent.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

This should be part of my max77693 patchset:
https://lore.kernel.org/lkml/20220111175017.223966-1-krzysztof.kozlowski@canonical.com/

Nothing actually depends on this patch. It just fixes a warning which
will be brought to eyes with mentioned max77693 patchset.

Pavel, feel free to take it separately via leds tree. Other way is to
take it with other max77693 patches (probably via MFD tree).

Best regards,
Krzysztof
