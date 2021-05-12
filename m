Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E4E37EE6D
	for <lists+linux-leds@lfdr.de>; Thu, 13 May 2021 00:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbhELVnM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 May 2021 17:43:12 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:37654 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385226AbhELUHc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 May 2021 16:07:32 -0400
Received: by mail-ot1-f48.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so520060otp.4;
        Wed, 12 May 2021 13:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=hhnaSOD9rZUaH7zbR+h3t72aZb7UhhEovYqBhpogtio=;
        b=Ssd0khHDrdt2dhdZ3Urq0aXdE8OfnJaohg+0BuqDWAPAngJbovL99aRdp/jXvcjdWx
         CTgh3KaEtNe2jwhC5LBQfkPDHIgUlK34/J+0+3laeo5uS48GU8Mfs7pf4RbWvlBpvFD2
         9mDpGKWJgfSQMaTfkk85p8PxWewwyleFUahNBa3dpIiM5Y9LV8mx9YlzGnDzmHpPvu7f
         U4jBFJ5g7jyq52pA5hkHeKxjtAAp9LWCSpKFDT4qcF0h+6wNsZCznTNDSGiP7umoUpCH
         tFXXSHdSUXDgMyYgJ44e9iRyb4rujXYUcG5MRRdlx9PtcF5XKIs0ycG6ii2/TRAaH3Ls
         rVMw==
X-Gm-Message-State: AOAM5337DdkSkmA8RGkwOEHXXEQe9qwrcz+DU7MCx+qfxehtB7qKcb+k
        KCX8rIOnfZdr7HtXwY0l80hPod7FRA==
X-Google-Smtp-Source: ABdhPJzyWvUr3Ry/8XTYUAydrxrHT/tsdf/bcwoWjSHkvNEpPyamIYQZ0sf4FRVUdyw+345Ug+z0Aw==
X-Received: by 2002:a05:6830:208c:: with SMTP id y12mr30405131otq.129.1620849983154;
        Wed, 12 May 2021 13:06:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h6sm223813oom.21.2021.05.12.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:22 -0700 (PDT)
Received: (nullmailer pid 204080 invoked by uid 1000);
        Wed, 12 May 2021 18:35:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     Doug Zobel <dougdev334@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20210511204834.2675271-3-dougdev334@gmail.com>
References: <20210511204834.2675271-1-dougdev334@gmail.com> <20210511204834.2675271-3-dougdev334@gmail.com>
Subject: Re: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
Date:   Wed, 12 May 2021 13:35:16 -0500
Message-Id: <1620844516.492214.204079.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 11 May 2021 15:48:34 -0500, Doug Zobel wrote:
> Add a new device tree object for LP5562 predfined led patterns.
> 
> Signed-off-by: Doug Zobel <dougdev334@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.yaml | 103 +++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/leds/leds-lp55xx.example.dts:159.28-172.20: Warning (unit_address_vs_reg): /example-0/i2c/led-controller@30/pattern@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/leds/leds-lp55xx.example.dts:174.28-209.20: Warning (unit_address_vs_reg): /example-0/i2c/led-controller@30/pattern@2: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/leds/leds-lp55xx.example.dts:147.24-151.20: Warning (unique_unit_address): /example-0/i2c/led-controller@30/led@1: duplicate unit-address (also used in node /example-0/i2c/led-controller@30/pattern@1)
Documentation/devicetree/bindings/leds/leds-lp55xx.example.dts:153.24-157.20: Warning (unique_unit_address): /example-0/i2c/led-controller@30/led@2: duplicate unit-address (also used in node /example-0/i2c/led-controller@30/pattern@2)

See https://patchwork.ozlabs.org/patch/1477300

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

