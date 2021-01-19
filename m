Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE682FAEB3
	for <lists+linux-leds@lfdr.de>; Tue, 19 Jan 2021 03:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbhASCTv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Jan 2021 21:19:51 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43994 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbhASCTs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jan 2021 21:19:48 -0500
Received: by mail-ot1-f41.google.com with SMTP id v1so289547ott.10;
        Mon, 18 Jan 2021 18:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NviAxCG66kR6tYWTdCuPd+dNP54yI4/tOkv+tahqOUA=;
        b=nZVfMhRmns3bnZdTVCLe7d8gJP1vhKuVNKIgVqSdnyzu6SWDO0H+tcJ1zoAhf3mR+y
         lccIR+IOAA0JC8hnWUtrXbUCYimTsgUmSPXwfXEtirI4pUd/Mm4Z/AfPK4WnzaUY3qya
         DTOZg1r8UCHzi+lM1fyEL9gYpMcvNYPe3sXygxu0toX3sE6WzFnSPI3+0uGO1VAJdRj7
         nm3LXEYXzafGx6BfRQcAJv3n4fSiucdIuTZvy02M4oyVvSc7Vgj0r6L1QKzhnV4y/DCj
         dJTjZI22Vgvzc6YLGvmQuOWUSS0b+rqBwC1KTATWCWE4eAWeaICjg+AmDSYBOKe7D3Ku
         2IZw==
X-Gm-Message-State: AOAM533VQuVlhkbWiPwUH2fXK4f9qVCtGofgnVlCiHEe8sLCrN1FEgLR
        m0Cd2be+9McX6v9XRb/Cug==
X-Google-Smtp-Source: ABdhPJzDm2rmL6h7O0jHEuErkbcy+xrPlvp2HhvCJUiGszCs8xqlmaPNesxTDKjxdtHo3XEXliA7zw==
X-Received: by 2002:a05:6830:1dc8:: with SMTP id a8mr1903693otj.26.1611022747382;
        Mon, 18 Jan 2021 18:19:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 33sm544177ota.69.2021.01.18.18.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 18:19:06 -0800 (PST)
Received: (nullmailer pid 760112 invoked by uid 1000);
        Tue, 19 Jan 2021 02:19:05 -0000
Date:   Mon, 18 Jan 2021 20:19:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: add setting of default intensity from DT
Message-ID: <20210119021905.GA759930@robh.at.kernel.org>
References: <20210118140947.3887-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118140947.3887-1-schuchmann@schleissheimer.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 18 Jan 2021 14:09:47 +0000, Sven Schuchmann wrote:
> In order to use a multicolor-led together with a trigger
> the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
> 
> This patch adds the ability to set the default intensity
> of each led so that it is turned on from DT.
> 
> Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> ---
>  Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 6 +++++-
>  drivers/leds/leds-lp50xx.c                              | 4 ++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: patternProperties:^multi-led@[0-9a-f]$:patternProperties:(^led-[0-9a-f]$|led):properties:default-intensity: 'The intensity the LED get initialised with.' is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: ignoring, error in schema: patternProperties: ^multi-led@[0-9a-f]$: patternProperties: (^led-[0-9a-f]$|led): properties: default-intensity
warning: no schema found in file: ./Documentation/devicetree/bindings/leds/leds-lp50xx.yaml

See https://patchwork.ozlabs.org/patch/1428176

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
