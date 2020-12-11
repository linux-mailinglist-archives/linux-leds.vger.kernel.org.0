Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AFF2D6ED5
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 04:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732479AbgLKDqQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 22:46:16 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:44719 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390347AbgLKDqC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 22:46:02 -0500
Received: by mail-oo1-f67.google.com with SMTP id n20so1823087ooq.11;
        Thu, 10 Dec 2020 19:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UiGfYqcd3SIOWPESdDXiPXkRmItmUwrRrvjwRsZsNew=;
        b=nNa5aCV+uMjqkgJsdp1+qlcauGi98VRi1FAKRHxQqXRypivxeqI+tUjEy83RqItlMN
         9lISbWAsLLBTpnJJj5/f14xGee7VI6jrsdM3z6ZvCL1qSJg6bhnyg0wAds+MGjpyESt0
         zQ7PWCXbjMIiFdzD70/HFkj3OKH6OhQOzpt5l6WH+Zr1dRZvCgZdRcm0e6eKGQ5A/94I
         zwfa3LMCMpQHHQNFG9ZXnsdHGgm/STyyjej/FFwtb5hbnQl1AlvL3qKcbahrr62buOro
         dwRqdPl0QPT/I89fvJmq//ftTskN60Lbq73lFaEJPd4tdMxhTGCPixrBKyF/BV5ye25c
         ZfMQ==
X-Gm-Message-State: AOAM530fdmwH/5nZy1FKEm1ZCz3EQGC7856NXP/ANO6m5xtUTpqmpLiV
        vKlZhLRrJ9qogwiY3iBvtQ==
X-Google-Smtp-Source: ABdhPJyHT5ivvuA3SblzSQql+tmjj3ba0cwmrrDluItDwViRUrTLaIxum8iXelZMmOXx+9wdG0085g==
X-Received: by 2002:a4a:3e42:: with SMTP id t63mr8464406oot.32.1607658320972;
        Thu, 10 Dec 2020 19:45:20 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 8sm1597094oii.45.2020.12.10.19.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:45:20 -0800 (PST)
Received: (nullmailer pid 3600883 invoked by uid 1000);
        Fri, 11 Dec 2020 03:45:19 -0000
Date:   Thu, 10 Dec 2020 21:45:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     cheol.yong.kim@intel.com, dmurphy@ti.com,
        malliamireddy009@gmail.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, qi-ming.wu@intel.com,
        yixin.zhu@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add bindings for Intel LGM SoC
Message-ID: <20201211034519.GA3600828@robh.at.kernel.org>
References: <49ebc8e27958cb77cde36e5f95ad530803259907.1607591119.git.mallikarjunax.reddy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49ebc8e27958cb77cde36e5f95ad530803259907.1607591119.git.mallikarjunax.reddy@linux.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 10 Dec 2020 17:12:11 +0800, Amireddy Mallikarjuna reddy wrote:
> Add DT bindings YAML schema for SSO controller driver
> of Lightning Mountain (LGM) SoC.
> 
> Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> ---
> v1:
> - Initial version.
> 
> v2:
> - Fix bot errors (wrong indentation).
> - Spell out LGM and SSO.
> - Remove vendor specific name for LED properites.
> - removed deprecating property "label"
> - Include 'reg', 'function' & 'color' properties.
> 
> v3:
> - Included full names(maintainers).
> - changed compatible SoC specific.
> - Remove redundant properties.
> - Updated vendor prefix and unit suffix to properties.
> ---
>  .../devicetree/bindings/leds/leds-lgm.yaml    | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
