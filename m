Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D53B4AB104
	for <lists+linux-leds@lfdr.de>; Sun,  6 Feb 2022 18:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbiBFRkM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Feb 2022 12:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbiBFRkL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Feb 2022 12:40:11 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A116AC06173B
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 09:40:10 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CDB1F40039
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644168890;
        bh=z5izoBPa4R9EwBL70QufFWzK1TBtESD+9kJEsHX6Aho=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
         In-Reply-To:Content-Type;
        b=MIcGa5Z4ikByeqdyMIUwhP5763PiJCTkTyKn2rStWLy0o1Xs8B/ifhdO9SPexYdI/
         Ou49EtOlVCTFTQx7ITn1yjm/lExxWEutNyNntcNpTZjzlGgS1tvPSiWA/fIbo+cv8j
         y0RchwfLEuf4IkZaqgTUaL1IBmPMfXRG18fJwI8ZTKPLfxHEB1njGPArbTqSEWVP/D
         MnFMvI7BYKt6DjC10Sy+FeIMYaT6XN2qB2Ic3JuXlH1fgqGYfxXszmiXQP8Qyp9v+4
         8iUOAEM/OljJykik8ti0X2oSWMc0UgLEE9OB9Pm35z2cVJ4Wx4nBh5x3cHPjKHuCnm
         lMFoSSB/ntDiA==
Received: by mail-wm1-f70.google.com with SMTP id h82-20020a1c2155000000b003552c13626cso6463987wmh.3
        for <linux-leds@vger.kernel.org>; Sun, 06 Feb 2022 09:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=z5izoBPa4R9EwBL70QufFWzK1TBtESD+9kJEsHX6Aho=;
        b=IgnCJa4Bz1rNJ7E5bXuh6Y7HyDkHx2JjU9X65qSlx4lkyQGFVqKWhw3wpZ5tA3ZlPS
         iJ4kCzquza9Bqs0OnRV14wE5o/mdTaXBLUzzcZkAMn4C9WSD76ACPWRkXhGqjAB8uGyw
         1tuH9+QoJhbAvZ7uH7832Rjez9VuTJwVY2JEnw6rPaivotTkwol4WBKtkXFiRPsqxl89
         MNw9LXXZ1btCmdAuTWsO6M83rCWWjnrEDQTzvZMtUgICrxfqogYpCgoi/eWcFGC+K0hP
         Li81zRhddAwcyZ3T2lqV29VK/EkmqLGeOHaaGbDdi13KwX0ciAzxRQ9b+rbd8L++aj1X
         icJQ==
X-Gm-Message-State: AOAM53127TBB9769jwuzh7+TUFnklucookSgcNU7wpWw85aCSEyOWQWQ
        TMmW+/ZdZZP0oX5SjmTMtGDmvjUstuYZwKTDbnxSPr/ggU56+VviVBdqn1r65u9U0fGVPl6EmC6
        3Qe/2G7OucDnOH+gFHWHzhm1v2w7ISEgs8SROPuY=
X-Received: by 2002:a05:600c:510e:: with SMTP id o14mr7785306wms.163.1644168890585;
        Sun, 06 Feb 2022 09:34:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1rOAFnc0rXLk6obrEoY0IBwhFxEnLcHOsLdWK71QDzzC6xlUe0hnU8CgHpqzZIXOQQqmMLg==
X-Received: by 2002:a05:600c:510e:: with SMTP id o14mr7785295wms.163.1644168890461;
        Sun, 06 Feb 2022 09:34:50 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id ay29sm6975979wmb.38.2022.02.06.09.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 09:34:49 -0800 (PST)
Message-ID: <f0a9e656-cf18-f212-b701-a1c9d10c4a59@canonical.com>
Date:   Sun, 6 Feb 2022 18:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] regulator/mfd: dt-bindings: maxim,max77802:
 convert to dtschema
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/01/2022 18:54, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1
> ================
> 1. MFD: Use absolute path to schemas.
> 2. Regulator: skip properties.
> 
> Dependencies
> ============
> 1. DTS patch: nothing depends on it, sending here so Rob's automatic
>    checker won't complain about DTS.
>    I will take it via Samsung SoC tree.
> 
> 2. Final MFD patch depends on regulator, so the two last patches could
>    go via Rob's, Mark's or Lee's trees.
> 

Dear Lee,

This patchset was reviewed and there are no outstanding issues. Could
you pick up entire set via MFD tree?

Best regards,
Krzysztof
