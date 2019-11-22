Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A872910742C
	for <lists+linux-leds@lfdr.de>; Fri, 22 Nov 2019 15:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVOnA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Nov 2019 09:43:00 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:36433 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVOm5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Nov 2019 09:42:57 -0500
Received: by mail-wr1-f54.google.com with SMTP id z3so8925773wru.3
        for <linux-leds@vger.kernel.org>; Fri, 22 Nov 2019 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hoPOh21olR4yR3etjFWcnoa60If5IZiVlNptNDVpa9k=;
        b=R/uPRRve+D/36PrlFAZ+v7bEL0KnZpRHUQRPrFtPz8oZOzUsIOjaQ9yQYv6eGzg9nw
         uJ8lyxFEdbtuEcTNhIETeI4HbgdD/QERHRUlJJ8bZ0L1aeCyldAfjGjJV5+NwzDF7NaE
         ki59OAOP+ELGJfKQfETK+07+BwtYryjoNP8VqOceIciUMYGPAGkkguJEYA9v+oGrmd1E
         71bxgO8mJeH4cyV6iE7whBUk57QFxlPjDVkT13cHh0pJgdcxUbq680E11fhTq/cUqJfS
         Hx5RfO1Ohym9OojcH665NUw0vnc3Mh+t1BY1Ab+0HokguaRTzweqTURzRvudwf9OEUh2
         1QPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hoPOh21olR4yR3etjFWcnoa60If5IZiVlNptNDVpa9k=;
        b=KLTgTMvtcUuJuleZeJvMF0KZgHSt086hyrwKrWS1uTTpb2Ue8pmiZluTcw0HqvpoOQ
         vTtWbN7A2x9qLm4kHnsvHWB/hWKBDA/4ga+VDPHdZM9DaGUPA+yAfUrRfUYT0hdaC/CP
         iolFb3CkaV8ujIa+acU3UHjQsG//XdSZW7MFSs9y40oqGJ4I++89UwEJAg3jbThb9ASi
         an2lxisMCe7YOg81sAeiyxPIMrqluezjHOHt2IhJG3A8Jxm2xWjUm+W6RYZMKDuh0dEj
         8lbOm1FSaq6mi3cM/MHd5i2+p1ukVcklrKP7pLkr2c2wYYOFrmDI4t6sHxvVxY7qArXh
         PrhQ==
X-Gm-Message-State: APjAAAW5Z2mvFRXGJBy0HtBESHTwtayTXjwjOVJJI8ZT2qIRlGQRxT3F
        +CpfRE0+It62sW4TzlXOxwrOkA==
X-Google-Smtp-Source: APXvYqzCgWGaqbE51BQAnG37UGDGNxfx4IR3oun03T6T1DOkP8efGl42cNn/p6X4rDaRkRFwSEAO4Q==
X-Received: by 2002:adf:e944:: with SMTP id m4mr18600080wrn.49.1574433774712;
        Fri, 22 Nov 2019 06:42:54 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id x2sm2032469wmc.3.2019.11.22.06.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 06:42:54 -0800 (PST)
Date:   Fri, 22 Nov 2019 14:42:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, Grigoryev Denis <grigoryev@fastwel.ru>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Subject: Re: Applied "tps6105x: add optional devicetree support" to the
 regulator tree
Message-ID: <20191122144235.GD3296@dell>
References: <20191119154611.29625-2-TheSven73@gmail.com>
 <applied-20191119154611.29625-2-TheSven73@gmail.com>
 <20191122073124.GA3296@dell>
 <20191122133230.GD6849@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191122133230.GD6849@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 22 Nov 2019, Mark Brown wrote:

> On Fri, Nov 22, 2019 at 07:31:24AM +0000, Lee Jones wrote:
> > On Wed, 20 Nov 2019, Mark Brown wrote:
> 
> > > Example: put chip in regulator mode:
> 
> > > i2c0 {
> > > 	tps61052@33 {
> > > 		compatible = "ti,tps61052";
> > > 		reg = <0x33>;
> > > 
> > > 		regulator {
> > >                             regulator-min-microvolt = <5000000>;
> > >                             regulator-max-microvolt = <5000000>;
> > >                             regulator-always-on;
> > > 		};
> > > 	};
> > > };
> 
> > ?
> 
> Sorry, I completely missed that this was adding a MFD file - the binding
> only mentioned regulator stuff and I clearly didn't look at the
> filename.  Do you want me to drop it?

It's okay. Probably won't cause too much chaos. Keep it applied.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
