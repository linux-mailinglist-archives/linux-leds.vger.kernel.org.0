Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B307026AF7D
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 23:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgIOVXk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 17:23:40 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39648 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgIOVXK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 17:23:10 -0400
Received: by mail-io1-f66.google.com with SMTP id b6so5806703iof.6;
        Tue, 15 Sep 2020 14:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wQZoizpiPLGiWQ+sE3lJKxQsllW2m6IJcrK0e1QXhyw=;
        b=fh7ndsZVurfS7wulK4qqtHuquzkUsx7bPUEiOdwdz1AujsrYyoQTnVOyLgasSk9VvL
         QCHfOs18Kc0GLcIwFvq1vYVIKsOW/Zm5+Mu1W7A0fm0ghaqj7shdsNlOJTE0ZuZ9A8Bw
         E/yDgKXF7uLVsIqwxzJ8h46P9igAQsE/zoLVzBSu4yWpn4aMutkYcPWTIP3qwf6g56W1
         Ng6TZK6HE5bk3ryGgIRI0F0cVvN3B8cHahEaxcKc7hfgcwSBOZTlFjwkNyN7UJOjou4O
         pBcMZbF+k2JzrhjU9GchKARhxD3wixdiDc/qCmfIE2W6rlnZHxjWWL45o1n4fuwB3AaH
         hhgw==
X-Gm-Message-State: AOAM532nWk1pl2zPgkJmQrLC0jfLPRRSO3oZi3HYOX/7sKI5bLQ5a4ux
        8bTYkB9MFIwa2LP4V0CPqxaP1chJ4cmofCQ=
X-Google-Smtp-Source: ABdhPJyqXU4D2bORpccxrVnlGtibgK6DID++IvrTcULScTmL0RCY140ebogp6NPOdNP4bWwlWD94Qg==
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr16456350iod.82.1600204979821;
        Tue, 15 Sep 2020 14:22:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w13sm9523010ilg.65.2020.09.15.14.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 14:22:59 -0700 (PDT)
Received: (nullmailer pid 2530840 invoked by uid 1000);
        Tue, 15 Sep 2020 21:22:58 -0000
Date:   Tue, 15 Sep 2020 15:22:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH leds] dt-bindings: leds: cznic,turris-omnia-leds: fix
 error in binding
Message-ID: <20200915212258.GA2525921@bogus>
References: <20200915005426.15957-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200915005426.15957-1-marek.behun@nic.cz>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 15, 2020 at 02:54:26AM +0200, Marek Behún wrote:
> There is a bug in the device tree binding for cznic,turris-omnia-leds
> which causes make dt_binding_check to complain.
> 
> The reason is that the multi-led property binding's regular expression
> does not contain the `@` character, while the example nodes do.
> 
> Fix this, and also allow for longer address in property name.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Pavel Machek <pavel@ucw.cz>
> ---
>  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> index 24ad1446445ea..486ab27d75f2f 100644
> --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -30,7 +30,7 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "^multi-led[0-9a-f]$":
> +  "^multi-led@[0-9a-f]+$":

There are only 12 LEDs on the device based on the description and 'reg', 
so 'b' is the max unit-address.

I can fixup when applying: "^multi-led@[0-9a-b]$"

>      type: object
>      allOf:
>        - $ref: leds-class-multicolor.yaml#
> -- 
> 2.26.2
> 
