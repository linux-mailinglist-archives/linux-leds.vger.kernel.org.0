Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C835356737
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 12:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfFZK4U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 06:56:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36326 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfFZK4U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 06:56:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so2209479wrs.3
        for <linux-leds@vger.kernel.org>; Wed, 26 Jun 2019 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j2eG3tSDbarkCwpmXUvGaJx+Wh9f5fwEAaa9WZrgNI0=;
        b=BOKTavz/4nPTkI1bDzm/v1kGi3+GDZ3FBIh3ofIszJbiO4XEozsgDAJXZDdNZsE/Lp
         dswNw+B+0X2HRezmnGjA745HV/iopd2wx0kxd9s/7TTmPXhhgyMP8lFr2Mh1bCBSpidX
         4LlaUU6wIcT6VKpytLluyfeMKqSqRkhQVypPVxN7S5dOEyvc5VXfd4asnouS/DlCNgM2
         ZJY9XKix+GXxmMU1q9mhknf56u0Ftt1DqeRyiJ5U8xhVAyTxdDA109iKBnfwaoLTRO4p
         dp/Ro22jNKqRJWkRpW09LCkCIW780VgAz5jzpUFjpWOlP+T1LaQVlcxy3+h2SZAe4sfJ
         PsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j2eG3tSDbarkCwpmXUvGaJx+Wh9f5fwEAaa9WZrgNI0=;
        b=ohjhvBb0XGeyoV22KGtvC7HNc9Gd0t94rPR0C163z/3IMfGECGCaFgamb1T3k53jjA
         N9RxtDYHVeUDjgqPyFTXl2TbKveEDvBf/eKs5fiH/dm9+CDVFgP1w0Psc2c3fe3O8+n8
         FMOalMoM78VdgQ1Bs3RxxpAoXnXf31isXU+t+QRFYPtXzx9dSKJ8M/QXrwHKIg8DjH9p
         OJSqMOrNjwWHe8ugE05YV3p1W+quJtC88ILzXbsiiRUPm3xWQOYELXxpj/V+AtHo7Rhm
         qI9Kra42k4IQp8vQQEwudfswcDy09D3kUxXrx8lrpJb4MMXDhtHLjbgEOBWtKlndp85V
         OyNg==
X-Gm-Message-State: APjAAAXK+HDTkduZrWzkwyYj+5/pastTrTxAeO9cYqpr8WkE3jqHhL3i
        xt5Pwo9yCu1m6+vEY5gLSz+mnQ==
X-Google-Smtp-Source: APXvYqyYMXk739SFIZW8rU7j/7NYZ/CNk4T4NZtdoU8WWWjOZHSL/n3F4W7cK9xHaLb3iGZ02Hm7qw==
X-Received: by 2002:adf:fed0:: with SMTP id q16mr3113776wrs.127.1561546577205;
        Wed, 26 Jun 2019 03:56:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y184sm1642151wmg.14.2019.06.26.03.56.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:56:16 -0700 (PDT)
Date:   Wed, 26 Jun 2019 11:56:14 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Brian Dodge <bdodge09@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
> I would like to deprecate the old prefix in the future after communicating
> with all chip customers, which is why the old prefix is not documented in
> the new bindings.

Deprecation is fine (by me at least) it's just that I'm not sure that
removing the documentation for the deprecated bindings is the right way
to do it. What is the prior art here?


Daniel.



> 
> 
> On Tue, Jun 25, 2019, 4:55 AM Daniel Thompson <daniel.thompson@linaro.org>
> wrote:
> 
> > On Tue, Jun 25, 2019 at 12:05:28AM -0400, Brian Dodge wrote:
> > >     The vendor-prefixes.txt file properly refers to ArcticSand
> > >     as arctic but the driver bindings improperly abbreviated the
> > >     prefix to arc. This was a mistake in the original patch
> > >
> > > Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> > > ---
> > >  .../bindings/leds/backlight/arcxcnn_bl.txt         | 24
> > +++++++++++++---------
> > >  1 file changed, 14 insertions(+), 10 deletions(-)
> > >
> > > diff --git
> > a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > > index 230abde..9cf4c44 100644
> > > --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > > @@ -1,8 +1,12 @@
> > > -Binding for ArcticSand arc2c0608 LED driver
> > > +Binding for ArcticSand arc family LED drivers
> > >
> > >  Required properties:
> > > -- compatible:                should be "arc,arc2c0608"
> > > -- reg:                       slave address
> > > +- compatible: one of
> > > +     "arctic,arc1c0608"
> > > +     "arctic,arc2c0608"
> > > +     "arctic,arc3c0845"
> >
> > This is more a question for the DT folks than for Brian but...
> >
> > AFAICT this patch is fixing the binding for the ArcticSand devices to
> > use the correct value from vendor-prefixes.yaml and has been previously
> > discussed here:
> > https://lkml.org/lkml/2018/9/25/726
> >
> > Currently this patch series just updates the DT bindings but the
> > implementation also honours the old values (since there is a Chromebook
> > in the wild that uses the current bindings).
> >
> > Hence I'm not clear whether the bindings should document the deprecated
> > options too (e.g. make it easier to find the bindings doc with git grep
> > and friends).
> >
> >
> > Daniel.
> >
> >
> > > +
> > > +- reg:               slave address
> > >
> > >  Optional properties:
> > >  - default-brightness:        brightness value on boot, value from:
> > 0-4095
> > > @@ -11,19 +15,19 @@ Optional properties:
> > >  - led-sources:               List of enabled channels from 0 to 5.
> > >                       See
> > Documentation/devicetree/bindings/leds/common.txt
> > >
> > > -- arc,led-config-0:  setting for register ILED_CONFIG_0
> > > -- arc,led-config-1:  setting for register ILED_CONFIG_1
> > > -- arc,dim-freq:              PWM mode frequence setting (bits [3:0]
> > used)
> > > -- arc,comp-config:   setting for register CONFIG_COMP
> > > -- arc,filter-config: setting for register FILTER_CONFIG
> > > -- arc,trim-config:   setting for register IMAXTUNE
> > > +- arctic,led-config-0:       setting for register ILED_CONFIG_0
> > > +- arctic,led-config-1:       setting for register ILED_CONFIG_1
> > > +- arctic,dim-freq:           PWM mode frequence setting (bits [3:0]
> > used)
> > > +- arctic,comp-config:        setting for register CONFIG_COMP
> > > +- arctic,filter-config:      setting for register FILTER_CONFIG
> > > +- arctic,trim-config:        setting for register IMAXTUNE
> > >
> > >  Note: Optional properties not specified will default to values in IC
> > EPROM
> > >
> > >  Example:
> > >
> > >  arc2c0608@30 {
> > > -     compatible = "arc,arc2c0608";
> > > +     compatible = "arctic,arc2c0608";
> > >       reg = <0x30>;
> > >       default-brightness = <500>;
> > >       label = "lcd-backlight";
> > > --
> > > 2.7.4
> > >
> >
