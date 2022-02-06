Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14AA4AB0F8
	for <lists+linux-leds@lfdr.de>; Sun,  6 Feb 2022 18:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344299AbiBFRga (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Feb 2022 12:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239172AbiBFRg3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Feb 2022 12:36:29 -0500
X-Greylist: delayed 96 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 09:36:28 PST
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85146C06173B
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 09:36:28 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3E8A04003B
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644168987;
        bh=gU40D18zy+yYQC0btlcmtDWK+66i5c8aQLed2HqI8k0=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
         In-Reply-To:Content-Type;
        b=dPdENRwEPg5X8ATFzs6qXQdO8LdS4GVZHG9JiNu0Wuve8GtVvFxoWPIgK42e7n8GN
         1CFP6ZwuYC08l98ddupe94Crl0VAG+Zf/fIZcXR9ccYOZeSJrEfdpSbFwlu54fZMc/
         U7abTuhkzyWxuRnC/a3MU1bTbR0a3RrCF33dDXPuLw8qToYfF/3Eb2z/xW302jqsYx
         hs00La1FWSOsXBb3LyzaDgRBDOjiX35lvzCLuYyGnqfykTkIONUvhRU4sxd2i4ts7j
         R1qE/LEGriWBiJ7tS6lEL1BPm3X1cnb3RliMD9OI4Mo5SS79fqV+7Z7KoREfnaOFEl
         209OimDzMfAzA==
Received: by mail-wm1-f69.google.com with SMTP id z2-20020a05600c220200b0034d2eb95f27so4516009wml.1
        for <linux-leds@vger.kernel.org>; Sun, 06 Feb 2022 09:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=gU40D18zy+yYQC0btlcmtDWK+66i5c8aQLed2HqI8k0=;
        b=kPFVFL338jbEB2zpXNAEZR9WPsA9JrbpfTscRYU2wFSIP526jZXU7jaC+bbIbfWYUq
         5R5MZ0rPlGyQpiIMqKPqq/zkK+SBu+fOGX0uUcKcSospyQhmZguDFM/iHUmR0K+gYSEf
         dEG2KLRIzuvIhNlyuqksgIDYmpjCRfDL7MT+7AhurgkP82xNIcxgzHc+wbTaD2RsQuTm
         1dVC5NU1f9zitwca43NPv6S2w4ANdvzyQhYXqqX5fPHK/dzg5MIW0yfJD2BjGbGAg/mn
         xM4/UADfv78Sohlj7TxPIA1oD0Ganq5aqReYl9CncuMqHyVYVJzhHJT7nF3xMv4xUzkM
         2c+w==
X-Gm-Message-State: AOAM530eVyBPYcdWLfSUnLsZXIuWyrpc8IUieKa9dUSxF+2hkrF+cFhW
        VqEoeWTNSTD7fOrRZ4oECYl1OlcqVND+luFSLojfvigQYPE3h1WDkGuZPw7G5cDTtF0YD6V2X19
        Qshp1PZWb5t82kctYarKUljuUjZ8jmJCwfb4Prrw=
X-Received: by 2002:a5d:500c:: with SMTP id e12mr6925260wrt.193.1644168986943;
        Sun, 06 Feb 2022 09:36:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+OyXalnsQiFHkVAkYfKnSTAkoix3otIqV8BBL6nkmNQ5dNSo9+3+pwnw83UMpdPXnKSWFNA==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr6925247wrt.193.1644168986805;
        Sun, 06 Feb 2022 09:36:26 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n26sm7038162wms.13.2022.02.06.09.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 09:36:26 -0800 (PST)
Message-ID: <63255060-8df8-660d-52bf-198d77c884d5@canonical.com>
Date:   Sun, 6 Feb 2022 18:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] leds/power/regulator/mfd: dt-bindings:
 maxim,max77693: convert to dtschema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>
References: <20220111175017.223966-1-krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111175017.223966-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/01/2022 18:50, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1
> ================
> 1. MFD: Use absolute path to schemas, add additionalProperties=false.
> 2. Regulator: mention all allowed properties,
>    additionalProperties=false, add min/max values for voltages and
>    current, don't use patternProperties when not needed.
> 
> Dependencies
> ============
> The final patch - MFD maxim,max77693 bindings conversion - depends on
> all previous. Therefore this could go via Rob's or Lee's trees.
> 

Dear Lee,

This patchset was reviewed and there are no outstanding issues. Could
you pick up entire set via MFD tree?

Best regards,
Krzysztof
