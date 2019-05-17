Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA59220AB
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2019 01:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfEQXMO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 May 2019 19:12:14 -0400
Received: from onstation.org ([52.200.56.107]:37476 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbfEQXMN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 17 May 2019 19:12:13 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3FFDD3E957;
        Fri, 17 May 2019 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1558134732;
        bh=qurT+nMJYRUKyNSe+yc/AIUY3mDFS6CFIis415+foE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vn3yfw/jnNsapohuXlzskfz4gwwlrmCgVVz8/V0C5xRjhJeelhjjMS8DOJz6y8PrD
         vi0aLVvEPz3Z3VRqtNHt4NOdaT+jhb9Pztk4fbqWTEXlFP6I1vJbUEokYc2OcI4sVJ
         dTotabBBmQRVlsZ/lNKCKXuaEnJKll0PjE8fwsis=
Date:   Fri, 17 May 2019 19:12:11 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
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
Subject: Re: [PATCH v6 2/3] dt-bindings: backlight: add lm3630a bindings
Message-ID: <20190517231211.GA7907@basecamp>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-3-masneyb@onstation.org>
 <CAL_JsqLdS2SDd-dczZmqDTN3XMY7fwDjdkX5OibXbrksd7qQYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLdS2SDd-dczZmqDTN3XMY7fwDjdkX5OibXbrksd7qQYA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Rob,

On Fri, May 17, 2019 at 04:11:48PM -0500, Rob Herring wrote:
> On Wed, Apr 24, 2019 at 4:25 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > Add new backlight bindings for the TI LM3630A dual-string white LED.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes since v5:
> > - Change 'lm3630a_bl@38' in examples to 'led-controller@38'
> >
> > Changes since v4:
> > - Drop $ref from led-sources
> > - Drop description from reg of i2c address
> > - Expand description of reg for the control bank
> > - Drop status from examples
> >
> > Changes since v3:
> > - Add label. I didn't add a description for it since that'll come from
> >   the common properties once its converted.
> >
> > Changes since v2:
> > - Update description of max-brightness
> > - Add description for reg
> > - Correct typo: s/tranisiton/transition
> > - add reg to control banks
> > - add additionalProperties
> >
> >  .../leds/backlight/lm3630a-backlight.yaml     | 129 ++++++++++++++++++
> >  1 file changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> 
> I'm working on getting the examples to be validated by the schema (in
> addition to just building with dtc) and there's a couple of errors:
> 
> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> '#address-cells', '#size-cells' do not match any of the regexes:
> '^led@[01]$', 'pinctrl-[0-9]+'
> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> '#address-cells', '#size-cells' do not match any of the regexes:
> '^led@[01]$', 'pinctrl-[0-9]+'
> 
> You didn't list '#address-cells' and '#size-cells'.
> 
> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> led@0: 'ti,linear-mapping-mode' does not match any of the regexes:
> 'pinctrl-[0-9]+'
> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> led@1: 'ti,linear-mapping-mode' does not match any of the regexes:
> 'pinctrl-[0-9]+'
> 
> 'ti,linear-mapping-mode' is not defined in the child nodes.

I'm sorry about that. I'll send out a patch this weekend to correct
this. I have 'make dt_binding_check' in my local build script. Is there
something else that I should be running as well? Or do you have a
branch somewhere with your validation work that I can test my changes
against?

Brian
