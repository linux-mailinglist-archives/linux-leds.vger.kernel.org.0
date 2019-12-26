Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB7712AE43
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 20:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfLZTTK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 14:19:10 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:37314 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbfLZTTJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 14:19:09 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so15276379ioc.4;
        Thu, 26 Dec 2019 11:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yctUm+tP/JTWUbU92C3KuZCqpDM07cBinnz4jiKKOqQ=;
        b=JLYNHywEiMYqrztF6zhnhy6pPXCi8kGMcluFPOD/xYC6PnE2RVzBmeC7bWa7yow1EL
         Y+yx1Nr1850BRpEgEVlqOfQC6IGw14nq/3WjsZo/0EmwpUNVQ7FQ9eezhVw7GzeLpIWV
         GIJ6G8Ufq60MeNyr/TRmw6d/EtL+v1q1A3r3L5EaiRtHd3WqY3LpQfhcozinrXGZyHRS
         IhZurj8GixgOagt6y+C3KHTw/1T5gdbaJgNalbnQyK/UXW6pFNeYW5fryznLp1AsF6va
         rvQw/smDmVwa7fHubxOvSjNKyVkM0cpYIOsRhUEB4zyu9yXNGzHBniyu/kUuimt97j8/
         EzNg==
X-Gm-Message-State: APjAAAUrAZ2245WWwsHz3+9NKgoisfW1TaequybPMcTcskznAfaUCgwz
        pIerb2ZeQF6Iqp31hD7lO8YsbeY=
X-Google-Smtp-Source: APXvYqy+jP/GydyoayFfqc8hNeW715Akwn3atklyNvagsLYAmw6MirUXuY6WNdRKQ9dUwb7PtlyjHw==
X-Received: by 2002:a6b:bf06:: with SMTP id p6mr24081425iof.255.1577387948956;
        Thu, 26 Dec 2019 11:19:08 -0800 (PST)
Received: from localhost ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w79sm12395491ill.70.2019.12.26.11.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 11:19:08 -0800 (PST)
Date:   Thu, 26 Dec 2019 12:19:06 -0700
From:   Rob Herring <robh@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt: bindings: lm3692x: Document new properties
Message-ID: <20191226191906.GA13331@bogus>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Dec 16, 2019 at 01:28:05PM +0100, Guido Günther wrote:
> We allow configuration of brightness mode and over voltage
> protection.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> index 4c2d923f8758..f195e8b45d85 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -18,6 +18,10 @@ Required properties:
>  Optional properties:
>  	- enable-gpios : gpio pin to enable/disable the device.
>  	- vled-supply : LED supply
> +	- ti,brightness-mapping-exponential: Whether to use exponential
> +	    brightness mapping
> +	- ti,overvoltage-volts: Overvoltage protection in Volts, can
> +	    be 0 (unprotected), 21, 25 or 29V

'-microvolt' is the standard unit suffix.

>  
>  Required child properties:
>  	- reg : 0 - Will enable all LED sync paths
> -- 
> 2.23.0
> 
