Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806C5227500
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jul 2020 03:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgGUBwh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jul 2020 21:52:37 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43133 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgGUBwg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2020 21:52:36 -0400
Received: by mail-io1-f68.google.com with SMTP id k23so19697896iom.10;
        Mon, 20 Jul 2020 18:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gZohupLyo656XqP4QIw1ulNxoOarM5/e7M44rf2cWq4=;
        b=Hd+hzu3L3vssTidzDgsQpM0r7B+z54Rcm55gi8XR77zvwlw4TkaFQkYjlXZz8iUawg
         dC3IzgvJVAuzEdGZH6R5WAEhyNNJo0LxmbCB9prINjwPdTrx8QrH+RPC3YsqsI79O6J0
         uYH5ZC+22U3+/eOYpDEvQyOKL6WvOx5mFSEmsrZ+KKvYl9ROf9rbhJ86r4L+k11DBELG
         /By+l6/E1fTXYG09017TS/ijYjJxeBqOzhmOSP08rJN4TDSSQV1owD+8qSK/1NvIlDa1
         px5f0HKDLQFGZyQyhh7WLyfzQMSqZan0mOlDEbKoI/JXZP1B/u/SdncBPscZUeig7ejs
         rF9A==
X-Gm-Message-State: AOAM530A497YRew2G+Vw+jN0/RJfhne3LenCecHrWModaCy3wXD1X6D1
        y9uFV8KO2qSzJZQYrgsylGCSVZcxkg==
X-Google-Smtp-Source: ABdhPJxymzXjKx80rnnrA8u0IIv7eIJGwKLpCSKZuoMb6H5JJ8v9fxhzSSVnrC1E5iTplaZIBv+jnA==
X-Received: by 2002:a02:cb92:: with SMTP id u18mr29452277jap.143.1595296355640;
        Mon, 20 Jul 2020 18:52:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w7sm7783820iov.1.2020.07.20.18.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 18:52:34 -0700 (PDT)
Received: (nullmailer pid 3361453 invoked by uid 1000);
        Tue, 21 Jul 2020 01:52:32 -0000
Date:   Mon, 20 Jul 2020 19:52:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz, dmurphy@ti.com
Subject: Re: [PATCH] leds: Replace HTTP links with HTTPS ones
Message-ID: <20200721015232.GA3361404@bogus>
References: <20200713145115.35121-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713145115.35121-1-grandmaster@al2klimov.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Jul 2020 16:51:15 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not just HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/leds/leds-lm3532.txt  | 2 +-
>  Documentation/devicetree/bindings/leds/leds-lm3601x.txt | 4 ++--
>  Documentation/devicetree/bindings/leds/leds-lm36274.txt | 2 +-
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 2 +-
>  Documentation/devicetree/bindings/leds/leds-lm3697.txt  | 2 +-
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt  | 2 +-
>  drivers/leds/leds-lm3532.c                              | 4 ++--
>  drivers/leds/leds-lm3601x.c                             | 2 +-
>  drivers/leds/leds-lm36274.c                             | 2 +-
>  drivers/leds/leds-lm3692x.c                             | 2 +-
>  drivers/leds/leds-lm3697.c                              | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
