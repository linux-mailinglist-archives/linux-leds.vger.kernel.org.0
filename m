Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA3A26B551
	for <lists+linux-leds@lfdr.de>; Wed, 16 Sep 2020 01:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgIOXmH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 15 Sep 2020 19:42:07 -0400
Received: from mail.nic.cz ([217.31.204.67]:54312 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727480AbgIOXlz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 15 Sep 2020 19:41:55 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id B22111409FB;
        Wed, 16 Sep 2020 01:41:53 +0200 (CEST)
Date:   Wed, 16 Sep 2020 01:41:53 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH leds] dt-bindings: leds: cznic,turris-omnia-leds: fix
 error in binding
Message-ID: <20200916014153.4dbb05d6@nic.cz>
In-Reply-To: <20200915212258.GA2525921@bogus>
References: <20200915005426.15957-1-marek.behun@nic.cz>
        <20200915212258.GA2525921@bogus>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 15 Sep 2020 15:22:58 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, Sep 15, 2020 at 02:54:26AM +0200, Marek Behún wrote:
> > There is a bug in the device tree binding for cznic,turris-omnia-leds
> > which causes make dt_binding_check to complain.
> > 
> > The reason is that the multi-led property binding's regular expression
> > does not contain the `@` character, while the example nodes do.
> > 
> > Fix this, and also allow for longer address in property name.
> > 
> > Signed-off-by: Marek Behún <marek.behun@nic.cz>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: Pavel Machek <pavel@ucw.cz>
> > ---
> >  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml       | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > index 24ad1446445ea..486ab27d75f2f 100644
> > --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > @@ -30,7 +30,7 @@ properties:
> >      const: 0
> >  
> >  patternProperties:
> > -  "^multi-led[0-9a-f]$":
> > +  "^multi-led@[0-9a-f]+$":  
> 
> There are only 12 LEDs on the device based on the description and 'reg', 
> so 'b' is the max unit-address.
> 
> I can fixup when applying: "^multi-led@[0-9a-b]$"
> 
Please do, thanks.

Marek
