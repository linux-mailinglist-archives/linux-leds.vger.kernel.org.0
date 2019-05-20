Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8445923803
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 15:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732478AbfETNaM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 09:30:12 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52100 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729755AbfETNaM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 May 2019 09:30:12 -0400
Received: by mail-wm1-f66.google.com with SMTP id c77so11845502wmd.1
        for <linux-leds@vger.kernel.org>; Mon, 20 May 2019 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8jmGilw1nCQQmkBhHj38AiUSNpWBZe/sVuRM01rHJv0=;
        b=FY+xDHdlrGHpESK8d3dY9mKd1ulBFHyvOVNM4E/E1imXiTfV0C2iFc0rfPluiYI9ti
         MkuGQzvux2dG6tG1e+KiV4OUqVQT5Qm7Yy6WB3PkW8ZWeG7UB4NYbi7D93geMjs6ZkGo
         Fx+yt0kZcrFZHxnA90yAfup2DJJZ8Dn6Y3K7hxCTFDbqFjRvkwbaSodfn5WtHGfthJDo
         3PTdSyM8MM33ZMwBaxKztYfimViCP70xCgakknd24OaIpwTnAaIvV6iT+VaeivDs8E23
         4PeY7+bjmcEHI+4pdtdPQ5ty1/iv+0HT0SoZnbwzxt+BwcB8hC4ZCUQeopMbZDFiDxOM
         jy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8jmGilw1nCQQmkBhHj38AiUSNpWBZe/sVuRM01rHJv0=;
        b=iOhibFqYQe0QWV/3pkRJBrcSA7KvYNPBcMRC7tiu2wrUbvfEHcG++NKPy3Zh2o0Vs/
         TLeqIZDCM9TETrA5fFxZEdZtNT7uds5rerqJtGtET/WPoshUuX3rJsrqD/rlsYeQb0eo
         RWhOYmaIZOfkVsjmf5TATHCXiIJXDPXooEu68zA7hO1+UiieafQ3VAkzt2X90ozuWfAZ
         +6qQDP+pSRtkCrPv4ZR7LGESTmvR00uUF+1r3Q/oy3r0BKYYt8Fm2tXcnUAHLI3iMGLT
         H/pcNNVRQ1EGJfJ+8B3o1YBzvgth6YbC/bctIDtuHsVgGy1H455d+/9lzC3SXL4TRtHT
         bBdg==
X-Gm-Message-State: APjAAAW8/I3CGPJE9/SLv4CZR9LKsidLqUCc+uD3a51nT9Yf6U8VvTCe
        YsPD+71PQ71sO30HW3/s6q/wsAhUOkqUwg==
X-Google-Smtp-Source: APXvYqx2txSUvSVKzjvZhfqtdeKg/VLHgRIYD6Rv9nUdsldKd1EgOPFxeK2Xh7cX5NLv9PmgcLKi1Q==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr11647224wmc.25.1558359009976;
        Mon, 20 May 2019 06:30:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y1sm15465215wma.14.2019.05.20.06.30.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 06:30:09 -0700 (PDT)
Date:   Mon, 20 May 2019 14:30:07 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Brian Masney <masneyb@onstation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema
 validation
Message-ID: <20190520133007.gymbonmq635gp73b@holly.lan>
References: <20190520085846.22320-1-masneyb@onstation.org>
 <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 20, 2019 at 08:14:03AM -0500, Rob Herring wrote:
> On Mon, May 20, 2019 at 3:59 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > The '#address-cells' and '#size-cells' properties were not defined in
> > the lm3630a bindings and would cause the following error when
> > attempting to validate the examples against the schema:
> >
> > Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> > '#address-cells', '#size-cells' do not match any of the regexes:
> > '^led@[01]$', 'pinctrl-[0-9]+'
> >
> > Correct this by adding those two properties.
> >
> > While we're here, move the ti,linear-mapping-mode property to the
> > led@[01] child nodes to correct the following validation error:
> >
> > Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> > led@0: 'ti,linear-mapping-mode' does not match any of the regexes:
> > 'pinctrl-[0-9]+'
> >
> > Fixes: 32fcb75c66a0 ("dt-bindings: backlight: Add lm3630a bindings")
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > Reported-by: Rob Herring <robh+dt@kernel.org>
> > ---
> >  .../leds/backlight/lm3630a-backlight.yaml     | 20 +++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

