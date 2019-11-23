Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD2A107BD4
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2019 01:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfKWACG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Nov 2019 19:02:06 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36595 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfKWACG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Nov 2019 19:02:06 -0500
Received: by mail-ot1-f65.google.com with SMTP id f10so7745827oto.3;
        Fri, 22 Nov 2019 16:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UYRop2h5oq/V7Zd/ECRh55ucEaP6cWcggnLJFjyrjyc=;
        b=gRgEORhrVXKVtvzn3lcUIxsKpap7J8VwQ4mJYbi2gOpRiu3iIL4T4IYkWCSBzObc/E
         axLAsOa5CZaxIO9GaUoAEeF2205ysWhwuBT+8uFoQlRv2KwLF+hpZkthDJ11vw9562zk
         oKCdp1fiMtBmqf/BmEA27z2JXQpGDTXQMFvgYWF2EJwbxElRK7pTwVrxCqS8SLS8QVq0
         DsmpZvh7h1Tu8cFt7P9hYMFKggpV2IC4L8ufhGgNUlfJIU/eeUj2fdK4Nt2/qjKeYY7w
         xK9GLW0tzeY0umDyiJiSb4F9s53obqhmhZ3WhAvJvthjaf4hxIVzMPivT1cU+2m1yPSO
         0RuA==
X-Gm-Message-State: APjAAAXvq75VHnGSfBnRCYAex783aBaeQbAfAoCndeAUrsR8dm0Yalu7
        QxUS2gy/lbytSxoMa7Jung==
X-Google-Smtp-Source: APXvYqz183lykh/6KKbgXxLpzmHDXXs9QM/I350iV1R7oLP6tD7QwiCYU2T6vzcZTRlz89Al56YpMw==
X-Received: by 2002:a9d:4003:: with SMTP id m3mr13219180ote.50.1574467325133;
        Fri, 22 Nov 2019 16:02:05 -0800 (PST)
Received: from localhost ([2607:fb90:bd7:3743:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id 94sm2741749otg.70.2019.11.22.16.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:02:03 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:02:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Message-ID: <20191123000202.GA27127@bogus>
References: <20191121142726.22856-1-TheSven73@gmail.com>
 <20191121142726.22856-3-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121142726.22856-3-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 21 Nov 2019 09:27:26 -0500, Sven Van Asbroeck wrote:
> The driver has been extended to optionally get its operational
> mode, regulator init data and led naming from the devicetree.
> 
> Tree: next-20191118
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  .../devicetree/bindings/mfd/tps6105x.txt      | 47 ++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
