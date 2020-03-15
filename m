Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858B2185C0F
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2020 11:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgCOKx6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Mar 2020 06:53:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgCOKx6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 Mar 2020 06:53:58 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D6D02D6;
        Sun, 15 Mar 2020 11:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584269636;
        bh=tHZj7k528VQp787Iu7lw15HaxCaHUWTuuW+O8lIRCV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=twQyM+1lGITMQqyxXCOzCVjNxdRkFDEN5Q+XB7scUmWhUwBhnFmAx/7FRLsXJe09t
         3c+eJ6c0MTWuKvkh/Wa+144xmukaiIwjDTSe1D4n6VXiu/EFm6qlCHllgISiac3x8n
         W4aiRKx5AIlyOz82CjnfeLQxDBSudePE3vgLvhLA=
Date:   Sun, 15 Mar 2020 12:53:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] dt-bindings: leds: Add binding for sgm3140
Message-ID: <20200315105345.GB4732@pendragon.ideasonboard.com>
References: <20200309203558.305725-1-luca@z3ntu.xyz>
 <20200309203558.305725-3-luca@z3ntu.xyz>
 <4f848ab3-0e76-ae63-0771-758b1eaa0660@ti.com>
 <3051566.44csPzL39Z@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3051566.44csPzL39Z@g550jk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Luca,

On Sun, Mar 15, 2020 at 11:47:36AM +0100, Luca Weiss wrote:
> On Mittwoch, 11. März 2020 13:49:35 CET Dan Murphy wrote:
> > On 3/9/20 3:35 PM, Luca Weiss wrote:
> > > Add YAML devicetree binding for SGMICRO SGM3140 charge pump used for
> > > camera flash LEDs.
> > > 
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > > ---
> > > Changes since RFC:
> > > - new patch
> > > 
> > > I'm not sure about the completeness of this binding as it doesn't
> > > mention the led subnode at all.
> > > The only existing led yaml binding is leds/leds-max77650.yaml which
> > > mentions the subnode but duplicates properties from documented in
> > > leds/common.txt.
> > > 
> > >   .../bindings/leds/leds-sgm3140.yaml           | 53 +++++++++++++++++++
> > >   1 file changed, 53 insertions(+)
> > >   create mode 100644
> > >   Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> > > b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml new file mode
> > > 100644
> > > index 000000000000..be9384573d02
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> > > @@ -0,0 +1,53 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/leds-sgm3140.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SGMICRO SGM3140 500mA Buck/Boost Charge Pump LED Driver
> > > +
> > > +maintainers:
> > > +  - Luca Weiss <luca@z3ntu.xyz>
> > > +
> > > +description: |
> > > +  The SGM3140 is a current-regulated charge pump which can regulate two
> > > current +  levels for Flash and Torch modes.
> > > +
> > > +  It is controlled with two GPIO pins.
> > 
> > Please define "It".  Not sure what is controlled here.
> > 
> 
> "It" means the SGM3140. Not sure how else to write that or what the correct 
> term for such a component is.

Maybe "The device" ? I think Dan's concern is that he wasn't sure if
"It" referred to "the device" or to "flash and torch modes".

-- 
Regards,

Laurent Pinchart
