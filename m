Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5A04213FE
	for <lists+linux-leds@lfdr.de>; Mon,  4 Oct 2021 18:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236896AbhJDQZz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Oct 2021 12:25:55 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:37607 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236674AbhJDQZy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Oct 2021 12:25:54 -0400
Received: by mail-oi1-f179.google.com with SMTP id w206so22278456oiw.4;
        Mon, 04 Oct 2021 09:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3YL9t/LcFUdv6zIOKUIqTBFhHWXv86fgYlmOjVAyNXI=;
        b=C9v5LlOUGZWYJxJW8v5tcT1aVT8rQFHh0NPuhMixm9HR6B9+V+x/ARKKIWQ32cQhYu
         fyNwxA9Ctgm4m5EfDD6GJMsOVPE0IS4eKKjxCvVlykkt5aIkfpDEHLaVMfcnBz/eOWDv
         By5AZZD6PlRruF/IQOD8IZkv59R18o9avRsbqFR8Z+HbO86vhjAXU6Zf9lvYNJSqp3wc
         OIcWzu/H2/lFjZOyMSShtTmXNv8W/Zz3NC1htTieIypcHnL8RawhSZWY7XDRF6G+liQi
         d9Guh80gYZgqyrBM/GZZAHnAKzPc3ptCup2wHdWV23F3fMU+twYLQ8Y1FAoBLYoDeJDN
         hjOQ==
X-Gm-Message-State: AOAM532MMF9wG2tiC8CmqFgufByxZ6nKQooZzcIltj4k3YRb7txCDsPd
        /3DRoLG1Q5PFHwYlyBSYzg==
X-Google-Smtp-Source: ABdhPJzYH4QZGQHRqPJ/av1OXS8AHDxnW5j2mrkBdDuuBvT+5e7uRYrz/G37hN2fVdGuO1IX015rCA==
X-Received: by 2002:a05:6808:8c5:: with SMTP id k5mr13925791oij.93.1633364640465;
        Mon, 04 Oct 2021 09:24:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o26sm2920432oof.32.2021.10.04.09.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 09:23:59 -0700 (PDT)
Received: (nullmailer pid 1413747 invoked by uid 1000);
        Mon, 04 Oct 2021 16:23:58 -0000
Date:   Mon, 4 Oct 2021 11:23:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/8] Arm boards syscon 'unit_address_format' clean-ups
Message-ID: <YVsqnr185GTtN3uH@robh.at.kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 13, 2021 at 02:28:08PM -0500, Rob Herring wrote:
> This series addresses the last of the dtc 'unit_address_format'
> warnings in the tree.
> 
> The remaining issue was dealing with the node names on 2 bindings for
> Arm Ltd boards syscon child nodes: register-bit-led and Versatile ICST.
> Both of these used an offset property for register address rather than
> 'reg' which is the preference nowadays. With a 'reg' property, then we
> can have a proper node name and unit-address. This series adds support
> for using 'reg' instead and updates the node names and unit-addresses.
> 
> The dts file changes have inter-dependencies, but the clock and led
> changes can go via each subsystem.
> 
> Rob
> 
> 
> Rob Herring (8):
>   dt-bindings: leds: Convert register-bit-led binding to DT schema
>   dt-bindings: leds: register-bit-led: Use 'reg' instead of 'offset'
>   leds: syscon: Support 'reg' in addition to 'offset' for register
>     address

Pavel, Can you apply or comment on patches 1-3?

Rob


>   dt-bindings: clock: arm,syscon-icst: Use 'reg' instead of 'vco-offset'
>     for VCO register address
>   clk: versatile: clk-icst: Support 'reg' in addition to 'vco-offset'
>     for register address
>   ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
>   ARM: dts: arm: Update ICST clock nodes 'reg' and node names
>   kbuild: Enable dtc 'unit_address_format' warning by default
