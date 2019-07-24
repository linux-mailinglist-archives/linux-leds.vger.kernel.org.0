Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B602773428
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jul 2019 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387698AbfGXQsA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Jul 2019 12:48:00 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39117 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfGXQr7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jul 2019 12:47:59 -0400
Received: by mail-io1-f67.google.com with SMTP id f4so91034448ioh.6;
        Wed, 24 Jul 2019 09:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NaGPAivB1MBv9O5lVWBShae32bWUUsQkrf58j6a6XWY=;
        b=gX1m7rA7wbPHnvd7/XqCaN/dXfTsUeaBwMPQaLAd5IyKnv/v1tZ0La18S3JU0EkNSi
         Tk7NaZuk6gE7gfDJezU8b21I0vA13APrC5fSNAnh3mU2cG8I4zalK/5YQj2dXi96gEpV
         U90ggHDLs3drk5nD/dSk2bvvcZ+9lMUEzui/ipA2jwvDTR+BngV+A+g3zxgO56Qm+YFN
         zflPBHGWVt08mgJwsNuPocWFbJwUs/IuNIGTzjkSvFZ4ncZIqxxlR8r9wVSpTMszcXm4
         y7F5KO5A7BNjC+T60kFiyQeDbZdeEqq6xxc/1lLudvJ5y92+xg3QerrLrwQBQfjykgCZ
         t0iA==
X-Gm-Message-State: APjAAAUVAiJCFX9YED5FxG/0ontDsffq+BTJGL3/nUqYJ+Rof5JVbUGD
        YFCD8aUfjTRJ3RIA6GPEFg==
X-Google-Smtp-Source: APXvYqwYAKj9Y6Xo4kgnFhQ30skobcWvL/jM5t0oA7OfBXz+vNRCAT4o/ffCCGaz6bY311xkT9x01Q==
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr77188637iok.52.1563986878841;
        Wed, 24 Jul 2019 09:47:58 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id m20sm44390636ioh.4.2019.07.24.09.47.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 09:47:58 -0700 (PDT)
Date:   Wed, 24 Jul 2019 10:47:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply"
 property
Message-ID: <20190724164757.GA3723@bogus>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-3-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708103547.23528-3-jjhiblot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 08, 2019 at 12:35:47PM +0200, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. describing in
> the device-tree makes it possible for the LED core to enable/disable it
> when needed.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..e093a2b7eb90 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>  - panic-indicator : This property specifies that the LED should be used,
>  		    if at all possible, as a panic indicator.
>  
> +- power-supply : A voltage/current regulator used to to power the LED. When a
> +		 LED is turned off, the LED core disable its regulator. The
> +		 same regulator can power many LED (or other) devices. It is
> +		 turned off only when all of its users disabled it.

Not sure this should be common. It wouldn't apply to cases where we have 
an LED controller parent nor gpio and pwm LEDs and those are most cases.

Perhaps what makes sense here is an regulator-led binding.

> +
>  - trigger-sources : List of devices which should be used as a source triggering
>  		    this LED activity. Some LEDs can be related to a specific
>  		    device and should somehow indicate its state. E.g. USB 2.0
> -- 
> 2.17.1
> 
