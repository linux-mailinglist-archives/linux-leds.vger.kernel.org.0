Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF4EE921
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 19:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfD2Rco (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 13:32:44 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41467 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbfD2Rco (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 13:32:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id v23so8813167oif.8;
        Mon, 29 Apr 2019 10:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QDtrWOXaOIs/bib/3O7J4111EMvXZxoXj3SzesY8SpA=;
        b=sv6n00BYulkDfeVZKRCZ0nBYhjjMaBoheR6MY59HrK2gfohhTacrJkg8ipuny3YQtB
         d/MxEpp/V6GYhe/ruXXsk4iZ0HQ3YJfMhqdaJc2AgvpgQ3Qcr4WalUT6uVUmeml+IkMs
         9fSA3UvPmYRplAFbiIDSlxe4KZPenHNqddi746tOl0K1xq+sInyAAd4skBFhkR7xD0np
         pV0qh22vVTllJWsMlT7Ns+O0v4p7qNWlKLuwegL5M5NCvIqewdGZccH7XGI2k8/n4Fqu
         eMu8EtxcQIvURQJeieWHk2AWtaFO6U25+bq4FzOlmQVYxkrlOeWENCs4UYX9h2eJ9Bhz
         JwRw==
X-Gm-Message-State: APjAAAVqWM/NYXOFvCf2Iq7ACUC1FIaTQSmiPu5xVWl/pyH/kRRYhh+c
        C1uzDr/DD6itwVl4zePVVg==
X-Google-Smtp-Source: APXvYqzyPSEssfXutyMhWb2fynO/AklVIW4F7DP8jHNu56/LpY77hOUe/wwznZk4urFuw5CJscMBNw==
X-Received: by 2002:aca:3306:: with SMTP id z6mr145029oiz.25.1556559163639;
        Mon, 29 Apr 2019 10:32:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p132sm14802026oig.37.2019.04.29.10.32.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:32:43 -0700 (PDT)
Date:   Mon, 29 Apr 2019 12:32:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: LMU: Add the ramp up/down
 property
Message-ID: <20190429173242.GA30624@bogus>
References: <20190405142855.3969-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405142855.3969-1-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 5 Apr 2019 09:28:50 -0500, Dan Murphy wrote:
> Document the ramp-up and ramp-down property in the binding.
> Removing the "sec" from the property definition as seconds is
> implied.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Fixed commit message as this was not just a modification but adding documentation
> https://lore.kernel.org/patchwork/patch/1054504/
> 
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
