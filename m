Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D578F344D87
	for <lists+linux-leds@lfdr.de>; Mon, 22 Mar 2021 18:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhCVRi7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Mar 2021 13:38:59 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:36775 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhCVRiX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Mar 2021 13:38:23 -0400
Received: by mail-il1-f169.google.com with SMTP id t14so5781931ilu.3;
        Mon, 22 Mar 2021 10:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=LgzDGJWoJMOgdng0fXijoHV8KSFecL3FBQ9h1vUK0NI=;
        b=N4G5HndlaBKtLTr0JzZdLDbBvqvhP9NuLgGylOLhpm+AGVchRD6MUXPGeVTKBxklCi
         zylC3ptXR2vV+G6RqmZBg5Vxir35J4c/9K1P7kNi62DtcWH8hb1ZqrGPNtZJIyEYx6/d
         RYmkRCGi6aau9LkHd24kRdi6EoeOOMXi7hhpQk1Bc+b8dsn3ZiHSY/HxnlKKaXP2sEQF
         ru8WKiXzFuEVnvrT4rw0Ij732UV1zph+kl0P+oybYAQmthK6Fxt2U/f63d8a6Gp5DZus
         oQU2HjoGbU/MXLyPTFhOBEgRCRYF9E92f7Oxu5sEmcjt6o2lOJHsg0+huc581AFpK2sm
         EOEA==
X-Gm-Message-State: AOAM531mNtVqFU5vzsdd0dmaFIH06ANIGHeKVm3uSugHins55RDn1DeD
        PGdJIyhO+kdOZrRoYU2bH6XbvAjsWA==
X-Google-Smtp-Source: ABdhPJxJsfYMmDLRVj07ECod4Bv/+uOMDFRG69sXvE06tBcQaetoDa2CL4ahsTS18NH1joGL10Kgnw==
X-Received: by 2002:a92:dd82:: with SMTP id g2mr957624iln.194.1616434701096;
        Mon, 22 Mar 2021 10:38:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e195sm7784494iof.51.2021.03.22.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 10:38:20 -0700 (PDT)
Received: (nullmailer pid 2887755 invoked by uid 1000);
        Mon, 22 Mar 2021 17:38:18 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, kernel@axis.com,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Hermes Zhang <chenhuiz@axis.com>, linux-leds@vger.kernel.org
In-Reply-To: <20210322091819.29119-1-chenhui.zhang@axis.com>
References: <20210322091819.29119-1-chenhui.zhang@axis.com>
Subject: Re: [PATCH v2] dt-binding: leds: Document leds-multi-gpio bindings
Date:   Mon, 22 Mar 2021 11:38:18 -0600
Message-Id: <1616434698.344402.2887754.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 22 Mar 2021 17:18:19 +0800, Hermes Zhang wrote:
> From: Hermes Zhang <chenhuiz@axis.com>
> 
> Document the device tree bindings of the multiple GPIOs LED driver
> Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml.
> 
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> ---
> 
> Notes:
>     Fix typo and missing item
> 
>  .../bindings/leds/leds-multi-gpio.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-multi-gpio.example.dt.yaml: gpios-led: led-states: 'oneOf' conditional failed, one must be fixed:
	[[0, 1, 2, 3]] is too short
	[0, 1, 2, 3] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml

See https://patchwork.ozlabs.org/patch/1456433

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

