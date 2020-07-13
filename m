Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E2A21D97F
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 17:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgGMPGh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 11:06:37 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40078 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729581AbgGMPGg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 11:06:36 -0400
Received: by mail-io1-f68.google.com with SMTP id l17so2297265iok.7;
        Mon, 13 Jul 2020 08:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JdA6x59diKndbVEgzMdD3TbDSGTvGCxliznaVc9RcrA=;
        b=mpsdXfT1HliMTr5rNDdf0RCAYdc0IDCmg4L0tlfpKlkVaF7Iz7vPCPo0iYyBdyOmh9
         NKIdIhwlUVfLZzWk+Lt3qmk0SqTnxu134asiLzroK56azYEKb+LtzT8Gat7SmHvELpWu
         l6s7KLfrMR0PCIfMJ8Bx45wEJFgTY73KX/UVfKXtHKqKztTtSMJjFUzzFmUT94imEd7Y
         tM4v3lJ44zKGNryJjomeEQPSLYx4gXroZrV9BrHz77MyT8+itj85iC6In8SInLh6Nf5E
         CUyuqyKznchrocPXjC0TRxuIcJK0WvcBmZHKg4dcLPpgcwlY5KFTEGKx7wN8x4EdDBlU
         Rydg==
X-Gm-Message-State: AOAM5329XB7oONRHIzXKNrrraUNeEwRiDaCGiN23kvKLBU/A2XN9g3HN
        CxiW8zDEOg3hYqfUcC9McBz2VJ7uHw==
X-Google-Smtp-Source: ABdhPJwpwMci6wh3k6kp2CGyI4RcxsBTCyXWV5bOJUtLkejQTonttC5Wmv2DKJsDiQy9rLu6kgAmJg==
X-Received: by 2002:a02:5806:: with SMTP id f6mr515595jab.136.1594652796095;
        Mon, 13 Jul 2020 08:06:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u15sm7760078iog.18.2020.07.13.08.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:06:35 -0700 (PDT)
Received: (nullmailer pid 183937 invoked by uid 1000);
        Mon, 13 Jul 2020 15:06:34 -0000
Date:   Mon, 13 Jul 2020 09:06:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200713150634.GA176775@bogus>
References: <20200712210601.5239-1-marek.behun@nic.cz>
 <20200712210601.5239-2-marek.behun@nic.cz>
 <4609c389-4be6-0987-5078-725b43153596@gmail.com>
 <20200712234035.213348aa@nic.cz>
 <ff707d34-8fc0-342e-3df2-e96e5493004b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff707d34-8fc0-342e-3df2-e96e5493004b@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 13, 2020 at 12:11:51AM +0200, Jacek Anaszewski wrote:
> On 7/12/20 11:40 PM, Marek Behun wrote:
> > On Sun, 12 Jul 2020 23:27:07 +0200
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> > 
> > > > +            multi-led@0 {
> > > > +                reg = <0>;
> > > > +                color = <LED_COLOR_ID_MULTI>;
> > > > +                function = LED_FUNCTION_POWER;
> > > 
> > > Please provide child nodes for each color LED. Let's stick
> > > to the bindings closely and not make any deviations from
> > > the beginning.
> > 
> > Why? It would make sense if there were devices using this controller
> > having other configuration, but on Omnia, all LEDs are RGB.
> > 
> > Also, if I do this, should I also make the driver check in the probe
> > function whether the per-channel child nodes are correct? Eg. if they
> > are always three: one for red, one for green and one for blue? Or
> > should the driver ignore this and only the device tree binding specify
> > it?
> > 
> > Because the way the driver is written now, it only registers
> > multi-color RGB LEDs.
> 
> This is not RGB framework, but multicolor framework. It is not justified
> to pretend that RGB is default. Unless you would state that clearly in
> the comment in DT, but that should be agreed upon with Rob.

If the LEDs are fixed in h/w and never vary for this controller, then 
they don't need to be in DT. However, is it really possible that a 
channel only supports 1 color of LED? I don't think so.

Rob
