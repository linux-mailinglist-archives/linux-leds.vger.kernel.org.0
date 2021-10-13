Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310C342CDC1
	for <lists+linux-leds@lfdr.de>; Thu, 14 Oct 2021 00:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhJMWY7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 18:24:59 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:36855 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhJMWY6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 18:24:58 -0400
Received: by mail-oi1-f174.google.com with SMTP id u69so5866471oie.3;
        Wed, 13 Oct 2021 15:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IptNI8AZvdjuhYBGG1I13k/v8fLmke+LtonQRtVHqSY=;
        b=7tRV5QhqJW0hCCflgCn+mRlJ9l9FzjEFCOLuAYlXqDTgoTle6qQQUKO77t2t0+UlCT
         72/6pFuUKjgXGG5lrsijK38EFdM3eua+DG1YqQ7JFT+UnJqGw3I7Vu736+OeeE6a5eaD
         vM8eJEDiuCr5UuT/kxt5C/UogWKS/iSw6pzsPbmGVuvtudMa0A3sxwPTzAx41prYY+xL
         hE9rWZDTRLRi3MEn9Eyq3MDRamMQOKrXfe0Lbjhm+FTKGQTcR1T0fUB43B+/QMbMVIe6
         edXsJk7V5pdi1ky41unIQ2uV8VOTx/OnpLg2yoXgcYkhQAh72CYG2wItfR8j+PqzMZvE
         ahRQ==
X-Gm-Message-State: AOAM530mKBUIJg+Or54VQPAluZBQ2hxoQgVYzDnvmkUOefMwemFZooED
        KR+OOk3SYp4iprnJRMZwsw==
X-Google-Smtp-Source: ABdhPJxKPLvlBvD316T1Z6lR/28YGgOUe4siTt8q9BJHQAunCqTt1weyOde3jg1GBrKZHU2/97OUeQ==
X-Received: by 2002:aca:6109:: with SMTP id v9mr10080058oib.59.1634163774553;
        Wed, 13 Oct 2021 15:22:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s20sm269577oiw.44.2021.10.13.15.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 15:22:54 -0700 (PDT)
Received: (nullmailer pid 1691441 invoked by uid 1000);
        Wed, 13 Oct 2021 22:22:53 -0000
Date:   Wed, 13 Oct 2021 17:22:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, linux-clk@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: leds: register-bit-led: Use 'reg'
 instead of 'offset'
Message-ID: <YWdcPbLLGGkbrjI5@robh.at.kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
 <20210913192816.1225025-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913192816.1225025-3-robh@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Sep 2021 14:28:10 -0500, Rob Herring wrote:
> 'reg' is the standard property for defining register banks/addresses. Add
> it to use for the register address and deprecate 'offset'. This also
> allows for using standard node names with unit-addresses. However, since
> it is quite possible to have multiple nodes at the same register
> address, allow for the unit-address to optionally have the bit
> offset. The unit-address format is '@<reg address>[,<bit offset>]'. This
> matches the format recently added for nvmem binding which has the same
> issue.
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/leds/register-bit-led.yaml       | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 

Applied, thanks!
