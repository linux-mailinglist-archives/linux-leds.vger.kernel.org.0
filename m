Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE012F5E44
	for <lists+linux-leds@lfdr.de>; Thu, 14 Jan 2021 11:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbhANKD5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Jan 2021 05:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728199AbhANKD4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jan 2021 05:03:56 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4C4C061757
        for <linux-leds@vger.kernel.org>; Thu, 14 Jan 2021 02:03:16 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id 91so5116543wrj.7
        for <linux-leds@vger.kernel.org>; Thu, 14 Jan 2021 02:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oVf5kDc7i4gGrzg222CFywiTCholDlEVEzBooRbeXN8=;
        b=lNr9TM2KRK50yFUSVqvQRC2+d8NR6/ezTC8nz87RztuEm0sg8oFVZ8y/GwJu5fmbuy
         fYHUI2RWogLsikN9SnHQipAiHDGDc1iscx3mN0jbaxwjTcDQ0ZVtTW8fUsLtiGBQW1Q1
         AKfeQ1ODq0/1MA3AOJBalS1gNW0n1axzkT2WZXyba4RRsLVzZn2saNJpv/dEYHRUicJF
         cy5rlCwzCpe0zLOzmTd1UhR5H8lUdW/NIPwujCtBAv7zdrfaCFXLG4Tew5MNdkvkGGm0
         1fvVpBLtBl0dMLy8xB3oQ4gsFCDJ3uv0n491bAWkFkP/SVR3QtNXDcjHubOMox2quEnn
         hbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oVf5kDc7i4gGrzg222CFywiTCholDlEVEzBooRbeXN8=;
        b=rBbvCIT0m0wno8UbI9mLWWHuxTCpz7qpadupplCKxzbodhvKR7o03wn3vVYZj6sxts
         3gkOaAjf747oCAUh+6V1QnnnWIoNFFmKRXmxPTgMYHLmGMbNEnb+yOfJgSuCiGeQVYaC
         oP+uv93jLrfRIjE4cMWwmzwdKXkiK1eIjUdOJvthQNhGImwumPVblAai7wDRyWhNvqUr
         65EBVDU5fBDY5XXD1Rj9Qt9VBHs6bNXUze6oGl1aOHxnEuyGoLSDXFFj3kkBb+4dziaN
         5uLQo48wuhQnJTpgOfwJ/KQgTmHhc5TLUsE3rlTj1C9a1jU3vSczLdDN1lHgwPUU3OGj
         nJSg==
X-Gm-Message-State: AOAM5338GuGeBABJKYvFol+OM6tRavvEE7lv7Z0kJvXFHqH/PyA51ZGt
        VfHPhsSeknqkDkmv/B+kICd9wQ==
X-Google-Smtp-Source: ABdhPJx/ZTFqNdbwMrPPQXGb4a5AARaWdvmncwYK2q1w7//JoVyn/n68+kesxeF+gvUR8rMoynCXCw==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr6917001wro.231.1610618595259;
        Thu, 14 Jan 2021 02:03:15 -0800 (PST)
Received: from dell ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id b3sm2474771wrn.70.2021.01.14.02.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:03:14 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:03:12 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Rob Herring <robh+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20210114100312.GL3975472@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201228163217.32520-2-post@lespocky.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 28 Dec 2020, Alexander Dahl wrote:

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Acked-by: Jeff LaBundy <jeff@labundy.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Notes:
>     v8 -> v9:
>       * added forgotten Acked-by (Jeff LaBundy)
>       * rebased on v5.11-rc1
>     
>     v7 -> v8:
>       * rebased on recent pavel/for-next (post v5.10-rc1)
>       * added Acked-by (Rob Herring)
>     
>     v6 -> v7:
>       * added warning message to commit message (Krzysztof Kozlowski)
>     
>     v6:
>       * added this patch to series
> 
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Failed to apply:

Applying: dt-bindings: mfd: Fix schema warnings for pwm-leds
Using index info to reconstruct a base tree...
M	Documentation/devicetree/bindings/mfd/iqs62x.yaml
/home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:34: indent with spaces.
            led-1 {
/home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:35: indent with spaces.
                    label = "panel";
warning: 2 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging Documentation/devicetree/bindings/mfd/iqs62x.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd/iqs62x.yaml
Recorded preimage for 'Documentation/devicetree/bindings/mfd/iqs62x.yaml'

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
