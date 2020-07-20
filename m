Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBB822725F
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jul 2020 00:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgGTWZJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jul 2020 18:25:09 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36588 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgGTWZF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2020 18:25:05 -0400
Received: by mail-il1-f196.google.com with SMTP id x9so14729042ila.3;
        Mon, 20 Jul 2020 15:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MZqPehWuAaKZ1kDIiDAtIDxeI9fYnQ6uKzjYm+bg3hw=;
        b=l74HM/QEIyMume9MYOGL+Y2z/FpKO5mNYjLxU543TVaJxNc1xBJ42YvkAIISSKnsEa
         BDpZUGL1ddvRTET/lKwYmmBZh9ZzLdLAnj0F1QC8Hdw0iKqeMj0kuUftRM0h1UTJEHiT
         T38wgfr7vRM3mFCQXPGGIwvGk3D3OptoSbNVorfCByFGrsEr5D8H1nd48LA4t1wN7//d
         04EQfb9/DkkvgMwzhOAw0Vx2wfE1EqRlDEU2byM43dBDaa4XJXpCn6HCFI6KmDQfo6hJ
         M7t49+PCrBVsXg0zWnK8MWer9TVHLN993BEGVbNbggCjliAQ9XLYu9YtmDFKklBBxN6y
         8YfQ==
X-Gm-Message-State: AOAM533J6fkqwJJcHqhzt2Ny74kVvpzTFnsADYeC8zBZjY4Qfw2YDJnB
        ZXEe75K0vSEZmCWB+LrlpQ==
X-Google-Smtp-Source: ABdhPJwB+CzpX9Dgd3C5ILBklMR8r62BD85LbwTOjFwD1kOkV+ZDYDVOCXLvY4fVyBJrJ9WY0ZIYUA==
X-Received: by 2002:a92:8552:: with SMTP id f79mr25548228ilh.225.1595283904930;
        Mon, 20 Jul 2020 15:25:04 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u9sm10033330iom.14.2020.07.20.15.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 15:25:04 -0700 (PDT)
Received: (nullmailer pid 3060507 invoked by uid 1000);
        Mon, 20 Jul 2020 22:25:03 -0000
Date:   Mon, 20 Jul 2020 16:25:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dmurphy@ti.com, jacek.anaszewski@gmail.com, vishwa@linux.ibm.com
Subject: Re: [PATCH 1/2] dt-bindings: leds: pca955x: Add IBM implementation
 compatible string
Message-ID: <20200720222503.GA3058862@bogus>
References: <20200709201220.13736-1-eajames@linux.ibm.com>
 <20200709201220.13736-2-eajames@linux.ibm.com>
 <20200711134814.GB6407@amd>
 <ad50a2a7-0b06-420e-baa7-dec2787ab30d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad50a2a7-0b06-420e-baa7-dec2787ab30d@linux.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 13, 2020 at 09:28:32AM -0500, Eddie James wrote:
> 
> On 7/11/20 8:48 AM, Pavel Machek wrote:
> > Hi!
> > 
> > > IBM created an implementation of the PCA9552 on a PIC16F
> > > microcontroller. Document the new compatible string for this device.
> > Is the implementation opensource?
> 
> 
> Hi, no it is not.
> 
> 
> > 
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
> > > @@ -9,6 +9,7 @@ Required properties:
> > >   	"nxp,pca9550"
> > >   	"nxp,pca9551"
> > >   	"nxp,pca9552"
> > > +	"nxp,pca9552-ibm"
> > >   	"nxp,pca9553"
> > Is it good idea to use nxp prefix for something that is
> > software-defined and not built by nxp?
> 
> 
> Yea I suppose not...
> 
> > 
> > Would ibm,pca9552 be better, or maybe even sw,pca9552 to indicate that
> > is not real hardware, but software emulation?
> 
> 
> How about ibm,pca9552-sw? Someone suggested that just adding "sw" could be a
> problem if another company does the same thing but it isn't compatible.

ibm,pca9552 is good.

Rob
