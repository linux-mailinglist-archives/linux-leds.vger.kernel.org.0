Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3055B1CEE8
	for <lists+linux-leds@lfdr.de>; Tue, 14 May 2019 20:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfENSTZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 May 2019 14:19:25 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44240 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfENSTZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 May 2019 14:19:25 -0400
Received: by mail-oi1-f194.google.com with SMTP id z65so5642374oia.11;
        Tue, 14 May 2019 11:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1dWX2OQ2EtNmawgXfTg7Q+1r7icdewt32EBVZ89ytiE=;
        b=VXVZ7yHJNDdHVXVS1IWPIDvyfiaYFGERxcHaPMeA3yUkNYOGAXuTsH0BLmsyu6ecK1
         4B2g4buxfQLpAF0UnIW1L8I8mGBHpzCSaJEbNAgbRGLH6H2z/jnCHcHc7m4IgYKxJtYB
         NtrG+iMZQ2hrdXmQN59mIGOaXIF62uALY8FxK+L5r6qxjwjjY4TpmKWxCwVShjAWz3mv
         tXG8eV075enO7SMHSBcYynku5hRdU/NemcrVQRxtQw/F9vQMW6j7J94TP4BKhtvTAT+c
         4IpKvHUNpW0BCkyAiva4VMdTDVuPq5vy9b4e+Fh7GS4xRkZNjdtWnkwPWXMPAe3QBa5C
         4QvA==
X-Gm-Message-State: APjAAAV0HZ6yEkyo8LGob+/63qV21ankn1VoWV1Gd8MxJC5aTF8YFjO3
        rP+XJvGELa0+kC6mz8ms3g==
X-Google-Smtp-Source: APXvYqzdycLONAITq4HThKG1418JK6bpq4ylYFMLPoKCIeMbxiC3HF3qzVD0bXrMocrHCvXDsWAqUQ==
X-Received: by 2002:aca:47c6:: with SMTP id u189mr3828040oia.23.1557857964422;
        Tue, 14 May 2019 11:19:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 33sm3063529otb.56.2019.05.14.11.19.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 11:19:23 -0700 (PDT)
Date:   Tue, 14 May 2019 13:19:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     oss@c-mauderer.de
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Message-ID: <20190514181922.GA24534@bogus>
References: <20190513193307.11591-1-oss@c-mauderer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513193307.11591-1-oss@c-mauderer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 May 2019 21:33:06 +0200, oss@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
> 
> This patch adds the binding documentation for a simple SPI based LED
> controller which use only one byte for setting the brightness.
> 
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
> 
> Changes compared to v3:
> - rename binding to ubnt,acb-spi-led
> - rewrite description to fit the new binding
> - remove off-value and max-value - now determined depending on the compatible
>   string
> - add 'default-state'
> 
> Changes compared to v2:
> - None
> 
> Changes compared to v1:
> - rename ubnt-spi to leds-spi-byte
> - rename "ubnt-spi,off_bright" and "ubnt-spi,max_bright" to
>   "leds-spi-byte,off-value" and "leds-spi-byte,max-value" and mark them required
> - rename led-controller node to "led-controller"
> - extend description
> - remove SPI controller
> - use "white:status" for the example label
> 
>  .../bindings/leds/leds-spi-byte.txt           | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
