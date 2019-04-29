Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D512E92A
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 19:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbfD2Rdk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 13:33:40 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34868 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2Rdk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 13:33:40 -0400
Received: by mail-oi1-f196.google.com with SMTP id w197so8998525oia.2;
        Mon, 29 Apr 2019 10:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iQykDPM2znu+1Ab99OotA6cPeEVOg7x9O3IcXV8hfJ0=;
        b=dZKDYxDphkg69NZQBJEAuc4w/nPvSOkc5bxEJIU5WP7ygY+zxxh12TT9YcxGLiVXWq
         ZVJ5JIO7k64xwvstnrSWiiH7V0bHaW+yQ/uoj3T3aRbo/X2fI0lSdfDg+p2kF7aCyk0j
         jGt7dSqvvwtAb7qX7TCG2CxeA9NHBsLOy06RWr480OjL0rEqpFxi3HoaeDMMYrzIqk4H
         5jpHXef8Oy9wjQ/cJtePf2sRNMMUJGd/aSAxSt+ZZfNAEooJonNCxCNi8dZE/eDeA4O2
         y68A1lVwT9Uq4edOft4fZjIAdw9s7QdDGMHNRnhuo1+iAixGnILw5n9Zl95a6oJHOiBk
         Pr7Q==
X-Gm-Message-State: APjAAAWxIWZdTuwrq1IoDAN+85gj1l/RleWlsNxlS8zlp3MoS//SKMot
        UrTTUH8LxJ4X7mp885o1yQ==
X-Google-Smtp-Source: APXvYqw1DPZtosg4ZCpNjkKRGn28wJ0aHGrjLKL2ksyew44Era2h9Kk+mJ1E/gEKCo6SIXxOlb6wmA==
X-Received: by 2002:aca:6182:: with SMTP id v124mr152175oib.11.1556559219178;
        Mon, 29 Apr 2019 10:33:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f18sm13353178otl.51.2019.04.29.10.33.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:33:38 -0700 (PDT)
Date:   Mon, 29 Apr 2019 12:33:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: mfd: LMU: Add
 ti,brightness-resolution
Message-ID: <20190429173338.GA32250@bogus>
References: <20190405142855.3969-1-dmurphy@ti.com>
 <20190405142855.3969-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405142855.3969-2-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 5 Apr 2019 09:28:51 -0500, Dan Murphy wrote:
> Add ti,brightness-resolution to the TI LMU binding to define
> whether the device uses 8-bit brightness or 11-bit brightness.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - New patch.  Add brightness resolution to ti-lmu.txt.  See patch comments
> for context. - https://lore.kernel.org/patchwork/patch/1054501/
> 
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
